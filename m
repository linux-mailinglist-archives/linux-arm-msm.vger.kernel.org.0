Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C492A2F52F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 20:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbhAMTBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 14:01:48 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:59691 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbhAMTBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 14:01:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610564490; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=v+t5ZjZHmOvSSICCDPJB44KGvtnlC42GelECNsheDPI=; b=HKAxBIssaaFpaAruyoaGNJ/+6c2TX1CRLFHwXgqbkge7XKpFtR+CwVIr0ecQf/oKJhrtTYWL
 jGDcCn++YsoTQ0Rg6Ils+3ii4RFhWHzZlCp7HPBHTHyLNCQlr33v9d4c4LwEZF7deTqV9ZN9
 qQDZnRbAib44A+GTzSAyTmI+bT8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fff434c46a6c7cde7dbb9cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 19:00:28
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AB56C433ED; Wed, 13 Jan 2021 19:00:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9D9FC433CA;
        Wed, 13 Jan 2021 19:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9D9FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2]  fix missing unplug interrupt problem
Date:   Wed, 13 Jan 2021 10:59:58 -0800
Message-Id: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
Therefore irq_hpd handler should not issues either aux or sw reset
to avoid following unplug interrupt be cleared accidentally.

Kuogee Hsieh (2):
  drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
    read
  drm/msm/dp: unplug interrupt missed after irq_hpd handler

 drivers/gpu/drm/msm/dp/dp_aux.c     |  7 -------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
 5 files changed, 50 insertions(+), 15 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

