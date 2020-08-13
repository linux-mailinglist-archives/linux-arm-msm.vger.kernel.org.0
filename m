Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746D724319A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 02:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHMACU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 20:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHMACU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 20:02:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F62C061383;
        Wed, 12 Aug 2020 17:02:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x6so1876010pgx.12;
        Wed, 12 Aug 2020 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL6rjLUzSXMKDMOOhTr8S6EoaPbeYW69JWbRVQ0AlOQ=;
        b=U2gNhKgvUtMwI0xzUVhx//Bq/+qwtjFeuaYS1iveIR3A4bsACyis1XddGwiY6dK2Sn
         6jbT7RsiRVg4o5I9ePAPB9paTugf7W0AFcLzK5wXEbTZo+P35e/+ALwm2rCJrrKtDu3k
         QF8c2z47qQ9ToSjndnfod7w9oaqdqX0rpY9OcEHNQNshW0I1MNOYt8B2wVa6hUuRfxLP
         JX84Att2w1CT9xa5NObA6SMP5S2SXrU9yu9N1jAjKiD8MtKfyIvLn5dP8l7iZy+cIMPr
         eafUH6Ta2blVR9Y7ToWsVuBk8fVhSdKCO5nOlGZBcndN73qqU5NcvBYHd5k9LbAGOJ7U
         1ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL6rjLUzSXMKDMOOhTr8S6EoaPbeYW69JWbRVQ0AlOQ=;
        b=julcxlrFBIA58gh+dHoy4i5doghRosqY1UiB3S5eVZQXhWM2FUfHntEnmX5LnytCD4
         IJAUfkMsQOj+Emap87btcFgXtCpByja0z1BB1KSPQBY7TLQR4irAjkWuCiOMcfqtL2u5
         ctWPFH0Jrrtdb4UZzOevHjwxxhEmc0jaseWr8NjqXmpmVsPgYo0hdidDVxqSHmllBExE
         CbMb7eBLmOMorIE9xCH0rsfnUpfwTq07Y07yTjECcZEvk37Azvn2MDUSkg9Ehv4mICMZ
         OH291lX9v2l/+u7TNMTOj/yRO/WxfuDsqm0VyM6dNv8k/JqKfvZ3an06ffthnwLbYNTi
         BPLw==
X-Gm-Message-State: AOAM532ZU1N1Ufqz/N2Zy/xWJNwV9khpODZ5bEW5KOwWqYjDpWTJUpSJ
        2gGRIR/Dx8TGo7/qtrf117de8x7eB9E=
X-Google-Smtp-Source: ABdhPJyrSzvVBwV+Sltkyb+UhvogaKP8htnyL7cUHmv9324U3QvGSXf9RSUI9G2wmyoYoKvDJUop1g==
X-Received: by 2002:a62:d149:: with SMTP id t9mr1853163pfl.59.1597276939794;
        Wed, 12 Aug 2020 17:02:19 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y20sm3563448pfn.183.2020.08.12.17.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 17:02:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        Takashi Iwai <tiwai@suse.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: fix updating ring fence
Date:   Wed, 12 Aug 2020 17:03:09 -0700
Message-Id: <20200813000311.708728-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We need to set it to the most recent completed fence, not the most
recent submitted.  Otherwise we have races where we think we can retire
submits that the GPU is not finished with, if the GPU doesn't manage to
overwrite the seqno before we look at it.

This can show up with hang recovery if one of the submits after the
crashing submit also hangs after it is replayed.

Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f9e3badf2fca..34e6242c1767 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -405,7 +405,7 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ring->next = ring->start;
 
 		/* reset completed fence seqno: */
-		ring->memptrs->fence = ring->seqno;
+		ring->memptrs->fence = ring->fctx->completed_fence;
 		ring->memptrs->rptr = 0;
 	}
 
-- 
2.26.2

