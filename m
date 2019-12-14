Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1F3511F11D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 10:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfLNJYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Dec 2019 04:24:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:37998 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbfLNJYh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Dec 2019 04:24:37 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4C9EE223AF7006B33425;
        Sat, 14 Dec 2019 17:24:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 17:24:29 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/4] drm/msm/hdmi: Remove unneeded semicolon
Date:   Sat, 14 Dec 2019 17:31:47 +0800
Message-ID: <1576315910-124558-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
References: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes coccicheck warning:

drivers/gpu/drm/msm/hdmi/hdmi_connector.c:104:3-4: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 839822d..2ccb55a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -101,7 +101,7 @@ static int gpio_config(struct hdmi *hdmi, bool on)

 				gpiod_set_value_cansleep(gpio.gpiod, value);
 			}
-		};
+		}

 		DBG("gpio off");
 	}
--
2.7.4

