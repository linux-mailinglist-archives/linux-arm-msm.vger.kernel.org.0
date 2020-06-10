Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0DE1F4A68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 02:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFJArJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 20:47:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10388 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbgFJArJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 20:47:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591750028; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=pQUc4fKnBHwIKnTPsoaMWGixFocmxulbLIkiXCV2hNo=; b=T63UGOrlR21gHM0ynUe4loC9Y9Icmwj2u1aCTJMY3mc+pjoC+blEb3J8CUQp0Rmf5JkCqYBM
 1z/AMonKJwHU2Apw39BZi2uvXrscRak0RNnNh8C3EdSVKgOBZ6pY8KfhtUX9SVWdKsQbq/m6
 bxJZnkazB5PkKFCn/53zwb/zRw0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee02d8a356bcc26ab59c12e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 00:47:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C652CC43387; Wed, 10 Jun 2020 00:47:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7349C433CA;
        Wed, 10 Jun 2020 00:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7349C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, pdhaval@codeaurora.org
Subject: [PATCH] drm/msm: call drm_mode_config_reset before drm_dev_register
Date:   Tue,  9 Jun 2020 17:46:59 -0700
Message-Id: <20200610004659.10401-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per the documentation of drm_dev_register, all drivers should
call drm_dev_register after all the initialization is completed.
This also means that drm_mode_config_reset should be done before
drm_dev_register.

Change the sequence to align with this documentation.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 29295dee2a2e..9e77cc7f1fa4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -538,12 +538,12 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 		}
 	}
 
+	drm_mode_config_reset(ddev);
+
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
 		goto err_msm_uninit;
 
-	drm_mode_config_reset(ddev);
-
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (kms && fbdev)
 		priv->fbdev = msm_fbdev_init(ddev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

