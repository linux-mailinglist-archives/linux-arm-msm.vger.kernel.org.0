Return-Path: <linux-arm-msm+bounces-58531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CAAABC69F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DED3B62BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B5628A738;
	Mon, 19 May 2025 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpPUpvtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA728A419;
	Mon, 19 May 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677503; cv=none; b=jrCy7J0R0qU5pvFIJcvYfNOb15s/krw1Xf2VjbV93rQd6ZD1jp9YR45uaaQbwYbbCAsrGoY+vQrPW03+g1bOpqm6UGCgcGadhGOAfiH4QaDgh9ntjB4lttrqElFXzY0EbHuqAhiZA0YhitboWMtsNF6oXX/ozdGGEK2voSnzPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677503; c=relaxed/simple;
	bh=RQNYZfcWFkBFy1yXVF2TvLd6+/9GINYibAbtHU0LBxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAp9sLAdXJTxUUIr6m2/ZK/6sS0Jm681UnJPK5L0D4DwN2iUF+dNMe9L6QYhMjfUDs66y3SrV3rVKz9pKQkUeLT0uqC40vjmhWLgBfT3ztUgqMwhuP/ETfm6fWalAmsA0gVdTpfTvZLXskx6/P35DgrbPDjGLrC2gPzEvUTT3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpPUpvtw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74267c68c11so4248155b3a.0;
        Mon, 19 May 2025 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677501; x=1748282301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
        b=OpPUpvtwaUqVtj8Ai5s2VdTnBALXXrvoyeKWeoF4BI/7/2kPCPdOLFlpNLXG5OyzSs
         8U3tLFoRbGKUyTDUJrcFlOynYS9Q6jNM3gojsLQtDVKMB9hIfyyADirKMep1w78Jd9UH
         KoU1EW5jK2iqBNCmcHAYlpeTC0iCX1PcJhF9pMDIlb0Ezh5K3ehYcapOlpuHFWUTPWA8
         zvS1Tcw7ryN/dzc4SIIU/egZMcxdca8BgP7qn9ljsSwge+jrLenZR0wdzO9f0sJO9veZ
         8VNvRkJLN+o5YIYn9ASzst1PYcnnmidpeU1AAAM0/NairTSekQH7Q9l8c7IkMSaHj2iM
         mXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677501; x=1748282301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
        b=bP6WXDIUFlJcwJJur5RFye7rDejdQG0quDRVLqOnnH8X1RcFKn3jwPRom1wWGNHrW9
         V24fXAejAzF25TUMd+CYgEipFyr0AaEePSapY/ZC9OmA67MVvjptKARQmlycVLM5U6+H
         SANXCflK+ZZ4IYSwH+5X4HU+omcMXXvh5MPPzFDSTmNnQlNrm6eOC/JhK0XDHZq3L/7C
         yy9DsNaCmRNSQa71XsBU55lkkQ8mK/6MlA1AiO0aW0OAG3sIHQIhk6t5iiMJAtvhFars
         qLkaYFC/R322y85wgXt5leObblkr5JmIbjMetnY57Chu8hax1HZ8kDWpgMMgT0BbhBRk
         myDw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Q+REKVuk6T67ylLD0h8O1W1ifo5TTluQN3tj1pkqFEYLJubUGeyUhSe/zN+7o419H4Ie2X0Ne9/F5OXq@vger.kernel.org, AJvYcCVTMQe9gzHoZXddG+JtiN8tzsBsPW0g0ss9qf+tP7ilP1wKbFhdVqYLd1pd8u22g50wGdnVtUU83T8NSDmF@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhwwnVuc5fp0hBsYqiX803qr3F9RAUesQy7OAalqrutZ3FbSv
	3M9KIAJzS0IP9fAKJBiK5I4MRqHGJYo96Ldk2LXwvmt53qNa+Py08dhd
X-Gm-Gg: ASbGncvppMnOLmygZWBivNIhl4JgwAtVEc6mAG8BQCG6FozE+7WV1d/JpBXjQn+6c9Z
	zsECPtuu1tyrSfnGkS+80/MfUtWA7RPx0/EzDz3PB5QSirCrhXuCLrKKtiCphiNHUmc2nMrsd6W
	SSmMF/P4Md26Q7rYinX3m+jUR08f9wUwd4elEeFHHfh9nKbyAyRdQ9NAdd1n8aRBUh6+jg7dYbg
	XYeaZka21GSi9snyXf21zI4FbvlOb16u2DbYKFtQX8+YyJ9CpiTyyim+4C8GsmdHLFh/6iSGiuy
	LkuZ52xOE5Tz65rC0SACnfKjm5OATRBgnbqQ4GY3ZQj/8Ck55n0+kNroQdnfjwhBo9kn79LsPHc
	90d/SKvy6I1L5HmYc1JB91Y+FgQ==
X-Google-Smtp-Source: AGHT+IFIyFTDzMZF98uDkDCYSSBpvn7zLyPicAJGXxSwxhrsNbTAsiqbNsLjqrVwcxCyiEStsO/+9g==
X-Received: by 2002:a05:6a21:1089:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-2170ce31534mr20223986637.35.1747677501245;
        Mon, 19 May 2025 10:58:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d7c5sm6778137b3a.67.2025.05.19.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:20 -0700 (PDT)
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
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 20/40] drm/msm: Drop queued submits on lastclose()
Date: Mon, 19 May 2025 10:57:17 -0700
Message-ID: <20250519175755.13037-8-robdclark@gmail.com>
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

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0


