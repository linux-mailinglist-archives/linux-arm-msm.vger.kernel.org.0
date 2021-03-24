Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B637347B83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbhCXPB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236368AbhCXPA5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBD1C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a198so32436843lfd.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ODzvX9EZrwbemZb4oINSit5l7SLzwthVC0SVRjb2PyE=;
        b=m9uc9ihGqmBI9y09Qa4HBAFLHe71opBwoq6uKXVoJO8djeXqJZ87ZpRQ2jzKcjS5zh
         GigzhIc5Vh8nx93jj5xzdE8qW5u5Wst5eT/JfrtgdtczpRVK9S9ufTOXwSqefOrPwq2w
         hjt2k9QhTfB1PEjhrp1CPYqtbkKGkZbR276udv1eZPJlwKAHnAjxDsN7ozwZNKNEu68+
         QQWHS1qY11w8/ncKX2fmi36Nw6jBzBkJqFS2mndVFhcvDI/iYnAb7Ilt4lXHok4Mnh5H
         6B/xIYfHbk/2IAFrhLH6aOr6A4oKZDrJ4B0ieDQxJhZ2die1rONPebOpeM3EmJ6/tRz+
         nNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODzvX9EZrwbemZb4oINSit5l7SLzwthVC0SVRjb2PyE=;
        b=HYlycf/74DROVAbowuPv4qqs7HnQDg/Xec8uYXdMx6s9ufyOV31qJJTaSLv17fJuwl
         PkaiOknvj/5NloeCLPpP6oHmycQaySxUURWnyZxnxYnlNdnRYydHCXPYr3NO6nEZ72Kq
         yqemYEwf0/wWuFreovPouJiN5KmJowi+vZb1pxA+ecyUGx0Fj1uiyLro+HTHGh9ltdKU
         7fuW2kqqZhU0e0zbAY3y0xrFnspQCB7RL6Z/nwO86G15PomrcteRVHSeobNw5rXQRtX8
         u12SXMNkDomFuJQGypQhxyjQtHVKlxu+jxAB3E0eH6znTOMP8EX2UjU2fOZaIZCjQCR0
         DeHA==
X-Gm-Message-State: AOAM5320RQMrr2/bbJG10FI4A9qUh1/SyFXs1T1/G0cmEHi+F8miyb9h
        bOsOjXI9VEOOzZvDXRcPZHhaHA==
X-Google-Smtp-Source: ABdhPJzN0syGzL97CnhhUH0gfaBSfDkqmT4VfqiYb0232mZnJuPy4vT+S26CJFdeZKw37ZClRmzCjw==
X-Received: by 2002:ac2:5ca7:: with SMTP id e7mr2201134lfq.646.1616598052554;
        Wed, 24 Mar 2021 08:00:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 18/21] drm/msm/dpu: hw_vbif: make set_qos_remap mandatory
Date:   Wed, 24 Mar 2021 18:00:21 +0300
Message-Id: <20210324150024.2768215-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All supported hardware instances feature DPU_VBIF_QOS_REMAP option, so
just mark setup_dither as mandatory rather than optional callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index b757054e1c23..377d5e8ae615 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -204,8 +204,7 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
 	ops->get_limit_conf = dpu_hw_get_limit_conf;
 	ops->set_halt_ctrl = dpu_hw_set_halt_ctrl;
 	ops->get_halt_ctrl = dpu_hw_get_halt_ctrl;
-	if (test_bit(DPU_VBIF_QOS_REMAP, &cap))
-		ops->set_qos_remap = dpu_hw_set_qos_remap;
+	ops->set_qos_remap = dpu_hw_set_qos_remap;
 	ops->set_mem_type = dpu_hw_set_mem_type;
 	ops->clear_errors = dpu_hw_clear_errors;
 	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
-- 
2.30.2

