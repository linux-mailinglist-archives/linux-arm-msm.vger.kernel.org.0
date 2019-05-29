Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE0052E6CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfE2U4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:56:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60772 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfE2U4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:56:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5E45D60FEB; Wed, 29 May 2019 20:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163380;
        bh=Q7ZQd878jM/ppuJ4uNWWJeXdoWzwLS/xcQibVXy6ISg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l0rkU5p6c78A9yyAOon8wO29jALyf4dfxO+tiGdkvP7bWZ9WFSJ10/Ip3jjwWHG0O
         RNnIdzTxZJG2kAhcjh19xc9ST7NdUeXIGAG/fCJWaDGLNPL1jlwLXXviGa1QDC08SY
         fI8vcgYLhZ1FY6UofJVUT+ULk3hYGm3QTB3H5bKo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EAD460A63;
        Wed, 29 May 2019 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163351;
        bh=Q7ZQd878jM/ppuJ4uNWWJeXdoWzwLS/xcQibVXy6ISg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2LzsUiEUpDhY8rHCdeqFQfHqXLFLPZdacqRZUXosKTXQTfzq5KShaUFbm1wW4qQn
         40kWnbOGOvRIHp7Gp4FTcfbqjJM2Q4mdBpTAIAtYELW1ZbcY8Wo8WivQ0hEnzih6RA
         0/QkDy4mNnOgEuNQzl2lUaH+cTbza0a1N23OSomg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EAD460A63
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 14/16] drm/msm/gpu: Add ttbr0 to the memptrs
Date:   Wed, 29 May 2019 14:54:50 -0600
Message-Id: <1559163292-4792-15-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Targets that support per-instance pagetable switching will have to keep
track of which pagetable belongs to each instance to be able to recover
for preemption.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_ringbuffer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 6434ebb..493fa89 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -40,6 +40,7 @@ struct msm_gpu_submit_stats {
 struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
+	volatile uint64_t ttbr0;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
 };
-- 
2.7.4

