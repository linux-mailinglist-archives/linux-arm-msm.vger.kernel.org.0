Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81437980D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbjIHDFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238039AbjIHDFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196A01BDB
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso26372901fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142323; x=1694747123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o883M3C8fvtCGweIidn/6JBt/oAPnlfkI17tGXxBy4Q=;
        b=ECNFxC3f2v3aKRcE9cNiL3G9kICzO/vx5FEmTBzipM7SaLojEcR8/l+6JzhYmsw4RD
         V03bK6cjDHaDxD9rCkLJRZDYkbr9Plsmh8Ab0R9iOW3ui52383cDaTedGUbxa9Kng6c0
         OXBjjAzrxADFLTIADJiHipxJGmlr92naZDua9lp56VFEh9zKjYOzC8UEl7iqRUsxIky2
         gtTyB2/43SdOQFQOV41bBQYck5Hpkl/L36Xkn4WcjQ5QtOuNkpKh7nmOAEaVnv76eYep
         5LU6pwb4SR7lqL7LKAwH9fYZ861jSpL3XbNpmKQ32chjE8e1O+YoBi5SvQTBVdZQahbS
         ivhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142323; x=1694747123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o883M3C8fvtCGweIidn/6JBt/oAPnlfkI17tGXxBy4Q=;
        b=n/cXEqsR01JiW4ECx3XtfZiSi4x18g4p88kvHo6h5W2R/ZTzdWDqIBAw58So0Of5/0
         +XvGVAwjD4o6NNwSq1kiRfhIhP8gs+5XY0FYcfEvA4rFgcxzD0vRASdKE3iiq5G//9dC
         mWLujJ22UoCV+p6HXsuYmAZ6yxrtqSGeJeoyMQQLtYl0KmTrapep4zFAX8KJOsg1u28W
         l0VZBa/HPCemZt5Yg7tf4prtBhfnX5UUt1XQjIsDyR89YpwSYtM8VLsicUwl2f1NQ3ry
         PloaMuJilYPVVAxSalDbfmrad3imOasCXCeuYvrlH2sS2HrLZN2hup5u5Zncqx88Ia15
         8KEA==
X-Gm-Message-State: AOJu0YyFv+W5JDMyuoH9V+gwrSE2ubtaBk4PDyg/00rceqzj6qMBoRI+
        WJvHZobdJeRODAqwbpLSNkRt7A==
X-Google-Smtp-Source: AGHT+IGpggkFyIkBUixeUSKNcYrFKcn+bnKrNcdK4A5JLNXtk7ZuNI1nZCzfID5emgXF1KO8lwSi3Q==
X-Received: by 2002:a2e:9303:0:b0:2bd:b99:ab7e with SMTP id e3-20020a2e9303000000b002bd0b99ab7emr636452ljh.42.1694142323342;
        Thu, 07 Sep 2023 20:05:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:22 -0700 (PDT)
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
Subject: [PATCH 1/5] drm/atomic: add private obj state to state dump
Date:   Fri,  8 Sep 2023 06:05:17 +0300
Message-Id: <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
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

The drm_atomic_print_new_state() already prints private object state via
drm_atomic_private_obj_print_state(). Add private object state dumping
to __drm_state_dump(), so that it is also included into drm_state_dump()
output and into debugfs/dri/N/state file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c277b198fa3f..9543e284dc15 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *obj;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
@@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (take_locks)
 		drm_modeset_unlock(&dev->mode_config.connection_mutex);
 	drm_connector_list_iter_end(&conn_iter);
+
+	list_for_each_entry(obj, &config->privobj_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&obj->lock, NULL);
+		drm_atomic_private_obj_print_state(p, obj->state);
+		if (take_locks)
+			drm_modeset_unlock(&obj->lock);
+	}
 }
 
 /**
-- 
2.39.2

