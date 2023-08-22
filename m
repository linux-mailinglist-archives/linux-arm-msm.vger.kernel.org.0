Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317117836DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbjHVAOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjHVAOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38455CFE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ffa6e25ebbso3872933e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663256; x=1693268056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUxHBQiQCwRpfgTCnCWgGQRhrUIliii3ZqoQ/JpTRu8=;
        b=hDVBYUhtgiAPhkap4BfOrWhrE+KJ7eDNmGrFWdI5hi9rOr3hCwD2r0OqDMRkLXBPCq
         5BUSWC7SZVBGUDIYWUdSZM/zX/DnT/a6SNL8LxgqVkZKOSPTY0sefRnIcBKVKSK79dxF
         qQW2LlFiTlz51S81bKGWMr/hyZ7r+Ug09rWSHRBN3VXAcrMYgH0iyq/wzOQoksEmp/S1
         PwSPEq0bY6tFMMW7B8JccPtdY14cMOTviu/1wwEHllhx2nVdZ//jHAvYmV3i+xUuVh6U
         jysMWQ3cPEGaBrMfDFHcCog3fSpfEbNwAbmfiKPvlj6hSymmSU2eW9hfh7A8qH2RqUvW
         kFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663256; x=1693268056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUxHBQiQCwRpfgTCnCWgGQRhrUIliii3ZqoQ/JpTRu8=;
        b=Lp0qFtcCYR/Sp/lK8IKZtVSmqXmT8WG7/6WipWZ2KlaEOJOU4k8JHwfCGaj3y7ADkg
         j5XkuagrmNpSdNwJz4pwP8A1sIHukCpR3FhC3UoQwY6iTJZx3w1L5PGwI8wGa0oWXuEt
         u3PaBsRwcsI1gNGeKyIXxn3zD1m+uQ9ufIpsGXJbaUEUuDF9p2MZNZtZXsd0yf6hGd4Q
         d/bbcdEbvHtE/IepUiLQ2Yz/crG5sAhrZXBoTuUyiEP8ps4LQMb2psOQCvpnN8VzdaZk
         dpJLDZlRAOwadr8si1lM7KNTnYkvy1Em2WtRhFTiPogzUerAeBvpaRHzUaVntN6N/VZX
         BfUA==
X-Gm-Message-State: AOJu0Yz9P10QqiZl0A8YOJrmc26G9vY+a82nGgr2E2jVSz6dmMunIgwA
        CoK7RmApGl04oshkyNOgrOAszw==
X-Google-Smtp-Source: AGHT+IFg1Q/VqL8+WaTUU6FpXA0UCqq9n8pV9Lc87UwKP8g67EDhO3PfLfHd029kHwRZOzdqAY8WnQ==
X-Received: by 2002:a05:6512:202c:b0:4fe:8be:6065 with SMTP id s12-20020a056512202c00b004fe08be6065mr2083638lfs.5.1692663256580;
        Mon, 21 Aug 2023 17:14:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 32/32] ARM: dts: qcom: apq8060-dragonboard: rename mpp ADC channels to adc-channel
Date:   Tue, 22 Aug 2023 03:13:49 +0300
Message-Id: <20230822001349.899298-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic `adc-channel@N' node names for board-specific ADC channels
(routed to MPP pins) to follow the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 8a511f69d800..26066c76e088 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -994,23 +994,27 @@ &pm8058_xoadc {
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

