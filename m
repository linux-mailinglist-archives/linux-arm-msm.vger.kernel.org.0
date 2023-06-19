Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802CE735F01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjFSVZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjFSVZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940CFE5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so5188664e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209928; x=1689801928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4goZSlfthzSL2bPwaaeATgTIB1vK2ib72gp9EanaBU=;
        b=mTThJqUk6vlY+Hr/dlz7fOcaLVWos/q9L2HkDNYSRS/j/glUk/cfPsdH5divpxLKIN
         yEX1FtOhRLBkQQcHqOeNzEYpt6rY1VnKgi8JofdhQsHA+5daarH+u5JMyklCYkJC2FaC
         N96hBZQHL/64IbIvC/1oyGalyZOFlUMwV9PoTotPF39JQApaB3/GAObq6ShDvXUoYVrm
         IhvxSwuaAw6INoM6KH/IjY1/cAjq5b2HKNDzHkGBtu9xwAJNG9k5ycZCRu3nIwuU4/D8
         868kd7yPbLfQkowIZIUHlHSXXQCDgJ4xTI5XckDbARArva16V9BSRu6J6FMUDMreln5U
         524A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209928; x=1689801928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4goZSlfthzSL2bPwaaeATgTIB1vK2ib72gp9EanaBU=;
        b=jYsyjT6Cz0Ksn9XQjFNKkMPZUNArOAG0KiHbyRvBNlVIipKtytIARawdufYzFwqC2J
         tzwy3AFJ11XvSEsM6ns/7SAwws4ByYq3UG6+EDKQMzhlxXNX26G3OnWLTR/GPmEcF/oL
         CqpTpvo9tZxV9cr3x6/ZO+lGbULtqj01Ua1nK6h2MctWGAsQJNfJ4KUeQ3CvzB82BiH1
         xee8rRdljE2Ux8HI7E0wiB2bPcSZPK0q8HGTkCGwB1F3plSHTYcj4BQYUNT8/3XZ3lbT
         6d95+9sUZqeo8ZLw5v7/a649zEnpv7nbbrnUSkc1CREJVeQ4OR8E6eOjKpMhvggzSuEg
         ztfw==
X-Gm-Message-State: AC+VfDyvQg3pu849sOpF+FKZ1oMvinOs/Klf4H8rDku9Kvxm14bpeCjV
        OpEcWRNuSAVwzBnahaZsC9PESA==
X-Google-Smtp-Source: ACHHUZ6Ji/sXpw/fqA7ZzFWOlAj00ctiG7a3XMs/xqefE4FzBU9U36WCiB5fzWjQcdv7HsrpWx63Rw==
X-Received: by 2002:a19:9209:0:b0:4f8:710c:e2c7 with SMTP id u9-20020a199209000000b004f8710ce2c7mr2227893lfd.33.1687209927934;
        Mon, 19 Jun 2023 14:25:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date:   Tue, 20 Jun 2023 00:25:08 +0300
Message-Id: <20230619212519.875673-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

