Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC5C779B9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236565AbjHKXrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbjHKXrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:47:47 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAC519AE
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:46 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso24102055e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691797664; x=1692402464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvdIfz5zUOd71DmktwXF8XCtGN303BHSgHFEyeqUTG8=;
        b=pHllTPeYcqkqT3mxYtyqZzXRMvNCn77gEn0lSUfMTjxHRN+wzWg0Y+Q8mKfx0ywRSy
         he+Ph58EzWjhHDJTc5Vr6RGRRC742Hx3SzHIBde3HnWr7PscvbicVgtqgjjZGJtHfe4s
         +O5e+kNRzQlDCXXX0J5FCl3Jr/hrUo/0QKj8HzolPUCfjEplrucOFTcCILyGHgTxvDMj
         OSDfELh+QRZ/SaXb7KxenenNr/g2ww4wyaeRLYdtvedZIFuihxcd8nmIXvlaalsTCANx
         mgXwCzCniYxUps6GD9l3lHe7eC776vY/Olm8baXQEzUyf1YftC3w7BOxpWbWIWXtUL1x
         qI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691797664; x=1692402464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvdIfz5zUOd71DmktwXF8XCtGN303BHSgHFEyeqUTG8=;
        b=K4rAqrfITqQwAXBAOXJfHlVRI1PBXBfMGPO3dyCNRilKvifie5chabu4ydAFKM+ei2
         MxxMs262vwh9xi+02wInkPGKY3MqHHbJgzDQbsL0QA921uFxcVS1WGr23frR5yKl9U3A
         sdi6JsiHxutCtZEmWhYd1GfNppTQCD8zBlRPgkJxfkrM159ahEzhyf/fMLpYyRukgldj
         J5XtjZ+UEUnwsXz8TJbJMz/mpNWJ97gdtYUDLMHAxDelV1eBzClhDDnRS77dJJJTQKyK
         XveQL7E08RLatujPyiae+dWUcS7ESGxD1bWTDLmW/kEA9QVq9fAI8fXTRYYcuZeJDVYM
         jzTg==
X-Gm-Message-State: AOJu0Yxnl+2gmEB8RqJf5KdpILCP7xdN2PgaoZaCnEPIa0wunZSTdxwl
        1QZUIcCgvrVBRNQW0hr3EJGc1B9phrf5rjmUZoE=
X-Google-Smtp-Source: AGHT+IFvieQ11KvEBFS2fPlThzOhRAimEDTWxlxg9HmA/9TJr+MANKmVUsQDF/iLWsmPuCzxRing6Q==
X-Received: by 2002:a7b:c40d:0:b0:3fb:415a:d07 with SMTP id k13-20020a7bc40d000000b003fb415a0d07mr2633477wmi.36.1691797664589;
        Fri, 11 Aug 2023 16:47:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c025400b003fa98908014sm9599051wmj.8.2023.08.11.16.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:47:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/7] arm64: dts: qcom: apq8016-sbc: Fix ov5640 data-lanes declaration
Date:   Sat, 12 Aug 2023 00:47:34 +0100
Message-ID: <20230811234738.2859417-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
References: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The yaml constraint for data-lanes is [1, 2] not [0, 2]. The driver itself
doesn't do anything with the data-lanes declaration save count the number
of specified data-lanes and calculate the link rate so, this change doesn't
have any functional side-effects.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 75b4e5ff7c95c..0481a4a82090a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -291,7 +291,7 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				data-lanes = <0 2>;
+				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
-- 
2.41.0

