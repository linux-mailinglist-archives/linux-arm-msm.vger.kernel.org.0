Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29AB7198DC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 09:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgCaH5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 03:57:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23447 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729425AbgCaH5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 03:57:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585641426; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dVNPuFwMQs3mGQ6A/aNYnqJJmJ84rfGZXTYWK1NW09c=; b=EKkrwcQIT9ka1wAAVCJmKL5zgJQV8la2wt7E2tL88UFG7XhmXv3TFGPTEqL4Kvi8XTYbtkc/
 LE171G8K1JbRRtyaj3qmfBtyNOfzr/8jkgaj3KLftlGFbh0ooqg22IYtN5KEObp4lvdONxHw
 oHpKb/922LO7JsGFTTai7qQHy4U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7c4.7ff857154d18-smtp-out-n04;
 Tue, 31 Mar 2020 07:56:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE2F7C58A02; Tue, 31 Mar 2020 07:56:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CE7CC43637;
        Tue, 31 Mar 2020 07:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CE7CC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 4/5] drm: msm: a6xx: Fix off by one error when setting GPU freq
Date:   Tue, 31 Mar 2020 13:25:52 +0530
Message-Id: <1585641353-23229-5-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes an error in the for loop, thereby allowing search on
the full list of possible GPU power levels.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 489d9b6..81b8559 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -176,7 +176,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 	if (freq == gmu->freq)
 		return;

-	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
+	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs; perf_index++)
 		if (freq == gmu->gpu_freqs[perf_index])
 			break;

--
2.7.4
