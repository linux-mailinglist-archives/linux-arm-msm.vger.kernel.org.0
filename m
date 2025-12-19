Return-Path: <linux-arm-msm+bounces-85969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB37CD17E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 848263019BE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAFA34D93A;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ffVPRY2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AD34D4F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170007; cv=none; b=S/MZgzJcN27Vo2d73rhTnjBGPo5MFj9digwwUyRlfLruoTSEvRtEMtAcCLSKLNcyG5xtNsTNHRRomcFdskP+rI3WJKOqa1gkv0+tZzApUVNSigZJ7dIMQ4vHk2bP/BEHFvAi+UINwDZnguqWQ7P2bnC1+6Vv4Lq+Z97Ib6C9S+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170007; c=relaxed/simple;
	bh=44EtEhAWigEhrR3GC9KZLJY2zNFaOpnkxUyUTFupBFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEpiAOy9gV2z40FVD/qQJuqsYRSoWxSkglAtWHorhuq2X8YL01pPbgEXrl4u5b7hy/J+sCo0DB0WJgTp2L1yIHpKAwktygWha03h2KiBY0+KhnF38+iLlYwhrzK3sWSKgukeureSKimBQW7stQGE5B1HWEG1r4FBHlRVRWYA82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ffVPRY2c; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NonYhmvZMwONi2btokC5vswbHTeTJUUE8JUNsaNzQQw=; b=ffVPRY2cY7L0qE1gtUViyxo0u+
	rk6KxwV74+/wdJbQrV92EBJDZELIrnpysXQz/Ma7X60XDYFUW29CDRLSdz8DgWedaZH1h/KnB2gc/
	FsYXNujbfbMgeIrvAEuLmK7x+7nRoiudlYkMDdxXldNdORF1y86p9yTaRAANUchpv/WFb0vG3Cdn7
	HTFSCD6rpbqnw4nJWR2heg/KA3k4O9fv/rK9Ytxrl6FieDRcia01zaCYJDYLjz4vwrEklddF0kX8R
	QahjKMbTqRUeh1opBYaXTjlfdMJiBfYeMOeCnHklO99KVBzZVOhjb7dLo7l0SxliYPqMSruITR085
	p1bA4yvA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUz-0000000AqkV-0z4n;
	Fri, 19 Dec 2025 18:46:45 +0000
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
Subject: [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:34 -0800
Message-ID: <20251219184638.1813181-16-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:24 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:57 struct member
 'setup_roi' not described in 'dpu_hw_wb_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:75 struct member
 'caps' not described in 'dpu_hw_wb'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -22,11 +22,11 @@ struct dpu_hw_wb_cfg {
 };
 
 /**
- *
  * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_outaddress: setup output address from the writeback job
  *  @setup_outformat: setup output format of writeback block from writeback job
+ *  @setup_roi:       setup ROI (Region of Interest) parameters
  *  @setup_qos_lut:   setup qos LUT for writeback block based on input
  *  @setup_cdp:       setup chroma down prefetch block for writeback block
  *  @setup_clk_force_ctrl: setup clock force control
@@ -61,7 +61,7 @@ struct dpu_hw_wb_ops {
  * struct dpu_hw_wb : WB driver object
  * @hw: block hardware details
  * @idx: hardware index number within type
- * @wb_hw_caps: hardware capabilities
+ * @caps: hardware capabilities
  * @ops: function pointers
  */
 struct dpu_hw_wb {

