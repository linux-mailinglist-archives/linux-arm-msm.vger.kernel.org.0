Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26C16F9AB2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 19:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjEGRp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 13:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbjEGRpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 13:45:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6E3AD3C
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 10:45:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-966287b0f72so203772966b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 10:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683481521; x=1686073521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Wo54dN/w6EQWeHzuTUVMhp6njY4onW4frgeHv5uzMw=;
        b=oG4s+fUjxa99NsmyDtgkXb/obWuSgRnO7Sb74hziJt/ntqjipycnmVQZq/MObpdgvz
         yY8HjOn5TolWcDF/BvX24pbyIQ4mq2kIv5JG7ExHARt+Z/HuvCwPPe07CNJIIkmgBpHy
         UgoNgv6pSu3kFTKOREOsJ/f2lVJ6rK+eJLfiwDY8yKHJeOKjFhnANzJ18MhorhHtGrCy
         AG65+O+e0cy4P92y3a6UwCijaHKnSW7R/9smpM1zhiive93d0axAVTAmFAC+3izVVSgU
         +KlY4AAE9uUk9a2aznkTjr83rq5lhgDNVg6PMSj5RP1n+CRQKSS71lzLqyMdhnZDRBCT
         1aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683481521; x=1686073521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Wo54dN/w6EQWeHzuTUVMhp6njY4onW4frgeHv5uzMw=;
        b=Kj2yf5aaYBnShQXVRj+SpkJhwLuHooD8lL8crjaww4uHNQt1HFEd/fLWRm08/c5bAD
         +D8ktWayROgRhipN4FAR76PhS2DUafI341s48rC1avUOWs4oQm9lhVPXtaKCqPRwG5lj
         xwQV8MQlyhKcXGExkGx76SxzehdfAZIVBbdx/tMBJ5yR6zl0R+u3U3hw0os9IWaSoGDW
         S3ef2rsVI3GhKgyTV5mW8WiVDIpSe5KvHloazkm5+qIlGg0ZEIygZH9VDXw/JdT792D6
         j7+s5afYU952owX3b5AdolEgnq7/s6J84NH3wd+PYQNBa5l3VJEDMXOOR1rfR+XHWWrM
         Colg==
X-Gm-Message-State: AC+VfDzsil7qUecwZ3piT+Qpeov5q3EqMYVdoPnFAEp17GyFvMcFZ/74
        KYjKi3DRzTEnHFgb+Zr1ydOV74Gxvb8is6+XJQ+fsw==
X-Google-Smtp-Source: ACHHUZ7FrAtfE1nM1pDeG9fGiz7i3jtAlBERGioOA+ybORu8xzdSCfBnjZqMtALGeTeOzZ0eFz0P/Q==
X-Received: by 2002:a17:907:7e8b:b0:94e:5708:1564 with SMTP id qb11-20020a1709077e8b00b0094e57081564mr6658141ejc.22.1683481521157;
        Sun, 07 May 2023 10:45:21 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id jl3-20020a17090775c300b009655eb8be26sm3950864ejc.73.2023.05.07.10.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:45:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: apq8096: fix fixed regulator name property
Date:   Sun,  7 May 2023 19:45:16 +0200
Message-Id: <20230507174516.264936-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230507174516.264936-1-krzysztof.kozlowski@linaro.org>
References: <20230507174516.264936-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the typo in 'regulator-name' property.

  apq8096-ifc6640.dtb: v1p05-regulator: 'regulator-name' is a required property
  apq8096-ifc6640.dtb: v1p05-regulator: Unevaluated properties are not allowed ('reglator-name' was unexpected)

Fixes: 6cbdec2d3ca6 ("arm64: dts: qcom: msm8996: Introduce IFC6640")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index 71e0a500599c..ed2e2f6c6775 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -26,7 +26,7 @@ chosen {
 
 	v1p05: v1p05-regulator {
 		compatible = "regulator-fixed";
-		reglator-name = "v1p05";
+		regulator-name = "v1p05";
 		regulator-always-on;
 		regulator-boot-on;
 
@@ -38,7 +38,7 @@ v1p05: v1p05-regulator {
 
 	v12_poe: v12-poe-regulator {
 		compatible = "regulator-fixed";
-		reglator-name = "v12_poe";
+		regulator-name = "v12_poe";
 		regulator-always-on;
 		regulator-boot-on;
 
-- 
2.34.1

