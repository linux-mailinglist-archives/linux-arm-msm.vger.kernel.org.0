Return-Path: <linux-arm-msm+bounces-85957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E9CD17EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DD530321ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C534CFDB;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3K6dl4Lt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF534CFBA
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170004; cv=none; b=QYX4YYEUJUpz9QK3eh38AWdln5OPkPsoCjsQ1Eo1Jlysh43z7PK8C6EtTzWzBHtMzpQhYy7ucj1bGcPoFsQRTsApZdeyghWwqMcrJMw3j0OP39/dN6eLXLjzHJP36Dm+Z2dhGTmuuAh4CCkjghIVBQ4YHBIzFCQpXDczqHBQuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170004; c=relaxed/simple;
	bh=/L0Ma5q/BSOHMK36mS1Zsjbl2V6W98Sbn17poDnuAGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ek7PjCatdandieMpYYj7+rkUA8hWC0A6N8mfFzuj2vFE4ASfFG1Xa7IFGs4hOT9yyv8Ytx7wC5my1VWpmYCd8NNeVsH802cI5VVylszeL5PMhOdiYk5TQzHBmHVZhLE9dH9UTwNobQFlsFf2s+pFSLArdzzTfDaubxFCSWCfHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3K6dl4Lt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9NvSm9B5endm091xxJ6Qok7LbA5K+Elj4jZPILxrHhM=; b=3K6dl4LtJE4tHAiBee8n1PCvwr
	cIZBwC9IvWcVBlgh4BVUd3xT1YrOoC6KCUcYbR6GeJ9w/m85PwnCB8yI+mzCEKR8EG6Fo069DO/Ul
	1y6uuWBMJ4uAIMFSgzTl00lD+lel4go9U+mnbEgNTMShWHFqo4bJFUckmi+QXid/27w3ehbfARnPY
	V/SXiFNT6DfsWlQOC8FZ4yrGY9BrOd5npM3SHVun4csdWD3514Lxpy01FoRyIP9qWS4hfBw1knW1/
	SWJfw5Y6SAQPb3MBG7bz44k+2t+0paEaHwzTScwjjxK5lOKlxnN0f00HYMIkixf3/K2wf8GKFIkXL
	UcOxOZfQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUv-0000000AqkV-185m;
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
Subject: [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:21 -0800
Message-ID: <20251219184638.1813181-3-rdunlap@infradead.org>
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

Warning: ../drivers/gpu/drm/msm/dp/dp_debug.h:31 expecting prototype for
 msm_dp_debug_get(). Prototype was for msm_dp_debug_init() instead
Warning: ../drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter
 'connector' not described in 'msm_dp_bridge_detect'
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:90 expecting prototype for
 mdss_dp_test_bit_depth_to_bpp(). Prototype was for
 msm_dp_link_bit_depth_to_bpp() instead
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
 'aux' not described in 'msm_dp_link_get'
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
 'dev' not described in 'msm_dp_link_get'
Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:70 function parameter
 'bw_code' not described in 'is_link_rate_valid'
Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:84 expecting prototype for
 msm_dp_link_is_lane_count_valid(). Prototype was for
 is_lane_count_valid() instead

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
 drivers/gpu/drm/msm/dp/dp_debug.h |    2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c   |    1 +
 drivers/gpu/drm/msm/dp/dp_link.h  |    9 +++++----
 drivers/gpu/drm/msm/dp/dp_panel.h |    8 ++++----
 4 files changed, 11 insertions(+), 9 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_debug.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -12,7 +12,7 @@
 #if defined(CONFIG_DEBUG_FS)
 
 /**
- * msm_dp_debug_get() - configure and get the DisplayPlot debug module data
+ * msm_dp_debug_init() - configure and get the DisplayPlot debug module data
  *
  * @dev: device instance of the caller
  * @panel: instance of panel module
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_drm.c
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -18,6 +18,7 @@
 /**
  * msm_dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
  * Returns: Bridge's 'is connected' status
  */
 static enum drm_connector_status
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_link.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_link.h
@@ -80,11 +80,11 @@ struct msm_dp_link {
 };
 
 /**
- * mdss_dp_test_bit_depth_to_bpp() - convert test bit depth to bpp
+ * msm_dp_link_bit_depth_to_bpp() - convert test bit depth to bpp
  * @tbd: test bit depth
  *
- * Returns the bits per pixel (bpp) to be used corresponding to the
- * git bit depth value. This function assumes that bit depth has
+ * Returns: the bits per pixel (bpp) to be used corresponding to the
+ * bit depth value. This function assumes that bit depth has
  * already been validated.
  */
 static inline u32 msm_dp_link_bit_depth_to_bpp(u32 tbd)
@@ -120,7 +120,8 @@ bool msm_dp_link_send_edid_checksum(stru
 
 /**
  * msm_dp_link_get() - get the functionalities of dp test module
- *
+ * @dev: kernel device structure
+ * @aux: DisplayPort AUX channel
  *
  * return: a pointer to msm_dp_link struct
  */
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_panel.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -63,9 +63,9 @@ void msm_dp_panel_disable_vsc_sdp(struct
 
 /**
  * is_link_rate_valid() - validates the link rate
- * @lane_rate: link rate requested by the sink
+ * @bw_code: link rate requested by the sink
  *
- * Returns true if the requested link rate is supported.
+ * Returns: true if the requested link rate is supported.
  */
 static inline bool is_link_rate_valid(u32 bw_code)
 {
@@ -76,10 +76,10 @@ static inline bool is_link_rate_valid(u3
 }
 
 /**
- * msm_dp_link_is_lane_count_valid() - validates the lane count
+ * is_lane_count_valid() - validates the lane count
  * @lane_count: lane count requested by the sink
  *
- * Returns true if the requested lane count is supported.
+ * Returns: true if the requested lane count is supported.
  */
 static inline bool is_lane_count_valid(u32 lane_count)
 {

