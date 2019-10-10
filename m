Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A5FD20FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 08:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732897AbfJJGsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 02:48:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3682 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732759AbfJJGsM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 02:48:12 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 7A8F794905A5AC752912;
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
Subject: [PATCH 4/4] drm/msm/dsi: Remove set but not used variable 'lp'
Date:   Thu, 10 Oct 2019 14:55:06 +0800
Message-ID: <1570690506-83287-5-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/dsi/dsi_host.c: In function dsi_cmd_dma_rx:
drivers/gpu/drm/msm/dsi/dsi_host.c:1302:7: warning: variable lp set but not used [-Wunused-but-set-variable]

It is not used since commit a689554ba6ed ("drm/msm:
Initial add DSI connector support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 663ff9f..4851188 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1291,14 +1291,13 @@ static int dsi_cmd_dma_tx(struct msm_dsi_host *msm_host, int len)
 static int dsi_cmd_dma_rx(struct msm_dsi_host *msm_host,
 			u8 *buf, int rx_byte, int pkt_size)
 {
-	u32 *lp, *temp, data;
+	u32 *temp, data;
 	int i, j = 0, cnt;
 	u32 read_cnt;
 	u8 reg[16];
 	int repeated_bytes = 0;
 	int buf_offset = buf - msm_host->rx_buf;

-	lp = (u32 *)buf;
 	temp = (u32 *)reg;
 	cnt = (rx_byte + 3) >> 2;
 	if (cnt > 4)
--
2.7.4

