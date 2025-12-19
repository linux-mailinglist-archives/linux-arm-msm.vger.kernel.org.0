Return-Path: <linux-arm-msm+bounces-85968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360BCD17D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7706B3046D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFC234D930;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MQXyKwIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C034D4EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170007; cv=none; b=H0az5xSuwKjmdDjPcMgZuF9Zcyx2rD3+08GytqgmgWIEyk0y414d/qrgYM65SbPnVbgA+KuTZOTeW5rqJMdTi4be2Uv1uETyKX6Imi0JxFOpXFZFnkYjOgis6qPLUls9VKqxVpoiqldxwi0HOYDWs1yZJTsmPAuZM2mXvWmzWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170007; c=relaxed/simple;
	bh=+H3WrloQlDguoIYJlwD5OqcFEK+Vo5qyimaNVzrGt+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5U+/uOlepqjtdkuQdTVYTmmM7CQHZwFDIvCf55T7261MUutbz3z8ecM82C0Kl0k7ZodpqfFnezxoLZfIBWeRFbSaG9jREj58Y0cLCT5egY3jJWPr1OweSjh/W5QRAYrzz9W5mIBB6cfioVRllLC8+ABsqykLA3CazySXVG+tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MQXyKwIE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=29bFBqNh7gMbtS+CkFMD3+tvUazk9p3Y16DWfFrntG0=; b=MQXyKwIEdZLL0WoGvpSFHvj2Co
	tiU8UxCqxYUJmHMKIJxUIJpksvoDsc3qEx6sHTMn9AkAlAv5tNRmNYoJ4KdAMOKPPHpt+OjuTX1qY
	lE6jfZWaSRGtalpGuh1WtJGuLPba5EInBJxdhbrx8ZJoz/gBYi2fseMpw53YqctSSEKc2VqRiURNR
	NN2l1ZO3K3rH3PRZu8heKHmfRk/YwMB/gBoS8W8EGs/kvPd74g5O0dnpw5dmxdQosp+Ye8nx74nlX
	IdP67d732KpukFC+GGz3vlMgt75MGeZMDoJz/1bvJED7UlINUGb8kHLXLPu44gDU7ayEID0tFLZUo
	EUL/n2mA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUy-0000000AqkV-3tEf;
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
Subject: [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:33 -0800
Message-ID: <20251219184638.1813181-15-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:19 Incorrect use of
 kernel-doc format: * set_limit_conf - set transaction limit config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:29 Incorrect use of
 kernel-doc format: * get_limit_conf - get transaction limit config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:39 Incorrect use of
 kernel-doc format: * set_halt_ctrl - set halt control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:48 Incorrect use of
 kernel-doc format: * get_halt_ctrl - get halt control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:57 Incorrect use of
 kernel-doc format: * set_qos_remap - set QoS priority remap
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:67 Incorrect use of
 kernel-doc format: * set_mem_type - set memory type
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:76 Incorrect use of
 kernel-doc format: * clear_errors - clear any vbif errors
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:88 Incorrect use of
 kernel-doc format: * set_write_gather_en - set write_gather enable
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'limit' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_limit_conf' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'get_limit_conf' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_halt_ctrl' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'get_halt_ctrl' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_qos_remap' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_mem_type' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 's' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_write_gather_en' not described in 'dpu_hw_vbif_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -17,7 +17,7 @@ struct dpu_hw_vbif;
  */
 struct dpu_hw_vbif_ops {
 	/**
-	 * set_limit_conf - set transaction limit config
+	 * @set_limit_conf: set transaction limit config
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @rd: true for read limit; false for write limit
@@ -27,7 +27,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool rd, u32 limit);
 
 	/**
-	 * get_limit_conf - get transaction limit config
+	 * @get_limit_conf: get transaction limit config
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @rd: true for read limit; false for write limit
@@ -37,7 +37,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool rd);
 
 	/**
-	 * set_halt_ctrl - set halt control
+	 * @set_halt_ctrl: set halt control
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @enable: halt control enable
@@ -46,7 +46,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool enable);
 
 	/**
-	 * get_halt_ctrl - get halt control
+	 * @get_halt_ctrl: get halt control
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @return: halt control enable
@@ -55,7 +55,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id);
 
 	/**
-	 * set_qos_remap - set QoS priority remap
+	 * @set_qos_remap: set QoS priority remap
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @level: priority level
@@ -65,7 +65,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, u32 level, u32 remap_level);
 
 	/**
-	 * set_mem_type - set memory type
+	 * @set_mem_type: set memory type
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @value: memory type value
@@ -74,7 +74,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, u32 value);
 
 	/**
-	 * clear_errors - clear any vbif errors
+	 * @clear_errors: clear any vbif errors
 	 *	This function clears any detected pending/source errors
 	 *	on the VBIF interface, and optionally returns the detected
 	 *	error mask(s).
@@ -86,7 +86,7 @@ struct dpu_hw_vbif_ops {
 		u32 *pnd_errors, u32 *src_errors);
 
 	/**
-	 * set_write_gather_en - set write_gather enable
+	 * @set_write_gather_en: set write_gather enable
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 */

