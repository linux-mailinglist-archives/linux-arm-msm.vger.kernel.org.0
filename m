Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488E026C1DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 12:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgIPKrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 06:47:25 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:28199 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgIPKo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 06:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600252912;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=wPJEoYyYQh25xISg8G/qnJXW/NhFz+5NwkRwlfMN4Pk=;
        b=fvx+6rC/g/EPG+ME0Q4+FH4lQPDXnG8d3uJlK83UChzKJqBl5pai0kBTMyAvAD7+/w
        Sw+TPlF+tA7Gn66RaKTK+Znk91k+JLHyNPc3nVUrZKX4wceN9VMy4DzWRfbFb+u/eP5N
        gYyDRUXC8gpNRxntspfWVOwg3p3wAq6Sns6xyYjmnmL0HUx7nKYZqoGe991S7eTyyWc6
        nqUpL2SCNDON1i3wrIl4vToCbGMnEzFaNaD92e7aGoZafLIYo+N30u3/oTva/F3iVZF+
        s36wY/PtsemJ9Q+vc+hM/gV2RxRqKo5p6QYZgi9rzASQtHiMBfYee0Eok5Xa6bQ9ir5V
        PjYA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfnzlN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:49 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 00/10] Convert MSM8916 to use rpmpd/power domains
Date:   Wed, 16 Sep 2020 12:41:25 +0200
Message-Id: <20200916104135.25085-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer platforms vote for necessary power domains through the power
domain subsystem. For historical reasons older platforms like MSM8916
or MSM8974 still control these as regulators.

This patch series adds the power domain definitions for MSM8916
to the rpmpd driver. Then, qcom_q6v5_mss and qcom_wcnss are updated
to use power domains for MSM8916/MSM8974. For compatibility with old
device trees (and for MSM8974) we still need to support using the
power domains through the regulator interface. This is implemented by
falling back to the regulators if requesting the power domains fails.

Finally, we remove the regulators that provide the power domains
(s1 and l3) entirely from the MSM8916 device tree: They should only
be used through the power domain subsystem from now on.

Stephan Gerhold (10):
  soc: qcom: rpmpd: Rename MAX_8996_RPMPD_STATE to
    MAX_CORNER_RPMPD_STATE
  dt-bindings: power: rpmpd: Add MSM8916 RPM power domains
  soc: qcom: rpmpd: Add MSM8916 power domains
  arm64: dts: qcom: msm8916: Add RPM power domains
  dt-bindings: remoteproc: qcom,q6v5: Deprecate regulators for PDs
  remoteproc: qcom_q6v5_mss: Allow replacing regulators with power
    domains
  dt-bindings: remoteproc: qcom,wcnss: Deprecate regulators for PDs
  remoteproc: qcom_wcnss: Allow replacing regulators with power domains
  arm64: dts: qcom: msm8916: Use power domains for MSS/WCNSS remoteprocs
  arm64: dts: qcom: msm8916-pm8916: Stop using s1/l3 as regulators

 .../devicetree/bindings/power/qcom,rpmpd.yaml |   1 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  12 +-
 .../bindings/remoteproc/qcom,wcnss-pil.txt    |  20 +++-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  10 --
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  10 --
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  |   7 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  10 --
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  38 ++++++
 drivers/remoteproc/qcom_q6v5_mss.c            |  68 +++++++++--
 drivers/remoteproc/qcom_wcnss.c               | 109 +++++++++++++++---
 drivers/soc/qcom/rpmpd.c                      |  25 +++-
 include/dt-bindings/power/qcom-rpmpd.h        |   7 ++
 12 files changed, 242 insertions(+), 75 deletions(-)

-- 
2.28.0

