Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127C121C003
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 00:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgGJWkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 18:40:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48677 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbgGJWkl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 18:40:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594420840; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vtmcg9y3utHjV10IFgZiIry9hswQAoCk/nvV3VJg7Cw=; b=rdWz+rIbl61+I/7/CMfR3JT5zhhzW33/TJV+9BHTePVE9KCuCSBLT4g+zvB/wBLioHQEGEXk
 5HSiyrGf7W0iJ9ss8OAolGx7ZG3Mxp4Wpt9GBeJC75IPg4toj2G7DNw7Zpgeh6XjZUtYydUd
 5TxG4gB6MTF6R7O+IX4SkRZmkig=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f08ee67427cd5576602e032 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 22:40:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 288EEC433CA; Fri, 10 Jul 2020 22:40:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cohens-linux.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A39CDC433C8;
        Fri, 10 Jul 2020 22:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A39CDC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     Steve Cohen <cohens@codeaurora.org>, seanpaul@chromium.org,
        pdhaval@codeaurora.org, jsanka@codeaurora.org, adelva@google.com
Subject: [PATCH] drm: hold gem reference until object is no longer accessed
Date:   Fri, 10 Jul 2020 18:40:26 -0400
Message-Id: <1594420826-4897-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BUG: KASAN: use-after-free in drm_gem_open_ioctl

There is potential for use-after-free here if the GEM object
handle is closed between the idr lookup and retrieving the size
from the object since a local reference is not being held at that
point. Hold the local reference while the object can still be
accessed to resolve this.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/drm_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e..4b2891c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -898,14 +898,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 
 	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
-	drm_gem_object_put_unlocked(obj);
 	if (ret)
-		return ret;
+		goto out;
 
 	args->handle = handle;
 	args->size = obj->size;
 
-	return 0;
+out:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

