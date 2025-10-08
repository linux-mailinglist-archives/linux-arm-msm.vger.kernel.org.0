Return-Path: <linux-arm-msm+bounces-76338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50584BC3FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFB313514FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF70E2E22B4;
	Wed,  8 Oct 2025 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GPzt3PsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5119E2E172B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759913675; cv=none; b=iOvl8XvPb8qdL1RKjsDxXcG/3I9CqkUgOtlhRWhwU9eQwBg4+0O8u4Ozuod0UmIJZQJ//HQRERZYEI9HS1qeFurtYbcvttQ3xk3Yq0kY1ULcu1RZMK8UYMjHupb2wlWiERN7ZLXb1J7fFjxkoBZAbr/Hu52A4fRXUVnrk0cLYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759913675; c=relaxed/simple;
	bh=TZEtSxzmiA78S0pOF1+9Ub0xGTYchpiQTe2U4MB4Sl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiwzVFPQkn16FQ+N6jGK7+7vTmcSsYN8oBrBiyjgfRVnXf/xPZN93d/mrtrLrZfF0yzP+LfSUfEUS41t77vYpPlXWQcQJyYH3yWt5PUcW3cLmujzURtzvp++axgVX0mhC1PNGU+mQGXBMnLboJQCZyHyCg2pY7pDqZHvpXtp5ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GPzt3PsM; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XQJ/Az/VSv88y1BgCLcNqjv67/Kh0T6JPpRcE6EW2y0=; b=GPzt3PsMQzYyP7OJvTZiMTpz4P
	1F/0srEHhRRZih/uo3bAKsD74mh9NlRXC2tsAcNQz3Ih/NoOPNZ/zAqDK7Mi9kyO9DnjcwtWw+43B
	SRqbmczVChLcnwY08w1eHqJCPSpmYBvqEbK7zBROF+0oSA8CQBM0VxzPRjNyxyyxu8k97sE6e3VFZ
	T3K/TdGBvSdD8JmpuQ+DYacWVC/QXoLIkhDTic89Qc5rpqPcVXlv8PHa5lX7zsxAMeSn1/7Uw02+8
	9Ig+ApSU/L9n0/VrjcjjS6wwrjk6nifXNrARzWjTk1St9PVTvJ4OdqTOmQWkC/BPpRzDcgDix54i3
	EvJ9X1Ng==;
Received: from [84.66.36.92] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v6PwH-006Z1M-4X; Wed, 08 Oct 2025 10:54:25 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 21/28] drm/msm: Remove drm_sched_init_args->num_rqs usage
Date: Wed,  8 Oct 2025 09:53:52 +0100
Message-ID: <20251008085359.52404-22-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_vma.c    | 1 -
 drivers/gpu/drm/msm/msm_ringbuffer.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8316af1723c2..478e31073c31 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -813,7 +813,6 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 	if (!managed) {
 		struct drm_sched_init_args args = {
 			.ops = &msm_vm_bind_ops,
-			.num_rqs = 1,
 			.credit_limit = 1,
 			.timeout = MAX_SCHEDULE_TIMEOUT,
 			.name = "msm-vm-bind",
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index b2f612e5dc79..f7f0312a7dc0 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -67,7 +67,6 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 {
 	struct drm_sched_init_args args = {
 		.ops = &msm_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = num_hw_submissions,
 		.timeout = MAX_SCHEDULE_TIMEOUT,
 		.dev = gpu->dev->dev,
-- 
2.48.0


