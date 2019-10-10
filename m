Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEBCD20F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 08:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfJJGsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 02:48:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56672 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732759AbfJJGsI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 02:48:08 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4C858EB0C575B4513E8B;
        Thu, 10 Oct 2019 14:48:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:57 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 3/4] drm/msm/dsi: Remove set but not used variable 'lpx'
Date:   Thu, 10 Oct 2019 14:55:05 +0800
Message-ID: <1570690506-83287-4-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/dsi/phy/dsi_phy.c: In function msm_dsi_dphy_timing_calc_v2:
drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:156:17: warning: variable lpx set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/dsi/phy/dsi_phy.c: In function msm_dsi_dphy_timing_calc_v3:
drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:273:17: warning: variable lpx set but not used [-Wunused-but-set-variable]

'lpx' in msm_dsi_dphy_timing_calc_v2 is not used since commit a4df68fa232e
("drm/msm/dsi: Add new method to calculate 14nm PHY timings")

'lpx' in msm_dsi_dphy_timing_calc_v3 is not used since commit f1fa7ff44056
("drm/msm/dsi: implement auto PHY timing calculator for 10nm PHY")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 3522863..aa22c3a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -145,7 +145,7 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
 	const unsigned long esc_rate = clk_req->escclk_rate;
-	s32 ui, ui_x8, lpx;
+	s32 ui, ui_x8;
 	s32 tmax, tmin;
 	s32 pcnt0 = 50;
 	s32 pcnt1 = 50;
@@ -175,7 +175,6 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,

 	ui = mult_frac(NSEC_PER_MSEC, coeff, bit_rate / 1000);
 	ui_x8 = ui << 3;
-	lpx = mult_frac(NSEC_PER_MSEC, coeff, esc_rate / 1000);

 	temp = S_DIV_ROUND_UP(38 * coeff - val_ckln * ui, ui_x8);
 	tmin = max_t(s32, temp, 0);
@@ -262,7 +261,7 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 {
 	const unsigned long bit_rate = clk_req->bitclk_rate;
 	const unsigned long esc_rate = clk_req->escclk_rate;
-	s32 ui, ui_x8, lpx;
+	s32 ui, ui_x8;
 	s32 tmax, tmin;
 	s32 pcnt0 = 50;
 	s32 pcnt1 = 50;
@@ -284,7 +283,6 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,

 	ui = mult_frac(NSEC_PER_MSEC, coeff, bit_rate / 1000);
 	ui_x8 = ui << 3;
-	lpx = mult_frac(NSEC_PER_MSEC, coeff, esc_rate / 1000);

 	temp = S_DIV_ROUND_UP(38 * coeff, ui_x8);
 	tmin = max_t(s32, temp, 0);
--
2.7.4

