Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39035184FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 15:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiECNIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 09:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235798AbiECNIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 09:08:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004A62317D
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 06:04:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id j6so33292615ejc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 06:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2iTBHUMgc9O6iYAm1ylwqmDXmtMF3u0H907cZiaL8w=;
        b=oIB3oc83K0ugG58GKCh/6ddbBZURbRvELGborvc6uNGqfRZMLjbNpDzHATG2P5i826
         FZKbJ1nh5MMtgMeyzxQvifX0PkujtwYbuhuy5lWD134H49bVd8AuTqt/75ooJqQCiVPe
         8FlTmkKSTJlk5zrHwX42e1YVW53TU6FHTCV9ii3bK/IvF52QrbBUDEVfQRWW+DybshPE
         OzKfwWXMc+vUkSeyv6w6roVCA9SeXBBjjcG+STU00gCydZqC4OBFJP4yO0pLzJXwv9xa
         pz7glrIf5QsQhpnJuMqY8h3+Xi7atAmbLNTysxqNXq7535VS/84XqKicweoKgcvmCLgk
         3Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2iTBHUMgc9O6iYAm1ylwqmDXmtMF3u0H907cZiaL8w=;
        b=6T2iF9cAD6rkJsg9c5E2KaL+uYxYxAWQaZdWrBSnPGAfrcK439pwJsA4UuOHEOg3fh
         vuGz/fq8ImNzyN48GAqdQqfV80NYNuYbL+8JotYS86kgcMBqbB2wvUAAT3FFQsqDpfD9
         ZUu733vZmK8JTU1FY7Ye2WxST06ktyA33fwM3K64Ghcez8moCE+ITbM+EhRAsFC02J6Q
         Kcxcjcix+YpcRAWCfhjb/m+N/tEyCUTWcpnsd4ZAXfwMcs6qT3nyqovuVPglgFNabklF
         qFhleF9GP6pv3KyhLFffE3u8hdK4cqEtR+7Mv2DQFOJZ4iQDcvPyyDuCC/VBXh8n23/F
         F/FA==
X-Gm-Message-State: AOAM531PmYPplhgou/FOpZx05tKPywIJyj+r0CWUaPVGFGxEn3JBgIsd
        6S+ZzO+YZB2CdOtUCDD7pfeFFg==
X-Google-Smtp-Source: ABdhPJwIs3QGucGXjAD9VvJLS6B2BZNRUo4mZaTrRs2HyRVDxzkR7qqfViM9H0Kr5/4yVQv1elJPXA==
X-Received: by 2002:a17:907:3e92:b0:6f4:7ab4:20a5 with SMTP id hs18-20020a1709073e9200b006f47ab420a5mr4691262ejc.620.1651583096353;
        Tue, 03 May 2022 06:04:56 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7cccd000000b0042617ba639asm7868782edt.36.2022.05.03.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:04:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/8] clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable
Date:   Tue,  3 May 2022 15:04:43 +0200
Message-Id: <20220503130448.520470-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503130448.520470-1-robert.foss@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The state of the shared RCGs found in the SM8250 dispcc can't reliably
be queried and hence doesn't implement the is_enabled() callback.

Mark the shared RCGs as CLK_ASSUME_ENABLED_WHEN_UNUSED, to ensure that
clk_disable_unused() will issue a disable and park the RCGs before it
turns off the parent PLLs - which will lock up these RCGs in any system
with continuous splash enabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index db9379634fb2..22d9cbabecab 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -214,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -546,7 +546,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.34.1

