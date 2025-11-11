Return-Path: <linux-arm-msm+bounces-81177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B6C4B99A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DBCF3B7B78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6F8288537;
	Tue, 11 Nov 2025 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EDWHUYPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE39237A4F;
	Tue, 11 Nov 2025 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762841040; cv=none; b=t43GBUcu9MZjzrxjfnlr5kOv+adtszH5MteQYbEnNJaQaLbQgK909mvylLafRdCDvA4l88M0Nxx/l6MgfK07pxa5Ugd61UFr15ML4dNfkjn4jyEgrqXhgIlJoN7zI6Cl/AjK1JCRZ9P+Jw8CLY0yJbW4DyJApkeMWdSJfgqe2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762841040; c=relaxed/simple;
	bh=Q6ZqJwzSwcBpazNeZ+tEPPkjzJyuRRBgLuF6059Ca3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sW3+I5TYzHQT8glRkTq5c7inWoN2fy//h/fyoDNaQ6euJKXI0sZOF6h2d0UUW2sb1b2U3qv/jJXL/mFhZOi7TN4SE6+0ImAAXO4RegoOFSykCv2I2whZFLpp07nZQCW9nUGFT4F0t0cIcxVa0nKa6F8Y0yFsL3mBEMvQDm6BKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EDWHUYPz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yXHOEfbHGbvqbP1Nad+xAerCqiTYHUSbE0LcjnK5MOc=; b=EDWHUYPzks2P1f8YajAH8QGHua
	zr78W5BMj2gEuDYW2kwMOb0gXx+iw+tl569j1McNUYCz1l4CXp6yEvXVORBqLfO7PXYliGVhge36S
	yhg2XUMiUNTKXlbYmfY9ocwzGiTLMqQzd+VrD64XWVNkDlALWgZdbFAIAF2xdSbGHIP7MwZzwLsL8
	YvgjNOs2CJmFCGSilvI1FvBVFzFl0FuWlZmto/YtqcMn1tIMnjJkOc2fqSAt5EE6ewKQ2gbubIPpq
	JL11cxH0bsJ/vAuPPCKYCDs9YRiyvbdYkxT8FXjM4ihmGJ9sSIkHDud35x9vBdxz1BhstKhrcWQKm
	3YEhsIlQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhTw-00000006aj8-09zz;
	Tue, 11 Nov 2025 06:03:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/msm/disp: fix kernel-doc warnings
Date: Mon, 10 Nov 2025 22:03:53 -0800
Message-ID: <20251111060353.1972869-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all kernel-doc warnings in msm_disp_snapshot.h:

msm_disp_snapshot.h:53: warning: Function parameter or struct member
 'blocks' not described in 'msm_disp_state'
msm_disp_snapshot.h:69: warning: Function parameter or struct member
 'node' not described in 'msm_disp_state_block'
msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
 in 'msm_disp_state_block'
msm_disp_snapshot.h:95: warning: No description found for return value
 of 'msm_disp_snapshot_state_sync'
msm_disp_snapshot.h:100: warning: bad line: 
msm_disp_snapshot.h:117: warning: bad line: 
msm_disp_snapshot.h:125: warning: bad line: 
msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
 description in 'msm_disp_snapshot_add_block'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- linux-next-20251107.orig/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ linux-next-20251107/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -38,6 +38,7 @@
  * struct msm_disp_state - structure to store current dpu state
  * @dev: device pointer
  * @drm_dev: drm device pointer
+ * @blocks: list head for hardware state blocks
  * @atomic_state: atomic state duplicated at the time of the error
  * @time: timestamp at which the coredump was captured
  */
@@ -55,7 +56,7 @@ struct msm_disp_state {
 /**
  * struct msm_disp_state_block - structure to store each hardware block state
  * @name: name of the block
- * @drm_dev: handle to the linked list head
+ * @node: handle to the linked list head
  * @size: size of the register space of this hardware block
  * @state: array holding the register dump of this hardware block
  * @base_addr: starting address of this hardware block's register space
@@ -88,8 +89,9 @@ void msm_disp_snapshot_destroy(struct dr
  * msm_disp_snapshot_state_sync - synchronously snapshot display state
  * @kms:  the kms object
  *
- * Returns state or error
+ * Returns: state or error
  *
+ * Context:
  * Must be called with &kms->dump_mutex held
  */
 struct msm_disp_state *msm_disp_snapshot_state_sync(struct msm_kms *kms);
@@ -97,7 +99,7 @@ struct msm_disp_state *msm_disp_snapshot
 /**
  * msm_disp_snapshot_state - trigger to dump the display snapshot
  * @drm_dev:	handle to drm device
-
+ *
  * Returns:	none
  */
 void msm_disp_snapshot_state(struct drm_device *drm_dev);
@@ -114,7 +116,7 @@ void msm_disp_state_print(struct msm_dis
 /**
  * msm_disp_snapshot_capture_state - utility to capture atomic state and hw registers
  * @disp_state:	    handle to msm_disp_state struct
-
+ *
  * Returns:	none
  */
 void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state);
@@ -122,7 +124,7 @@ void msm_disp_snapshot_capture_state(str
 /**
  * msm_disp_state_free - free the memory after the coredump has been read
  * @data:	    handle to struct msm_disp_state
-
+ *
  * Returns: none
  */
 void msm_disp_state_free(void *data);
@@ -130,7 +132,6 @@ void msm_disp_state_free(void *data);
 /**
  * msm_disp_snapshot_add_block - add a hardware block with its register dump
  * @disp_state:	    handle to struct msm_disp_state
- * @name:           name of the hardware block
  * @len:            size of the register space of the hardware block
  * @base_addr:      starting address of the register space of the hardware block
  * @fmt:            format in which the block names need to be printed

