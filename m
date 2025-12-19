Return-Path: <linux-arm-msm+bounces-85958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24BCD17E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F2F8301D5A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579D534D392;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JDoHBmd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5257322523
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170004; cv=none; b=cC6BFL43gI/DqhFarmKeATJNUm9kcqCN2yzHi1CdPaRT2w5mJYchUQeqX8lqey8tfT0LyymPGzHr9FzwIRnHVw90rSae4d5f2QgkBg2uYlIsosAaxa0FeRDE8z0zKIU5JB4Q7ZsM2oETtYuLxrghayt6H6BuFAhVHY23ItJ9oEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170004; c=relaxed/simple;
	bh=sW1HOzGTbnXpsqkXSUazeOTho+HGuB21Z68nRuoTW0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJm5Y//uWvXfHwIaIPK8WujX3pWyFZphXlsp6vVFWMXuAHpAnAZru2vWgpA41cILTclucw6Amn6d2ijyw/gxcLrtKtbEjK6hJbaPrpPTVnOvppf0bRj/MfmdHaqy4ZSp6+wAqRvFOay4GTBSmeyyxvZM2R91WKXVgGkPys1Ikjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JDoHBmd5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=aMTIQNpoq4JnAFqdCgtDfaBJpJ3OgOmObmKnmGO00n4=; b=JDoHBmd50J/M3U7CCh1onN8s6k
	k9MHobWgJnnXINbEC/RM39feFQ7H9i1odRJm1/J9Qs8jtlpLV/Jv3K6GhYsVYpOev4oZj0jsTuns/
	2plQ068hGsd2BuFtZ51GCMrnkCnNu7HJKzzYz77R3oIKeCAY2Wwd7j2uKVdpTKwgl+BI0EKftjwCB
	H1UepCWmTfPaENsy/Dpe3f8bBoOuUv//P0clWecKSoQBkQtUAbEcM2arTdJisbBk214Ll/c0NRTpB
	QI+cg1MrWaHQXpiZzxYwyB2tHK9h83vCxUI41bWutIVhWg629/Mh/+qaKjXGmF0zLNz/u75TcYb2j
	q+xVNvxg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUw-0000000AqkV-0mbJ;
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
Subject: [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:24 -0800
Message-ID: <20251219184638.1813181-6-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h:30 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h:61 expecting prototype
 for dpu_hw_cwb(). Prototype was for to_dpu_hw_cwb() instead

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
@@ -28,7 +28,6 @@ struct dpu_hw_cwb_setup_cfg {
 };
 
 /**
- *
  * struct dpu_hw_cwb_ops : Interface to the cwb hw driver functions
  * @config_cwb: configure CWB mux
  */
@@ -54,7 +53,7 @@ struct dpu_hw_cwb {
 };
 
 /**
- * dpu_hw_cwb - convert base object dpu_hw_base to container
+ * to_dpu_hw_cwb - convert base object dpu_hw_base to container
  * @hw: Pointer to base hardware block
  * return: Pointer to hardware block container
  */

