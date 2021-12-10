Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C054C470E91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 00:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345125AbhLJX1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 18:27:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:19157 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345112AbhLJX1s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 18:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639178652; x=1670714652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zEYfjvBMHvPx4GKgUpSX8H8PHdgwuH8BVfo+Q46AGGo=;
  b=fCdF3tJWUhn/KiuRLbIU6WXsnI0et6hoz7lQKjtPyjFABIGHwLEywUxx
   BvVnvowjGjPG6xw4bz9DgyU+4KuxQ3jXPNoUMd1FekkkAui/FCvvZcuue
   bLO8eyc8085wmFC5+1AY/F2oDKodxRTHhDcEKfLiZP/A6Z+jdECmfOtnO
   m34/lOE3Ry4s+SZJh4DY4lf6WQqtj/1Lfk5Y18tq7Y2ASgLy4/xBxvHdk
   gA8akHCyxA/nvLAOSeTqj6g2k5C01JrgzXnGLmtb0ehxfoc8FssApRasH
   tbdJ1iDYA/PMSZ1BYj/vnn/sN/EcjSQgPPgcJiH8ffoKdmBT8rJnPs9ER
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237212386"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="237212386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 15:24:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="463861484"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 15:24:12 -0800
From:   ira.weiny@intel.com
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Ira Weiny <ira.weiny@intel.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/7] drm/radeon: Ensure kunmap is called on error
Date:   Fri, 10 Dec 2021 15:24:04 -0800
Message-Id: <20211210232404.4098157-8-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The default case leaves the buffer object mapped in error.

Add radeon_bo_kunmap() to that case to ensure the mapping is cleaned up.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
NOTE: It seems like this function could use a fair bit of refactoring
but this is the easiest way to fix the actual bug.
---
 drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 2ea86919d953..7462010e0e6d 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -563,6 +563,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 
 	default:
 
+		radeon_bo_kunmap(bo);
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
 		return -EINVAL;
 	}
-- 
2.31.1

