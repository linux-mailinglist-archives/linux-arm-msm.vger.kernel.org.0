Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB93340EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbhCRT7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 15:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbhCRT7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 15:59:41 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC24BC061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 184so9049249ljf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=QpjEn0TA9chnbxxBaq+eDniLEsmDcAgkh4kqf5Bu68MlJDpI/aUwVmgV9WQkNDDO+Z
         RgDA5MbbVLcHc9WJ52IFB5ugbfPOE2sLkTdZvjRj4bLkFrOdCIE8mFQPV0sVjBp/yA4E
         PI9Krh8DOTbfiJToL9YTB/+4GghRqI+FLGPkqM6m2VWOpBeo/xDZQOD5cHbdbEjafBPk
         SamI+KgmlAtLWBWQM2rkQMm/22Zvqm1HJSkG0VSacD8trtVkj1uuqf/MXOSzwqMi5+Yx
         mMEyxvJix9c3MpckSdJh22pvtX/M7Kvs+IqVjt5c3VOWUmC0o61MbyHUur0pQ96LJD1X
         BLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmV5IJWPHSxLmzC9gCnVq4UR+8W3WxG5ODhCcEewhgo=;
        b=JyoXFcdvO8ffv9Lfkl4DgnmOJNI/3Z1llEenGVt97ZoEFkRHqDCbBGxB0bVIx1dgCJ
         IcsyZfVrpAx6yR0a+jDtJXuhbCmz76dnOGGZsRrWf7JgQlDCc53dhUfURPfQd6ZzCbQ+
         +7bswggqTAlSkfGIUQiYwg8jWHOySYOuyfEEIa1az4QKnQRV3C8mait+azz63NGAuvX4
         gTuW0cQgFRnkihIxJbfg6GUG/fLYdWRmfx+e8QlyRWYYjq5BWC6M144h+MyYT2+fnRZE
         YfaHerKpThN6eG5HRWujBlMVkx+rVYOGAVXRWaAfqXWe08VV0dfG6doPRSqn1mu7J0WJ
         NsGA==
X-Gm-Message-State: AOAM530DmfRWSYXwkoPCS+lNUy6CCr6ceqt6Vi5prsKa53ZXUP45joW6
        auIdsRc4mgBtkQDeykIPTDtl1Q==
X-Google-Smtp-Source: ABdhPJwE5eUPqOopFiIX4mA3GAGdfQ+mD3P+q1vn/68DzlCGjNgyK8TzL44NMm3vHXt1UNrj+Z7ZNg==
X-Received: by 2002:a2e:545e:: with SMTP id y30mr6340407ljd.46.1616097579226;
        Thu, 18 Mar 2021 12:59:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g6sm344159lfh.232.2021.03.18.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 12:59:38 -0700 (PDT)
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
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
Date:   Thu, 18 Mar 2021 22:59:29 +0300
Message-Id: <20210318195930.2229546-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
References: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
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

