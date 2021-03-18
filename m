Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5435D340778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 15:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhCROMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 10:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhCROLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 10:11:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B55C061762
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id r20so7676333ljk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=B3bozCUQ6IypnBqTRqpNYdCSb/92UDw7mJmhaExS+m8Oii7jIV9SfOaF7043wWIUSU
         7ea5iLRenx2BfJCnSNPRuqDs6kBnat72g1d5tWDU5eE3WnGk8nMojXFr7eXVDmgi1BCf
         e8HPtNZfQYbEGx33rKtdhR2kJR/nlFQby6KvzYCbK1KXcQhhOiRp0tHl2pR8qHQnJkPP
         ALJOI2C+CwuCl7n5RZqgd8y29RSFef71tlLWlGcr4/Wxulv6jaEmxEdXng4yFlGRh/xc
         qac3v6cgowhiiUW2Xkziv5hs+LlYrhg0QC/hbWMKR8sk3hOOqG4DKlk2lbZPBg7DZ5IG
         2c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=cxaohXklHFl4YutXUkpgibdeFiulDsnksz7KVlpWs7kWTKBb4PAG4KkjU5AtMfmfoa
         Kfn09F5NWnI/jQZrdTwPhB3e2NZANajHmoBjq65qjeXGuTfZ2g6TDTCBbOmnKrGLJhfW
         AccKm6ZNGeBCAtSj+UG0mk4y4OsjGTqX0rIdl2F44BlXe7CSlCgrQg1uhHfgkqCwduwx
         EDYXyf9fT7jgjA3+CLavOzCQpVN83pY9btEdRd9NwU5s2QZloc0JQ9r2RqvVKxtBEgWE
         nO1amXm8BbXSwV2QRfrvz8mZPV3r2k2U9Ubyw0Kv7ViBvXnagjlRN76FYJXZbbvsYrSq
         yH/w==
X-Gm-Message-State: AOAM5311NlPJk411QXXRWYMiEnMRmB09H50UzXKdQx8bwPIXRoNqgo6G
        7hggcLKdR95Jwrww8HUHkJv26uEU0YqS4A==
X-Google-Smtp-Source: ABdhPJxjaAWqGINArbD8oRY1ClmMevCAN5UcsMSGevw5Wr9wi7d1NclQSPUCWMVf+nSgNSYLTboOYg==
X-Received: by 2002:a2e:9d4:: with SMTP id 203mr5463346ljj.211.1616076710776;
        Thu, 18 Mar 2021 07:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20sm254713ljn.123.2021.03.18.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 07:11:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
Date:   Thu, 18 Mar 2021 17:11:43 +0300
Message-Id: <20210318141144.2147610-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
References: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

USB1 QMP PHY is not just a USB3 PHY, but USB3+DP PHY. Change device tree
nodes accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..0f79e6885004 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2097,12 +2097,11 @@ usb_2_hsphy: phy@88e4000 {
 		};
 
 		usb_1_qmpphy: phy@88e9000 {
-			compatible = "qcom,sm8250-qmp-usb3-phy";
+			compatible = "qcom,sm8250-qmp-usb3-dp-phy";
 			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x20>;
-			reg-names = "reg-base", "dp_com";
+			      <0 0x088e8000 0 0x40>,
+			      <0 0x088ea000 0 0x200>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -2116,7 +2115,7 @@ usb_1_qmpphy: phy@88e9000 {
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: lanes@88e9200 {
+			usb_1_ssphy: usb3-phy@88e9200 {
 				reg = <0 0x088e9200 0 0x200>,
 				      <0 0x088e9400 0 0x200>,
 				      <0 0x088e9c00 0 0x400>,
@@ -2128,6 +2127,20 @@ usb_1_ssphy: lanes@88e9200 {
 				clock-names = "pipe0";
 				clock-output-names = "usb3_phy_pipe_clk_src";
 			};
+
+			dp_phy: dp-phy@88ea200 {
+				reg = <0 0x088ea200 0 0x200>,
+				      <0 0x088ea400 0 0x200>,
+				      <0 0x088eac00 0 0x400>,
+				      <0 0x088ea600 0 0x200>,
+				      <0 0x088ea800 0 0x200>,
+				      <0 0x088eaa00 0 0x100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.30.2

