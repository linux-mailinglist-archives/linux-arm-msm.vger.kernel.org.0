Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3098E33FDCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 04:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhCRD0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 23:26:23 -0400
Received: from m12-13.163.com ([220.181.12.13]:57458 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231262AbhCRDZ7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 23:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zyX6k
        q40HN3swFxBR+AxgMqhx9HhQ1paeRj8bPuVsuA=; b=a3KVEdJYEz59JMmy82VwY
        hxYQEr++4gDXBiis1V4+rJUHC5pVr1yE1xrHjP7+vpJmHlsT2ovHClCzcfMvdYlA
        5zNf45PDzF1lGiEKFZbHhr6yNjY6tseaiVcgKFtkuNBnUetatfohBR8d6zPaBxVS
        PNVwodx0KuM3zzIeujAQ/4=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
        by smtp9 (Coremail) with SMTP id DcCowADX50_0x1JghcgjBw--.23937S2;
        Thu, 18 Mar 2021 11:24:39 +0800 (CST)
From:   zuoqilin1@163.com
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, zuoqilin <zuoqilin@yulong.com>
Subject: [PATCH] drm/msm: Remove unneeded variable: "rc"
Date:   Thu, 18 Mar 2021 11:24:22 +0800
Message-Id: <20210318032422.1285-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowADX50_0x1JghcgjBw--.23937S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1DZF18ZrWrWF45JryDGFg_yoWfurb_Gr
        10qF9rWFW7GFnrZF13Zws7XFySyFs3uFWku3WvqFy3A3ZrAr1UX3sF9r1xJF1kCr1xCF98
        Xan5ArWayrW5GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU05l1DUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/1tbipRdZiVUMc3oMVwAAsp
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: zuoqilin <zuoqilin@yulong.com>

Remove unneeded variable: "rc".

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc8166..8cb3d01 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -351,7 +351,6 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
 
 int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 {
-	int rc = 0;
 	u32 data, total_ver, total_hor;
 	struct dp_catalog *catalog;
 	struct dp_panel_private *panel;
@@ -404,7 +403,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	dp_catalog_panel_timing_cfg(catalog);
 	panel->panel_on = true;
 
-	return rc;
+	return 0;
 }
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel)
-- 
1.9.1


