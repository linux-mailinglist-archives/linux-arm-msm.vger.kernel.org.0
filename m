Return-Path: <linux-arm-msm+bounces-85961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DACD17D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2479E3048478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1948434CFCF;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sqiqU2Qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD834D3AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170005; cv=none; b=nrjR/Ljcdpq1tQxMwxVAotfOxvgNgqZfkpNNxwNoNfHBUB6e/cDXqey2Fd7ZM0QDVhQJrf2ERs6+mDKyljoByM6pPCt65wKjPYk8kWJ5atmasGmbMlC2nz0yMuK7Oyk239t08Z5KcnMsmsSG/00PH8GZSpVbd0ENHbM7NCCdVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170005; c=relaxed/simple;
	bh=ExirSmJ8BcSI6br6xnrs0AxfIFfFojrAVU/KjuLZG9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWlkvEJlzUl60D39b7lCAWCNRXg/+vzKZlwP2+pTwAN3tnfb2GfVGJ5ueaz07Z7kpimsXZs2R7R7CRhNfXypfuyh6EFNzMwGiTNGkDzzYnB27jhYcFH4dLGeVMWGt6R0ny5FgRXUH22ZS/dMZ7NESEOENIN+D9JBIQFJ214+63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sqiqU2Qp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YXj+2VB+qykXGnoBqXu0bdo0Nqyv/wpG5dksHagKeVM=; b=sqiqU2QpO2Jatw/6I2CyaS8LHA
	tvbugIYGLCpE5WsbQls6GLDMpznBW6TtzjYM0fFhDJ1SFO5OGken5ha2yQPfDkecybuVYD+QYw5I+
	2Uw/HNcGG3nWJMAp0651s3Ql8FLpIn/fEWt4ZkpWAxQVl1IhZfUXb8tESIapNW5IfuoqqmrCr5dks
	dwcYfjJ/aab8nieDFQ/5BOTM8mkFPL2zSQCneilOnmLx++oDimx/gt7MGKS9Z6Zr5ayhElznlqkRa
	4DyhmXkt42IAxYAlbFYSJ5B4gtZyIusGgff70xzIFWWKul9SFOrnn6B9hgMCyIVnQKt43OXo+c0cI
	vCKw35yw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUw-0000000AqkV-3HO8;
	Fri, 19 Dec 2025 18:46:42 +0000
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
Subject: [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:26 -0800
Message-ID: <20251219184638.1813181-8-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:33 expecting prototype
 for struct dpu_hw_pcc. Prototype was for struct dpu_hw_pcc_cfg instead
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:42 Incorrect use of
 kernel-doc format: * setup_pcc - setup dspp pcc
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:48 struct member
 'setup_pcc' not described in 'dpu_hw_dspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:76 expecting prototype
 for dpu_hw_dspp(). Prototype was for to_dpu_hw_dspp() instead

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -22,7 +22,7 @@ struct dpu_hw_pcc_coeff {
 };
 
 /**
- * struct dpu_hw_pcc - pcc feature structure
+ * struct dpu_hw_pcc_cfg - pcc feature structure
  * @r: red coefficients.
  * @g: green coefficients.
  * @b: blue coefficients.
@@ -40,7 +40,7 @@ struct dpu_hw_pcc_cfg {
  */
 struct dpu_hw_dspp_ops {
 	/**
-	 * setup_pcc - setup dspp pcc
+	 * @setup_pcc: setup_pcc - setup dspp pcc
 	 * @ctx: Pointer to dspp context
 	 * @cfg: Pointer to configuration
 	 */
@@ -69,7 +69,7 @@ struct dpu_hw_dspp {
 };
 
 /**
- * dpu_hw_dspp - convert base object dpu_hw_base to container
+ * to_dpu_hw_dspp - convert base object dpu_hw_base to container
  * @hw: Pointer to base hardware block
  * return: Pointer to hardware block container
  */

