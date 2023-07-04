Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96F287474BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjGDPEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjGDPEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:00 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5999610D8
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:03:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6a1245542so95321711fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483035; x=1691075035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tj0LTLAfRW3eN7Hujj5ZWhl9+2Sp6toZsHXLprydla0=;
        b=Oc0Ht0ENmTOi5FbZB1qXkgsXbGSfj290T9ms1fVGyZjAf+TvXYp+/XVxkzCCIUGrSN
         EXJ8sKyrnhtEvoNXAWvuVh5zypAQ9dnK+/nrEJM0S90TWQRgERdcDwt1rJGSR3OtB1GJ
         c8HsekoMrsGgyoXLkej8cT4EiZGmXZFuy7F8Fpf+2O6unmIpqpzCA3jXn2tUvxji+tEc
         vblq4c3eF+JzahrKDenDiKVi087tZQT66kmUdvBPD+h5gbPz5Xx33t3bUqOTRXNZ/T7P
         yUQCpke/VbNqgNBt3L8JccyC0TlbqEDDFSpx9UwY2wtpdt83wBG8jIJZQo3atPTPfMRv
         h91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483035; x=1691075035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tj0LTLAfRW3eN7Hujj5ZWhl9+2Sp6toZsHXLprydla0=;
        b=LjGmPBNvddi/As24YrjcZ+05ei3/NA0csF50bRBXnDLwBNApUH5TV30/n/cQQRJAi8
         SeuBlmfPJRbGaawRfBXWs3x2WcJq0VyszoqHwDmcWe0AxCgol8tDKMcSMHzrCOALJ76H
         ZdT/L+lon694jc77HlINEm9BKqzI43Excy3fUYygo7EOKlHHsOSibPiNKtJ52ZOBdtGP
         DqAPIN2+dllSPq6U7p0LmPdy5q5XsBGZTbz6QHmMKpvFIyBNBuLwl0MJYV+sjLNsV51+
         BbbTi8+DVlrp62gN+7D9Rsb2cgZ2WUYGZ9jGNx5pBXxU2Kq7eBSxFZSqS5APdxgKn/zH
         9A5g==
X-Gm-Message-State: ABy/qLYAKwoCENXQDXUZnk+jfc8USs/f9wwbKZ7n8Y9SJ0V0pfXGHJYc
        uBUtp0VWWtmzxILNxeKm8ytKoA==
X-Google-Smtp-Source: APBJJlH/fz7KgnfYa/G7+IktCfZ+NwjetuSkB8OLYtVtfbCSbvd92lztcnUZLLzQ8pUrqydS/i56Fg==
X-Received: by 2002:a2e:b606:0:b0:2b6:bf9c:d025 with SMTP id r6-20020a2eb606000000b002b6bf9cd025mr9182116ljn.8.1688483035336;
        Tue, 04 Jul 2023 08:03:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 00/14] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Tue,  4 Jul 2023 18:03:40 +0300
Message-Id: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apply several cleanups to the DPU's core_perf module.

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (14):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
  drm/msm/dpu: rework core_perf debugfs overrides
  drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: core_perf: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 265 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  60 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 251 deletions(-)

-- 
2.39.2

