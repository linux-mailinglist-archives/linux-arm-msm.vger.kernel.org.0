Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47CC2EBC5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 11:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbhAFKaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 05:30:55 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:33442 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbhAFKaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 05:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609928882;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=YLZC1XitSBch6PjkGrG6/3f/oe72VczVQQyLQv4Oyzc=;
        b=fDigIg7Pr0hp0WazsGNj5mJi3T+nFLVeAnZt12y5VcB3fzuPF+kIfJd/2f34misiom
        b3xTrR8xFeNkh2Yh63DCLt+RcfJWaFFhGwmM26lu7gUUt8y62ip5iY1ycFBsN8hX3fiM
        +EEQj8yjc2l5wiAocbGUnFskzgwpVAkTu+LLL5E6T69xbrhZVpOXLTcfsqijki0Fl9+6
        ig2jGhkzBCapEDUkGxys+LUAxnJSSugEOpTBkt48mc88pmO7O8fs4l2vN/Bk5CAq0uDg
        q49FNKiV5p2mQbbiJP25rodqzdXFRKk4hMTQWYdqTCs9Dc1Hv70mUhS/uM6jwymfEf8a
        V74Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALj5DT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:45 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/3] Fix wcn36xx on msm8916-samsung-a5u
Date:   Wed,  6 Jan 2021 11:21:31 +0100
Message-Id: <20210106102134.59801-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unlike most MSM8916 boards, samsung-a5u uses WCN3660B instead of
WCN3620 to support the 5 GHz band additionally.

WCN3660B has similar requirements as WCN3620, but it needs the XO
clock to run at 48 MHz instead of 19.2 MHz. So far it was possible
to describe that configuration using the qcom,wcn3680 compatible.

However, as of commit 8490987bdb9a ("wcn36xx: Hook and identify RF_IRIS_WCN3680"),
the wcn36xx driver will now use the qcom,wcn3680 compatible
to enable functionality specific to WCN3680. In particular,
WCN3680 supports 802.11ac, which is not available in WCN3660B.

This patch set introduces a new "qcom,wcn3660b" compatible
to fix the msm8916-samsung-a5u device tree.

Stephan Gerhold (3):
  dt-bindings: remoteproc: qcom,wcnss-pil: Add qcom,wcn3660b compatible
  remoteproc: qcom_wcnss_iris: Add qcom,wcn3660b compatible
  arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible

 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts            | 2 +-
 drivers/remoteproc/qcom_wcnss_iris.c                            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.30.0

