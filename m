Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A32347B7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236389AbhCXPA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhCXPAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:48 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325D1C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u9so2945004ljd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5O4S87sSonR8b8YReuDQ+tyO7OoPApI6qR6ZtyWtNo=;
        b=ag41z3TTI+1hBOp+V0y4TJVbNjU4P32YDILwsy7eFogpNU14hviu29k6mpVJXDa0/O
         ZAKTkSO145kL4WjVZSc3XzIoAaxYiPPZ9SMz/64GtrFp3ovjG38Rg4O8EBNaWk1O+0Kq
         XnnFzHB3jqgTkfQ2c2HL3O13OmbKf7NUiJ5OD4GXA62V6Dc4NA/ysda9maA2cIXl/Cm2
         cXXPSs+nzdrt7uH5OcNULCqokEROmZKlR1ekDxYlKzVsPEMJOphetpg0MvnjLar5EJBH
         3Q6jZjWbGGzkoihRkVXkCAHYbmYer8U2Wb1xszsMI0DsTJ+wCBHQKGudylwMsWa0fvsi
         9bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5O4S87sSonR8b8YReuDQ+tyO7OoPApI6qR6ZtyWtNo=;
        b=CuCyZWWx5rLnt/uacH97ZwFFurdax1coYfuyXsboLtqXDmDwWDRSbd2ms0JQW4Q+xw
         c5JiliDHvfoEAmXssEJciis3CfdsaFAm5t6q48Gby2D4ziOXqceyEtFH8fmsY+itFTLr
         JKMsAUzZzvC9Sq/UqESSx12CVDT9PhKjJCln5nU7B0Om+lm3nLOTKLFUqHtp9gJZtPOf
         rhw7bZqIB8Hwze7cQdn8SrXIPoWZw5Ix7jHPFXO9AJ06vV/diQbmO3F2T0d/63moa8Oa
         IvuycLmUUWVy0cSUthFel3dOH/mtg9ltXuy8WzHdO5f7D/KsSJDxt2UKR4dQ3Q9tMW4g
         jrNQ==
X-Gm-Message-State: AOAM530okRxYWZM3sO7BM1YziRhXEpjiPiXzIft3AAztvHkXmTP/s9Q/
        BTIkuhLzpF1ZO3PGmDVFUeoMeQ==
X-Google-Smtp-Source: ABdhPJxKAmSj+KeuEBTRDy807NV2uoHenAL8d/JKDr/XiRp5IT+zSvPM1S4LjmLY5sC2E0blLpRhcw==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr2397033ljc.388.1616598045961;
        Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 13/21] drm/msm/dpu: hw_pp: make setup_dither mandatory
Date:   Wed, 24 Mar 2021 18:00:16 +0300
Message-Id: <20210324150024.2768215-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All supported hardware instances feature DPU_PINGPONG_DITHER option, so
just mark setup_dither as mandatory rather than optional callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f80694456fd6..ac03f329491d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,9 +217,6 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
 
-	if (!hw_pp->ops.setup_dither)
-		return;
-
 	switch (bpc) {
 	case 6:
 		dither_cfg.c0_bitdepth = 6;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 89c1123d957f..5c1ce835cf49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -258,8 +258,7 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
 
-	if (test_bit(DPU_PINGPONG_DITHER, &features))
-		c->ops.setup_dither = dpu_hw_pp_setup_dither;
+	c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
-- 
2.30.2

