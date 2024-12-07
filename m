Return-Path: <linux-arm-msm+bounces-40865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344159E80D6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A232832BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13E015278E;
	Sat,  7 Dec 2024 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZWkrPRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8E14F9FA;
	Sat,  7 Dec 2024 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588266; cv=none; b=dLQnzyLPjt++dA8wa+hz5254UarCgYwkovSFP4QTq0QGoXSxc+95aF1YtiAT7wr7fANmmvFe9Am38l1BlbesD5p203ngDyVlPv4KX2YvlF6jq//3xsWAk8kTJDWJg2JJAJ2BEIz4/RBJQTYPB5OZ6UbthBqBwDnBlCu6rEBseYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588266; c=relaxed/simple;
	bh=x959h/MIbQeMPwRohoSRvpp75clWi3271X1vvXgiU+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOsj4kgfB+/YTVz1IEfAkkmOJ9l7Ok1PV/FHKAtSpesXRVsR6zWiKm9Yfa/ZVh3V5IDcn0zq83Ro8yVSiH5ISXABwIajSHfqp1iShwlZ2mzVZGLEQvVuC1Bqus06mJQORpCZndXhHsbKSwSHaYYezKLq6iuH0qzw/yEiROjdW+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZWkrPRW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215b0582aaeso23670055ad.3;
        Sat, 07 Dec 2024 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588264; x=1734193064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDaYepScugWukq2XI1zi50Sp415jY0K0KC3SJsPCP2g=;
        b=fZWkrPRWCJtGlDYQ+Bhjx6wROp0gawyP/oR90ejtm2WRLtigMFbepmnbcst9iF+M1V
         D/S4XKQvboywfROvBIRh5HcSQzd/M02NpvLd2Jl9qV2i5c1Vj1JGuTHzHbMeb9CRBPIk
         Pk4kxmd0ERm4iDuP9pW+X0S4/Iwt08nh+c9OD3bhenkOM6n0dgs0mL1fGs29csDLG+LS
         6WReuZ4i2SY+W8CCbmLAQdghDYlABNIZejujRkZmErDFGU5cpAT0BWJSCGWPrjSacPBr
         CTO84fsyVWJTZjE5xhHsGmgcU9xPuGYco0lWLoilVpKCw9WNHlQUeDpjd+3QmzagUxBE
         m/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588264; x=1734193064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDaYepScugWukq2XI1zi50Sp415jY0K0KC3SJsPCP2g=;
        b=c7OPyDj3ztK6yOLXf/NP6Hq16kdtzmumlk1UQ7xQaO7qBsn4+ZQ2cSr8jrubV8uvSN
         ruhK19PsGk9YZVJpp0U4r4Z0cebp9Vzn34s9O1dFQ2hLpMMwnRfAjLdVv4Yq1qyvdWos
         KAcKkB4PYyIwlLLW9LQz6FmYdoQa8ybQaeroijn/ZUq3wTGK5uFtU99htTu1LN7LtPQZ
         RKhGNEi6unhWq/rCZCjz0RGCGlXyJNXRTnTr0STFYAwW7VRH2LfczkbufeDD75d70deb
         lhDHmciWgnBsgG5TuGgon42n72604k1zPXe2OeBKWf9cR5H0RUc1MEdRvJ39pryYSsZY
         EEsg==
X-Forwarded-Encrypted: i=1; AJvYcCVuoBShjYbMSTNLcHxCUHTSMQnRIHxvA0JfchtUSCyGXPgjh8JkdzyRka8OR+z3x4INPhmlHWcZXdiegz4W@vger.kernel.org, AJvYcCWM2FV768ij/Pqvf/TxdXPtRtOaRh4q6RBN7yjbtsPOO9Pfh9uh02ocqpBq84BYSHsxY2R6NsBFcpDrNasw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfju9AIkrxDn41N1T26fWGT3kdtl9RxyysPuDtwG1wA+lErzDH
	skaW/BXSGZTT4J+Yz0hG0mcdHPCl7BkDF3cYf0tr1KINLzvxAvcs
X-Gm-Gg: ASbGncuyWDPfYaBsxIRnmkkZs49ncrT0DFhQ4fRaesR20dUCYni1BR+lryqcxV6rrmV
	wb91inDpIh0NKHLm8cSfJ+qbqQxcNZ8Y9GlZ7V3Ya+gWlHn8CfJ8H/xliAVCU+DycjGYm3hAsx7
	BBpmbTD4PzBkLv9kvCMYcpBM5PvKpGGyiJyDURyMWKIbtMCP23+3cx/ul9ykKddykH9vl5bImKk
	tNj4WQ1EgLzVxkG/JFacjJYoLqXL1AIi5vo3s2aj2fAH8M0lJdE+lkWHM7E5JdSrhPYSJSK2OQf
	SQDAeAXp
X-Google-Smtp-Source: AGHT+IGlm8gy6Zo+nDRsiVqmOjnQSJxEkmCuTB/KlVGLgBqx8VVYfJC/KbklIO4245KngxH8QdN8+g==
X-Received: by 2002:a17:902:f641:b0:215:9091:4f4c with SMTP id d9443c01a7336-21614dabf5bmr99810815ad.41.1733588262908;
        Sat, 07 Dec 2024 08:17:42 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa1a0sm45432785ad.165.2024.12.07.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:41 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 08/24] drm/msm: Collapse vma allocation and initialization
Date: Sat,  7 Dec 2024 08:15:08 -0800
Message-ID: <20241207161651.410556-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f42bfa70502a..6f11ce1d0191 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.47.1


