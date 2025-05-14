Return-Path: <linux-arm-msm+bounces-57923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECCAB73D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C24D179A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FBF2920B2;
	Wed, 14 May 2025 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZXLg2Xa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B448291144;
	Wed, 14 May 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245428; cv=none; b=Q9LASexuHrAcYc/Lox1AW3LMdboVVvtoXn2UnMkM8LE1eymgKSJGfbtFucn+RRt7uo6UyyKok2wjmYiSazZM7RAq5GoK59XzDK6CqzNb7Itg0i+IOVT6MYTCQSNK5UPG42WaREAKQSTufOtsn7KKMGqgxKQlkknM8HXfP+n7hC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245428; c=relaxed/simple;
	bh=vcGnDUc0jlkB8HrBi9RCWsHF6aWOVhZxx+sQm1b4eUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxnSLprpA211CmD55BLvpGS6fHonqPDy8aQGJ77Cp70m2XqaX2TdrDVwA5YfSFTdwVMPky9Q/NdJ+fGOL7t0+TiK7gAuvrHJeiP3A/G7C74iLMIv2PYopyQ5BpM24CB5MXS0vkKyqIa75TcCLqMy11B6totai0lCooe3xpwTpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZXLg2Xa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ae727e87c26so7074a12.0;
        Wed, 14 May 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245426; x=1747850226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
        b=LZXLg2Xa1SlN05F3112WXI6pmHigXfl7/xU4WMYSyUFtrImd3ydAUfXdPXy1MTBJqN
         ZCsu2DZigT8+IMiyima4l7esdzxyPwo+iA9j3w3eXORPGgmjASWzuo5vSdilK2fnM0/b
         2xp5R4Sf+72eqAGsktvhiC2WTABzcs+neoQooXrqKd4eKNE9aepfH1iXMY5rZ+ouk4CC
         bUgBc/VKQmgr4GFkgkHX04tTdlD0lBOKpEFy44TOYQs8cURYOgKIJSSmOH/3haW4Ile1
         xohiAkRpjEaB8KdvojubiEW2zMUr/MCBrKzNtlCVjNEipNXWsLhqVBpeVJnJ4+RWwmSr
         TnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245426; x=1747850226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
        b=Ipv4icixUM60GPG0fkd0lB2DnTHkTCtwiYWd8LygJ768H069Nz3mf3mvzIERSWKrhi
         sKbq15SeLrVl12jltaXAR0NfbywCW/owkYyXQ53Vcwe0bfHZ3ScXgmfODSphWknT9VLC
         WHwXTUMZWSPcABCCTTufXFhDj5kbCPXmLS9ySUSkdcRVQlnaYSNFhfkUYdIQv7Uv++4A
         6omNln/PQd79GkWzYZDTn5eEhVFvNq7Hj1sQQb4KR2fAB/UGKeDWOu614poAYmEF0Ax9
         /WWvDsyNWiAZgnFQoivitZxVZAUPjFZYxFe6NwquxbCBXz2lOCdtou2YdoTDIaafeBGh
         BZVw==
X-Forwarded-Encrypted: i=1; AJvYcCWDNd8fqpYDWYpO5kW1ia8mwD3gHmC7xnNIm6drkLv+lyM7YNPUlyo3depHok0W5OGa47RyXnGhvlkfE6uR@vger.kernel.org, AJvYcCX0+Bt+mbiIPVExW2+ZKUZowltiAbdUrF/nyD96h2qLccoBBcF/6zxW25UzTDCFDfojTUuvR2mhvxs4q9ZD@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1rMsY2sZZEdN+5syxJ8IoOqDjLOkfDGCvr5gOuT9EUK6Wr7K
	1M8AdH/dIXt19U6nIiH5gZoFfCbee6YOp6NdvsburXu9S2ad0pCm
X-Gm-Gg: ASbGnct8U9ItyHk1wnXnv3nGWf5zhEvYxYDtW5mum3Alq+5Sls7PseINZB7H5Dbr8zh
	fGoVt4kr7K2prEOKaWugUoDx42nTQSV3EyXspqLNvrYE1j9xjCkmRX52OExoWV1JTzH3hBYovB/
	36gkj26FIkcKCJZcVvWqvZGWxiSt0Om10PTffr9H6TnHrMwC7s2xnrSoO/b85Y8M9PnIb5luaZu
	pNDwZaIFyaAxvZe75t6RAaMxeZ/4Q+pdYthQnzwuDEezZqnKpXnKDL3bHlBc5ZNAGSwOpWfv+Hg
	q3VkA7tgDAESNhCEcMp7vao5Dd6frv1O7G7DIznSLqxxwREBlGy9IKfYG96KiiVUCvMBl3QorhB
	wrDRNsgjbyiMrpLBhjGl9TU605A==
X-Google-Smtp-Source: AGHT+IFFnPpCKvP0NgWNjE1vrV9fJbyMFV4zUdMUBDCgVbDmqc6bNLHoWsuKiYFLjFpINHpDBAMlDg==
X-Received: by 2002:a17:90b:3b43:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-30e2e68a300mr6252605a91.35.1747245425559;
        Wed, 14 May 2025 10:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33460e5asm1884882a91.29.2025.05.14.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:04 -0700 (PDT)
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
Subject: [PATCH v4 23/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Wed, 14 May 2025 10:53:37 -0700
Message-ID: <20250514175527.42488-24-robdclark@gmail.com>
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

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da8f92911b7b..67f845213810 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7a9bd20363dd..f282d691087f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -676,6 +676,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0


