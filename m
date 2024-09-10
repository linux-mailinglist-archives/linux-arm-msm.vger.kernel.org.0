Return-Path: <linux-arm-msm+bounces-31404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8C97311D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 12:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E0D01F2690B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF631199938;
	Tue, 10 Sep 2024 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gELwogK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882E195FD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962678; cv=none; b=fLHJEIhu3xJAVSiI9lXLAsy8aSQrEj2s/Nd2+T/XNfmt4/n7JmViGvsvn5a6Mj8ifQlk4SiW8AVRm86ctKiAFfRZAP440uFl8UdhM9FN9p1Un8iGoOrdM327Hvz8r1W+OYP1gXqaeXt/iwkArt38NYu/uzX1kjHWuhclFEcv400=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962678; c=relaxed/simple;
	bh=/kcZlDuQnabH6BPO2BuWeu16asULg91Bir+RLOc1XJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BAF++StVPx7ZfqnRa9dxc4yna72Og6dlQ7/5/NgqwyyCNMWjrMzz4caXfayxa8OduNYofR89snu5mYVH6uEkFdHQ2EpVhSbsngm9pjDtObhtq/FAcddE8ADSyisuH+o5ofPFISNxnix81NlELziuxDsVw/nlE0tdleXUl9Lzv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gELwogK4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725962677; x=1757498677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/kcZlDuQnabH6BPO2BuWeu16asULg91Bir+RLOc1XJA=;
  b=gELwogK4+kOx08kJ9RwX5VXp94YkBnVj792WKEWi2R3bQBwVE1lAZrOl
   UBZBkm25TDptggVIsHzBaau+HLLyX2PBKMGtJVlYkeykJ+81sdBspdWtT
   2nGKaJRU6xF5BUOS1Iy7mdn31FJAzC1l0U6clU4j8eLvKcY3k7VJ/HrPv
   SAE3fCB2D/nN8qP2cKdk6NZnmrN/j3gR2wL9zHZR4M0j+7PIaJlQuuCUS
   NCP7eTrlkJZ4QRT041bp7UgQ9iS6jXDofsuQe2Xytte1YWzavUrVpvht3
   95sok7K7slWAo4griUWPNdqGjQU7t4pICHa3dGiNoRDyWraL3St7h7D++
   Q==;
X-CSE-ConnectionGUID: BaU3N4mDQgeUYPdDEhpCLQ==
X-CSE-MsgGUID: NZ2KElTwTkiVZ/lYiwbycQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50112884"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="50112884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:36 -0700
X-CSE-ConnectionGUID: GSLg1y8iQ4qmW2qH+ega9A==
X-CSE-MsgGUID: 9pxrFGnTSayhpKQpZDD2sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71762394"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.43])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:43 +0300
Message-Id: <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Building with clang and and W=1 leads to warning about unused
pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..c0bf1f35539e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
 	return dividend - 1;
 }
 
-static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
+static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
 {
 	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
 
-- 
2.39.2


