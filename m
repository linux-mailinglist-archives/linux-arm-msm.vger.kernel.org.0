Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21DFA5AF8C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiIGAB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiIGABW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:22 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A612685FB3
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:19 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso9955342wma.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7R61Gklh3pO/6zSvN7My1KcnW/P1Z9LT3q9ImftUt2E=;
        b=OLtVRP4RRwB0nY/zbdjec9TNAXyAHc6BmtvXok/SqHxk/CEsBQejJpxNDx5XUmaq0L
         0WO3q/g8wIXdN9aWnz1ILq0Eau/Sqv3js3QDV2I9rVGicRH7PQcmw9h+J5sLeYG10TlM
         a2qC7Io4p1yjcQr+Nc+w3hZs5+njo2qBn/1Al6ba7HxNWJyUt+0nbafDEZqYOTkTbnTI
         rJpziPzRT9utL0z6lQllWYexCTAFgDXX+Pqz1fcE27ViWcG4uVkFCJd72MvgT5EmEZk9
         uAFy6tcIZYcJZeC9qNwtmvhE6lBU10xMoTvAgSJPvrmV6irJhGgtpBtZOSGKHe8rfXnW
         dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7R61Gklh3pO/6zSvN7My1KcnW/P1Z9LT3q9ImftUt2E=;
        b=4+flDOgNCm6CSvtWxlTVdZ3QwKQIwZgIe49+j9ElPJT3RJN++Yk0d3LRtRWl7pfKfZ
         t/YI2OcQ1IfVi/WqKttVQJllVOXV2CzS0EmB0yzGKfQFxEqEamQ2U9LMKmlphUtXSKp1
         41jzKNq+yWTVNDFnU/HIR10xwha0YWKDrA/9tKqg7C9JeaQr+nAwYqpJnh6mZZlcOu4t
         I8WIm0PbjDR18dlib2LIoLazwZZHTyE4OXH+Ef+oO0ZMAUxDAbQ8IvUxdgxkySUUgyGI
         jnNTJDBWfNRmxkep0Cznj9qMaCk9BVy0DBHpjIG5Jgoiem2oXdIiHncxcr3QGHtX5TMS
         O/yQ==
X-Gm-Message-State: ACgBeo0KEfXHX+wWGpanRSKj7XKw8mp/o+wF179PXoIOkBwZ9GEVXjYc
        VzeoHkqolr57mI+AhcMFqJ0JxA==
X-Google-Smtp-Source: AA6agR5qIAJe8uGkxgAJMNncrY8BJOPsZNvlXMOJAldCJRXmGSvh+sIIF1eC/ZdFNS+gtNYVEbtD5Q==
X-Received: by 2002:a05:600c:4f88:b0:3a8:3e65:bfc7 with SMTP id n8-20020a05600c4f8800b003a83e65bfc7mr15316484wmq.39.1662508877859;
        Tue, 06 Sep 2022 17:01:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 10/11] arm64: dts: qcom: sdm845: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:01:04 +0100
Message-Id: <20220907000105.786265-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the sdm845 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0e286715d1bd..813af058fdec4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4511,7 +4511,6 @@ dsi0: dsi@ae94000 {
 				power-domains = <&rpmhpd SDM845_CX>;
 
 				phys = <&dsi0_phy>;
-				phy-names = "dsi";
 
 				status = "disabled";
 
@@ -4583,7 +4582,6 @@ dsi1: dsi@ae96000 {
 				power-domains = <&rpmhpd SDM845_CX>;
 
 				phys = <&dsi1_phy>;
-				phy-names = "dsi";
 
 				status = "disabled";
 
-- 
2.37.3

