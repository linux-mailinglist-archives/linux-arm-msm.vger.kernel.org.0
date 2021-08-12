Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF57D3EA1E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235850AbhHLJWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhHLJWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:22:24 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91784C0613D5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:21:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so586279wml.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SfSWlMNkRusRWrFgcNlK5f+Tq18JLveXJe/Yu78G3iI=;
        b=plSLnX8ZD6s40Oveh27/GmjBzf/ucPmUjZJrNgWQI7yrpGQaw9aYJVM+/EPwmjSsbe
         M2jb1omyczDnezm+sqCci0R/gombAiPDnzr1tRWprhlmdv7kH/t3byAF3ioWrsB6LdZK
         Jq/wqDLHVxcxtVRd0Xgdm0+bbRkl5ZX+5kewjCXfdqMEeBN6cTvAgqm4iij+iaC4SfHX
         stibatM6EHmZXPBzJ07XXAZIMvr4IJZk4PYd4a09gxJlgGrVxcu6yYvSWB3FL9F7N9HS
         YHSxoaxYgB+T5ISOt4lR8Y+OpGHXie880p662vtyVO5muEGUj1zhXtzra593KDc8p5Wt
         hIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SfSWlMNkRusRWrFgcNlK5f+Tq18JLveXJe/Yu78G3iI=;
        b=KG4zY0nnT/NNzUhpIsH9Kb0lmVVG9ogC7R1z5CmcD15XcJyU02xYsNeesklCwizpJh
         v/+JxjS+zc6r4bzz+UCxJ+9hTSBHdNKlLtTfLvJoiau4bfmq5Ebf/EoPHucijiq5P4bY
         0PAWm/QtZOF0WcpMCZAGfgl3i2lCUlkS7XOFNPI/5iUqgfvteSTXlDVyl9/OWRpkc8GC
         4F1IObZdOOlL5lHr0vXiVRTOyVCAJgrfYG/dKpXKzTI8c0okZwtEYaNpYyFCyQipTWMB
         WmFStmDm+pNUqe4EfswPIW9U67Sd5RTspxTKI9ksMEiZDdDSua1ovGAhH6m9qQw9rY89
         lLIA==
X-Gm-Message-State: AOAM533KxO8YhnOxTYlv6aPs6MafTb/27AlZ1+uAU+H8nnGbDQWudfvd
        QwfUhNZuYsacnpjyvTowFfbrUw==
X-Google-Smtp-Source: ABdhPJxz42p7tdtH6rARtZ5tspXf4Xt+v1Os/5IYZZ5LAH4xeBEtmOB6nAvaDO8JrK0QbfPExl64+Q==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr2922862wmj.104.1628760118152;
        Thu, 12 Aug 2021 02:21:58 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:3e3:aaac:9c1f:b942])
        by smtp.gmail.com with ESMTPSA id s10sm2720586wrv.54.2021.08.12.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:21:57 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2] media: camss: vfe: Don't call hw_version() before its dependencies are met
Date:   Thu, 12 Aug 2021 11:21:52 +0200
Message-Id: <20210812092152.726874-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe->ops->hw_version(vfe) is being called before vfe->base has been
assigned, and before the hardware has been powered up.

Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6b2f33fc9be2..71f78b40e7f5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -604,6 +604,8 @@ static int vfe_get(struct vfe_device *vfe)
 		vfe_reset_output_maps(vfe);
 
 		vfe_init_outputs(vfe);
+
+		vfe->ops->hw_version(vfe);
 	} else {
 		ret = vfe_check_clock_rates(vfe);
 		if (ret < 0)
@@ -1299,7 +1301,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version(vfe);
 
 	/* Memory */
 
-- 
2.30.2

