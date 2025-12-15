Return-Path: <linux-arm-msm+bounces-85263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08177CBE98E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 16:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C86A630439E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 15:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC5C2F2612;
	Mon, 15 Dec 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Ux4ptcUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C702F39C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811327; cv=none; b=qJK8QVBuB4EV6wTPerGdoRkoQopuhKpfxxs5QUnpRnEMU8odsRqqKzK2REEQ4rqtVSyJryAIFpvxM+bgl+IPuejSHWj8i0fWUjkv7gDie1FvlZII6+ywRDZpMDy1q5yYeBd/8MTHHAPhc+dycXFKLTQhGcI0hKLNuYnuLPOQfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811327; c=relaxed/simple;
	bh=N5KDwQqXWpF149MAmkq7hxyI4yvHhwoVjHXmU07ejZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQn7f4GoZLzt5Q/0QqJbnkm+QP2rUhPP4zX8Hn8mJ5FidQFME9IY9r+9/rqhtBod7NgWIwAeKgAEldtKDE/HTqZHo6B7xymUQ4wLD9ZN1lEyjps+uqG2/CDhh4iLj6t3c2qdqVaEoYy2y1UqXMrCIOZile7bqorNY3G6o3ObJ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Ux4ptcUi; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9Oc7SeDgIAn/pvJ2xdrtswjdqH4HQWnLutTcecIxOlM=; b=Ux4ptcUiTeRX8BbUGjRwhRYO/k
	nL8kSB8Hu/Vn5qW85CWzVpDhBdfpuNs8VSW4/VsVcjESaZ9CMnYRlWAw+KPilkF9NnJWdH0vViYGG
	2+huykKBm0LJicqcUTGbZ5JOFP/0GNUDZNaz0aud67U5GiLxh5wDhxVoz2GKXCFnemTthaN2cifIZ
	amofn1ZprGh4ZPOGRwgKqhW6vJ0PUuTkgSavCD1VLp1UFqsZe9vLQkc0bKrqyePKIc4H0e8gZQu10
	YcEUPGI8wJciNj+BkCVcWX8szKZeZKXm4/2yPbzHkDYlWz8v/wD01nYmvrnjCYIWX2hPxqeQPerw8
	CBjOCrNg==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vVABj-00CzC9-Tm; Mon, 15 Dec 2025 16:08:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.or,
	intel-xe@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 21/28] drm/msm: Remove drm_sched_init_args->num_rqs usage
Date: Mon, 15 Dec 2025 15:08:00 +0000
Message-ID: <20251215150807.58819-22-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
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
index 71d5238437eb..dac6f190544f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -829,7 +829,6 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
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
2.51.1


