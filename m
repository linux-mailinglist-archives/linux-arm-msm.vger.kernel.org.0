Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4454F231925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 07:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgG2Fgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 01:36:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62025 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbgG2Fgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 01:36:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596001014; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Nj7EmiVixXrJxeYBB1Hx4fSCI5ncRdynyCsACLKj4pM=; b=Epx/D96Eh8xfy4LDrVEGc+3tqZC4DjuoPPdlsEE5p1w4nPThUW7qwkUHAT9KIIkhAiQ4HKZv
 sH2Xx9dcntlbK7+YUzC3OqOcpngv7pdxMw7OetDeUNUlsrA4iQL8DpYdMUAeEGGz5PIbANN9
 a3hC8yOaclX7n22LL0/+AzjsAIo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f210ad47186ea1ee13d615f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 05:36:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D34DC4339C; Wed, 29 Jul 2020 05:36:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cohens-linux.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E98EC433C6;
        Wed, 29 Jul 2020 05:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E98EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     Steve Cohen <cohens@codeaurora.org>, sam@ravnborg.org,
        daniel@ffwll.ch, pdhaval@codeaurora.org, jsanka@codeaurora.org,
        adelva@google.com, gregkh@linuxfoundation.org
Subject: [PATCH] drm: re-add deleted doc for drm_gem_open_ioctl
Date:   Wed, 29 Jul 2020 01:35:52 -0400
Message-Id: <1596000952-27621-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add back the removed documentation for drm_gem_open_ioctl.
This patch is submitted in response to [1].

[1] https://lore.kernel.org/linux-arm-msm/20200728085244.GY6419@phenom.ffwll.local/

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee2058a..fe94122 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -871,6 +871,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
  * @file_priv: drm file-private structure
  *
  * Open an object using the global name, returning a handle and the size.
+ *
+ * This handle (of course) holds a reference to the object, so the object
+ * will not go away until the handle is deleted.
  */
 int
 drm_gem_open_ioctl(struct drm_device *dev, void *data,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

