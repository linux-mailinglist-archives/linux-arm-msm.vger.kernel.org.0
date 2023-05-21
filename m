Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482D770AFF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjEUTgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjEUTgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:36:41 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7631CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af2ef0d0daso15302581fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684697799; x=1687289799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWtQzjHUlWVKjR6hyfJMpC5Arsr78CLVvJSVCwCWijI=;
        b=Vyac5jY5NWZ3YZ4oN5m8mcySexoGPR2F9nfouCoONTepm25fG4kxKzm0EhXIoU/H3Y
         ZkpIKf9NHtuQv/kB0u9Yf289QNy3jT4C9D/QaOK+e6LR5PfPvHW7JbCcFbEmnT5bJ4sq
         eJaQ8Te7k5Qtvr2DZlG9YfH6lomaezHR9YyIC9LUQSFFd3lFhm8IXTfLZqWCu6ttSYNC
         wrUbsobagV+xbOrOYmroMaE8NtSaL2gK9/F8fLhAu3bbiOLxpFNmlP14gxeVq7XfglDj
         pMf72sdb6RY2ONhlVqoLmqgbnt5Krvg1Cq+kJfWV9/QbGq/Zfq++X1C+s47ot+m1V3ds
         Qmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684697799; x=1687289799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWtQzjHUlWVKjR6hyfJMpC5Arsr78CLVvJSVCwCWijI=;
        b=Py4MddX/wRGmg/VnslhgxUjMJnNPhjSpHtT+41HCocG6gbDdWQDtNaFU9dn8NbrJqd
         I2sh6836vs2uV4WW7tY3tNwTM8eg7YnXNJ/paN3dQ+tqoI9NvAm2F5awran9wYIVd4Ci
         yr1AQG5VY+GZEfcg09VL47NCGcvAlMwNTgn8/g9zUJTnES1U9jvG9Z4w0td4fgL8gNIw
         jwe80Uloav4U+eCIXIdihyOwlfqKEmyZy7mnMNTZjbfNkhfuxkJW7+57vk+rCBvnOcXM
         NDbiUykzPj+2AHJ3diOXvRmnBCHniq3IaM/XvUXVkOBV0mqKrA1SLjhNVj7Z9KOmLprd
         NShA==
X-Gm-Message-State: AC+VfDzPO+LuYJ4qaF13qpgAWZ/weChgggvyeUPx1EYrTgpH3sarzvl/
        j7L12sJv1K5eAcaThJsIEIs8zA==
X-Google-Smtp-Source: ACHHUZ6uV8V6xeI0N/grDNzxgfqzyth+cO9A1Msp0VSfKxp75OdMIwv1dBCAPmCeRp0JD8VtdLuq2A==
X-Received: by 2002:a2e:b301:0:b0:2a6:16b5:c658 with SMTP id o1-20020a2eb301000000b002a616b5c658mr3149346lja.31.1684697798952;
        Sun, 21 May 2023 12:36:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm830009ljj.7.2023.05.21.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:36:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into USB+DP PHY
Date:   Sun, 21 May 2023 22:36:33 +0300
Message-Id: <20230521193635.3078983-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first USB PHY on the sm8150 platform is really the USB+DP combo
PHY. Add the DP part of the PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2273fa571988..1f442e1be63a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3399,20 +3399,19 @@ usb_2_hsphy: phy@88e3000 {
 		};
 
 		usb_1_qmpphy: phy@88e9000 {
-			compatible = "qcom,sm8150-qmp-usb3-phy";
+			compatible = "qcom,sm8150-qmp-usb3-dp-phy";
 			reg = <0 0x088e9000 0 0x18c>,
-			      <0 0x088e8000 0 0x10>;
+			      <0 0x088e8000 0 0x38>,
+			      <0 0x088ea000 0 0x40>;
 			status = "disabled";
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
 			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
-
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
@@ -3430,6 +3429,16 @@ usb_1_ssphy: phy@88e9200 {
 				clock-names = "pipe0";
 				clock-output-names = "usb3_phy_pipe_clk_src";
 			};
+
+			usb_1_dpphy: phy@88ea200 {
+				reg = <0 0x088ea200 0 0x200>,
+				      <0 0x088ea400 0 0x200>,
+				      <0 0x088eaa00 0 0x200>,
+				      <0 0x088ea600 0 0x200>,
+				      <0 0x088ea800 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

