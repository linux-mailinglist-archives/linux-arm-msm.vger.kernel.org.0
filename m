Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAA465FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 20:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731135AbfGKSqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 14:46:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39824 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731144AbfGKSqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 14:46:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DE04F60E5C; Thu, 11 Jul 2019 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870812;
        bh=xHTm+r3iev8HeqpPDWURSLUS+X6fMCYc5WJrMfReLEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H02usFybvTCz+6qvCK9z2ba/Jf4DpBwwWfFjWNW6XXe2IpIJc4CTv+JpeUcQxMAck
         ZM6a4/3Q0QhEZWEH86VS98/9MQ3jMU2DIr+H0EWR+83dm20pzMllDo0SF9zHYNLXty
         EQ6AsQOLmyZHUbtfY814QxkzTHeroxikQRK4iFmA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jsanka@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CA4560E41;
        Thu, 11 Jul 2019 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870812;
        bh=xHTm+r3iev8HeqpPDWURSLUS+X6fMCYc5WJrMfReLEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H02usFybvTCz+6qvCK9z2ba/Jf4DpBwwWfFjWNW6XXe2IpIJc4CTv+JpeUcQxMAck
         ZM6a4/3Q0QhEZWEH86VS98/9MQ3jMU2DIr+H0EWR+83dm20pzMllDo0SF9zHYNLXty
         EQ6AsQOLmyZHUbtfY814QxkzTHeroxikQRK4iFmA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CA4560E41
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jsanka@codeaurora.org
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@gmail.com
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>, pdhaval@codeaurora.org,
        nganji@codeaurora.org
Subject: [RFC PATCH] drm: add mode flags in uapi for seamless mode switch
Date:   Thu, 11 Jul 2019 11:46:45 -0700
Message-Id: <1562870805-32314-2-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add drm mode flag values to expose mode capabilities to
perform dynamic seamless mode switch. This change also
exposes the backing panel type associated with a mode
for panels which can dynamically switch between video
and command display modes.

Signed-off-by: Jeykumar Sankaran <jsanka@codeaurora.org>
---
 include/uapi/drm/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ab331e..b76f1bf 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -124,6 +124,11 @@
 #define  DRM_MODE_FLAG_PIC_AR_256_135 \
 			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
 
+#define DRM_MODE_FLAG_SEAMLESS_SWITCH (1<<23)
+
+#define DRM_MODE_FLAG_VIDEO_MODE   (1<<24)
+#define DRM_MODE_FLAG_COMMAND_MODE (1<<25)
+
 #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
 				 DRM_MODE_FLAG_NHSYNC |		\
 				 DRM_MODE_FLAG_PVSYNC |		\
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

