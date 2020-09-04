Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B430F25CF32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 04:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgIDCDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 22:03:24 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:28392 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728288AbgIDCDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 22:03:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599185004; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=HLRG701VY73XybmwQ/I+cBnN7Du1gCo7YJN50TYK7Es=; b=xRnFsLvqec9U6Jt5wfPVUWPSEs5SOhpHHh7zBxzqCWS9/0qzNlsMPwPrgJovpE2+0tunhgpr
 vKHFdMDo6elXmwLnuEDPDQB+ivTrIyTcRSQvkzE4+pHWCTKqWAyiIMGYJPC0zhK1W6355cTU
 xWL5bAYnE8iIcEC8DOmvN2DJsPM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f51a06bba408b30ce65d258 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Sep 2020 02:03:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63149C433B2; Fri,  4 Sep 2020 02:03:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBFFCC433C9;
        Fri,  4 Sep 2020 02:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BBFFCC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/msm: Protect the RPTR shadow
Date:   Thu,  3 Sep 2020 20:03:09 -0600
Message-Id: <20200904020313.1810988-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Adreno GPUs there is an option to shadow the RPTR register in GPU accessible
memory. The shadow memory allows the kernel driver to query the value of the
RPTR for each ringbuffer even if it is preempted out or if the GPU is turned off
during aggressive power management.

There are risks to using the RPTR shadow. If it is in GPU accessible memory it
could be read or written by any GPU operation. All versions of the GPU hardware
except A650 requires the shadow to be in unprivileged memory which opens it
to risk.

This series does two things. First, it marks as many buffers as possible as
privileged. For a5xx these are some preemption buffers and on a650 this includes
all global buffers (such as the ringbuffer and memstore). I've sent these
patches before but they tie in well with this series so I've included them.

Then we disable the RPTR shadow across all targets. For all targets except for
a5xx the RPTR shadow isn't needed so there isn't a loss of functionality. a5xx
does need it for preemption so that has to be temporarily disabled.

Later changes will re-enable the shadow for those targets that can safely
mitigate the risks.

Jordan Crouse (4):
  drm/msm: Split the a5xx preemption record
  drm/msm: Enable expanded apriv support for a650
  drm/msm: Disable premption on all 5xx targets
  drm/msm: Disable the RPTR shadow

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     | 10 +++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 14 +++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 25 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 13 ++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 27 ++---------------------
 drivers/gpu/drm/msm/msm_gpu.c             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 11 +++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  4 ++--
 11 files changed, 85 insertions(+), 37 deletions(-)

-- 
2.25.1

