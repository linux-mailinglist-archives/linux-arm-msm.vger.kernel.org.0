Return-Path: <linux-arm-msm+bounces-2996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022008017E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 00:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975231F2104A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B023F8E7;
	Fri,  1 Dec 2023 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrmszY8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEB51A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 15:42:37 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bc39dcbcbso3775751e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701474155; x=1702078955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycxynjmtRt/XVGvqx16uPR6ksjV7oaeAV/Qc50+s7Yw=;
        b=qrmszY8SAWP7AOItDUd+gdhehsE2P0KeYuZwiLTSEhMUdDTUV6AJZiLavDsigt7BT4
         LcjFustDTcCPoIUJZHlLDQ3ifFFCbH7nbSJUtLZlp/YsgCZp8tzRFIy41J3e3L9AEYOw
         1eUCKjrvoDOYtUlfF+u+pZ2v3b55YWNQtXTOOi5pY4a4LHWUHqTNEvcruPSiQFK3qMop
         F0xjo1aO8hg9o+Ekpub4vhXpPgL7aYJ0nMp6Oa7/4YO/5fHaxuyPaRztI49EaRpTPLis
         P222k7hxjiFpJgVPtlGZIRE0vuG9qSQR4+Hh1N8OsB3LaVXcbZNc4tRJYVd4CVunuXiK
         xPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474155; x=1702078955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycxynjmtRt/XVGvqx16uPR6ksjV7oaeAV/Qc50+s7Yw=;
        b=hlsN04681o7iGH/qHto314pDMqULd6enNFkdTbhG1Yk/HZtKxdTtMF0Oq4unkox7li
         ST2V2I9tQtdfVX1ItxuIxprr7190LW1ZfvLsxLQnVNKmW9E44JIMm3mO9Ds7jrK+U1Dd
         DI6C11FfpsRhgs7G3queh4ihmq/K5cLaU3qjKDhQ5CaqDy1Oj9seR4DUMsHfNcPtxtyA
         f4bIdekFNYNb7CW8dw1pQtFxY+BH0zQrqEOFvutjiv9mtu9l/RoJmFi4p1LeliBnJm/i
         m4RoyDkXhR8vGFnFnuQjXhCXSRF/oMoTrYqF1Au7AylSOm5/3EAUGDPhqdvy/Xo2k7IJ
         HQmQ==
X-Gm-Message-State: AOJu0YzZ+C9krgFWOTez5LazBBZWfD7kgX964GHGu1JendddBWQfF9la
	Tkv2zp2zNsW5Rt5Ehs2vkrWKfQ==
X-Google-Smtp-Source: AGHT+IGAd7fnI91i4slPrz65STgvKx2zQuzr38iUxZWkNmG6MAvGyJrGwRQrCctMuy6rdAXt6t9OHg==
X-Received: by 2002:a05:6512:48f:b0:50b:e056:396a with SMTP id v15-20020a056512048f00b0050be056396amr449640lfq.28.1701474155273;
        Fri, 01 Dec 2023 15:42:35 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:42:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v7 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Sat,  2 Dec 2023 01:40:24 +0200
Message-ID: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

While we are at it, also fix all VIG subblocks to contain correct scaler
block version and drop the becoming unused QSEED-related feature bits.

Changes since v6:
- Renamed the merged DPU_SSPP_SCALER_QSEED3 to
  DPU_SSPP_SCALER_QSEED3_COMPATIBLE (Abhinav)

Changes since v5:
- Fixed the rogue vig_qseed3_noscale sblk. There is no qseed3 in the
  noscale VIG blocks.

Changes since v4:
- Renamed dpu_vig_sblk_x_y to dpu_vig_sblk_qseed3_1_2 (Abhinav)
  Note: I've choosen _qseed3_ instead of the suggested _scaler_, as
  there are other scaler types which might have their own versioning
  scheme
- Dropped the DPU_SSPP_SCALER and DPU_SSPP_CSC_ANY defines (Abhinav)

Changes since v3:
- Proprely describe dpu_scaler_blk::version field as the register value
  (Marijn)
- Picked up Marijn's prior art patches (sorry, missed them while
  preparing v3) (Marijn)

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Dmitry Baryshkov (8):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: rewrite scaler and CSC presense checks
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

Marijn Suijten (2):
  drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
  drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  29 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 149 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  57 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  21 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   7 +-
 23 files changed, 204 insertions(+), 313 deletions(-)

-- 
2.42.0


