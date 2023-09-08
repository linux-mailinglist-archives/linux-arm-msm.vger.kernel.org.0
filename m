Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9E27980D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjIHDFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238525AbjIHDFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:49 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C081BE2
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:25 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso26792111fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142324; x=1694747124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjF+Ni17TVCwIorp3DZ1/pP2g7KWsdAJkvzgXwIGnZs=;
        b=SgWeKHlycJd+vQMBPGGDGdPWHOuOnHhhChAUD31TdCqk2QuiFVTQw6sYWV88T//I1X
         iZDSFcZ/QR0XU5ffsVYq2icXZqEyjFJxygLJQhv9QrCDB7M2Ipzxpyyn8jyNJOjWIVDj
         8JTdDylH3AZudb/tW9FkZOJfCcuTHjdnDZle7VDWlZpqtZbQq22LVzjiL0d01QALaiQ0
         j42EDXdBcuF5IxLO2hKnvxvfMKc53NZaYNKbNQq0txN1CNNDBamFgdttG0bY+jE8sHRu
         FyYw4CcQLXYM6u0X9v+nRQNaUGvDaDmNT4LfbeZp859yTAAwc2Jaf8Qpp9oyLlzGZzNV
         SF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142324; x=1694747124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjF+Ni17TVCwIorp3DZ1/pP2g7KWsdAJkvzgXwIGnZs=;
        b=qxIfQqYqwXqJg5m0NeWrARsOWYHirvTKzlrXfdZV9ErIILM50lI1pi6wN86LXyccRL
         PsTVbw2aM2MW+mvd0RbIieSZ4xmINrv1BgKTDDHH5yNe7Egp9hapwwtUHOGyn4JP1ZF5
         drlvj3YnS3+DjDQTWXQFXW+TWuCU/6HVjOAdbCn0EAqkRYMWIZOGBq59I1Zda+gBu+wv
         iTlJ0W+tJYSZ1aFetN6PaJ8n3SAhx+Wfmc0V5/JTDuDsXFATEJ6edzfxnNgxheeDDUXN
         7+PY0sKKeLzdUdISdP0LyksnG15+7QZNafOH4OnzgT4Tp+o9tTHV1OHVVgRshEaV9555
         TsjQ==
X-Gm-Message-State: AOJu0YwjCy+IPh2GvPZlcnS5rSb3TOhBaNXYG1ZvAtBp53NCmbE2Hx81
        +xtWBLXjxSTCwA1oXBuRlTXrOw==
X-Google-Smtp-Source: AGHT+IEPZQBKLVkp0sj0YHhbSBoBG7ps4S6wXzS+PGeOdpT3sIK8s0aBEQUUBdV9d5V+uIjuBNLNIw==
X-Received: by 2002:a2e:b044:0:b0:2bc:befb:b602 with SMTP id d4-20020a2eb044000000b002bcbefbb602mr776445ljl.1.1694142324074;
        Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] drm/msm/dpu: finalise global state object
Date:   Fri,  8 Sep 2023 06:05:18 +0300
Message-Id: <20230908030521.236309-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add calls to finalise global state object and corresponding lock.

Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..fba2294e329f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -385,6 +385,12 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
+{
+	drm_atomic_private_obj_fini(&dpu_kms->global_state);
+	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
+}
+
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
@@ -827,6 +833,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	dpu_kms_global_obj_fini(dpu_kms);
+
 	dpu_kms->catalog = NULL;
 
 	if (dpu_kms->vbif[VBIF_NRT])
-- 
2.39.2

