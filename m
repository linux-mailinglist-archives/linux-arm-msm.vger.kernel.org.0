Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A8062044A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbiKGX6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiKGX5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:38 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390A52A970
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id cl5so18496045wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjihtwzxynAdmXNyYhFWISiC+gmKeksCLl7q5cLu47E=;
        b=ftsFknmKMHp5ctn33IICASRPgbSaNmFKJg3pZvwPMb3tUpTjKazLk7CLmPTRw9oVbJ
         0MzEYPXoi/m6qyUdJg6rCzeXOWZ9vgvSNLFKCg4BQxvX5JgcbK2+NJRiwTdY1pNv9eZe
         MGlY0kRlEG2M1498+jbxK3de8F2Kfu45ZAZ/j0hrwiO3v8lypxvOTQJlKHtVYarhqAHx
         QrSh584d4JmfsxOLPoAoALJo0MuFV3+LOiiWVNyqj6p9ofJKcKshUy1tRcXeoOsrZVI1
         UhXYANAedUHrXDfr2dhaa/21BXX0ktAau8xAlwK0epJd7yOXUQbGwRGcgwvDz/agmDx7
         psUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjihtwzxynAdmXNyYhFWISiC+gmKeksCLl7q5cLu47E=;
        b=1xvlQ2KCPkQBZc6aMH576U9ctA/G7lmt+8yJR2czVOEEnQK31JIRcCB+2LvkH9QAj6
         2DHyilBVOrFxIY75/l38FeIslbr9FiGOM02iKmEw8RdnO/S90QwttH6pWCacyG5U8hTH
         9/D+Odddd0JmWKEInzKpapti3sgYbvESQRIPbMBXVT7cr4pdcfB1fl9SYoRYKnpJ08K7
         b0knn5ACFWREY40c+/RxxvA67WQlrE0/81hhwRHWlPIvAXUJK7ovO13tZV1VRiod9JLX
         XsvLNr1uM66+9obOwz8sX699tmwkJlW1StbG0N28JAWipXDzwgnZhAZBdkN5Z+JAPoFO
         27hg==
X-Gm-Message-State: ACrzQf2v05+emVa9oUCr1CViXqH0yT7yla9sJ9eIX1ac03je5PM7EAcl
        714KGm0ywXgjjJEEssUXfsOTsg==
X-Google-Smtp-Source: AMsMyM6kR5CsJUm/q8euh7DgqYMORJwnKbP27X78dPsrovE2GkY+53Pf/ZqWh/B1JtPnEvkJoPMxMg==
X-Received: by 2002:a5d:58ca:0:b0:236:2324:3f0f with SMTP id o10-20020a5d58ca000000b0023623243f0fmr33605241wrf.325.1667865432835;
        Mon, 07 Nov 2022 15:57:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 15/18] arm64: dts: qcom: sdm630: Add compat qcom,mdss-dsi-ctrl-sdm630
Date:   Mon,  7 Nov 2022 23:56:51 +0000
Message-Id: <20221107235654.1769462-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,mdss-dsi-ctrl-sdm630 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm630 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0e7764f66b104..6a5f84f85bc8f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1581,7 +1581,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-sdm630",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

