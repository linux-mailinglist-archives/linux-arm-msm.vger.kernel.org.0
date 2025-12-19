Return-Path: <linux-arm-msm+bounces-85960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A2CD1800
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA08306385B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A091834D4DC;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VDDu7pYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B234D382
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170004; cv=none; b=TF7Lt75ZdesxcouzaxC8+13fCe0JZVbac12hQ5TrtJCUZNUYBxHoEDBOycLDD6MIlYXj4Y22oJ7BJ9ZY3XzTsoBKzLf9xLF7K9cB1SKdpeQPoVcjocr/5mzqVI31lZXbPVZczr6uBnsvHWMybGGKfFUnoITl5tN9iOv9/9+d1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170004; c=relaxed/simple;
	bh=OXQZ61kYQgngl/3H7J5vwvlWtsxwDf//VZRhoCkHOxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZ5iTLBJAQ6hO7WiH5ek+2l4cgUrQDIEDvFUdP8NZQa1el/Mf8bmb53URH6EDkk9XOE2w/1VrocLKYfnySQu3inn+w+J680b9LxESSMg9YMe5MEe3z8cimoPK2tKv4AQFhcJKG6i/Uy/mj6JKEts0o+Avo0KFh5dYcuW4joS5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VDDu7pYL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GMuISuhLZlhqMv9bXZPyQ5GgapsS85Up6a86wjy0oNY=; b=VDDu7pYLy+RTa8fNVbe8KjWvbC
	E4JOzvAqAodW7TZa26CM6W2xXP6s6+rhJPvvIaS9RinL27wW6IqvYaA/apFV39MZtWz/tUxzu2Dm+
	E9lBircAPtK+TQBATTynEDS+Tb61BVjtGT7PKzzRVlfZfsiimCKRwWYy3w5j+Ohb8Zvppun9ZlPC6
	vhZvIVGeKAbYAaCunnZuDR5C//M6li/H0XMPF635xX4/OZaHEwOx4ZAv3DhEUNmLFNBAo/bOenEZ0
	tMFZUTGnIsDecfBgJidlKn1Q/Jg+9Walv2d4x9rjIQyWtkkrCBXtrPA+mHu4u88iTgV38GOJbiOfe
	dlnyTM2g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUw-0000000AqkV-21TJ;
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
Subject: [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:25 -0800
Message-ID: <20251219184638.1813181-7-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:23 Incorrect use of
 kernel-doc format: * dsc_disable - disable dsc
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:29 Incorrect use of
 kernel-doc format: * dsc_config - configures dsc encoder
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:41 Incorrect use of
 kernel-doc format: * dsc_config_thresh - programs panel thresholds
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_disable' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_config' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_config_thresh' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_bind_pingpong_blk' not described in 'dpu_hw_dsc_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -21,13 +21,13 @@ struct dpu_hw_dsc;
  */
 struct dpu_hw_dsc_ops {
 	/**
-	 * dsc_disable - disable dsc
+	 * @dsc_disable: disable dsc
 	 * @hw_dsc: Pointer to dsc context
 	 */
 	void (*dsc_disable)(struct dpu_hw_dsc *hw_dsc);
 
 	/**
-	 * dsc_config - configures dsc encoder
+	 * @dsc_config: configures dsc encoder
 	 * @hw_dsc: Pointer to dsc context
 	 * @dsc: panel dsc parameters
 	 * @mode: dsc topology mode to be set
@@ -39,13 +39,17 @@ struct dpu_hw_dsc_ops {
 			   u32 initial_lines);
 
 	/**
-	 * dsc_config_thresh - programs panel thresholds
+	 * @dsc_config_thresh: programs panel thresholds
 	 * @hw_dsc: Pointer to dsc context
 	 * @dsc: panel dsc parameters
 	 */
 	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
 				  struct drm_dsc_config *dsc);
 
+	/**
+	 * @dsc_bind_pingpong_blk: binds pixel output from a DSC block
+	 * to a pingpong block
+	 */
 	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
 				  enum dpu_pingpong pp);
 };

