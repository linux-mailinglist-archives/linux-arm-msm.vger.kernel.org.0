Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78662D10CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbfJIOGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:06:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44424 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728019AbfJIOGU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:06:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7FAAF3A6F2849E1D75E3;
        Wed,  9 Oct 2019 22:06:18 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 22:06:12 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH] drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in modeset_init
Date:   Wed, 9 Oct 2019 22:13:23 +0800
Message-ID: <1570630403-92371-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function modeset_init:
drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:458:28: warning: variable hw_cfg set but not used [-Wunused-but-set-variable]

It is not used since commit 36d1364abbed ("drm/msm/mdp5:
Clean up interface assignment")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index f8bd0bf..5476892 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -461,14 +461,11 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	const struct mdp5_cfg_hw *hw_cfg;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };

-	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
-
 	/*
 	 * Construct encoders and modeset initialize connector devices
 	 * for each external display interface.
--
2.7.4

