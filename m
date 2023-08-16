Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBB777E0DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 13:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244816AbjHPLwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 07:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244886AbjHPLwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 07:52:04 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A2826A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:51:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so38356735e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692186717; x=1692791517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV00bZkaIhPWpOxXyRCh8E/f/JJawPGdTZeIZXeOFXQ=;
        b=qaoiO6J6BahFe7jSR2wlw2iWxl+NuzmBeCt74oguzunznZWIZm8APWNfCAE0gT1AfN
         A6/SjB5B/KwShKq+qzsLblc3LyZc6+wYIXGOYL3vVVQWIsK2t8zXUUd0hIwkayVIONhz
         5zv2vFJhj1CDYpA8oqM9McT/+QbSI9s9XWNDjSFht7n0xVezbRoZS+3nE+EbpordaQ3H
         Gptbye2QQ2Zk5iXOCaI81rGolmYbfpgtz/wQhgrkbQxkamGaKjppeUk4DDoSSPbwPhkd
         +bNiS7ZqaS3MVOJz+QOXQyFKLWwsN2gEd4CaIVqsWGuweHc2R/B1b2bSpRV62oJRoXDx
         3c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692186717; x=1692791517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV00bZkaIhPWpOxXyRCh8E/f/JJawPGdTZeIZXeOFXQ=;
        b=CHlQ0Km5lyA2Z3ATTTfIPpz3wN4I5JZg5bTTMgIGHW8OaZr3tJuo9lPuiE4UHmQsMW
         QsXUTFMJoMHYwl62Yc3/zeriyUwfHRlgRyI8EC2jQr8x+ZQGXtO6SldTQr8bPc7QT952
         nFSgGKa5ot+/qLRvQCaKLrNJ9SF10tkU43P/CDpJGXjkP32/v2HcaDtrCEl4P3tQ8/fM
         znTTLqeLKolKamHxksHF0WroBOpfTh+aSkjvfN7CEMKLjSjU3CbfFsua/QD2EQiXbCH4
         92JcQ8KsuK0WN7/PqyGlJjDWS05e0dApGB7DlP2+uvxQx3D4Xwo5TSBtqck8tpOE+vL3
         yiyQ==
X-Gm-Message-State: AOJu0YxbFkfxnCtsy81qmnx565zj3x+YEzf54ZXbUdJB44HjsuhRmJm3
        Dmdh8O9IK2d0ZPt8gQ68EqfSpw==
X-Google-Smtp-Source: AGHT+IEtOq3k16VomGJ0zPhS63jvQjeTvHdx15cNuaELY7tU1EaOFnAsRIsT9S9/Ry2Z8SPQ1JtKUg==
X-Received: by 2002:a7b:c405:0:b0:3fe:1166:e33f with SMTP id k5-20020a7bc405000000b003fe1166e33fmr1491664wmi.10.1692186716979;
        Wed, 16 Aug 2023 04:51:56 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id fk3-20020a05600c0cc300b003fc05b89e5bsm21280663wmb.34.2023.08.16.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 04:51:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        sboyd@kernel.org, luca.weiss@fairphone.com
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/7] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
Date:   Wed, 16 Aug 2023 12:51:46 +0100
Message-ID: <20230816115151.501736-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
References: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ports for orientation switching input and output. The individual board dts
files will instantiate port@0, port@1 and/or port@2 depending on the supported
feature-set.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 83ab6de459bc4..c79173504a3fd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3613,6 +3613,23 @@ dp_phy: dp-phy@88ea200 {
 				#phy-cells = <0>;
 				#clock-cells = <1>;
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.41.0

