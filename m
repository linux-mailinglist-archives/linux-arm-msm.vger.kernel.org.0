Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944DB1FD66F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgFQUx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQUx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:53:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC4BC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:53:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ne5so1538933pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rkwd2ka8Z7iO2pJxHXIRpwXonoZgh2tKHVmhTEheWDo=;
        b=ankX+yV3pTmnsA/EifSsAOqJzVbig1w1EwLxdujI9nqFQz069s7Fk775dKVyb77dZz
         lsPW2YGgbcyA3+CjH4idHRgLZ94mALQ2IjTUKoioyiNO8+//px24k4CRWfcNgZThRtrV
         SrVLqkHIkdcIAG+Ajf9KeNtMOuZC+3HGLZ/nRTDRer73f/76QobJZP52SyTCPDWBrtOP
         M7nvex6ZuDmGWg8hUvoB+co44d9rgwp6dVbl3WtsAK5Oz/bvPtC+dxGri4nOmSMHWZVV
         ciZ+p0m+yFcsotHidWlmJg1FcX0M3/PgJG2tzDLv0qYXaNrqFbr4RREJ9ZjJPMJlaxmO
         QEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rkwd2ka8Z7iO2pJxHXIRpwXonoZgh2tKHVmhTEheWDo=;
        b=SDT+lSIdhrOiIR2F3Yepev/j5+oHSdT3IMWVWEFi3SBnX/ZFvfJTluyU5gwyIZEsLV
         11Pb06pY9DpzTODPYQEWkp5U2+E4cXAjfOW+3vxW8rdkgKJQLFyf1nm+TewRqmntBmg9
         bgxXFUS+CZlOpfQ9MklpHUMms2QhJAHoapSbkXQU988HpG18UDGYzvcg0Mil5gfhLLdU
         4g832XyZ4tDVxHJFw+M3xZRcYjyuARQULIurVHqq7KYF3cL5a8A1qw/qJNXA9PRPdSmO
         rOfjo2T0EWQOjwxRfUx/d3LEnL7QAGBW7UeVvB0y5fU9LzYtZLmXv4ydWukNGvLayAIt
         JXAw==
X-Gm-Message-State: AOAM5309qbIvo89PGWQFlSGh7seq4tTYBXhQiRLSnOywyEhMiI3v2Ycb
        6phSPRI2ckk72uTJ+pXi/CtdjQ==
X-Google-Smtp-Source: ABdhPJwJ2UTlCE2dQ2laBUA/pxpoSp23Y3LfsK2W24qN8hJszwXs3PuSNGnOaofSqf1abQraw6x8yg==
X-Received: by 2002:a17:90a:2683:: with SMTP id m3mr859532pje.196.1592427206091;
        Wed, 17 Jun 2020 13:53:26 -0700 (PDT)
Received: from miranda.anholt.net (c-73-11-63-120.hsd1.or.comcast.net. [73.11.63.120])
        by smtp.gmail.com with ESMTPSA id ca6sm392454pjb.46.2020.06.17.13.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:53:25 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/2] drm/msm: Fix setup of a6xx create_address_space.
Date:   Wed, 17 Jun 2020 13:53:10 -0700
Message-Id: <20200617205310.2183722-2-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200617205310.2183722-1-eric@anholt.net>
References: <20200617205310.2183722-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't want it under CONFIG_DRM_MSM_GPU_STATE, we need it all the
time (like the other GPUs do).

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a1589e040c57..7768557cdfb2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -893,8 +893,8 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DRM_MSM_GPU_STATE)
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
 #endif
+		.create_address_space = adreno_iommu_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
-- 
2.26.2

