Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E506470E90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 00:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345122AbhLJX1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 18:27:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:19154 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345100AbhLJX1q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 18:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639178651; x=1670714651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXyxgwUM4bkXvDM+XyNRIjGv+8i1m09MysFfC7KN7A8=;
  b=ZW+DD9B8xjomCGeTWtoZQJ3tV58nV+WpFXelOmgx+N8ArUMR9/Ds5Ml6
   RzmHUxAw+YDXyAHDby1H1UBwtgA27+HxZxzIGsTJIhh5aft5xova20MAh
   bv5Vwhx8HJQvyw41F63W7UW90v0rak4fSKQXrqYU2nZ53SAKw+StOnfDE
   yeTAs0QIlw0hkn2buBwGwOh3Q7wJaSlEFoXQCgIKbZA0WqX1TLXRnK1f3
   4r9lqtP20kY9wrFE7FPn9tT1fwpVUDitC8e8QiF4+uYhQ4UwY/TtsAPxN
   S75gLxZkOY5ETJYURFfIx1upw9izzBoYFMu0CP4nkMxvq6GoehmXBhW60
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237212372"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="237212372"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 15:24:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="463861457"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 15:24:10 -0800
From:   ira.weiny@intel.com
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Ira Weiny <ira.weiny@intel.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/7] drm/radeon: Replace kmap() with kmap_local_page()
Date:   Fri, 10 Dec 2021 15:24:01 -0800
Message-Id: <20211210232404.4098157-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated and this usage is local to the thread.  Use
kmap_local_page() instead.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..76d7906e1785 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -907,11 +907,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f, char __user *buf,
 
 		page = rdev->gart.pages[p];
 		if (page) {
-			ptr = kmap(page);
+			ptr = kmap_local_page(page);
 			ptr += off;
 
 			r = copy_to_user(buf, ptr, cur_size);
-			kunmap(rdev->gart.pages[p]);
+			kunmap_local(ptr);
 		} else
 			r = clear_user(buf, cur_size);
 
-- 
2.31.1

