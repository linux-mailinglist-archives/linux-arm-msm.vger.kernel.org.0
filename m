Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C323BDC18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 19:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhGFRXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 13:23:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25641 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbhGFRXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 13:23:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625592043; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kO74fHDbPrFpMaIWsRfS16Mih4MOjr/cYH0rdxML+ws=; b=Oz9uWYyK/PdnMbvkcFOUAQ3UNyDXl7IhoUK520B/cuTndwrR7OhPXcIP6SlTFjE/hk803hY0
 PmWbFElYgJJfnC5Rmut8KC+VXxgQSkZrOcuilVn2L07Fj0SQ++WGwzRgMQeh0hWM30mcVTlE
 lBXSz8Cgoe9ih5RAk5K9eVkKaC4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60e490e15e3e57240bcefdf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:33
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 622FDC43146; Tue,  6 Jul 2021 17:20:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 040D0C433F1;
        Tue,  6 Jul 2021 17:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 040D0C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] add fixes to pass DP Link Layer compliance test cases
Date:   Tue,  6 Jul 2021 10:20:13 -0700
Message-Id: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add fixes to pass DP Link Layer compliance test cases

Kuogee Hsieh (7):
  drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
  drm/msm/dp: reduce link rate if failed at link training 1
  drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
  drm/msm/dp: replug event is converted into an unplug followed by an
    plug events
  drm/msm/dp: return correct edid checksum after corrupted edid checksum
    read
  drm/msm/dp: do not end dp link training until video is ready
  drm/msm/dp: retrain link when loss of symbol lock detected

 drivers/gpu/drm/msm/dp/dp_aux.c     |   3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 158 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.c |  13 ++-
 drivers/gpu/drm/msm/dp/dp_panel.c   |   9 +-
 4 files changed, 127 insertions(+), 56 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

