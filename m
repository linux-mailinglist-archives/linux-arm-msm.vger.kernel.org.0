Return-Path: <linux-arm-msm+bounces-58541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D39FAABC6B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 880DF7A11AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3A828D8F6;
	Mon, 19 May 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5sg7ur6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4F28D85B;
	Mon, 19 May 2025 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677520; cv=none; b=rslmD6qb1ZZBT7f/vUAz+2tAe0m0IQek2p0h9cMNzdN81emLqRzhSGjMulH2gemY3kxdeMYKpdE7/u87IePwC3eCqbA3KRYgCKAMabsj9Z1nwj+WenfwOlo3e5qSQ+NPWOXKkiAl7nQS6jOgMwLCEn30tGS2ue/ZEeFtLdtqZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677520; c=relaxed/simple;
	bh=he5qvIDKEYSpUpScoEQkO4nstTj9ZaWWJob1vo4UMGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SygBhBSSeiEHhsLavcJTq8Go4XJ2TRCsH2BrDRKCZHx1QqH05aHXInrC7w7A1NI9CGppBMsTVbA25ghYehPxcZxSChEbFuxNpez3EZgCU0I4tliyxE30wsnSIU4USKK2uSWD5iFP8Br8XbtokI3gayErUrXyi/FdNNed232mk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5sg7ur6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e331215dbso43202025ad.1;
        Mon, 19 May 2025 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677518; x=1748282318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw8+5Lu92Jvnuz9rkyDiNgf2Y33qWiuGoKmOSlycwFo=;
        b=k5sg7ur6LYAmEaRreX14apAqbLEufAOxNEGBT8NPOvbL8xPPrvJkk2Fe5Fi5yYk5No
         ZQv1AfH9qZSjiDslaOtvgXZz/WGn8G7gxYPek0tniFAHL0Wty2OvqVFa5Juc6pZqgwaY
         8IeF38tDplatuulySpC61J5VCw4An0PM7TO99DatU1jQtKsQSZVaHF5zqWMiXSikE5tI
         aMkjCZvqOYTame0qdDATCZHJ/mX+3BCeTODZbvlKLJGBvLEdHAYqKYG77FW+gZ++47xk
         ymW6lO5nhV9Aw7Lyy7Vr6u7y5k0gesnWnBaSaq7UkqBqz5mFMbikYlHSJjzDRx2EyBUb
         Y6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677518; x=1748282318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yw8+5Lu92Jvnuz9rkyDiNgf2Y33qWiuGoKmOSlycwFo=;
        b=bIpeAJojDwfknc35zYdH5XzVWcvPBZGsnSEIF9EOOpm+JrfDsUYmciv33JLHh+D6/R
         E5POxVMd9cR8h2rnPTVsyE4NVPJclyngyxCRv5fu/JzZsnJUvoUiXscYhplgyPq+TVs8
         RuqFrM8ejo3BeAx6OmzKM79u9L78MvJefenpvZFmh7bDop7qnB83LShbtWO/rrwEVHmO
         lAIERM6os/ny4HBJFX0fv84JYm7iH6KCihHF7qcTSO/GslHYBs3mHx78e060IP6tpDiZ
         OITJnLrKQm6zLuq1/wIJvKAkFfR6A+2nm9AWlGUyRp/nr0ozrr04w2qkoJhW99H8HJ7A
         +VuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7KjbIs2BSFqE54SSCI0pVDOcUTpja0WQLBD+vixhogOUGeS8TN6SNwaFdbbqzo+rDxGnVA4lM7LQJ/Htn@vger.kernel.org, AJvYcCXQqexUrn1zxcNvYpSNEbAaOR75S+LKS2B807AhjlWx45W3DWnTYOrbrZqcbU0irdM329YgjfHhLToSlkod@vger.kernel.org
X-Gm-Message-State: AOJu0YxvySe5UuryNbvWxeDGy8WifAXTpqxhFXcHSa51GRfl9JFoKbI4
	J21/KRpTXv78NU27U3/dTv1PNo/lX+IVEp8dfESNoUCOkebHLaudwXZelwI69w==
X-Gm-Gg: ASbGnctHZPm85yXBPY3nq1qFVYh4jvo1sQyAuZDYVv7bhImTEbZX7yiExnX1eTkVKxS
	cihQCt3YnL1YIKpf1avXkoLTogjhTUsUfh/oc4R+PQ84cpU84jhqUJW0osaO8HknLL4Y2YttKku
	Bn+pSTq8Jzyq83vDNk9wFSHr/3xjJoEMPkiepfjOHEZTT73Jzh/BHS3lHuK4b4RHpM+qmiZf7zQ
	1kPq76k2aA9ULzfBOp8DQLgKhCqMW8Ww9/YJW/aJG2rNbo6GRGKzWmS6Bl4oMY7nJCe6g57RC7f
	DY4A8pF1iP5tAG+luAvV3W1s7Fj7YvV4HmGCTwiKgJzVlNIsG46JtWoXcF9bDffQaQvYVenefoB
	+CINR0dAb3IXlzGE+CdyXh5UiLg==
X-Google-Smtp-Source: AGHT+IGs6KrnF1n7CohVGZ2xmw1s8L1aM9us0S4M1mcH1itEFyn1K0EgB83X+frh9MTVQgjtuCFIYQ==
X-Received: by 2002:a17:902:f543:b0:21f:1348:10e6 with SMTP id d9443c01a7336-231d4d2041dmr208599415ad.13.1747677517708;
        Mon, 19 May 2025 10:58:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97dadsm63119275ad.141.2025.05.19.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 30/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Mon, 19 May 2025 10:57:27 -0700
Message-ID: <20250519175755.13037-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 65ec99526f82..cf509ca42da0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -76,8 +76,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -879,7 +879,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0


