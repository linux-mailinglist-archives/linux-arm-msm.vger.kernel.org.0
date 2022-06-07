Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2D65404D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 19:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345627AbiFGRTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 13:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345730AbiFGRTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 13:19:13 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D281059CB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 10:19:05 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v25so23891824eda.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KX0bvh9m5E/An1OjTL+Smck+4fFRXA35dGwS1mx4sTY=;
        b=HdD2iWwBA/mOFqDrrcz6IVv4pA1shuP94FuOt6TAbNVUz/e1eyD5yR+WnH/wu3VSDZ
         596J3iXVGEo5x+W8EkRYpK4tLSON8Fu7rwYyMw5xFJlwVzhZjdBTFJ8XQd3WwartRkIu
         cV7K3pNHQQ6sLNZmoA0T6htoG+WddpbXW55gjBV9yxwu1/8Hi95VBmZ4tsfU9DnwwXpw
         Z11TWY0PAr1bNOTtSJ05MERk8QSNpHPXD5tEQeU/udodTEMiS7MGzU62SHMmpx5dFHOV
         P2BLQFrGP2D3COQ1JktO4lSScTgNf4gWS+2Us85oj44X6h7OZn9qiEFPr4DwVArcwInJ
         +cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KX0bvh9m5E/An1OjTL+Smck+4fFRXA35dGwS1mx4sTY=;
        b=P2NS1FB7ol0m8uLYN/qjUwNTGVSDbgvvK0RpyR0vlCvyECE/YMZnEteHk9QvLAmYaU
         f9VuKJ+/x5VU/k88KDLFH9fm33AhtGOYB936DeVSOc8BKhVzUp/Y8/g0uEIvvZIe4JtH
         XeaTR7mrGBHVCeqUKboGoSBxTj0k/Lcvep60Bbh4911apilliQbdsQtQOVhIiJ2+rbjJ
         OnJ8LpoE/WssYoVGR9jyAA8Bl4mlaEMT2gn8UTWwsBPo1kSwlftHd46ly3K/y/UOPZX+
         TQfcjJVS11xWU/6mEBYfqCey7jk8obQN6802lQ+XAxAMTD0sBCiNfmrwtb6KUTAm08Jl
         17lA==
X-Gm-Message-State: AOAM530zuvRmO+biy9SOaTsmYp5s0Z+q/TIyeM9WFH4IOU/n0hv8wFWf
        Ho4MVNXfNbA1ti98+QzVOzz2UA==
X-Google-Smtp-Source: ABdhPJwELVQdJ1/xgKo/4yZziUTGQ1/q8sy5fh1006WK7I0N8jOxyQPRBme9y/J6qNArUlGumT09xw==
X-Received: by 2002:aa7:c752:0:b0:42d:ee9d:5ace with SMTP id c18-20020aa7c752000000b0042dee9d5acemr35123602eds.318.1654622344434;
        Tue, 07 Jun 2022 10:19:04 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm5876540ejp.96.2022.06.07.10.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:19:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/14] arm64: dts: qcom: sdm845: add dedicated IMEM and syscon compatibles
Date:   Tue,  7 Jun 2022 19:18:47 +0200
Message-Id: <20220607171848.535128-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
References: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
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

Add proper compatibles to the IMEM device node:
1. syscon to allow accessing memory from other devices,
2. dedicated compatible as required for syscon and simple-mfd nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 6e13aab15931..1fa1436dd68c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4722,7 +4722,7 @@ spmi_bus: spmi@c440000 {
 		};
 
 		sram@146bf000 {
-			compatible = "simple-mfd";
+			compatible = "qcom,sdm845-imem", "syscon", "simple-mfd";
 			reg = <0 0x146bf000 0 0x1000>;
 
 			#address-cells = <1>;
-- 
2.34.1

