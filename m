Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524976D7432
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 08:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237042AbjDEGJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 02:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbjDEGJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 02:09:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7770E2713
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 23:09:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ew6so138281910edb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 23:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680674953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTARyjbA9HHZxEptX/YxUmGndRPMKWlLXqPsf7UDIq4=;
        b=G+1aDLSeN5pHjlD2znOVASlP+jdalJBMt8Qfny2x702+SNEP0XKZO1jx/phwFQZ3xU
         Umw7JKZ79jGMkS9F3Gcm46tQUTXHb3aE96C1MTikeAsOaHPASswibZS62Oh4pZwiBOUP
         vknZysTpWl5FO+aD0tiMaGpwF14aYDS2ErHwGoaqyv4xiTdwpjAx56xb4ubdu0dKafTe
         vttIxA/7JcZeH1/ZbqqNUb7jeX5cD2PDzGJaV3yDCwjUFTJpVnBGd3Pt6eCxzKi82ZK8
         eNfR94y0aXpDzON9+JUQeAyQ0REPKC/mqqca8E7MjbF0OBNlKQLcbtDTYbadCPTVp6Lr
         Ci4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680674953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTARyjbA9HHZxEptX/YxUmGndRPMKWlLXqPsf7UDIq4=;
        b=KrWpdIxNntlzC3bOL/J2ixwCtKPUny0EBWwr3hAoZPZ0mC1j1vdu3RcEXdchzPY7zx
         z+TJCDDbwyNEhnySIvyVYJa6OSsFkHOasCBRfKpr2QNLXV50oZw0T6X78GjDEF0OsEss
         Fk0Cik26oo1/wcmETo8JF8iq4xjfm2EDOhUr1vPTgSipM/K2Bv4K83rjUzRg1OXipvVp
         o3SAP8lfn7BTqtcKwAOHeE4y3rIejOQP2lus257wixydywnmOM78/ctQ3REEJ1THJI3l
         8Zo+N92gpCm1DeI26rQbf6c3ZPI4ankYQOvgsjzcJH2KpNwGh8W2h1pjlK831P9TbweG
         fEQg==
X-Gm-Message-State: AAQBX9fQFm3eFwFMgFrTLLjPakSL8WhxEoXTgwH362RYlp+9PPfej22Z
        1Y0EfXTNIthvv30Xu/4Ix4VnaA==
X-Google-Smtp-Source: AKy350Z7IcLcBX2c/n+pCVziu38BjdVyq57xOIDaaUYKdRNj9m7QUC4GObtR9svnvkBIwwjykHuisQ==
X-Received: by 2002:a17:906:8244:b0:93d:e141:e958 with SMTP id f4-20020a170906824400b0093de141e958mr1809761ejx.15.1680674953012;
        Tue, 04 Apr 2023 23:09:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709064e0c00b00882f9130eafsm6784643eju.26.2023.04.04.23.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:09:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] arm64: dts: qcom: sm8250: simplify interrupts-extended
Date:   Wed,  5 Apr 2023 08:09:05 +0200
Message-Id: <20230405060906.143058-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
References: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The parent controller for the interrupt is GIC, so no need for
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..fae30dc58eb5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2366,7 +2366,7 @@ txmacro: txmacro@3220000 {
 		swr2: soundwire-controller@3230000 {
 			reg = <0 0x03230000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.5.1";
-			interrupts-extended = <&intc GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core";
 			status = "disabled";
 
-- 
2.34.1

