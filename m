Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291083675BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 01:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244053AbhDUXih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 19:38:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25277 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231510AbhDUXig (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 19:38:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619048283; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+Sv7ExPVdQKMsTngc9Z59FaHYxa3ZOvl5+VAeKdYdY0=; b=ahIjUVKh9d5fhpfOgV2XMBJ96zE0cYeFHHe5C7IXSW0/4tpK6rb6Bv7rO3ytnDerMNVokrGN
 PzmWfebqWhb2PjO4yqB6kIsPbqFxA28pnpseVuKSCycaDISfFSO87v+8i6t4VwGlHM90EAYO
 zbhieGloLOcw6KH3p61g7W/fqfw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6080b7572cc44d3aead5b875 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 23:37:59
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAB19C43145; Wed, 21 Apr 2021 23:37:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A31F0C433D3;
        Wed, 21 Apr 2021 23:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A31F0C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] check sink_count before update is_connected status
Date:   Wed, 21 Apr 2021 16:37:34 -0700
Message-Id: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1) check sink_count before update is_connected status
2) initialize audio_comp when audio starts
3) check main link status before start aux read
4) dp_link_parse_sink_count() return immediately if aux read failed

Kuogee Hsieh (4):
  drm/msm/dp: check sink_count before update is_connected status
  drm/msm/dp: initialize audio_comp when audio starts
  drm/msm/dp: check main link status before start aux read
  drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
    failed

 drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
 drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_link.c    | 20 ++++++++++++++-----
 5 files changed, 48 insertions(+), 17 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

