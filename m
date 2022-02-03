Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007874A8065
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349500AbiBCI0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349573AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BA6C061751
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z4so4395737lft.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S38tuxTwAJF2h0gRAdGhSXbP3RaFlufeQHI0R6YpVOU=;
        b=aWN6QKSPaM41d5unF2QXaafMSwWO7hi4eOS4AVCDKNIWIISbQJtAqbyYCy9MtFVLmH
         QTikXmb+lWaWW1Imx818pj2+p47bsadYEtrQ113ok8k+a7suBuVc+j/1pOuVgu9YJ9fm
         CFnUXNNiXQzmIahD6thOTfjn4XFrmPlj1g/uWS2gVmblGY2vOEHIHqTZNmUCGt+1oMof
         3XkwcWGLkvHOhgOjFafCJGTuJ3Y9zc7FbclwS0PyXYufE7XdWB47tUqUryAO4XQb5vzu
         mufi6ze2Zr9ipi/8l/DHUi580vcIpndMg33n0Qcs1z4anG0NErGxyDYEvryicOvnbwRN
         wZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S38tuxTwAJF2h0gRAdGhSXbP3RaFlufeQHI0R6YpVOU=;
        b=InDeOeUS7UMvIutkrgAyAm8InlRs2ccn+WArv1+fnQAyqiotwcVSG4Z+HjphP+LapH
         /+qjJlel3Fo688cEmR7x4Y+ip52G+VU84qveBGr/x9fl1Jza8Imwya6adHpapOfuYo5K
         G/ul/U/Su7j79FLcgobxOedPz2Y2pcdj6uMqLaMLnWcfSbEnGWkv7KyuskUk/YI41sly
         rD683JuXojMTB/FJL+ClIvPFBbw0iTAcikVpgRj8B09n5yYbY2bMiaWAA/NPoYnX/oEZ
         cYk3o/fqpIA5k1mWZkugOSvudz+5YNyMDz/RBzNYFsDS93bEn3loleh0C7pUnFqzD+iN
         i20g==
X-Gm-Message-State: AOAM532xxaASzX2x3W9jfFmcU9ekHnUOkF1kQ6DxX8auSgb3AGIOzu2O
        s9E8/VKthQIy9ORuorXMnnTLhQ==
X-Google-Smtp-Source: ABdhPJzTuWkFCHuo3KIaNz64Zq3zWmSn2BH5AXTpKPvbi2E5D4xcbKbDwwl5d9BZx95Tu9HdRou6gg==
X-Received: by 2002:ac2:5ccc:: with SMTP id f12mr26515293lfq.335.1643876773463;
        Thu, 03 Feb 2022 00:26:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/7] drm/msm/dpu: cleanup dpu encoder code
Date:   Thu,  3 Feb 2022 11:26:04 +0300
Message-Id: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset targets DPU encoder code, removing unused artifacts (empty
callbacks, MSM bus client id, etc).

Dmitry Baryshkov (7):
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: simplify intf allocation code
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused callbacks
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 118 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  18 +++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  18 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  28 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  28 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  18 ---
 7 files changed, 63 insertions(+), 169 deletions(-)

-- 
2.34.1

