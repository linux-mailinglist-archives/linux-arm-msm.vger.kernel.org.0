Return-Path: <linux-arm-msm+bounces-85956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457ACD17D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A87C3043D6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DDC34D3A6;
	Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YH0q3lx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4D34CFBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170003; cv=none; b=T1Yk0nwSqSuTpfjqAzPtNilHPmS4PYb+dp7lIKhnygpsZwX1RzG09HvdC0fnmtx+byWiw/AG6WAz/LRIXdzcPiG1xQpt3Y0xznFMJDisQrc4NcmhD49GBTrX0HRBAqmsmxePZP4HP7IMGixiM3yyXtKUXDKpxs+H0J5UgDMIJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170003; c=relaxed/simple;
	bh=dxllJ9bVDLfdIvPHRvJoWyIhgk5Dx1WjzvIWgZFzTgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjW6BO3QGC6HzcBNXLBMOnBOb3sKpjdqsLt5GpYzo4Ul6f+RnRHiKoVludhdUntHGtR1bC+T4hllYg9xq19TxyJhGsMh71uRg99/jwU0vGB5+nF/HMjgGXzD1Jcl3C9O3Ml4TXI60ymVYBN8C371mykcAXuAEUbnkZ76wimvsow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YH0q3lx9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=X1zbGY0zfBb6WWPms7jFzEXFLOTz3spooobx9hnueIk=; b=YH0q3lx9ykrb+c22vFi9BD7md0
	/ALaTYExNvKG2VfKhEI30NLdJuqM8RqM6qXpW4RrennxXtPnXsThNu5DPCvdlLKnn1pG1W6CRUWuq
	whmG9HGrJvu5/C1L70m47OiNnSq0dxz44VRLbTsm0/qGhrISqZ/rmzuvdMxxniEcwEmoKE2d2JHd9
	RVauxsevAZacLaVqg4gc4aEYBdyL8h2pNvBvsWdVtMHNPE8x+uN/JdcGb2VHta6eo6SnDOD/tScXA
	HglhsZbwTuaceOkylyVK9vamsl/QB3i1kOSUK/mwR6B61Q9I27hJZD26lZN/NCqJXgtiQUW5cXC8k
	a/oX/91Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUv-0000000AqkV-2R8i;
	Fri, 19 Dec 2025 18:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:22 -0800
Message-ID: <20251219184638.1813181-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct and add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h:91 Incorrect use of
 kernel-doc format:          * Enable the CDM module
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h:97 Incorrect use of
 kernel-doc format:          * Enable/disable the connection with pingpong

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
@@ -89,13 +89,13 @@ enum dpu_hw_cdwn_op_mode_method_h_v {
  */
 struct dpu_hw_cdm_ops {
 	/**
-	 * Enable the CDM module
+	 * @enable: Enable the CDM module
 	 * @cdm         Pointer to chroma down context
 	 */
 	int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
 
 	/**
-	 * Enable/disable the connection with pingpong
+	 * @bind_pingpong_blk: Enable/disable the connection with pingpong
 	 * @cdm         Pointer to chroma down context
 	 * @pp          pingpong block id.
 	 */

