Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F578BBDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 16:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbfHMOqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 10:46:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbfHMOqc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 10:46:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 60F1960735; Tue, 13 Aug 2019 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565707591;
        bh=RX2ZuF7FyFcwrhLgH5WfnjLf77k36pqleRUFSlPzjAQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Kq2sUkhYJde1OCI+XGoMCQ1KWgoN1wYhrwueI7SaGan6MrH35iNl+Zi+TqTzzPoId
         M0qtLXdJUNZ1FWiKvZyh3vbDVjm2T8XKJggIBT0fnY1v4aQOu0R6cqBARRGIvS9fuv
         hyT4rcepA3zOzuV4aCB98tN/PZtXwGeJJE1maVSE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6E0160735;
        Tue, 13 Aug 2019 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565707590;
        bh=RX2ZuF7FyFcwrhLgH5WfnjLf77k36pqleRUFSlPzjAQ=;
        h=From:To:Cc:Subject:Date:From;
        b=JVkr2CyLqGfAWWlP5g/MRzjweIo9GLa0Ux6gwF0J0OlH/8mterC9gwFPLWi3vS2J7
         w30oaM1JVjd8fNub6OcR9ZIU1NyBhzkML+DqrB5Riiyr38Onp1fXLELcHWA2yCNILj
         dhGGuKsLLxjH9Qi0h+hUfo5XN97XTPxiD93zLQ4g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6E0160735
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/msm: Remove Kconfig default
Date:   Tue, 13 Aug 2019 08:46:24 -0600
Message-Id: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the default for CONFIG_DRM_MSM and let the user select the driver
manually as one does.

Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
it doesn't get missed when we need it for a6xx targets.

v2: Move from default 'm' to no default

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 9c37e4d..e9160ce 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,11 +14,11 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
+	select QCOM_COMMAND_DB if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
 	select PM_OPP
-	default y
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
-- 
2.7.4

