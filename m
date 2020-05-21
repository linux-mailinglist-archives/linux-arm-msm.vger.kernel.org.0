Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EC11DC893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 10:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgEUIab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 04:30:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:54405 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728643AbgEUIab (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 04:30:31 -0400
IronPort-SDR: 9ASeLxgVKTSFiNrZfY4mC0+sV6bjDtYP+Kf8jEA4KR7MavSJUMqpGGryWtmR932mRl4i5ozYCe
 SQ3GbSATCW3g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 01:30:30 -0700
IronPort-SDR: GCA3JlLqCpnDWJqg9EI44GP6FD27GV4TN6LHYrrbLQXYUxfD+K4VycbwLzwLTQtPZqMR++lasG
 BrGQSmEHJ0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; 
   d="scan'208";a="268560572"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 May 2020 01:30:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jbgax-000D7Q-FC; Thu, 21 May 2020 16:30:27 +0800
Date:   Thu, 21 May 2020 16:30:19 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     kbuild-all@lists.01.org, Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH linux-next] drm/msm/a6xx: a6xx_hfi_send_start() can be
 static
Message-ID: <20200521083019.GA66267@f61f8b3f25ca>
References: <202005211627.xf4dxc5b%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005211627.xf4dxc5b%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Fixes: 8167e6fa76c8 ("drm/msm/a6xx: HFI v2 for A640 and A650")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 a6xx_hfi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index f9db69e771214..9921e632f1ca2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -342,7 +342,7 @@ static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_start msg = { 0 };
 
@@ -350,7 +350,7 @@ int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_core_fw_start msg = { 0 };
 
