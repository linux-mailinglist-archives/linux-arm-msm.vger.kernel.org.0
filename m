Return-Path: <linux-arm-msm+bounces-79305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB59C1730B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B713B3224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D312C3244;
	Tue, 28 Oct 2025 22:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK/UookI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D518991E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761690502; cv=none; b=V2bYxqs5K+5AnPJGPUQzsCCK/z/lW5YFTZcUTMaS71XGexGNoGyAajaH1NR/mWUcLH0dtcdu2mrfc8RonOe2jFnS6xxJkcCUgv5Wf2KcEQa7aoSihOht2rBQhgaxDKYM+vDQQMvc0cxHpAECUlzWWLY0/CvjK6AhdJwuv0QcG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761690502; c=relaxed/simple;
	bh=1U7IsgaZYOwBYiBpfvQuR0EENvyUdxBUDwFMMENqgr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTb752vTBPRoOeMaHWzMUI84iaxaz9PsfshJidq67xE8dQ+yge3U3QSIE56fOCwqI4PIptKRQsuTvm7Ycpl8CRMs+fbP8GQQhGl4Y906jcoWlE/uI1ZT/MsaofYuWsPaOcPZLCQAtI+5Qs+k9yprPQ+XPuZ07TvcOBpVpVedb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK/UookI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761690500; x=1793226500;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1U7IsgaZYOwBYiBpfvQuR0EENvyUdxBUDwFMMENqgr4=;
  b=FK/UookI0qHckbN13oj0ndPsCCdxqsnzyCDn3dRnv3AhGk7MDSDLufRe
   /Derib8OUvgKZdn3Y9gCDFK3A6HzJ43bzodqJDMh6IjhU20xjdQuCLjYY
   NCBA7UI+cID9xqG3x8QpMDnho7/H9xqaVQ65QAI3S0d2F4R8grk00IQXN
   kIKH2hzn21z/KYwWuljyrfF8kcJRPigfL5ZtN6J1R04UJiz2Nzn4b3UH/
   GUHU7Imd1/8P77WhVGoLz9g7+zOrz9jlvgFtp0Y4/86fNho7x4nAepKcW
   +2UpHVJ1PGNpOrDmhirJpDpJCGrWW/opQRVj+03p+j1VhIazkIl2zfVdc
   w==;
X-CSE-ConnectionGUID: gkoxvvm5Qyu2yfkSBIdXuQ==
X-CSE-MsgGUID: YQ5CU/beQZG+miBDMwB85Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63731181"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63731181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 15:28:20 -0700
X-CSE-ConnectionGUID: Hnl0jUQ0SWG7T/tbLanHYQ==
X-CSE-MsgGUID: DBbikkIAQd+4EXrZ0JnOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184720613"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2025 15:28:20 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
Date: Tue, 28 Oct 2025 15:28:17 -0700
Message-ID: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
Update its name to align with the DP 2.1 definition and reflect its
actual use in the code. No functional changes.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 include/drm/display/drm_dp.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3..5d465cf4dbc2 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 		return rlen;
 	}
 
-	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
 		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
 		goto end;
 	}
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..610b8cbf1125 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -849,7 +849,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.43.0


