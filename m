Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044956934BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjBKXNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjBKXNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:22 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E1215CBA
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:21 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id jg8so23960313ejc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkPOvEBdps48elEm4czvtOw08/xuzKzqH5bG2RoTpgc=;
        b=ECzdNEwPC5OFHCYzYtx4Om3PRM6E6MJo76QJ050QDTc8dL+ppY6kPpeI9Qy1a1sstv
         9UfbZlXSDbEv3VTAv46k7K+ouu8Ud4d9TStNs7z/7b0SLJSwtlxPV4rRIwpHcZuEcog8
         +1lYBIsoOHn4nHQgsOScC+CvomvcvfmhOFhUk9w80dE4vLgKSxT6YDL2JW8lwJDSyD1F
         gePZWfhwvbqcmIieOzGTeR6ygk0vmZM+yRgIdmUJfTCPJ3hYg2auuiAlAtI1Ui9usIML
         yCHp/7XEJ8fga6VYmCN0YyjGKM/R12uUJZu3ULF0cftIu3E0z97M+p/fqQKh+bZItLsP
         kkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkPOvEBdps48elEm4czvtOw08/xuzKzqH5bG2RoTpgc=;
        b=w6Y6gfl0RWJ65bJiNNSiPCQIxN+CJNoFC31jpJp5/l78ERTdxZf/WH7jkztlaxdCkZ
         MEp5ibBRLAtGJYgUMTG/oSIMr9vGstouPu3VZ7Xz2f2U20XZ41rUKx/oXBw6vmFD/GhK
         G7oZHNzuJ9uf0rtciIFA70NdW8RF5bSHQKXGUuQBBrM09Af3L2HtorK7Vgj/lJqvAJbT
         Dyf1nvENQEznOEpnjUi3LnSfOT7wvNDV8gF/FrGJd73uSf7O935RhXqUlTdX+oOmaaYN
         wRQLZ5jE5+v2C6ACagfPqy+k546LkWEA/0vMEjkMmxH3lE+rpf8UmzWG8G82pncD2xYW
         BsrA==
X-Gm-Message-State: AO0yUKWY3ZBWL6Xvc6ZeOtBnqEqdBh3gwUp9tedFwZ2f08IPLWtHmFL2
        ZbRSa8FnY7H2bTL7Y+naV8Oi6g==
X-Google-Smtp-Source: AK7set+x7VaFAxXCd0E4aDdaZ4Q/I4Ieu4JZ/h77alrN8e30JUDu3Z7+3pbzlchttXNlvwOAZ6A3Vg==
X-Received: by 2002:a17:906:80cd:b0:8aa:a445:8215 with SMTP id a13-20020a17090680cd00b008aaa4458215mr18337069ejx.70.1676157200864;
        Sat, 11 Feb 2023 15:13:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 16/50] drm/msm/dpu: mark remaining pp data as const
Date:   Sun, 12 Feb 2023 01:12:25 +0200
Message-Id: <20230211231259.1308718-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 54d706dfdbec..c983413cc3c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1652,12 +1652,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1721,7 +1721,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.1

