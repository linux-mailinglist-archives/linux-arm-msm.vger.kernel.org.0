Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561D46E7D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 16:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjDSOmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 10:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjDSOmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 10:42:13 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D25C6A4E
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:02 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id q5so17228436wmo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915321; x=1684507321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNjgEw1XFUwnMr96e+2CQ6Lo6q2FDtNyKhqD3dmTUrE=;
        b=4LuBgs9yLJSinqw8HSRzEzngPmX5hzcqhMf7QTeuslRyOioxSoXH7W1tHLPFVxL8Dc
         LKPzpPKd7dgx+TNyX9PyRaBjvqPW0nmct4PZ7GltxoAb0fWMBgWEgvBl5vVBVuxGQFYv
         MJ6vDW/SShPCy0/rw1wLYMJiDyk5Hvf5QbaefGOwazZPNGr0ynmOWszW+eNNydmSaXGT
         xzllUv1g1NPH9oFVmm7w/81fjtbJfJd3lm7gT735eTSwdtHtsdwJmk8Qfra9H4une67D
         W8BbPPVyYV6YT2A/mFNcFiRECiJ1eO4/AV/hWJYIKltcABnR4VBLce1ghxewvHpjG9cw
         +iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915321; x=1684507321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNjgEw1XFUwnMr96e+2CQ6Lo6q2FDtNyKhqD3dmTUrE=;
        b=SpgxuHaVlLWWVhODIT1wI4dv0azIBFIpnLzAzydNAgrQpwV1CV2NnqqztWkWxpQrMS
         q19q0Qz7Vw8JVanGEGZCrBKHIroAHvgTHkvN86JNKiLnMiZHB/Jg6rLly5N7JbvRnlCH
         MBBBGLDsX73Mp4yqrGNZiy/KlEIT4IsbYEfoQsMrkbkMyGMi0Q+gmcE09nl1eSbgI0VU
         nCiC9a70rEVWvf9ZbKq50FsLvObclgjw9jI2bLcq1g5IXl1LPxUP/3G8RhHC18U5yspV
         VLsoBFWu15W4g1MS0gz4a9jmG5f6XG0XcqF4RER+wNfo8oKocxyy4Y/+JGcKIL5VxHKY
         lrPg==
X-Gm-Message-State: AAQBX9eSQxlxoLbvbNluKRpHq01tbs3tjYZ6r/jp9GEIkMV+/h4u39r8
        kJblSxBj8gcDaIJTOTlObt0M
X-Google-Smtp-Source: AKy350YIZQJc5mHrOF4rjTE+t8DJKPx3mv8uZ6JW80wdo5VzHFNPb+JI8VMqvJYSCsJjOCkMBCPsCA==
X-Received: by 2002:a7b:c7d4:0:b0:3ed:418a:ec06 with SMTP id z20-20020a7bc7d4000000b003ed418aec06mr15495212wmk.28.1681915321030;
        Wed, 19 Apr 2023 07:42:01 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Wed, 19 Apr 2023 16:41:18 +0200
Subject: [PATCH 11/11] drm/msm/dpu: do not use mixer that supports dspp
 when not required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=eCHzSh6ygzKMrynLk5I85+wK8ZD9bT9L4MBgozHvN38=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2wtV1Bh/RNv/ZG/8M0oZScFy8jinYXpQd0Z
 l2D8Gf954aJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9sAAKCRBxA//ZuzQ0
 q1UJD/46OiGy56oZou1FdqKU/7l7QduKNHg/kGvjVQ6ejPCZbi3rN1/KsuGcpsfBDYnC9kEplxb
 uvdYGoJX7RbyRfP0M3er/R6d7fMOk7+uwCXDmsyGn5VfJ7qpkCgEutRG5O4KWV1oeiMna21h5F+
 DxVJuA2pBpUFw7JjL6fGQh1Sng8FWO8Uzcf391FHb3cK0xFZv0KXlAZAx4c6OpodRauIXYXkNd1
 Jcu5WViknxy5Ftn5+rJxEstwF7C63jyhlPLrZhjTyKqiCWVfyFXjEWAjGFdr/TkXh5WAEjbhSSt
 mU7nNxVjPtdxR6ie2B698VBZj3If5GylQw0/7BVI1Lq5qUA8eqzENzlcX+r6s3G0Lliqr3Zzl6F
 Sb1WxTjhcgQTYWU2Lotuy1lRuydJoEpSDSBpTnF4/agODy2JryUMyueEMDsy45r/1JSHkLKGNWY
 Pxle7Moqu1T+SjaNR7FQcs0TaLpSNvLGdjSregG/hZjCAWYtx8IIfLuuMKYRUTNLJ8X7jpS3E4t
 if08fYjYLSdG8uEyrg8/r7C4/A8NbcuuGuppH+nYYs/fnrfZguQQ/b9w9ZqLB08fs+zi0Ofy6Q7
 BWH5IzsYUYPdCf1/YN9bRJVoomXeRs5JSezRgMaF+ItDKS+kvI7o55nypbz0Ktlkt/IdxqkEhso
 yRJYDH3EDrznDuw==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This avoids using lm blocks that support DSPP when not needed, to
keep those resources available.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7d..4b393d46c743f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	*pp_idx = idx;
 
 	if (!reqs->topology.num_dspp)
-		return true;
+		return !lm_cfg->dspp;
 
 	idx = lm_cfg->dspp - DSPP_0;
 	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {

-- 
2.40.0

