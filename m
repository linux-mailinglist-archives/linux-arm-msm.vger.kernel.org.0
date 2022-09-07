Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C045AF8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIGABQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiIGABO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:14 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937B666A63
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:12 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t7so12745724wrm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=snCS1UV5t8KHvI66KtaEZoGLKqYHV4piyers8Lw21cA=;
        b=X/teVI9J/0dRe6ty/m6rBjGDQinO7Kut4D6ngtBj6LYFZGM9op+Kccna2jAqOoS3Pa
         MVUun8T5juuIjQCE7xtq/REDr0B67mOsKiXT6gHEB63c9R6DcYFHruFVsumim+QVt6fL
         +og77brjOOWYKopaVumA/nAxsuYCs1vWQhe81xEDh6c9fGE/RbquiSwIT2+ERWJJp6qN
         /qFXhALwi4kqBLk2lo36G4Cj4dqW4CVvZijxVb2+wckFZcsRZU8EQ079hZJV7rF/8E5Y
         ToI/IK+b67SHAs95MD//7Va+fT3qg71qkQn3UdFixJOjUdoB4rCaVLe42B9HohqXUXp7
         dygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=snCS1UV5t8KHvI66KtaEZoGLKqYHV4piyers8Lw21cA=;
        b=t6DrZuK7hIxSEKU+kywyhUcw1Za7g9JzrwMzKvHaz4GKYEjf2gOVXQu+jSVzncNsiz
         FOE2vNmjXJi5HbxtLQ1lo7Em/UQY+L6NPeUft8MNKEEVXMy+ivmJQs8pXkxDqr6Ex+GC
         jKJLXq73fMUS+86pg9Z73nRXwhnBx20yf6XhGDGslawe3Nqi7aokFeqCMnP0h9sNN+/+
         nGybLFLy9AuAXXqv+haxachHbRZpfltnINdxDy/gt3NDfB4qB8KJmegJlFUWPefereOd
         6Km8sylN0YfFroWrSlJLbSHikxXv6PPINQFVM7YoXQ24b4H8dXjgXUxeqK8mPBz+YY9K
         WU1A==
X-Gm-Message-State: ACgBeo3ka12D5Q92YPxlkxARyzxNKWYS1ZMQfm4Qe1VUJf0Tsz+I0L7e
        CHkmIrRnmGPU0DWCc5wlEJOjVQ==
X-Google-Smtp-Source: AA6agR6T31+W2j9XQm++QVPXiVH/0ekG0C7NSRE9nT2qJrmN/gl3Ggwrh9lJSul41NZbQSKpLF+m0A==
X-Received: by 2002:adf:e7c2:0:b0:228:8733:3a6d with SMTP id e2-20020adfe7c2000000b0022887333a6dmr411132wrn.215.1662508871046;
        Tue, 06 Sep 2022 17:01:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:10 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 03/11] ARM: dts: qcom: msm8974: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:00:57 +0100
Message-Id: <20220907000105.786265-4-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the msm8974 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a777176..979e88a064cca 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1566,7 +1566,6 @@ dsi0: dsi@fd922800 {
 					      "core_mmss";
 
 				phys = <&dsi0_phy>;
-				phy-names = "dsi-phy";
 
 				status = "disabled";
 
-- 
2.37.3

