Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24DE2A5A56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 23:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbgKCWyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 17:54:06 -0500
Received: from z5.mailgun.us ([104.130.96.5]:58402 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgKCWyD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 17:54:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604444043; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Xac6G7PfpbwYuIuJLCFCmTAO6YBPK+o+MuYIb3Gxhqw=; b=OsYH6rRw+I7LaUBAonPzWHjQSpHJQYt9KkDOwpimrmQ90AeR/SO54WS/jrF9h6RJxug9XsQE
 BhCn+WkOTTISrb7Ipvjp+zHX2vGZSnON9fvaKf8ochf/IfCw5mXeloAUteTam8CI2/HXCZm/
 0uS/IS6if4SnVvw/tTcRY98DPGk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fa1df7ed981633da3b08506 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 22:53:50
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62F1FC43385; Tue,  3 Nov 2020 22:53:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22F58C433C8;
        Tue,  3 Nov 2020 22:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22F58C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] cherry-pick miised DP related patches
Date:   Tue,  3 Nov 2020 14:53:34 -0800
Message-Id: <20201103225336.17141-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cherry-pick two missed drm/msm/dp related patches to msm-next-staging

Kuogee Hsieh (2):
  drm/msm/dp: return correct connection status after suspend
  drm/msm/dp: fixes wrong connection state caused by failure of link
    train

 drivers/gpu/drm/msm/dp/dp_catalog.c |  13 +++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   5 +
 drivers/gpu/drm/msm/dp/dp_display.c | 172 ++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |   5 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +
 6 files changed, 115 insertions(+), 83 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

