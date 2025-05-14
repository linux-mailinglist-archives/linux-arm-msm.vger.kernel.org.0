Return-Path: <linux-arm-msm+bounces-57878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2125AB717A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82786189668E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7067627B4FF;
	Wed, 14 May 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZSNNVt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8892749EA;
	Wed, 14 May 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240425; cv=none; b=ovtMwJpBPDtKLfsqQ6utRZjorUxeJiMAbZSTiA16fmy5YQHXyoXbcgqbjVm56z6g3fJyUh+yse2lnobAa/0KHHz5JPg9Buv1dak4EWllxdEgOzmbJBuUbvSpPNII7DlsZDU+xHvTGh4WPO8bvts43BCX26wfUWiknGS92aZcjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240425; c=relaxed/simple;
	bh=4ujIma5tBo8+opEU0UYn3/9H0LBTonNqlCEMXchmV/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXO2vbWiLwAOSo1IB5OQNnNBgEYaQZZXQ7FUCwAP1ozThcMtm3/BI14DF9Feg8pKRY/8SzMcR76SSZ2eKPkrnPdrzE56mP0vb/fbY4Uh2JytHJyAfTOgMVc+ECU4QogbwXg10Bk3Apeo/qGatW+fAN5ScT6BGNbQ7f/FQKn4sLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZSNNVt4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30c35ac35dfso49201a91.1;
        Wed, 14 May 2025 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747240423; x=1747845223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giCrtqk56/EbDcVLPZnFActrlq6d0kOfsWi+ZhZMU1A=;
        b=UZSNNVt40+2/JTiTSdPmeOOkjlApy4pAHVBVH1GEZHivH3RUAYq8p68t0JRmkUNrUs
         fDhWDi0GRnOSYeft/X/J8idEZnGEEeFV648Heh3PldQ/zPWz1vb+4MDQl7X4J2PK9BJ/
         WMQSnoB5HB10pM84crHN6xJDdBO+z2c1XuHBYp7cznjGPDJkktd5+88oSlR1w+S2rL6c
         zGkyoOutsQ9gYIJPssPSjc8z7yv46Ge4t+1yM4CSyS/LHidTxeNBDOUFnIwGxx6c6eDZ
         sRh5Afn0M4VolLY3SC9Bhn9plObhFTch88KQRdIgb2XDfFIeQuk6p29sU/98TXH3fHn9
         eJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240423; x=1747845223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giCrtqk56/EbDcVLPZnFActrlq6d0kOfsWi+ZhZMU1A=;
        b=e/HV+zL8y3Wuts2ykF+7Cm4xVNNyanrAgWaxvjxlnZv0VP5j2XVElXJNpHTdfHizBL
         q+X4EHxvyvBHxGtHm4p2u2QNrJDAmcg3htKlkMWbdBlb3+JRDS53Io4FLOIaxgbITJoy
         F0aDmb18jOzgJu7HzPUXiRRZYBM3OjLX+ASLXfh2hvez4thuQPOmajekdUlAK4BbVyK2
         MrW4g/+4sXAQiqkx76gU5Y2hDWBYWoLX38M2wU7wf29wwezQw5MjH7oebajWTDw/s8Hk
         Nv1+uMlJPk06iH1euHSlGouXqG5G/WITSMfPO9KfyQvBxU+TJEdV6lIP85MzB34nCZdk
         RdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWVcokYds5LGkZhR7STI3w24zfGShG2l283TwYNuVBT3l9YT1YJVsxB26Giw/fVLRAXH6XOgPmzfyQJ/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyThTMK6d2bz2CMpAKDZX3NBi8lBwmr63dCCImVPgdMhbBhTmob
	As5o1611BQDkdktxtkOi/HPTJb3XJ2Qfr04xs+0ngCczvjqlykPZTyxCqQ==
X-Gm-Gg: ASbGncsHJcjNnriJL8ys4lEFe+VFDh00AOSDdQnfWwdiN7pLAKY3wFYChPaPHL/KrAx
	Ls71aNuvcwduy6kPYAheXJWj9mqODpalDZULCsLART5qZQb8GtMMI+4E6T+sOuENzoGzPlIduQS
	paGwoOwSI/g2XeWGYtHynkzs1Jy8gdU5OP5HM977h4yYhlaKITEUmdTeZ/HU6ndeSxeCyiEQLXT
	YkxXCFlYeL0Yw3ZjdkrrPyDlGhQje0sWRJrpGlDPFHudltzVyoT8s6aVBzvmugyeGeqx06ZHJZf
	7Qspq6r9emPsRhc5HJUCSbQgQ/BhfOAN68J4GpeZ1mblVrBC+RaKIrPgPKF5cGsahChJG5H1vI7
	JLe8r83ndZhaFp3ivRSl/XNnr4Q==
X-Google-Smtp-Source: AGHT+IEKDLVaJTyQcdwmJsHMQpLOYV6IU6ZnpNJqxuawDUSfC4gUx33wXl6ykdcJH394EGz/IhSStQ==
X-Received: by 2002:a17:90b:2f4b:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30e2e5e5a8fmr6693177a91.11.1747240422852;
        Wed, 14 May 2025 09:33:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334018c2sm1810665a91.4.2025.05.14.09.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix another leak in the submit error path
Date: Wed, 14 May 2025 09:33:33 -0700
Message-ID: <20250514163334.23544-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514163334.23544-1-robdclark@gmail.com>
References: <20250514163334.23544-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

put_unused_fd() doesn't free the installed file, if we've already done
fd_install().  So we need to also free the sync_file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b2aeaecaa39b..d4f71bb54e84 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -658,6 +658,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -867,7 +868,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->user_fence);
+		sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 		} else {
@@ -901,8 +902,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0))
+	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
 		msm_gem_submit_put(submit);
-- 
2.49.0


