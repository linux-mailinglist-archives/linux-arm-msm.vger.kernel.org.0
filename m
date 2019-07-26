Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C6176464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 13:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfGZL2E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 07:28:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40223 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGZL2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 07:28:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id m8so17546716lji.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2019 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7MgO7LDfJLI1re2AmLs6fSClTgO04pZ2Z1SN3XHnLo=;
        b=L/TZ3vb3T22EK1HJo+QpkSQL7fhtmr9agOpQ8pWUpl20813rj+CmWCzmfwqt2D54to
         DWNS4kJSBjnHDUgf+X9oCYLxE1orEFH+x89VNk7jykOjUABheMYPrvsCnQNaVFE8SZN3
         3mIK54oD4QUmhWcOZOTtN9UrJT1zKoZ9HGzKb0Yrxq1RtjXRr6tjOY9B7hljvZbC13OS
         reks/ePwtDW5kj50ROfXjekOPnxhGDdp1a0fTE9/FMdR/hVF2EFOeZtoVTaA71eVQ0k5
         mobVZ6zgAuegz3xyvBto6aiJKauJC+/adkzyU7FrLXgarhBd3YqqpBfJgEE4a8Ay7TK9
         1qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7MgO7LDfJLI1re2AmLs6fSClTgO04pZ2Z1SN3XHnLo=;
        b=V33IxFyXJ04uC4ZHUv1lWrnjcMv7wg6r6Q4oxmxo41+Y0gur0UQ0kjfUZwtbvWJJYD
         08lvRS8f00q5/YYGUv5PwLtJ0dzns7enw2p0dqzOaIfq+/IxRqq7XinLzCB0B0qNBlKZ
         kyJB7djdg2/HHECKllEtB//DDcqbzQCl5GG3u4DSkJ3nrylie2zsYGjGSnNPRmV+pL7S
         6lF5r/wYgsu/vS8azn6hIWIqeJLVqkt3wcVMO5Dy6kWXzVz2g5Flk8jKz29NQqagrjVJ
         +30a/3lfes0w3NpnynwSnw9FcmAG/P3UM+hMTchTwBVotXcpjtSpjXqqLvFtDDdTao8+
         DXBA==
X-Gm-Message-State: APjAAAVSCIZrfJlzIh+XbqaMnFhLBDxgqpp1LAa1EOKF7uOhjY7JwR8L
        qKkdZRwjjTHiNh9BtSbP0DXWjQ==
X-Google-Smtp-Source: APXvYqzqkMmWf5XFkm6UgpddOj6fH2dLFSQx8s4YZ6JigCKF75gjO4pcg4iUvXqN26+7VIGRBPcakA==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr1684039ljk.4.1564140481817;
        Fri, 26 Jul 2019 04:28:01 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id v86sm9926234lje.74.2019.07.26.04.28.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 04:28:00 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 3/3] drm: msm: a3xx: Mark expected switch fall-through
Date:   Fri, 26 Jul 2019 13:27:55 +0200
Message-Id: <20190726112755.19511-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When fall-through warnings was enabled by default the following warning
was starting to show up:

../drivers/gpu/drm/msm/adreno/adreno_gpu.c: In function ‘adreno_submit’:
../drivers/gpu/drm/msm/adreno/adreno_gpu.c:429:7: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
    if (priv->lastctx == ctx)
       ^
../drivers/gpu/drm/msm/adreno/adreno_gpu.c:431:3: note: here
   case MSM_SUBMIT_CMD_BUF:
   ^~~~

Rework so that the compiler doesn't warn about fall-through.

Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9acbbc0f3232..8fea014f0dea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -428,6 +428,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 			/* ignore if there has not been a ctx switch: */
 			if (priv->lastctx == ctx)
 				break;
+			/* Fall through */
 		case MSM_SUBMIT_CMD_BUF:
 			OUT_PKT3(ring, adreno_is_a430(adreno_gpu) ?
 				CP_INDIRECT_BUFFER_PFE : CP_INDIRECT_BUFFER_PFD, 2);
-- 
2.20.1

