Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A70789EA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 15:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjH0N0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 09:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjH0N0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94211B8
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ffa6e25ebbso4019368e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142756; x=1693747556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXt286sPhU+yVmzfDKl882XWnXgjzSmy9rWB6wpkCI=;
        b=rm6AdYylOWN8hX5/ZNUahYlblmlR5Ib41IGJ2Bt50ZwaUxhc0yhd5gsUqgEDzQm7D4
         2Bwiz1ivug5JGN+C8q+OAuANsEQs7V7a2X89vC73plWanRUe3LH/bPuuGAv9Dbe31hqr
         /ig+E5sUMfYnGjBo+OUn1ZvyGJMAPpE+tdVCrCu9EfGcBSB+BSZBcKSXE2s6vhVh/Fvf
         8zv55DFJN6DAI0kq19aKLvEEwdMBRqHvh5kdVm+zXTdP296d5pLEIgenfQ0KqS62EJGQ
         DlDkpspKrPYTMeLGaPgQAPRyCAATu9CwvH/J/1MquucLoofKdK/ZUbGDgqofRDYRpjFz
         kMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142756; x=1693747556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXt286sPhU+yVmzfDKl882XWnXgjzSmy9rWB6wpkCI=;
        b=LXdaURvi+lxXLAv1x3X7+412oA1Ln3UEGixaWpqYfb/QJJyjLfLZ2O2QMhxXARnI+S
         LafFGBSg9JUvnyKcmVGaOxtKATG3WSmJY59p5ragU60C4wCe8TrUvCsCwkc8fCHJr5/z
         fZYzJt3lkpm7XqlG1G6EibjTSzT8aBxsMe7TYs4mZTU7kv7WdgD9/LZ7k9VNYTqanR2Z
         RtsclPdQTcxGaJa5t8k5OHDRH7f+zHfsb8OpmH/sas5Uxmwvr8fBTKt/gUn7wTDD0bNy
         2fPk6zh96ac7BYr3j9j90256HLvRoPuTS62pPq3wbXhMOS0prHkiJ1RUWOGVMHZVsZgT
         R5Xw==
X-Gm-Message-State: AOJu0YxiBEBHc+jbEDvPlXR3X0Jk7MzoSnnaTUn9eCLLhFSItQKb9Gy/
        PZjY8QtvL6DiiBvukCFv32XL1Q==
X-Google-Smtp-Source: AGHT+IGazNviFIpfQK9f+Atmuyr77uQaNDyew3nGBGqOk2spz0FokbHTOT1pZ4S922Q3I4zqUf0u1A==
X-Received: by 2002:a05:6512:3da7:b0:4f6:3ef3:13e8 with SMTP id k39-20020a0565123da700b004f63ef313e8mr8500642lfv.0.1693142756096;
        Sun, 27 Aug 2023 06:25:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 35/37] ARM: dts: qcom: apq8060-dragonboard: rename mpp ADC channels to adc-channel
Date:   Sun, 27 Aug 2023 16:25:23 +0300
Message-Id: <20230827132525.951475-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic `adc-channel@N' node names for board-specific ADC channels
(routed to MPP pins) to follow the schema.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 8b70d4a59c7b..bf2527941917 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -998,23 +998,27 @@ &pm8058_xoadc {
 	xoadc-ref-supply = <&pm8058_l18>;
 
 	/* Board-specific channels */
-	mpp5@5 {
+	adc-channel@5 {
 		/* Connected to AOUT of ALS sensor */
 		reg = <0x00 0x05>;
 	};
-	mpp6@6 {
+
+	adc-channel@6 {
 		/* Connected to test point TP43 */
 		reg = <0x00 0x06>;
 	};
-	mpp7@7 {
+
+	adc-channel@7 {
 		/* Connected to battery thermistor */
 		reg = <0x00 0x07>;
 	};
-	mpp8@8 {
+
+	adc-channel@8 {
 		/* Connected to battery ID detector */
 		reg = <0x00 0x08>;
 	};
-	mpp9@9 {
+
+	adc-channel@9 {
 		/* Connected to XO thermistor */
 		reg = <0x00 0x09>;
 	};
-- 
2.39.2

