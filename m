Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B4D284B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731157AbfEWRRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:17:11 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41024 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731140AbfEWRRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:17:11 -0400
Received: by mail-qt1-f194.google.com with SMTP id y22so7629907qtn.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAxvAIcKgOQtgxLFmLme64DEPUv6dyfyGiKy9z9/MCs=;
        b=V0CFGOhhRC9eOWybC6/ZBTPxvnDMwWa8evXcjFmVfoOF7xn1ScLItpDL3v/QCcz/QX
         1wzP9oTnirrNEy2iiPcV4Lg/ITtuPPrbCzYpG1fKug7lRL0OrvjUCMHlNcK6CvH2318I
         4SqhOH8ZWTfrtUaanBHb8TCdO8xRCQZbeflqzPt8OqFzNrLoQ0bPgTPbHMvcB7JyDiDZ
         AbVW4myrmGjYp6ArQkkS7s0z2FDKZR+Z0lJMOYvt6J6zaOnXIrwCOuqk8KM0sGltNNIC
         W576cyuZhs6n1Xcw0NPM7KLGwkyshxKBySWID0gN/7UQW71pIfT+i2Ln/b3PgkrlPo9J
         IfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAxvAIcKgOQtgxLFmLme64DEPUv6dyfyGiKy9z9/MCs=;
        b=Se8Q8c1mYRBzfkCVjSLmjyCAYQN3t7NMqvN0apXwhxkI+cEvEZm09jgWtqWyOnOqMH
         /LWlBfoa/9HRheUwbjEpHnOUpEQKGLShM8RdpEHme2qAjXJGV8D10Q/S5M8F0Csx61CP
         QXBaWWxZMj/CDcX+U243ufPEP45q0g+7XwwGzlexr2mD41gvq216ZjTSGNg7TBN/ry3H
         nDvtX9ZJdoRcaxvPTI148Ar3E5JoY2MtNTt0RiioYArbS8PxBfCfEGy+j6M+at7wLKyO
         ilOpRppGcqlxepN8Hee3M2AVyiILH3sT5KUxhVm1OS6eExsOM/BNow91eczmgTqyxwDD
         K/gg==
X-Gm-Message-State: APjAAAVEg1wDw294gl1dB6VYAjnh1hJFk/vVJUNBhI3XPEvW8LeIXZg8
        wXr5OaYT4SSSDdkNa03JfZfaHg==
X-Google-Smtp-Source: APXvYqyYw1/bFwr5ugr6PT9CZN+/0NEYxJLX3rL7031w7JMYQiQvCowH+7AbKLe2zMD0244RVWYD4A==
X-Received: by 2002:ac8:38c6:: with SMTP id g6mr12497608qtc.353.1558631830415;
        Thu, 23 May 2019 10:17:10 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:17:09 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/6] drm/msm/a6xx: Drop the device reference in gmu
Date:   Thu, 23 May 2019 13:16:44 -0400
Message-Id: <20190523171653.138678-5-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

of_find_device_by_node() grabs a dev reference, so make sure we clear it
on error and remove.

Changes in v2:
- Added to the set (Jordan)

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f7240c9e11fb..e2b839b5d3bd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1253,6 +1253,9 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
+	/* Drop reference taken in of_find_device_by_node */
+	put_device(gmu->dev);
+
 	gmu->initialized = false;
 }
 
@@ -1277,12 +1280,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Get the list of clocks */
 	ret = a6xx_gmu_clocks_probe(gmu);
 	if (ret)
-		return ret;
+		goto err_put_device;
 
 	/* Set up the IOMMU context bank */
 	ret = a6xx_gmu_memory_probe(gmu);
 	if (ret)
-		return ret;
+		goto err_put_device;
 
 	/* Allocate memory for for the HFI queues */
 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
@@ -1334,6 +1337,11 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 		iommu_domain_free(gmu->domain);
 	}
+	ret = -ENODEV;
 
-	return -ENODEV;
+err_put_device:
+	/* Drop reference taken in of_find_device_by_node */
+	put_device(gmu->dev);
+
+	return ret;
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

