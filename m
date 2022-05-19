Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B0052DA0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 18:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233979AbiESQVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 12:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242065AbiESQV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 12:21:26 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281A7C03B2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652977284; x=1684513284;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=OgFPRDCgT5PDUUJnCeD3XeLnIAuSjY8zzzo6IowuC5Y=;
  b=U8JK0OD7jGiDB67r11RtZyZzvsEJzxMZF69IIiMJlRXufHObXyGIkoMm
   sdy8R35Ne3S0G1e/60IbflIzUgUNHDA2vyf320bhzfyPyc9KX2PEiU1Kz
   dlWymEBerh7eFn7VYaVyuwLsRYK8t9Qa1YWmPZC0QYp17eCtyntFivpbx
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 19 May 2022 09:21:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 09:21:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 09:21:23 -0700
Received: from [10.38.246.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 19 May
 2022 09:21:21 -0700
Message-ID: <b011d51d-d634-123e-bf5f-27219ee33151@quicinc.com>
Date:   Thu, 19 May 2022 09:21:19 -0700
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
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [GIT PULL] drm/msm: drm-msm-fixes-2022-05-19
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Here is the pull request for the fixes for 5.19.

Just a few more changes on top of msm-fixes-staging.

Mainly it has the foll fixes:

- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
   in the bind() path for dpu driver
- Fix the irq_free() without request issue which was a big-time
   hitter in the CI-runs.

Thanks

Abhinav



The following changes since commit 947a844bb3ebff0f4736d244d792ce129f6700d7:

   drm: msm: fix possible memory leak in mdp5_crtc_cursor_set() 
(2022-05-18 11:05:21 -0700)

are available in the git repository at:

   https://gitlab.freedesktop.org/abhinavk/msm.git/ tags/msm-next-5.19-fixes

for you to fetch changes up to 64b22a0da12adb571c01edd671ee43634ebd7e41:

   drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path 
(2022-05-18 18:32:03 -0700)

----------------------------------------------------------------
5.19 fixes for msm-next

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

----------------------------------------------------------------
Abhinav Kumar (3):
       drm/msm/dpu: limit writeback modes according to max_linewidth
       drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported rotations
       drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path

Dmitry Baryshkov (1):
       drm/msm: don't free the IRQ if it was not requested

  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 4 +++-
  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 2 +-
  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
  drivers/gpu/drm/msm/msm_drv.c                 | 7 ++++++-
  drivers/gpu/drm/msm/msm_kms.h                 | 1 +
  5 files changed, 14 insertions(+), 4 deletions(-)
