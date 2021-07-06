Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9814B3BDC1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 19:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhGFRXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 13:23:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35692 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhGFRXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 13:23:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625592054; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VGIy1W6ivYT8sZ3EiOYv0LQr/+OaguC7PuT4KKQp+Q8=; b=YD3af/+AJgSleJ8leAa8ktb/7lwXF7uWJq96CenGvOurFScCVazgr/P8ncuJ2NvTGbIB/XLL
 Q3fEOCZGtp4fhFOqI8Swxh88Eog02VIKQLBBgVl69abpB8A5jOJkS/Zf4tR8Vtht1+H5XF0S
 F8k5U47wtQlNlIM9yQmnG8/nlJg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60e490ecad0600eede5ff72e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:44
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F23EC4323A; Tue,  6 Jul 2021 17:20:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0306EC43217;
        Tue,  6 Jul 2021 17:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0306EC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
Date:   Tue,  6 Jul 2021 10:20:16 -0700
Message-Id: <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Aux hardware calibration sequence requires resetting the aux controller
in order for the new setting to take effect. However resetting the AUX
controller will also clear HPD interrupt status which may accidentally
cause pending unplug interrupt to get lost. Therefore reset aux
controller only when link is in connection state when dp_aux_cmd_fifo_tx()
fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 4a3293b..eb40d84 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
 				dp_catalog_aux_update_cfg(aux->catalog);
 		}
+		/* reset aux if link is in connected state */
+		if (dp_catalog_link_is_connected(aux->catalog))
+			dp_catalog_aux_reset(aux->catalog);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

