Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768A134AE23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhCZR6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhCZR6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:58:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6A9C0613B5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o10so8888455lfb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=jVXSrsSq0OD3XN58B9etBTnhroLvBAvuKyZ9pu0B8WxvNpEp9EYgRsW/5HR0ECgRKP
         dfFfCW/u8i3QkXiKbiJ6m+C1qaa2/vwaSJcEGjkXOdvPbYqt7627RdXMH8TMiT6L9FjF
         f6NbXesFdWtfYjgsmfsBG1lMPpfDSdBpnkUG7PvLuqjvRywYOfTEV1mrNmEnObgakdio
         T4+XDNHSBJH/if8zzUsPt670YpRc7gXgmUX7L7oRDTRBNJoXg9NEIrk2l7eCLM1ydyLt
         WbrzCDbg4cKQ4eHmR1lWxe/hLUFk6pjZbGhrikFR9ozMGMa/dWVmqDgyqkgScaKwrkNw
         ztaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=NrhTW8SxfI0lag5RTIXRW/32gBexY1WRXyimMdnAevLY5UvaojVDh3qXljzUuZB4ZR
         VrjwGQez28hlYvHkOUXd05q2EiiVXxTCQDYNdPQM09OlOmF+eOFleYKVDZv9jkYBla/L
         JbdSgYD4+59sZD80qLbWdUMWYrJfAqk12AumeJsXlcvaIKtblpooBx7Mgekt0xbMYUyQ
         lZfP37hb3JaStN4skVGWd5GdhVfMdI+iSjKoYn7mifD0zwo8kRMY3OuIqA6sRmQIKVbv
         vP2lzEEksIkd1WF6vaoQ+dpnQr+FSUYLTFYq7lRz1N+qG7w3LtW4gH/NQYM8w75vPYli
         4gXg==
X-Gm-Message-State: AOAM530kQ8s+VMpNOObklL5LgRpNv74F0jsLPqR0ccdv3L1b8iJ8NqZM
        JFs//mASwzLiTurJV6Zm/gvl7g==
X-Google-Smtp-Source: ABdhPJzYvFGucWnT/RRpNjfrI40LoUvlcTs/LOX8D9aP7BJ5dIEYkMAgsG8RrOohetNtr/vNH7d7yw==
X-Received: by 2002:a19:e347:: with SMTP id c7mr8500751lfk.632.1616781496262;
        Fri, 26 Mar 2021 10:58:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f3sm1249554ljm.5.2021.03.26.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:58:15 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
Date:   Fri, 26 Mar 2021 20:58:08 +0300
Message-Id: <20210326175809.2923789-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
References: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
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

