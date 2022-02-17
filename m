Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154644B9749
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbiBQDyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbiBQDyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:22 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FD42A22A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o2so7616270lfd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPj9DuFzc5wZ5qQDoHU9zhJ7waGhcTk9Ut8y80UuXAM=;
        b=tFwAzo8/ZkBmIsV8kBDnMGFLrFx0YVbo1/v1NkcCxew+ugdeUOkOLEF5s1l60HAIlg
         +UTcM3jBsiedN7bjiJAIJKVjlE5h6jJj6zOZOd2DzqQoitC2oq5iBFLy0c8dnIAnqJWj
         rghldG033hGjmte5SyVgNEFOEWDbG/w7Zi22lR7R1I475hMEycqGDSEsWG831dLwlHDD
         J6kTLO8Fkj1etrUG38xREAO8qn6lq1KKFkLkZjesz2WibititxP6O1VH3MYyrvllCEoS
         OSnK6cD4Ysk65dH/afwvZ6+tq88MJkR4Sruku8tmBIFTk69oOzHybRAU7KZdudRQUZjm
         rwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPj9DuFzc5wZ5qQDoHU9zhJ7waGhcTk9Ut8y80UuXAM=;
        b=o4yasYmzaVQV3CKoXAqefI4zQwQnrJ9rE+TQiGpFnDYu73Wq5BTFek+4BCr6GfNup1
         kk5nl+mHEu7yon2tBPQ2tKWItMRS9E8ONsUb4ZPtXkLTiQ62rzhB4YOaQ2SAmGzF+kmO
         dmwDyhEwN2rMXmGIveMzPt5TzLwhsxIrE6lrbaoOUAjgC25JzGINBCut2T6l58XFTN0a
         PFdHsR17ceMT+a+jRZFkTGMHa9Aiiz/3RNeiCYQ4y5cRR7W6XXXQeoDpNEU355aMIhs0
         4ZBiPXvSn5E3bt2PdNSUJkyN+SyGooWd3AXe20IqWYfnXc/wSK0gpripXShtazZeenK3
         Rs0w==
X-Gm-Message-State: AOAM531oPneSIchYpMY1FZwqjDsCokfJXU5tcSOLxRG3FPk95hMEHfbk
        Tsqe3rLNvLfA9TI8MkKk6Od+xw==
X-Google-Smtp-Source: ABdhPJwrDPuNGRBBpzwRI7zFEF/VQ/jywG2z0N4Dw+fa1UFbf/A6EiND5HP39WpqV+2Wru3RRtG8Gw==
X-Received: by 2002:ac2:4250:0:b0:443:3d07:7b5a with SMTP id m16-20020ac24250000000b004433d077b5amr805701lfl.305.1645070040403;
        Wed, 16 Feb 2022 19:54:00 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm/dpu: cleanup dpu encoder code
Date:   Thu, 17 Feb 2022 06:53:51 +0300
Message-Id: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset targets DPU encoder code, removing unused artifacts (empty
callbacks, MSM bus client id, etc).

Changes since v2:
 - Expand commit message of 7th patch (pull connector from
   dpu_encoder_phys to dpu_encoder_virt)
 - Drop intf_type patch for now, as it causes controversy

Changes since v1:
 - Split dp audio fixup from the intf_type patch
 - Remove atomic_check() removal, used by the posted WB support

Dmitry Baryshkov (7):
  drm/msm/dpu: fix dp audio condition
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused mode_fixup callback
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 59 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 18 ++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 14 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 ++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 ++-------
 drivers/gpu/drm/msm/msm_drv.h                 | 18 ------
 6 files changed, 45 insertions(+), 120 deletions(-)

-- 
2.34.1

