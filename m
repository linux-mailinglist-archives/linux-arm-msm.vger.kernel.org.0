Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1035653FB54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 12:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241060AbiFGKeF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 06:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241074AbiFGKeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 06:34:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509A564701
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 03:33:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id h23so23205684ejj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Din8b4ZDN1HEqW7Sqe8kkBNl+yuozkXEbwel+kwZoV8=;
        b=dZfRGo6wkdJHzd6+xUGZzUGP7iGh81wHnB2LbxM97/Mlj5ykrgb9qNqWXu5yQbt1Y2
         UU6HJQ0YjNR8MKs+1wBitE7l+r7A9c7CDIjD8oMmsN4GnZ6xoyrAjvMPohHnf0lYv8Z0
         tWalXe8fHZyApWWjqeizj5V6jMJjQ2ZdvoKtctxCnBdGPnAyRhr5fNDFZgZYKnymMfAt
         1biUyTbvHAVaCeNNijSV7oqQxK7lNMDguuiGRFOBzAe+fjCyKqcYXwgDqQtLHxZ6fq2/
         tmDedTs7a6SGyRf2ziqS3LtMeMeMrB45qvOfqE+ERX/BqpHy5b+CGIxydSLQYtOTHplQ
         OGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Din8b4ZDN1HEqW7Sqe8kkBNl+yuozkXEbwel+kwZoV8=;
        b=68zCwJxJ3sXtauLz/nDXra9VO9SbVi48uKE9HCHcWWLCpBPZLmc4zovARMIW5Q8Ix9
         os1x4fqoMyys3Srhr4FFF+FIqbUK2JgB4hjO0iowLKU7T/KuU8MhR2k7+VzjY03l5c0n
         t5S5MlMgk7OmwMlnhSH/Ew8DDweYzgq+O3YrOnV73x9IGmAW50Xl0jIg/kQIhTdj8Ajs
         EmufA9/nJ1/BnWrNv3HJtTujnkh1f947i4d+AnDIjKHG+QShCWueOcsXDqzDQ5K/pHhP
         QELsyCnlL3xzMQQHQR/Qaz6AFNyidCrxuptLDgLrK6Kl1rwbgtoTAtWVaTlYChjDIcwW
         +D1w==
X-Gm-Message-State: AOAM531OqfnIQZQIdDVD1sEeB9FvEjnVEcIkiDLIfKpcmpdikt5tziZR
        FnbLuorhYwgd0cvIHtl7zNZS1w==
X-Google-Smtp-Source: ABdhPJz+3fvEjAfKB5gT7bcoIJU5OB2vBmnwN7ro8Vccgd2VLK0R6k+Id02ZTLH7jnGntIPJmwteXw==
X-Received: by 2002:a17:906:40c4:b0:70a:5d82:4e68 with SMTP id a4-20020a17090640c400b0070a5d824e68mr26220526ejk.172.1654598036835;
        Tue, 07 Jun 2022 03:33:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709065ac400b00704fa2748ffsm7505359ejs.99.2022.06.07.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:33:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/10] arm64: dts: qcom: qrb5165-rb5: add function and color to LED nodes
Date:   Tue,  7 Jun 2022 12:29:28 +0200
Message-Id: <20220607102931.102805-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
References: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add common LED properties - the function and color - to LED nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 0e63f707b911..3b480b9a9fed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -59,6 +60,8 @@ leds {
 
 		user4 {
 			label = "green:user4";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "panic-indicator";
 			default-state = "off";
@@ -66,6 +69,8 @@ user4 {
 
 		wlan {
 			label = "yellow:wlan";
+			function = LED_FUNCTION_WLAN;
+			color = <LED_COLOR_ID_YELLOW>;
 			gpios = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0tx";
 			default-state = "off";
@@ -73,6 +78,8 @@ wlan {
 
 		bt {
 			label = "blue:bt";
+			function = LED_FUNCTION_BLUETOOTH;
+			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "bluetooth-power";
 			default-state = "off";
-- 
2.34.1

