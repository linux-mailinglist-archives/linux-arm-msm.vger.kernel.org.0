Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509F6D20F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 08:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732792AbfJJGsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 02:48:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3681 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfJJGsF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 02:48:05 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 36984C152B3317FBD424;
        Thu, 10 Oct 2019 14:48:02 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:56 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/4] drm/msm/mdp5: Remove set but not used variable 'fmt'
Date:   Thu, 10 Oct 2019 14:55:03 +0800
Message-ID: <1570690506-83287-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c: In function mdp5_smp_calculate:
drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:134:6: warning: variable fmt set but not used [-Wunused-but-set-variable]

It is not used since commit 24c478ead0bf ("drm/fourcc:
Pass the format_info pointer to drm_format_plane_cpp")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index b31cfb5..d7fa2c4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -121,7 +121,6 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 	struct mdp5_kms *mdp5_kms = get_kms(smp);
 	int rev = mdp5_cfg_get_hw_rev(mdp5_kms->cfg);
 	int i, hsub, nplanes, nlines;
-	u32 fmt = format->base.pixel_format;
 	uint32_t blkcfg = 0;

 	nplanes = info->num_planes;
@@ -135,7 +134,6 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 	 * them together, writes to SMP using a single client.
 	 */
 	if ((rev > 0) && (format->chroma_sample > CHROMA_FULL)) {
-		fmt = DRM_FORMAT_NV24;
 		nplanes = 2;

 		/* if decimation is enabled, HW decimates less on the
--
2.7.4

