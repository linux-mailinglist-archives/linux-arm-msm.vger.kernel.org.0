Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231863C73A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhGMP5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:57:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40712 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbhGMP5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:57:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626191699; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ISnkaTcNJcI8305yLt52TZLR5pfbH41+7hRWFRezhug=; b=ud0YOt9M+PzXv6hdPTaxXMfIdXVrMrtPyJxnYMPgpBusUoqOykCHNkS8+fuUl0nxnKbInBUT
 Vgc4i/R3SKoxl/VUfiuOJtQXa5JgBjRKYskRVSUotcZDGAz0f3Ou7Sk4Etf3pMMvzCDnebr0
 UObN5PAl8O0ucCR82IPF1B1TOSQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60edb73adc4628fe7e72ea47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:54:34
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9ACB5C4323A; Tue, 13 Jul 2021 15:54:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17300C433D3;
        Tue, 13 Jul 2021 15:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17300C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] add fixes to pass DP Link Layer compliance test cases
Date:   Tue, 13 Jul 2021 08:54:00 -0700
Message-Id: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
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
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 145 +++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.c |  13 ++--
 drivers/gpu/drm/msm/dp/dp_panel.c   |   9 ++-
 4 files changed, 110 insertions(+), 60 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

