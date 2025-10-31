Return-Path: <linux-arm-msm+bounces-79957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5BC26824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 19:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E32063B7AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 17:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083C53502A3;
	Fri, 31 Oct 2025 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBxYQa++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB32FD1DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761933482; cv=none; b=edfIeaqwM+BjXjWYed4QDNPpqVUB/pzbPtgI4Fp7H0qVyGD+TM2FLkcSHXDQ1i/yxkDnUsP9h/xOck0on2fmnTs+6WGTA4Qu1lAVtVA2yQKFlBq0qpKqoKsDyHZDWgnSyNktvW0n41on+jn4vSO+W9lZ15FIfrqVg8G7zd8pGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761933482; c=relaxed/simple;
	bh=U1SJEHv77UlVmQIwfYx3kPtQgJj8QTjOlyY+o3sqETU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sp3MA5Olx8cepkZbJqop691GWEEEPMRRiqV4UV1AQLvO6gAjQt0qVu6qCks6HyJozOWe3rFMQzvtm7R6da37ob1NE6qrmKctjkqvNZTQ6OdptTE5ydkBVodhOD4U+E0V9ZoxRoI6oZls8/qP6+CyxR8Qqj0MmrNY0LKNcQH+RlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBxYQa++; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761933480; x=1793469480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U1SJEHv77UlVmQIwfYx3kPtQgJj8QTjOlyY+o3sqETU=;
  b=BBxYQa++kHqFaDfANIvoLr9T93MFH6QBCGq5gxHuyVKKuCDCpwH8DA9H
   dedDu5OXxtl0ArfFzDWKpMEGz3plQZx7uIH15s0t4ils3bwO9oH6KW76e
   OJkJOEPsxgA5g1RcuwewLxnGqNIx9aUfjZ+w56PzBoFJZq7SlQd4K91IR
   ecF1JWqc8zGKo14OD2TvPkPXjjmrlUvKYituT+EvynPgI1sC5xsaKOlbu
   SlDemJP/cKgygu/s2i5heIx6RpK/+6QF8TGS9o85L/XWuQUV8kgy5JX0c
   LbHdHt37TtDgFKunmlG3aTfwLuWwjF5fZouTVmxp0jjB6xsIoZfs5rApz
   w==;
X-CSE-ConnectionGUID: EyiVX56cTpyWTmy14gxp5Q==
X-CSE-MsgGUID: eWxmXrQ0Qwq+nJ0MlkqO7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="89563957"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="89563957"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:57:40 -0700
X-CSE-ConnectionGUID: gOmtIhR0Snmk1PIgUlTCxA==
X-CSE-MsgGUID: OdM79Rh1TAqwOU7/K0rLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186171943"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 10:57:40 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match DP2.1 spec
Date: Fri, 31 Oct 2025 10:57:38 -0700
Message-ID: <20251031175738.3430347-1-khaled.almahallawy@intel.com>
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

v2: Comment about spec version where the bit was introduced (Konrad)

Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Sean Paul <sean@poorly.run>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index e4eebabab975..e299a66e698d 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -849,7 +849,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4) /* DP 2.1 */
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.43.0


