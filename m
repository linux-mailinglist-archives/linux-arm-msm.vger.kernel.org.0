Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D7053B091
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 02:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiFBAGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 20:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbiFBAGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 20:06:49 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354D3E023
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654128408; x=1685664408;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=GCAGgClSsnPf11wyz+HdVkxKTodfGwXgExHPdRn3LpU=;
  b=HgvdZS7FEQdo7tpYYAnVnu2LKh1kp6l25mYjW1jCFP1ABJ1P8EwgweyB
   FSQgirJ6ZRxssBYZcKMF2o96iq95N1U9Avo4ixS1a86oA7QxCsW1pYCAK
   TRuqIwwvEIKaF2NVG5ozl8UMx5etl0JSY5TCeg0e/HiOL53iIhf/Mb+P0
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jun 2022 17:06:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 17:06:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 17:06:47 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 17:06:44 -0700
Message-ID: <927b201e-a734-a29d-b9fb-b9889e1f7795@quicinc.com>
Date:   Wed, 1 Jun 2022 17:06:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [GIT PULL] drm/msm: drm-msm-fixes-2022-06-01
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob

Here is the second pull request for the fixes for 5.19.

This goes on top of the previous pull request.

Mainly it has the foll fixes:

- Fix to add minimum ICC vote in the msm_mdss pm_resume path to address
   bootup splats
- Fix to avoid dereferencing without checking in WB encoder
- Fix to avoid crash during suspend in DP driver by ensuring interrupt
   mask bits are updated
- Remove unused code from dpu_encoder_virt_atomic_check()
- Fix to remove redundant init of dsc variable

Thanks

Abhinav


The following changes since commit 1a5409facf9ceba401f83925c6d15bae2121d29c:

   Merge tag 'msm-next-5.19-fixes' of 
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging 
(2022-05-19 11:21:17 -0700)

are available in the git repository at:

   https://gitlab.freedesktop.org/abhinavk/msm.git 
tags/msm-next-5.19-fixes-06-01

for you to fetch changes up to b9364eed9232f3d2a846f68c2307eb25c93cc2d0:

   drm/msm/dpu: Move min BW request and full BW disable back to mdss 
(2022-06-01 16:16:19 -0700)

----------------------------------------------------------------
5.19 fixes for msm-next

----------------------------------------------------------------
Douglas Anderson (1):
       drm/msm/dpu: Move min BW request and full BW disable back to mdss

Haowen Bai (1):
       drm/msm/dpu: Fix pointer dereferenced before checking

Jiapeng Chong (1):
       drm/msm/dpu: Remove unused code

Kuogee Hsieh (1):
       drm/msm/dp: Always clear mask bits to disable interrupts at 
dp_ctrl_reset_irq_ctrl()

Vinod Koul (1):
       drm/msm/disp/dpu1: remove superfluous init

  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  3 ---
  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c |  4 ++--
  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             |  8 --------
  drivers/gpu/drm/msm/dp/dp_ctrl.c                    |  9 +++++++--
  drivers/gpu/drm/msm/msm_mdss.c                      | 57 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  5 files changed, 66 insertions(+), 15 deletions(-)
