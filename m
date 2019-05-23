Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DA0284AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730987AbfEWRRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:17:06 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35687 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730924AbfEWRRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:17:05 -0400
Received: by mail-qt1-f196.google.com with SMTP id a39so7670238qtk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r1uMx4HlXEIWJhoxtRZuApdyrpL8kUyECxg5uM75EcQ=;
        b=fgrbGFp7nygVomfe4EMnidETfJIB6CM+tkh7RLf66aVDXAFgEMGmyMw9ds1JnFIyH9
         aI6FZXYuBnUWJeSXtErJwiDxtWaBOW903lX4oFmcui9xjC217AaXL7s80elnz/ZASXlz
         XZc3P/lyc2al7uYbmMFJjCOXWYFVkZY/4t0Spn/qGhC8I+aINXeNmSKFHV07owyGS+mz
         JaqgNCaTQkh30BlrketQocvxAeF9TIJI7gjm3SU8Bt72QqQYRIJg7fYhmt/V/RXJ35AB
         LpSQxAIY5nnbYUCuAW6D0Nyuaqkh/sCou9XElxa/v1JhsLLD1pRS2+PNyGCEYoyNrqnM
         Rq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1uMx4HlXEIWJhoxtRZuApdyrpL8kUyECxg5uM75EcQ=;
        b=YYe5xBWqzJj/Qac/FfsRImPgIiKDJFvdtFweUx/B32z7SEbcd+4apeV0F3nqROayxX
         aGbIMlkHFbvODiDwCQ/3QDf1k4Od/I27jfuFFIYjpLiuZrhuTHOMjcW7/3lFKg5k9KRU
         0q/L0F7jK6oc03aEjWNkHLkpNWrLokNbq3dripbwFCOtRigLL1pS7qFmFTjmpIin1grv
         njdlKcD/4rvRewISMkqjUr9OlNcRjO4JhU8/cRTFjtlSySNilGbchdpBaVO4f2VnGTI1
         KlM9SBBjARIMDcaYC1C6fs9mj9H6k7XHa0DkZR/dzp77hMsVkd++2q0SlQ+A4K1MvC8E
         +5LQ==
X-Gm-Message-State: APjAAAXUVbajatlDdwlmfnbRAQ2cddXgpMBE3UTijY/4zfuo3K9IaW3J
        Cj5V6bTXV7hTGCZe1GsNftAeQA==
X-Google-Smtp-Source: APXvYqw6qd2/bm3XDuds3ElkTbvU8jLAH+jx5B8lOufj9jGw5Pr4Vtmo68zBsIF6kAxsiF4lv8g0xQ==
X-Received: by 2002:ac8:193b:: with SMTP id t56mr58719700qtj.346.1558631824791;
        Thu, 23 May 2019 10:17:04 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:17:04 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] drm/msm/a6xx: Check for ERR or NULL before iounmap
Date:   Thu, 23 May 2019 13:16:42 -0400
Message-Id: <20190523171653.138678-3-sean@poorly.run>
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

pdcptr and seqptr aren't necessarily valid, check them before trying to
unmap them.

Changes in v2:
- None

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 742c8ff9a61c..7465423e9b71 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -504,8 +504,10 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 err:
-	devm_iounmap(gmu->dev, pdcptr);
-	devm_iounmap(gmu->dev, seqptr);
+	if (!IS_ERR_OR_NULL(pdcptr))
+		devm_iounmap(gmu->dev, pdcptr);
+	if (!IS_ERR_OR_NULL(seqptr))
+		devm_iounmap(gmu->dev, seqptr);
 }
 
 /*
-- 
Sean Paul, Software Engineer, Google / Chromium OS

