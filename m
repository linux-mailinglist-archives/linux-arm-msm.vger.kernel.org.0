Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E196E70A374
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjESXkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjESXkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:40:32 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A9CE47
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:30 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3a611b3ddso1756528e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684539628; x=1687131628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/2WWyPhTjUaVgU/BGI18hh+zOmuLaDw3SUbkMln6Fk=;
        b=G9LERltcrySUGB7WY/IUaCfOM2yBZYYgIKLTMhyw9f8XpuISnZRUqu5Bdj24aF10Ip
         Af99/+EnAp0ZjXiE2oVUm5sLdXKvDXBbrNfWPGYSIry/xaY9r+fVTUSwKPxiBRGFNNv9
         hspjAK3NdUICc09gaAmEG1KI0R6YEusFlPfzEZBA7z7L+RX5JsKiDxcOP718/iAAc9vj
         VcUpMSYmjJg2hneMAEPCBDy1BdVzrsCqxKWg/zTyNPtmUVNw14dc6OnreypshoSpygPX
         35lE3wKf1eLQs1bPQJGnWuxK3+sUplgUhcVpoD1Zzp4uO0fe7OQzz2Hx0Y+w012DabvN
         PWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684539628; x=1687131628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/2WWyPhTjUaVgU/BGI18hh+zOmuLaDw3SUbkMln6Fk=;
        b=i24TPuio3Ul4YJP7kzo3ZXtYEolNHVOVmwjZtCmtXjdMpuk9K0hxbcTt4rz0w20FQA
         VHd7aBXHFB0vw8IpZ8gkq4OUUqv6BXtcNbfx3NBwhzrRfZnKFWz7uYjfxkpkaa/z3Pk+
         Xd3V+xyQkh/UIYl4ryjq/zDvXuA3o3kzVp0aa3iJN1lFuMDncTOiqM2t2UlKe1b5zu9n
         nDPjnKj6Saxv+aDSDgtA2Re0s5H0Ey/BjD5b68Ys1Jq9yYvzuTr/7u/ZrY2Yjaot3U3c
         hKOCXKYUrnVaHi3BwO9AhdCHfvPFlB6mVhMkz9rFsNXuRV7YSz93lbe+gjMkJVzHymY5
         fkcw==
X-Gm-Message-State: AC+VfDzjAxvCfXm/98j/GTSL9OIHpHDE7/4k6e/6NAZ/GkyFRYagbTTM
        NcjMc6HGitlP8xMeH6++dsQ7pw==
X-Google-Smtp-Source: ACHHUZ4uzj/N58jKNzZY4fHKvombbsnpeSxU6ad47ODYlVweHms6mH5BymZ0GF56EoL5umcZF2PERA==
X-Received: by 2002:a05:6512:1086:b0:4dc:8049:6f36 with SMTP id j6-20020a056512108600b004dc80496f36mr1514263lfg.1.1684539628615;
        Fri, 19 May 2023 16:40:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 16:40:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Date:   Sat, 20 May 2023 02:40:23 +0300
Message-Id: <20230519234025.2864377-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_rm_init() contains checks for block->id values. These were logical
in the vendor driver, when one can not be sure which values were passed
from DT. In the upstream driver this is not necessary: the catalog is a
part of the driver, we control specified IDs.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 34 --------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index dffd3dd0a877..d5a06628885e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -122,10 +122,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		if (lm->id < LM_0 || lm->id >= LM_MAX) {
-			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
-			continue;
-		}
 		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -139,10 +135,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_merge_3d *hw;
 		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
 
-		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
-			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
-			continue;
-		}
 		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -157,10 +149,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
-			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
-			continue;
-		}
 		hw = dpu_hw_pingpong_init(pp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -177,10 +165,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
 
-		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
-			continue;
-		}
 		hw = dpu_hw_intf_init(intf, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -194,11 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		if (wb->id < WB_0 || wb->id >= WB_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
-			continue;
-		}
-
 		hw = dpu_hw_wb_init(wb, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -212,10 +191,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
-			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
-			continue;
-		}
 		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -229,10 +204,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dspp *hw;
 		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
 
-		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
-			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
-			continue;
-		}
 		hw = dpu_hw_dspp_init(dspp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -259,11 +230,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
-			continue;
-		}
-
 		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
-- 
2.39.2

