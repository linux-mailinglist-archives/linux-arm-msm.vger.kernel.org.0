Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD11DC761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 09:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgEUHLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 03:11:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:34644 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727857AbgEUHLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 03:11:55 -0400
IronPort-SDR: KTZlZJrQeNdQKshFjTCIOCvySHzQgB58sIlvwwE9Tz2K1t3lKnH9tAkeZXVOOzBhjuOlhaULXH
 zmQwjE9jHvsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 00:11:53 -0700
IronPort-SDR: z7c0s6E/XsKg6S11eV0hFFqcwljSpul7VUxWd+FplJFBN88A21CKiBuf6ns6T90R9x0GcCoDe/
 ZgBKGsJO3syg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; 
   d="scan'208";a="412297601"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 May 2020 00:11:50 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jbfMp-0003QD-8G; Thu, 21 May 2020 15:11:47 +0800
Date:   Thu, 21 May 2020 15:11:13 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     kbuild-all@lists.01.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH linux-next] drm/msm/dpu: dpu_setup_dspp_pcc() can be
 static
Message-ID: <20200521071112.GA92825@f61f8b3f25ca>
References: <202005211507.nm5LmztD%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005211507.nm5LmztD%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dpu_hw_dspp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index b5189cece3c66..a7a24539921f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
-void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
