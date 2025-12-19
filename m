Return-Path: <linux-arm-msm+bounces-85964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C2CD17C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F1013037881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD2134D903;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EwufHDfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146E34D3BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170005; cv=none; b=gBhMiX1EgsuGV6hocA++zIh8BuhwRlntpRw7bBGZMSxp/n1GhRcudSe6bF5BjNn7C5n9nNT7H+cuSX1bWm9Zc/3UeCwN2E3hiQS356/rHKOn6lAXleipqdu1GkXvnEdWweY0G0BscaKDjZa9ab83f4N7d9Epmi51RyoWCBz9l+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170005; c=relaxed/simple;
	bh=LTAFr6rtt4r6wJVcXU8bC9oof+MViglgGk0vX4At7jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBfXshkWab0vcf8n8+oJzXam7aQLTh4oFugzo+reTw9SU1T19zyEGrvXfGn1NHWSyM/q6+kvVQzNlcmD83jHh5J3TpnGFMt5WOaj5ZDypLCrsDG1JExqdUaIHm/c+xE1LY+4WOfK5pOWR3AqNiLx5SOzhemglsoIKg27UnuPL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EwufHDfO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PK99AItbHdRoxa+xwxOdW/W/b+6sW9m4zAOyS8iStas=; b=EwufHDfO8tBimv/IaCDcTHHWgp
	e6u/zpRLj4AAz+oO3VQ8tfIT+7sZrXRqWTryx8kugR4xz6SBTLlt5HOpocrdpxlV1oiOCOqXf4vS3
	/5yXRXqWjpQCaZqx9xE8v6Gnk7ddEOEgBjT2j2DDP67Nn72ZkX+LhoiqWRBJwvNsmQFnYNWsjUgIi
	5DRj6rXNA7JbVmP0srEjtDaqjYLye2ZOVGEpt6iKUQ6bpu79KUSFcxqaApk9Bf60/dSeGCEAyTmGV
	nTQo8RRkrWW8/kFkN/7MMolLX5DCXGr08QtDUiF5ckYk+Gs6oQ0l+dymF8kFpQBag3BJ7xTgDDlfL
	bNilVm7A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUx-0000000AqkV-2yx4;
	Fri, 19 Dec 2025 18:46:43 +0000
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
Subject: [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:29 -0800
Message-ID: <20251219184638.1813181-11-rdunlap@infradead.org>
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

Delete one "empty" kernel-doc line to eliminate a warning:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h:14 Cannot find
 identifier on line: *

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -12,7 +12,6 @@
 struct dpu_hw_merge_3d;
 
 /**
- *
  * struct dpu_hw_merge_3d_ops : Interface to the merge_3d Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_3d_mode : enable 3D merge

