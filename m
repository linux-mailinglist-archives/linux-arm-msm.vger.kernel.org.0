Return-Path: <linux-arm-msm+bounces-57920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5DAB73D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC681174AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DB028E56A;
	Wed, 14 May 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2e1DfeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7828DF38;
	Wed, 14 May 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245423; cv=none; b=Txb999mEh4yPOW21KlD1GpU8jV6DdptAlrvE3fZu/Iwk4o8K/VSoM02VPlPHrjfV4/gjiQ7gyXZvNx+MV3IuK746ELqWTR2afnV0Zz5KL/UU6f+4kK876b81ZkEdesyE3jqr/6ZMy2OO7kVe+dbdRtnVT7KZXc0WAe3YzrkcjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245423; c=relaxed/simple;
	bh=RQNYZfcWFkBFy1yXVF2TvLd6+/9GINYibAbtHU0LBxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwQtCmDoLKKo8o7/Yd2jH2oeB6rhXGVD0n3LoBlrUa3YaxGSUEnRs0K7qAhv2FZ5LSqmmgm8LTl8PIlGAkpw6xB/Y9z2f0iBibGG6cZFEwwwqGSfATieaM59A+TmZP65tNbzLDS1ECXMQKbBPs5HPKX8cBAXDzfPWuQjv8EqPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2e1DfeS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b24f986674fso161833a12.0;
        Wed, 14 May 2025 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245421; x=1747850221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
        b=l2e1DfeSAPhBQbUczVu1jrebbnaMDw16ULOf5MZk8SqMwVVuTRD3z9NVgSzGtW8Rht
         PX9J9gyuCpAQlay9OwLc/gDnPz7ZidZjNfepXGw6CReuTz6MSDOudqYbxNSm3PHzIpDe
         w0OsNSDIvSDLTJlYU6DUcFNERd2ZCtw6n3/ODY9EuI0e3puBFU5LNt0X3+5eudYvkcUt
         Ya112PIoBkrLvyQG58HahHIIYAU9Pn0IrPaNho/aEXJ66JiUVFl9U/Qpa9FLl94BOwqp
         w06kHabM3EcqV/SVwIVH7iNcOeJv4EKE8wejX66BD0H2BMyX5vMjGT2x9Dvx8DIaH59V
         eLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245421; x=1747850221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
        b=i9Wm7UgSvY1nQwGUqYI5WctuO5L8w2XrIz+qskLrUqJt59wEnO4RbFcUvqk8Dol6kI
         LDhxJL70wbEkQRQmp9ywkVwUQGMuOewHOKPfkhEzTEy4UZGehS9NW5w7YMpMyyN68UzB
         IqibMJfPH0GKS8Lv/f52NoEyfbisqlXcl3dCCAcE1M+4BLhFVl6hEVmW2s+b31hrVEtK
         Z9Emkf/Nj/1FRGWF5pj9DYGZb3t25GgFxV2Gk2HSOs99XnkZ26DdZYVvoIYuOt/bmPZq
         oFNGg6hFNFuvaScvK2i80xRDSCMV0r30aycBkNpBtLRNN5VPNR2FnIU7zYjUcVXFpB6q
         e4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR1rze/GopKDY8jOk25fBz0tImMaLAVAmPJfr/EkabGrzKaXPNV4JaVFXpE7TFV6LPJYjU+mtTDRxyR9LC@vger.kernel.org, AJvYcCWxtSx7nJESJKgze2dIEAUR8V8VmoJ8Ez3rmoOR7LNyQryiQ/uI1wxupkT2KyaBbzJZC6X5uxKnhsuxgSAy@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWefvBBBdq73nPT93cHdSTCef+tr6nWCHVaIS8QPTRDZhpD5D
	1RVDzAiI0gh19NHj1MSQYYBsuTMa+B4KmbPYp9v6NQFWCUX4DvXX
X-Gm-Gg: ASbGncucOtq9JzlwO/9bDtEFsPvyk4hlNKGvZwuo3ZaAJRgRZ+jnCg/rf0raZMw6i7O
	W91fZ46qj2hBv1zUe+O9PywtOjj6u7YQs+XxrO5Tw/FuH9CGQd0CX+0a46IBMmZlIp1xc7pSN9b
	eJE2KwOEUh8EYuj3QYRy/zezD0iy4tpm4qgdOJpr8CWn4vMS5t/lN3R+1HijjwEw18MEVYamlAG
	9XpA1HQluk0y6t/E90kwKaObPTH85GiTLBFpfRczmc2x9VD34ZiFD+iq6/f6l9wiIGqEbLNmqOZ
	oC97VXc+DVHw1StzsssPFAWX/p/VBngaPVfp6FjtMsj2VOXW2hqgL26sLHqlOxCSQoiSmxLS2NU
	kqRe42gA5/zV+TVikWa84lC/t9A==
X-Google-Smtp-Source: AGHT+IFUKM5BrMcM042mpp/H1alkGpnJKLvV2czpR6D7makWbQdqOpUykv4v+aSD1r+VXOZpx/ThDA==
X-Received: by 2002:a17:902:f542:b0:22e:23c1:d711 with SMTP id d9443c01a7336-231b399df70mr7688625ad.16.1747245420864;
        Wed, 14 May 2025 10:57:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a38d8sm101784925ad.236.2025.05.14.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:00 -0700 (PDT)
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
Subject: [PATCH v4 20/40] drm/msm: Drop queued submits on lastclose()
Date: Wed, 14 May 2025 10:53:34 -0700
Message-ID: <20250514175527.42488-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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


