Return-Path: <linux-arm-msm+bounces-85965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F8CD17AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 529853002897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487A334D913;
	Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cspOZFUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B9334D4CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170006; cv=none; b=A78DL69HhXY0XkmqzfkbeNZzbAR/zThnRlZdpCDZiUBstU21A0WJRCI+RpGM5zcY4OXsS3OdFL1FjyZ76Xa+TQFVXp8mvmPqSA6AoJ1VmRE1iLaSkFEQOdD6A6Iyj4igAjvKshgzcSzNqCW8KG9vNvVRF4JmEQ9/WrNQDGR95ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170006; c=relaxed/simple;
	bh=sj68Hoa1RgeexBO9e5HUtC/R99SmQrVB1tnSjx+yHTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcyEiqXKwqHYkttk0naSzjs3Wq04w+pnon1dKNFpQpAADYIDt0eD6Ja76Xurshnxm5v6aRX359iPyEkYcYCprTQnmC0VatYOSCGVyY7pRNErzeK5GW5yEmdBnOsDEZpaFv/oet2bACUh1B81SYjdJbdpsQX3/Vjd1fgfIWcVq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cspOZFUI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ffwG/PDzB8qi5AZFiseCdmI9ljWmXWH6/j0cmPS4p1s=; b=cspOZFUITC0R3ko8yx/y3e27UG
	ujiqFFGwy9P/4DBIh/Cf6RLmXc/IoDxJmrQPPUAP0tbemKGA6rkEmKJc9K7yilK1E5ipEsdO/YnbW
	y1BI/ROJ0g00bw7uDNM/Eo26oA7fuqgY0tTW6tvVoAkf7ucv0hTfgmQUDcOGvOEoq667Y+36UWfbp
	iYigDcTB5jZMUuUc48EKZIjKJHhwcDPkzTrsVltalnr/2MrsQWQxfx5/1PucoyKWtguvOLsKWX5R4
	WzenVWhhBWyxUpV4otCd/HhsFTJSAlSrSZ/s792DkD6ajaMYNuFh25rfecVab7eutxv8cDoFnsWN+
	oodozMDg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUy-0000000AqkV-01FB;
	Fri, 19 Dec 2025 18:46:44 +0000
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
Subject: [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:30 -0800
Message-ID: <20251219184638.1813181-12-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:36 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:46 Incorrect use
 of kernel-doc format: * enables vysnc generation and sets up init value of
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:53 Incorrect use
 of kernel-doc format: * disables tear check block
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:58 Incorrect use
 of kernel-doc format: * read, modify, write to either set or clear
 listening to external TE
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:65 Incorrect use
 of kernel-doc format: * Obtain current vertical line counter
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:70 Incorrect use
 of kernel-doc format: * Disable autorefresh if enabled
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:75 Incorrect use
 of kernel-doc format: * Setup dither matix for pingpong block
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:80 Incorrect use
 of kernel-doc format: * Enable DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:85 Incorrect use
 of kernel-doc format: * Disable DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:90 Incorrect use
 of kernel-doc format: * Setup DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'connect_external_te' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'disable_autorefresh' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'enable_dsc' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'disable_dsc' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'setup_dsc' not described in 'dpu_hw_pingpong_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h |   20 +++++++-------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -34,7 +34,6 @@ struct dpu_hw_dither_cfg {
 };
 
 /**
- *
  * struct dpu_hw_pingpong_ops : Interface to the pingpong Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @enable_tearcheck: program and enable tear check block
@@ -44,51 +43,52 @@ struct dpu_hw_dither_cfg {
  */
 struct dpu_hw_pingpong_ops {
 	/**
-	 * enables vysnc generation and sets up init value of
+	 * @enable_tearcheck: enables vysnc generation and sets up init value of
 	 * read pointer and programs the tear check cofiguration
 	 */
 	int (*enable_tearcheck)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_tear_check *cfg);
 
 	/**
-	 * disables tear check block
+	 * @disable_tearcheck: disables tear check block
 	 */
 	int (*disable_tearcheck)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * read, modify, write to either set or clear listening to external TE
+	 * @connect_external_te: read, modify, write to either set or clear
+	 * listening to external TE
 	 * @Return: 1 if TE was originally connected, 0 if not, or -ERROR
 	 */
 	int (*connect_external_te)(struct dpu_hw_pingpong *pp,
 			bool enable_external_te);
 
 	/**
-	 * Obtain current vertical line counter
+	 * @get_line_count: Obtain current vertical line counter
 	 */
 	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Disable autorefresh if enabled
+	 * @disable_autorefresh: Disable autorefresh if enabled
 	 */
 	void (*disable_autorefresh)(struct dpu_hw_pingpong *pp, uint32_t encoder_id, u16 vdisplay);
 
 	/**
-	 * Setup dither matix for pingpong block
+	 * @setup_dither: Setup dither matix for pingpong block
 	 */
 	void (*setup_dither)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_dither_cfg *cfg);
 	/**
-	 * Enable DSC
+	 * @enable_dsc: Enable DSC
 	 */
 	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Disable DSC
+	 * @disable_dsc: Disable DSC
 	 */
 	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Setup DSC
+	 * @setup_dsc: Setup DSC
 	 */
 	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
 };

