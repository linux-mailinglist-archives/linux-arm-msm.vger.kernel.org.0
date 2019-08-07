Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D957A85203
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 19:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbfHGRYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 13:24:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33094 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGRYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 13:24:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE67A60F3B; Wed,  7 Aug 2019 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565198672;
        bh=9K1MOxiCxYs/25EyWmBrmkD80zO1z57WgiTXJ3f3y6Y=;
        h=From:To:Cc:Subject:Date:From;
        b=OxCnwmzuQnMmlh3okgONlCz5nhylnjZ13rQgFQHfSjlepS/i8uCL6MM+bFrvIWvXn
         SKLFfBy4Aws2Cy9BQpBrZbOeulOU4rFgFrqY5u4780x9d23NgBy/obA1FgV7QRr+/o
         wsz3UYoCy8ZSgp02JhVCruRzZ/W1ZGn+V/08zcFA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A1E060ACF;
        Wed,  7 Aug 2019 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565198672;
        bh=9K1MOxiCxYs/25EyWmBrmkD80zO1z57WgiTXJ3f3y6Y=;
        h=From:To:Cc:Subject:Date:From;
        b=OxCnwmzuQnMmlh3okgONlCz5nhylnjZ13rQgFQHfSjlepS/i8uCL6MM+bFrvIWvXn
         SKLFfBy4Aws2Cy9BQpBrZbOeulOU4rFgFrqY5u4780x9d23NgBy/obA1FgV7QRr+/o
         wsz3UYoCy8ZSgp02JhVCruRzZ/W1ZGn+V/08zcFA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A1E060ACF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Make DRM_MSM default to 'm'
Date:   Wed,  7 Aug 2019 11:24:27 -0600
Message-Id: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most use cases for DRM_MSM will prefer to build both DRM and MSM_DRM as
modules but there are some cases where DRM might be built in for whatever
reason and in those situations it is preferable to still keep MSM as a
module by default and let the user decide if they _really_ want to build
it in.

Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
it doesn't get missed when we need it for a6xx tarets.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 9c37e4d..3b2334b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,11 +14,12 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
+	select QCOM_COMMAND_DB if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
 	select PM_OPP
-	default y
+	default m
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
-- 
2.7.4

