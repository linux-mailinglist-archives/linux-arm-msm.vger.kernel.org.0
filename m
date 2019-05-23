Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51BF0284A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbfEWRRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:17:02 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43585 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfEWRRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:17:02 -0400
Received: by mail-qk1-f194.google.com with SMTP id z6so4249247qkl.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
        b=Z1BBTBNQGFwi1a6YCUrwlBkcg4d0qRPyeFFxcIpPo4kL342FYfzrTCrsCkzAKJSa8D
         kCvCZ4JJX1m+FaxkU6hE15FHkcAFiT2zElk/si/zSkchoOAdiwBxiOLRU0lML2gbFAFs
         Rg5cE0bbhO58zclxCiqYroZnyhw2gnIFuJ6HBh83XRG1VtMiuf65JIJdSxWZtfJvw94P
         Qq5yMfEY+W/7B2yQ1pB1dzV/MwFKp6QkShaRF+MFs/e2FgyMUxrZNt9lQ4K8MjDBNhVv
         +R1ZRdQv5bv4yai7m51LsnP6d0vgTkdl+odwD3o3xD/PGRz88NrIgiGzuFCZchP1VT9m
         rdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GCPOgKXDLNcR6sFL6yT6feeZpVf/aYG9QLic+JdxubM=;
        b=M2NwMGqKaRJ+cZz3C630qc2UI2Au4+UCFeIPEBFwxgBE0dZUz4K4DFyKMsU6Um+MCA
         nNLRHxMIGMJs82GHB5kopexQFoDY0/5aK/FW2lEeS/Yo1+AQfq39S4YLS2g+MfKZZw81
         KvsNppEMujx4clQrBkl/9YanJ7KlOrIL/3HyOiIzxMjueSQEdCYf3Ejk0g7ZrNeDdVcP
         BKkM83NYv/UYU/LfPRqPBZbR2bPtdEmIPRAGkbO1LEUx9PPk2OfQgoqQqahXryQV3Z2P
         77r7HPcBsK26Q8+2YgGUJcMA9bMDw6G1FAz67fWyzDqIZpk+a+nv7T+oMyEBp1NCeLxz
         cEuQ==
X-Gm-Message-State: APjAAAVHlEvtAO+yAUXleVtgauTeiX4pzP5VoqplgvrMyfxYrmrgagtt
        iPBUY+IG74LNcuAUNJ1X1n41cw==
X-Google-Smtp-Source: APXvYqzQK71cctzLw03xT3jdNw0SD9PtL3nBDxCQtUeUy9B9Z9lczPE6z44Z2LgpEKo1y0LKyhEpiQ==
X-Received: by 2002:a37:bd42:: with SMTP id n63mr32955087qkf.262.1558631821916;
        Thu, 23 May 2019 10:17:01 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:17:01 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/6] drm/msm/a6xx: Remove duplicate irq disable from remove
Date:   Thu, 23 May 2019 13:16:41 -0400
Message-Id: <20190523171653.138678-2-sean@poorly.run>
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

a6xx_gmu_stop() already calls this function via shutdown or force_stop,
so it's not necessary to call it twice. Previously this would have
knocked the irq refcount out of sync, but now with the irqs_enabled flag
it's just housekeeping.

Changes in v2:
- None

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aa84edb25d91..742c8ff9a61c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1239,7 +1239,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
 
-	a6xx_gmu_irq_disable(gmu);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	iommu_detach_device(gmu->domain, gmu->dev);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

