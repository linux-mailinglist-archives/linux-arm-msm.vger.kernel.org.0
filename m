Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E1470DEB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237281AbjEWOJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237165AbjEWOJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:09:13 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362761704
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:28 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b5881734so4433719e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850786; x=1687442786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veEEIYZ2tnU8dynywIj4SXYMM+OoUP4JXNgjsxIbn3Q=;
        b=XjUvEjtnI4sX9K3uIvE5szYxsknxYZo/E/5fICgE371p63OG8OmP9tuDSt7WDhNc2P
         VUyT1x8QsRNZGu/BWjy9iSqAHO+a6p+crTifs+vvB8l9OyBaktHLNGTftA94B1ljbUQK
         uV3qCb/+jBpMhacXGQ3VqM6eydZnTiuFawDelT5TencczNuTi0bRLiFhtV3v3hzkv6Z2
         L0WKhrR2m01phInOQQAvmSxvRC5Ix0uEuUYiMvFO9IkYmhUFJ8sgA0HKeOQvJeZOPROO
         Kn5SGox+Sn4pSn+D/NEuCvqysVNyzDY5RosTVPoc2OgR4wztOOrFj1KpX5LtNFJNEyUn
         hsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850786; x=1687442786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veEEIYZ2tnU8dynywIj4SXYMM+OoUP4JXNgjsxIbn3Q=;
        b=gkVAbhmUurUtScgTr6XJP3x2fKs/mjMkIJouvmdyJrtIcY7k37cZbe3Ze6mDMbhjd2
         78YD82XARLscYZKs1h+QSHA85U3LuQr02A6VA6d5TB6xtwmYmCtIk2v2HQej83Tg2yFT
         A7wgjmYzDhPVtG7Uo05MvuahhwaZWHbUoUafdvxkP7bdFK2qBRsdSPouTIIObxeKMQFd
         6gdhIprID1vut6miZfj32HShzavO4MwcqjYBL4clhXOt7wn3Lr0bUuAsVixxHQEgeR9A
         gGM9I8l5Sh8kBfBPWRK7cMyuwqOH/4bUOLHYhmQCZDJkGtFUtcFaChJtSqaPp1YuA1Qq
         OxJg==
X-Gm-Message-State: AC+VfDwzo7te7tlJmR+ep5c21XlCMQnKJ+2pfT3ZqhXIu7kG7rCgmZJH
        sAscMfyT9Q1/g+LFCQykrb8AhA==
X-Google-Smtp-Source: ACHHUZ7CNdiFHrq8T3qmYAn0vt57lgf7SAwN2+lsoqpjxKV1/nC4Vr3EJf2bwcv1xeYvJWaS2gEEGg==
X-Received: by 2002:a05:651c:113:b0:2af:a696:3699 with SMTP id a19-20020a05651c011300b002afa6963699mr2600356ljb.52.1684850786703;
        Tue, 23 May 2023 07:06:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l1-20020a2e9081000000b002adbe01cd69sm1633536ljg.9.2023.05.23.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 04/11] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
Date:   Tue, 23 May 2023 17:06:15 +0300
Message-Id: <20230523140622.265692-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b150437a8355..58c7a52ea8d6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -980,7 +980,7 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
@@ -1021,11 +1021,7 @@ ufshc: ufshc@1da4000 {
 
 		ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
+			reg = <0x01da7000 0x1000>;
 
 			clock-names =
 				"ref",
@@ -1037,14 +1033,8 @@ ufsphy: phy@1da7000 {
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: phy@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

