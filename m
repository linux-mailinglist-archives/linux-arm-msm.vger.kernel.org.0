Return-Path: <linux-arm-msm+bounces-80759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C926C3FA44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 12:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 885414F139A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 11:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22CB2FFF9D;
	Fri,  7 Nov 2025 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfEZ99LJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C33195E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513525; cv=none; b=ucI+csy2UTZKr+Msp+1y1ZU9SJ7JmlFbz2uWFkfgwdik0RcCQv0vmkMjrgdODhKSKlaurk3bkguLP+K0K+tEPmP964slZ1/ccagnFmmDBLYd44f1I+1sdBxnhOO8e0YT4MAkgANInhrQMPYRSlp904IdXnyFLuZ4OnFpWta1WyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513525; c=relaxed/simple;
	bh=v776QJKUlaoHpHbZOwb7lKz6YsrkRzuR2qpxDWxtrnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvoWsPU6etMr/j8Umuo4PFys0q/h7TIKwzHlQs9NKScCkegntvvfM4pLDP3Gcvdc8J90hBkBoUWsT5KcPz4lBE+tV8FBDMUfCSdkeJNe5IiQ6KwcJ5cLkW2/VUc5F/Fj+iiFp9p9xRhjnLiuvJfjsCtRj92QeZEml7a8/00iL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfEZ99LJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762513524; x=1794049524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v776QJKUlaoHpHbZOwb7lKz6YsrkRzuR2qpxDWxtrnA=;
  b=TfEZ99LJ9HxXXITaTjdfAdrIVQM3R6mmT2/nfzOBQzG32875Cdc8w55B
   pel51LSNnEQQ6FG0wYFHKPLwyMzBW1q1CEAL/H9PQPYa9th3zjyFtXrdX
   XNKauRZHxNqVBw3VT+P+pYVP1z2xeFCeNzCFxJApJ0ukUBlDLqvqimMUA
   4MAu/7osUPAQHyPwtkrcykwqA9zt1Dma9pz0bHy1f9DEGMpmEr50cbyXq
   37Eq5W8SzeUkHmqeA47/n8RhRPBZ8F33/N79RKjkzGfgibzG5n3mmrzas
   t/ghECODR5esvKhX7MilGV2vzSqNrjO7gHtAmhY1W614nawnNqM1nLfv0
   A==;
X-CSE-ConnectionGUID: 39V6dOT2SNy52iCKVXJBFg==
X-CSE-MsgGUID: uFYRzfjXQEevtP0+sgzbag==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75353276"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75353276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:05:23 -0800
X-CSE-ConnectionGUID: 29IIpQ3sQxe+gTqN0DgrvA==
X-CSE-MsgGUID: w+pBUL8fTD+ADf7yyoTx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="211457387"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.124])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:05:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Date: Fri,  7 Nov 2025 13:04:57 +0200
Message-ID: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
for a vblank. Use it instead of poking at dev->vblank[] directly.

Due to the macro maze of wait_event_timeout() that uses the address-of
operator on the argument, we have to pass it in with the indirection
operator.

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index da53ca88251e..e8066f9fd534 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -527,13 +527,14 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
+	wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
 	int ret;
 
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret)
 		return;
 
-	ret = wait_event_timeout(dev->vblank[drm_crtc_index(crtc)].queue,
+	ret = wait_event_timeout(*queue,
 		!(mdp4_read(mdp4_kms, REG_MDP4_OVERLAY_FLUSH) &
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4c4900a7beda..373ae7d9bf01 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1234,6 +1234,7 @@ static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
+	wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
 	int ret;
 
 	/* Should not call this function if crtc is disabled. */
@@ -1244,7 +1245,7 @@ static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 	if (ret)
 		return;
 
-	ret = wait_event_timeout(dev->vblank[drm_crtc_index(crtc)].queue,
+	ret = wait_event_timeout(*queue,
 		((mdp5_ctl_get_commit_status(ctl) &
 		mdp5_crtc->flushed_mask) == 0),
 		msecs_to_jiffies(50));
-- 
2.47.3


