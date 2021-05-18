Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68997387F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 20:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhERSRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbhERSRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 14:17:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90AEC061573;
        Tue, 18 May 2021 11:16:25 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i13so12333350edb.9;
        Tue, 18 May 2021 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/RjbeOm0GK54WXBuEUz9ThyU2x4dxtPR3H60Ev2zXs=;
        b=Xsm+nMjO/X1Nu/VJbbmU1bK9oWSZogo6sBxVWTQ9UuWvaUF11IRSPS3L8e51JjJwt4
         a92AdsUcarVVMv7om7fExrVOaP0n4OgToSVfcaQ4Hk/TyYU01sNOMdLsdRClXFurRBDW
         lmwGotr812srdCnbq617KwP2ITEGOKbZL+B49w7LHdiyoOx7PmDRqOAcxp+jTZGcPD0u
         SzJLDygZKWeLXU5YS2Lo2amA8nua+o8+KdafCjFh+YlHtIOJu4Cf9VQfMD6pld7MZ8EX
         Ksazy0Cn9wBdFBdX7RivCMpzvfukdvIUcF6/riadZfTOFXew3E9S9QUpG8kc/6ZF045c
         7xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/RjbeOm0GK54WXBuEUz9ThyU2x4dxtPR3H60Ev2zXs=;
        b=EkMujNLhz+09x6zwJ0IJRDV1dWFpP7TqB8inRzXyU6LxX/HvxaB2dlSiCK+JxXWQiW
         UK9i3ohHDK5f05HrDVoKLtlt12BjZc3882zWAjSH6zljEhN62Xyib4JFRjtIb5oOQHHf
         fsyfdIv8PELcY6ZZDZJjoCqNCm50gyKOe/l7UrVWLMdtSemHvaOOIVJeTYdYfGtmfQff
         WgoGgax7G+bINFjkvXU37zkcqt0ovcVCmqVAtA/ofe6eBHXZOp59BH1qXrDvAO0h3Lug
         HrEgdyBX8ayIqVi1O13cTICj+2tUROPTnJtWLIg7/YpDmqBYIBeFh+6A3TSGzGBtQxN7
         TtJw==
X-Gm-Message-State: AOAM532CJ9+yqbaZ/ykCXfsadomj8WgfK3he9l74a2d8IYrPoWIjfTxc
        Eb5INsfTBPkR2S85qZrUOCGHmg9ZE+AkC8mm
X-Google-Smtp-Source: ABdhPJxdD/2x6Ion+dpumU5k57EXej6cA/2Qxreiz1/fYJxUcU8ydvYaPEnrZ269828k1ZWAP1KzKw==
X-Received: by 2002:a50:eb08:: with SMTP id y8mr8616849edp.89.1621361784316;
        Tue, 18 May 2021 11:16:24 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-66.xnet.hr. [88.207.99.66])
        by smtp.googlemail.com with ESMTPSA id e23sm12258594edr.80.2021.05.18.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:16:23 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] arm64: dts: ipq8074: add crypto nodes
Date:   Tue, 18 May 2021 20:16:17 +0200
Message-Id: <20210518181618.3238386-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses Qualcom QCE crypto engine v5.1
which is already supported.

So simply add nodes for its DMA and QCE itself.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 829e37ac82f6..194930374bc5 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -197,6 +197,30 @@ pcie_phy1: phy@8e000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma@704000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely = <1>;
+			status = "disabled";
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x0073a000 0x6000>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 2>, <&cryptobam 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq8074-pinctrl";
 			reg = <0x01000000 0x300000>;
-- 
2.31.1

