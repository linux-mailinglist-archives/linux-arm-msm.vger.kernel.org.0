Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8403C22726A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 00:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgGTWbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 18:31:32 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12166 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726506AbgGTWbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 18:31:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595284291; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bxR7ijxZKMOnXI/AhQULBlr08uvy6ovR5LTV4Tax43k=; b=ljAPCZwfNVlj0ssVv/p+KagD80habudaIn8RjNdujdp2icLZ/n7jdRkELNrWJ5J4btxhs2F1
 E9zUvez/15JE/t681Yowvaiet+2jUXldu/iZve3YC/K6slmdVNqdcaCtm8a7ecV/YJVqjUXJ
 1tj/2v9f1z9/nivcVxJ0ALHAl24=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f161b4103c8596cdb5fe96a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 22:31:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7A74C433A0; Mon, 20 Jul 2020 22:31:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cohens-linux.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB439C433C9;
        Mon, 20 Jul 2020 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB439C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     Steve Cohen <cohens@codeaurora.org>, sam@ravnborg.org,
        daniel@ffwll.ch, seanpaul@chromium.org, pdhaval@codeaurora.org,
        jsanka@codeaurora.org, adelva@google.com
Subject: [PATCH V2] drm: hold gem reference until object is no longer accessed
Date:   Mon, 20 Jul 2020 18:30:50 -0400
Message-Id: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A use-after-free in drm_gem_open_ioctl can happen if the
GEM object handle is closed between the idr lookup and
retrieving the size from said object since a local reference
is not being held at that point. Hold the local reference
while the object can still be accessed to fix this and
plug the potential security hole.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/drm_gem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e..ee2058a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
  * @file_priv: drm file-private structure
  *
  * Open an object using the global name, returning a handle and the size.
- *
- * This handle (of course) holds a reference to the object, so the object
- * will not go away until the handle is deleted.
  */
 int
 drm_gem_open_ioctl(struct drm_device *dev, void *data,
@@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 
 	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
-	drm_gem_object_put_unlocked(obj);
 	if (ret)
-		return ret;
+		goto err;
 
 	args->handle = handle;
 	args->size = obj->size;
 
-	return 0;
+err:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

