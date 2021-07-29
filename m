Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C9B3DA770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 17:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237669AbhG2PWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 11:22:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17042 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237314AbhG2PV3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 11:21:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627572077; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NbJPes2JZFM1rbr55unsdW4cU+ak6ueJQ+FFDzIUtdY=; b=TWYBb3PbuVytjv3z66261si0dW3/JnLEO6c+434v6PQvghyy91bKHMKZlT79aMggTox+fEbp
 7WiaF4VcSKu24j0PmajD9EbaONsHwAAakNrzkw0oahc5RrTdw48cYOJox25/fKxPPSgQ0U/S
 FDAr07htVSA/MYqoDMpEqvrawRQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6102c751e81205dd0a8757d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 15:20:49
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 54E28C41611; Thu, 29 Jul 2021 15:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2920C43460;
        Thu, 29 Jul 2021 15:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2920C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Support Adreno 7c Gen 3 gpu
Date:   Thu, 29 Jul 2021 20:50:33 +0530
Message-Id: <1627572036-28289-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the gpu found in the Snapdragon 7c Gen 3
compute platform. This gpu is similar to the exisiting a660 gpu with
minor delta in the programing sequence. As the Adreno GPUs are moving
away from a numeric chipid based naming scheme to a string, it was
decided to use 0x06030500 as the gpu id of this gpu to communicate
to the userspace driver.

Changes in v3:
- Add a cover letter.

Changes in v2:
- Use rev to identify SKU
- Introduce adreno_is_a660_family() (Rob)
- Remove revn for 7c3 (Rob)
- Remove CPR register programing since they are not required for 7c3

Akhil P Oommen (3):
  drm/msm/a6xx: Fix llcc configuration for a660 gpu
  drm/msm/a6xx: Use rev to identify SKU
  drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  8 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 87 ++++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 27 +++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 18 ++++++-
 6 files changed, 129 insertions(+), 44 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

