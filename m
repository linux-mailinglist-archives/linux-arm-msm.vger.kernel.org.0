Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D83B45AE44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 22:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbhKWVYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 16:24:36 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:16397 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbhKWVYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 16:24:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637702487; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ee7jLp+Udhos/5Xwo09c+o9YrLbNOM+j1KyKzFHc2gA=; b=B57pR3yFKzNDDBFJJ6ywoHOyDiBfOy81MN+anpVt6Fc/iCGQh6w0nYjDDlwDWsAM3ZRSJdG5
 NpHLlAVdP+oHzRACghZgyb9dPRNWzNh8jKQ7jCcmJGX+6Wutad0vRWIfMl1jlO+PfzBz/jz4
 jywNLusffhSs29D6/3ReYOEjlDU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619d5b575daaeec7971ff6c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:21:27
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF86EC4361C; Tue, 23 Nov 2021 21:21:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75D54C4338F;
        Tue, 23 Nov 2021 21:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75D54C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] drm/msm: Increase gpu boost interval
Date:   Wed, 24 Nov 2021 02:47:50 +0530
Message-Id: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, we boost gpu freq after 25ms of inactivity. This regresses
some of the 30 fps usecases where the workload on gpu (at 33ms internval)
is very small which it can finish at the lowest OPP before the deadline.
Lets increase this inactivity threshold to 50ms (same as the current
devfreq interval) to fix this.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

Changes in v2:
- Added patch (5) & (6) to this stack

 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 84e98c0..5028f92 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -167,7 +167,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	 * interval, then we won't meet the threshold of busyness for
 	 * the governor to ramp up the freq.. so give some boost
 	 */
-	if (idle_time > msm_devfreq_profile.polling_ms/2) {
+	if (idle_time > msm_devfreq_profile.polling_ms) {
 		target_freq *= 2;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

