Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C48269F56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgIOHNE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:04 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.160]:35815 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgIOHNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153978;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Keyc/P8gOEHzeqNuM4vQJaR2CcARe02xr8/Mflz2/kM=;
        b=gaBuipX5CE9LJtHD7BrpsjJrAnpzCZPLolJPOu/+/vi7Rb8E5GG7/zb2kmS7Wp93/h
        GEkIgcWsnWJwBO5115sFe1iN30tUHqRbQhK6DtHHxuV0OerNpHZrfJhOIw0EsiIGg2Se
        Bi/TMUzdbGIk+aVM8M7ohmVsc8OBPqprBOBYKZ3WVNUZu/X4AyOBDCoM7CJr+lG8iW1y
        iiWzMzaRSe3mV4e2gqdaEtj8fg3jdYaLgX/QXHDGfnEchb6XwV1rNOKj0ah3ksmIw6Ea
        P8SdLsnDEYLaOl9Bx68dQOFyRk9OpGcr6BdfCTN4xY/C0iaMdOq7hzYFmHaL25t6oJB/
        8CVQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7Curdl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:12:56 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 00/14] Cleanup & sort msm8916.dtsi, various minor fixes
Date:   Tue, 15 Sep 2020 09:12:07 +0200
Message-Id: <20200915071221.72895-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After cleaning up the MSM8916 board device tree files [1], this patch series
focuses on various cleanup and minor fixes within the common msm8916.dtsi:

  1. One more conversion to use labels to configure board DSI ports
     (I missed that in the last patch series)
  2. A few non-critical fixes just to make the device tree more correct
  3. A few style fixes (e.g. replacing spaces with tabs)
  4. Sort nodes in msm8916.dtsi/pm8916.dtsi and the Makefile

This brings MSM8916 close to the conventions used for newer SoCs,
and will make it easier to add new device nodes (e.g. CPR) to it later.

[1]: https://lore.kernel.org/linux-arm-msm/20200720085406.6716-1-stephan@gerhold.net/

Stephan Gerhold (14):
  arm64: dts: qcom: msm8916: Configure DSI port with labels
  arm64: dts: qcom: msm8916: Remove one more thermal trip point unit
    name
  arm64: dts: qcom: pm8916: Remove invalid reg size from wcd_codec
  arm64: dts: qcom: msm8916: Fix MDP/DSI interrupts
  arm64: dts: qcom: msm8916: Use IRQ defines, add IRQ types
  arm64: dts: qcom: msm8916: Drop qcom,tcsr-mutex syscon
  arm64: dts: qcom: msm8916: Minor style fixes
  arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS
  arm64: dts: qcom: msm8916: Use more generic node names
  arm64: dts: qcom: msm8916: Rename "x-smp2p" to "smp2p-x"
  arm64: dts: qcom: msm8916: Pad addresses
  arm64: dts: qcom: msm8916: Sort nodes
  arm64: dts: qcom: pm8916: Sort nodes
  arm64: dts: qcom: Makefile: Sort lines

 arch/arm64/boot/dts/qcom/Makefile             |   10 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |   12 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |    2 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |   12 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 2571 ++++++++---------
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |   84 +-
 6 files changed, 1339 insertions(+), 1352 deletions(-)

--
2.28.0
