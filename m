Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB58142BA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 14:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgATNGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 08:06:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44834 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728792AbgATNGw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 08:06:52 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E578B618678A3BA5CAF1;
        Mon, 20 Jan 2020 21:06:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 Jan 2020 21:06:32 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
        <jingoohan1@gmail.com>, <b.zolnierkie@samsung.com>
CC:     <kgunda@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenzhou10@huawei.com>
Subject: [PATCH -next] backlight: qcom-wled: fix unsigned comparison to zero
Date:   Mon, 20 Jan 2020 21:01:43 +0800
Message-ID: <20200120130143.35363-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes coccicheck warning:
./drivers/video/backlight/qcom-wled.c:1104:5-15:
	WARNING: Unsigned expression compared with zero: string_len > 0

The unsigned variable string_len is assigned a return value from the call
to wled_configure, which may return negative error code.

Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/video/backlight/qcom-wled.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index d46052d..3d276b3 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int version)
 	struct wled_config *cfg = &wled->cfg;
 	struct device *dev = wled->dev;
 	const __be32 *prop_addr;
-	u32 size, val, c, string_len;
-	int rc, i, j;
+	u32 size, val, c;
+	int rc, i, j, string_len;
 
 	const struct wled_u32_opts *u32_opts = NULL;
 	const struct wled_u32_opts wled3_opts[] = {
-- 
2.7.4

