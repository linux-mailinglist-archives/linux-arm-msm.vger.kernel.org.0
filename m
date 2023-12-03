Return-Path: <linux-arm-msm+bounces-3064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCF801FDF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7561C2092E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE72FB3;
	Sun,  3 Dec 2023 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C455Y+/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EEC107
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso1358e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561936; x=1702166736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhduEdY9rfFEo5t7qo9Oszbc0IZqRQzEBjCv6mdoXAM=;
        b=C455Y+/pWz8uzedYpKZWlkBiA0liLdy7NKBBMEKQRiFEgLsXzZN8F32P/uWWL/QTB2
         kiUaaOyMNEjYZxQzcTXTZkV9bnKbdz/yOr3JTFP1GNdocsaJlcylcBdMSBgnPDi4Q5Pv
         iqSJcJOMhTKZvfBrRivC8MiwtvWNXCSVUiJJGN4rvT6TqXw742j9bMIQ7O1mrt65Mreg
         /l711lUJmxAeVrxeLPyTBSmiv9Y5fo4sqLLvGY+ttt9dZ1QyaIHE93pa7R1EEFUoSzfG
         gkkdLv4wC7XUDcdR5RBjQgn4aRCa+koYNKFP+QhqCS9bSO+XoRcNydF1Ardp8uSjgPKJ
         ATsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561936; x=1702166736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhduEdY9rfFEo5t7qo9Oszbc0IZqRQzEBjCv6mdoXAM=;
        b=V21hszzYlO7nj479XFcSxnu610ib5xly+8hDChA5Yl1tys+lC6lC4MpD8Kz5G9/AEU
         itFZRHbLIamBgmHkWPRO2OgKJB4vyzP5ejmRHAvWteZmT2J2VXkm8CPJjpG6ogouSLlk
         LcuZE5+wBq8svlTSDwxqTjiLd8jw3T8Y0236rtRBUN4DudMncmDOyIF/2wrZZPY3IyA6
         Hd04m8bU37lneE6PYgfaY1XUdMO5zVM2ZwJC6JtyfS+mMTzFodMc+gzDqkzRtho+XZxR
         AOVv76m77jMY+It5Iun/Q0uqm9w1vSCABk1wZNQEmsub1W7EbGLVMGfQky5Gfhjmc3ST
         opQQ==
X-Gm-Message-State: AOJu0Yz7bc9jfcsO+nR6dWFWPFU0SZTIfW2U2PKuXjn0hEpyKpqMLQXX
	T3fvaYBYT5rfG6g6fWUg2IWCYw==
X-Google-Smtp-Source: AGHT+IEnH09BN8lJCnFzv/1AEwB1sYe5O3yf8kfOev9tVf+ZhwPkF/62e21L4u2Nl2L7UYNUJg5kQg==
X-Received: by 2002:ac2:4f05:0:b0:50b:d764:76de with SMTP id k5-20020ac24f05000000b0050bd76476demr3115828lfr.109.1701561936482;
        Sat, 02 Dec 2023 16:05:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND 2/5] drm/msm/dpu: finalise global state object
Date: Sun,  3 Dec 2023 03:05:29 +0300
Message-Id: <20231203000532.1290480-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add calls to finalise global state object and corresponding lock.

Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b3bff5..73f70e67cfef 100644
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
@@ -826,6 +832,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	dpu_kms_global_obj_fini(dpu_kms);
+
 	dpu_kms->catalog = NULL;
 
 	if (dpu_kms->hw_mdp)
-- 
2.39.2


