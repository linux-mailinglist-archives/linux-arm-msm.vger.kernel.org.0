Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246DD792AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjIEQqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242242AbjIEQed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:34:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBFC2D5F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:33:13 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99357737980so417469366b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931465; x=1694536265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lliAJnjKGrKN2HdJy1Zp01oKeEF+jouNcZc6sxAEmg=;
        b=AeaUwT+RZbntyjLvbbf2GnUCUDO1GNIdSqjXawsGuxfKVmGEF0ldsVOeYHuTo2koC5
         GCLcxRNHBTEUG+k3cwrENbNG+Xy5TMyj537aFWdJXe+j1HH98XZgnhMRtcfE7/Gbo6RI
         mMS1iJSGmXlSHewoiux0vLafQGXKOHmJRk/zBQTL0fw8s+ZAKEVQbe0Y0CuelE5NKgiv
         c0hJoIQy3wSgrzuCawkruMH5o5pOlmyd1gAxtfZK6zEfspJAA9hHY6hhK2ECgHtr85LF
         qG6AY/8vwrgIl9/o8RwBxjSxJTLABcn8qUAuq7jQFUL9x8j3tkTrPAKVdLnSWL9qO3yi
         349w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931466; x=1694536266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lliAJnjKGrKN2HdJy1Zp01oKeEF+jouNcZc6sxAEmg=;
        b=f4Ao7PXDa2CdVlZiLF9TvhACaPtgkEePvJYDW0bSby8FDuXBWsEkvroLyBVhpZnul8
         axmSnfFiQc4ha5Zy01vrCgcPxcdylFd7lFToaDv+eh3eONyU3g5SGGjo6jMMVLUiLXlC
         jHHl+S+urzB52Yji8AZQ80DUx0Txn3swICv3zi40Ihwhx3yMMIprBQP9nyhtZvOt7rbR
         HYjCvQuS/+TWmd8FqDKO6c2XbAMP0ULvvmYhpU5q8JlUE2UkZIPh/qS5zmCLykBvjKJj
         kIZ0RZZcIU0dL8kPn+gCO7guVXhuR4/5Ea7s6oRzDlGAeKyP6mz73rwI5L9VanYRMpAd
         gLkw==
X-Gm-Message-State: AOJu0YyHIUm/Di4mc6nrP4C4ytgyLhMAkMjExvCJJSzCSIloOAOagEmS
        tQ9W2WVoAu/pBt3j02AaWsQcLfnuRa0XYdjqeWs=
X-Google-Smtp-Source: AGHT+IGc9ZoOkCPrWQHAvmzavnP932KKSQltJbJVFwE5KtY8VTlctUL6wrsqrWGa8tPg0SULxnh2RA==
X-Received: by 2002:a17:906:3054:b0:9a6:8219:6e0b with SMTP id d20-20020a170906305400b009a682196e0bmr307473ejd.35.1693931465798;
        Tue, 05 Sep 2023 09:31:05 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906395800b00992e265495csm7796187eje.212.2023.09.05.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:31:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdx75-idp: align RPMh regulator nodes with bindings
Date:   Tue,  5 Sep 2023 18:31:03 +0200
Message-Id: <20230905163103.257412-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Device node names should be generic and bindings expect certain pattern
for RPMh regulator nodes:

  sdx75-idp.dtb: rsc@17a00000: 'pmx75-rpmh-regulators' does not match any of the regexes: '^regulators(-[0-9])?$', 'pinctrl-[0-9]+'

Fixes: 8a2dc39d1043 ("arm64: dts: qcom: sdx75-idp: Add regulator nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Really, I can't believe I am still fixing this stuff. New boards bring
the same mistakes we fixed half year ago. Or even earlier...
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index 10d15871f2c4..a14e0650c4a8 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -44,7 +44,7 @@ vreg_bob_3p3: pmx75-bob {
 };
 
 &apps_rsc {
-	pmx75-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pmx75-rpmh-regulators";
 		qcom,pmic-id = "b";
 
-- 
2.34.1

