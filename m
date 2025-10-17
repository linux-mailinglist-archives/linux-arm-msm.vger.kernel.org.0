Return-Path: <linux-arm-msm+bounces-77782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926ABE8F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 15:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5318C402C28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4759A2F6925;
	Fri, 17 Oct 2025 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p5S314oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8082F6915
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708235; cv=none; b=Jl0JDzfdmOqsRTrriQtAIMKD69xy8fZROIKoPZRp67W3ptWuiCZtsOU8MiJtz4QdtQ55833/GIlAayl+PktlBUbhpfqTOpgY1vpA9IA2ESE2RKCJWwkEPVoEDEfNG8SB3L41k2Zt1Ca/fNlSFUGHy8hb76Ns43o/2bldWmIBhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708235; c=relaxed/simple;
	bh=TZEtSxzmiA78S0pOF1+9Ub0xGTYchpiQTe2U4MB4Sl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjlsyQ6oNUSc1xhRWpd4g3kqmwdxNDIRswxzHoeSWeneJ1CfCipvJZ1D5iyiXNKsaL0BY4QETBTgypvk/9B1WvkL1asGo3Md+gyW84Cfljyu+itnEieAHMad/cWYFNiDCMU6rOXVc+xo4l+M3F1bnzA4fD/LWt8GrrD37P9t7kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p5S314oc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XQJ/Az/VSv88y1BgCLcNqjv67/Kh0T6JPpRcE6EW2y0=; b=p5S314ocZBKpWPEUXPcaa240gg
	uAo7qdAJOPz5NWY7f/FLkEpYJ0dn4JVe+uSi6wydtxnGw0g+F2Ah4ngrb7KDlR6CAmgjtbJxSl5MV
	qKAjjKgGayiuWygwppZTfQVhbJrJwC21diCC5XU7lpjWtxyB04oVujXKu5PIInmfCNRK+R3jkM/Ky
	hzqZOmnRKvzMDcZQDlZ3C/w31MrFT1kmryOETjcO3Ber+RrtiCKc+Vu08ZWrv1+mOi9BSdIvyUjkG
	gseXzETolKqHkRrf9ir3ytxw+pIm9is7KpZpJt+Ss2vOjUrEJulhTT5EaXi2B5M7znTpOPJ20zHK7
	KYwt4cdg==;
Received: from [90.242.12.242] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v9kdh-00B3xL-FS; Fri, 17 Oct 2025 15:37:01 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 20/27] drm/msm: Remove drm_sched_init_args->num_rqs usage
Date: Fri, 17 Oct 2025 14:36:37 +0100
Message-ID: <20251017133644.44747-21-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
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


