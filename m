Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B391D7ACB5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 20:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjIXSbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 14:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjIXSbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 14:31:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81538FC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:31:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ad8bba8125so665262466b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695580272; x=1696185072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjWcS63QejljbTAaZCxi0uzpk4ik0ikwDkLDQ/WQMSk=;
        b=SBUDQVfUfWHfoXPYV1xYpZcH3xi2CHp1OZsmLM0lgG7/hB9Z2LhQlDJaAUyZ/xRRXj
         UwAuVB6u8Ia3JKGmkvXnEA8o1NzDEP7L6QtyAZBSYsbuM6x7dSbyY8w6nEO/L06/zJF/
         YhrJMBvtyHPmfvKdBnYTTBOLTf5iCZStqErPuntFj5SUzGBFO+IRihVRutNUs+tmKoWH
         JoUyq43KgT6e3gS5vX+r2baJl9ifMYnxNvYFFGjr+rcwTvN5EBb2PFzUgHvvdZNyw+MV
         1QjoygiuufrBTnNtBTAdph3pzLD78WWv+C5/zTeUerygrertoa8gvzxvixgojIv6TO87
         nIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695580272; x=1696185072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjWcS63QejljbTAaZCxi0uzpk4ik0ikwDkLDQ/WQMSk=;
        b=qAZb4mF/F4rIrIaCy1P8XAAGzBFOXTb5TtbKc6m2wQiMorcvmGb8+balwOIvlImBRi
         xw/zpVpjcK+G+WzIwACY3PxbfgHt2dqiHMr0ISi3f4D43dPNyiMlQz0lycdoTsQD1+LA
         PrjRLil4QgQoqClNbODQ1XFAsal7ih0bYOAj17ISJlyMknBrowZP5cMnlsYulA8i5M8T
         jvtQqvBTElanfJUaeGvYa6yaWfpL1ijGxxHFLU+mtdTC7S1GKku0HwtUDH8dQy1eX8of
         RtyYPq5JJ4AsJq8c1eMgygrUCN75Ftnl5jxk0acickuSBLhLMh9u53qIaXMtZGpmhv4E
         oweQ==
X-Gm-Message-State: AOJu0Yyx09RNtrUOIOTIVfL4qvksiVqc0aPyipO2j9JGfPcm1qGUjk9q
        WEpjvRPE4pINm/b2dDrjF7533w==
X-Google-Smtp-Source: AGHT+IFEm8mCP5zUh5jnGWNXDx9Yw/cImSj86/qjegCW0fh8SN8iR2IfgnFgrBR/dgTNqUN20rZMCw==
X-Received: by 2002:a17:907:60c7:b0:9ae:6196:a4d1 with SMTP id hv7-20020a17090760c700b009ae6196a4d1mr4070144ejc.68.1695580272081;
        Sun, 24 Sep 2023 11:31:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id ty15-20020a170907c70f00b009ae6a6451fdsm4599845ejc.35.2023.09.24.11.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 11:31:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 3/3] ARM: dts: qcom: sdx65: correct SPMI node name
Date:   Sun, 24 Sep 2023 20:31:03 +0200
Message-Id: <20230924183103.49487-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org>
References: <20230924183103.49487-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Node names should not have vendor prefixes:

  qcom-sdx65-mtp.dtb: qcom,spmi@c440000: $nodename:0: 'qcom,spmi@c440000' does not match '^spmi@.*

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 4a8cc28fa1db..49c16ee2e169 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -537,7 +537,7 @@ restart@c264000 {
 			reg = <0x0c264000 0x1000>;
 		};
 
-		spmi_bus: qcom,spmi@c440000 {
+		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xc440000 0xd00>,
 				<0xc600000 0x2000000>,
-- 
2.34.1

