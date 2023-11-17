Return-Path: <linux-arm-msm+bounces-991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38117EF537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 16:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6AED280DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 15:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE6328CA;
	Fri, 17 Nov 2023 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaFko0/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4795EA6;
	Fri, 17 Nov 2023 07:24:32 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc316ccc38so18961505ad.1;
        Fri, 17 Nov 2023 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700234672; x=1700839472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBvEQIGbC4HURF/ntUyUlcav9b00XtnohKM7H7UZq1s=;
        b=OaFko0/qtrAFxBOJmfA0XFJ32AcaZ5bQvg8MUpcvjBYE8zEnHS0jZWAZ2wa/IXrLst
         e+1fgoOotAPqD/W1mQLqUmyvJY3TPg95nIn85iNj6/50ptRjlb26IXY+FHoQDhnJMoIc
         oQ1ryjkOK/Z8cdxj48G0T+sPO6A5DGIlxlGDDX0kZaVa7WNiO5ZVzcDiXPYWpeYo03Pg
         vYsTmxesQDdZuWdiAqyCaBS7RfaN3BLG/nUPAq2qDQJ5sDwCngfVQ2D9m4AHFTyG2YUm
         96hJYdvpbhdMljRUcQILB+4upC1LYvtWL7nr/hlrwDzpVqJmHf2dJWMzEkl6Fxq1Ef4t
         RYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700234672; x=1700839472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBvEQIGbC4HURF/ntUyUlcav9b00XtnohKM7H7UZq1s=;
        b=UkgvfHVbSn7g3W1Nae9hDq/axGQbJbfo0L1+9POSeWT2Q4teqF5h2bPevfWXGv0FUF
         U/XzcNxeB9wjexERjTWg5b48gxFXCOg/MaqotJ948CLgTlwWHCYts2Eylo7EYQtdTjQa
         r8hZZ4I8bUKkPHr55uUIBavFFW3wFfIthvuoHGZ7TXikmFZKJGKDC8hfJ7A5UCDwd6Q2
         HQ8HvihsgAaGdznf8HE20Ah/I8RzjJfCxCbquSg90cOiJJbYx4lJYohwQSQiTeSD9OEm
         XaznHL+iHi3bwARzBhyr3Z61FIT2Oh9tJZwu+/LcImIYH7Pls25vnqpQLN+RUtd2QcXy
         Em4g==
X-Gm-Message-State: AOJu0Yzza17JwhK0g82NKmFRCOqnrhYkFcZF/bK2dsup1JYbs3ag487e
	cnT0g3se5zEn+WRiyNPjVAQ=
X-Google-Smtp-Source: AGHT+IGTPCDBXhcUUjrXC4Dbd4cFWutY1Bl9KA7ZGsMeXgRJUlzNmkIzq5Rli0oYI5LYgJOwaYw/Zw==
X-Received: by 2002:a17:902:e5c3:b0:1ce:5b6d:e6b1 with SMTP id u3-20020a170902e5c300b001ce5b6de6b1mr3482012plf.17.1700234671579;
        Fri, 17 Nov 2023 07:24:31 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001c73f3a9b88sm1504162plg.110.2023.11.17.07.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 07:24:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gpu: Skip retired submits in recover worker
Date: Fri, 17 Nov 2023 07:24:28 -0800
Message-ID: <20231117152428.367592-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If we somehow raced with submit retiring, either while waiting for
worker to have a chance to run or acquiring the gpu lock, then the
recover worker should just bail.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 41 +++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3fad5d58262f..fd3dceed86f8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -365,29 +365,31 @@ static void recover_worker(struct kthread_work *work)
 	DRM_DEV_ERROR(dev->dev, "%s: hangcheck recover!\n", gpu->name);
 
 	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
-	if (submit) {
-		/* Increment the fault counts */
-		submit->queue->faults++;
-		if (submit->aspace)
-			submit->aspace->faults++;
 
-		get_comm_cmdline(submit, &comm, &cmd);
+	/*
+	 * If the submit retired while we were waiting for the worker to run,
+	 * or waiting to acquire the gpu lock, then nothing more to do.
+	 */
+	if (!submit)
+		goto out_unlock;
 
-		if (comm && cmd) {
-			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
-				gpu->name, comm, cmd);
+	/* Increment the fault counts */
+	submit->queue->faults++;
+	if (submit->aspace)
+		submit->aspace->faults++;
 
-			msm_rd_dump_submit(priv->hangrd, submit,
-				"offending task: %s (%s)", comm, cmd);
-		} else {
-			msm_rd_dump_submit(priv->hangrd, submit, NULL);
-		}
+	get_comm_cmdline(submit, &comm, &cmd);
+
+	if (comm && cmd) {
+		DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
+			      gpu->name, comm, cmd);
+
+		msm_rd_dump_submit(priv->hangrd, submit,
+				   "offending task: %s (%s)", comm, cmd);
 	} else {
-		/*
-		 * We couldn't attribute this fault to any particular context,
-		 * so increment the global fault count instead.
-		 */
-		gpu->global_faults++;
+		DRM_DEV_ERROR(dev->dev, "%s: offending task: unknown\n", gpu->name);
+
+		msm_rd_dump_submit(priv->hangrd, submit, NULL);
 	}
 
 	/* Record the crash state */
@@ -440,6 +442,7 @@ static void recover_worker(struct kthread_work *work)
 
 	pm_runtime_put(&gpu->pdev->dev);
 
+out_unlock:
 	mutex_unlock(&gpu->lock);
 
 	msm_gpu_retire(gpu);
-- 
2.41.0


