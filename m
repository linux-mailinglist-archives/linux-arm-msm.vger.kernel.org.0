Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3666C54F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 20:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjCVTbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 15:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjCVTbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 15:31:05 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8103A6505E
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so77472604edo.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679513456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKARDJu9nrbYePhQD+wO6UKNzl6w7o8kKIfBm/2S+Wo=;
        b=wLJAUN/1BR5K4lkl7ZxSYqHdEgXdPHMA0/wes72PIQy34qmcJJBd+kx/rWyyR71E3W
         9q8mrfodXvXYFGvEL57zUwrrBfcdnZpxoXQB+C4fEdq6tylPvZHfH/JoPeaSTT6jel+E
         7EfxnXNPiM+Xr00IkQYBo9f8J7FxljSk8ErXMoQt2YlnrGMIBCyxD/tfmwQ86FUwsld7
         xVnPnk+T+u6so9x2ns9k7mkhfhydBBz0YsvNEy1Obu28mbcErnb7+ItGhk9N25cQpjvT
         ZuFNPtae2DaZbt2e4PpLwRl0Ofn7bsKrei7Mc3SREfkoTAzjLSRJ00VaKRXA9yq2XNqQ
         Cj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKARDJu9nrbYePhQD+wO6UKNzl6w7o8kKIfBm/2S+Wo=;
        b=BItEDsowK4FHCwbNh2h1N7CNHFnOJn/qs2Fb/+k82BRIUslzDwhznUUBS0JuiNTBsO
         mDyLGg6Z5X7fiaFLc4mQy8p8761voaetzCrUeBTt3RnlOeTIwHAr8l0jdAdvR0aCD1x2
         P5kGG3Ti9xj++FuSRbG4/3uJsB1Wyp20qF2KwYJj398LEJbv6WmzaRbj7XD2MIowj8fB
         XdbD17L+9YBIQ99zuJ1RzM3nZ034ptYZlX4zg4TOB428MIsXVL8LR8UmPLoRU1wlRbNL
         PlM9kzsnx7tzv3aghG3igThcnTSIqtB2N/IDC3U+6PeusFP1pE2mvnn0AxMxm52ZuEe+
         Hpyg==
X-Gm-Message-State: AO0yUKWWHLnzmGQmcxkjSwKrDESg29beYvWrA0ILNI/u4vshAQ0ap8cV
        R1oY/fQgs/o1jlAZ5kQ/tB+csQ==
X-Google-Smtp-Source: AK7set/XzaLeAlmagzMRB4NuJaWLzeawOyq8H1ju+7ksDgwiTs2aeKQk7wrXrEMbKPF9JrOncg7VsQ==
X-Received: by 2002:a05:6402:1762:b0:4af:70a5:560b with SMTP id da2-20020a056402176200b004af70a5560bmr3638571edb.9.1679513456646;
        Wed, 22 Mar 2023 12:30:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm7660309ejh.96.2023.03.22.12.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:30:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 3/4] arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown GPIO polarity
Date:   Wed, 22 Mar 2023 20:30:50 +0100
Message-Id: <20230322193051.826167-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
References: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index e54cdc8bc31f..4c9de236676d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -764,7 +764,7 @@ &swr0 {
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
-		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
 		#sound-dai-cells = <0>;
@@ -773,7 +773,7 @@ left_spkr: speaker@0,3 {
 	right_spkr: speaker@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
-		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 127 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrRight";
 		#sound-dai-cells = <0>;
-- 
2.34.1

