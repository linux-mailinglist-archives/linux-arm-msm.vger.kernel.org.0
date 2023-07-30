Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343217682FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjG3BBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjG3BBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07741BDC
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe1c285690so4283973e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678864; x=1691283664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZFRcwHJeVSh65Kz3mZ7lpYUowAafMtprlMPT1r95fA=;
        b=D+kDYvMnwANwr1qh4aSkCWNS+hW/sQ8dmmOxM15zbfx/N75PKrr+7nt522kqc0hrBK
         IfYb2TVbnH2jKJLHpaKlZGQNqS5rW2XWjFiugMzy45Ffxmt5s3kryxSUID2rRR5Cu6H+
         WODDu025368gjog7RMq2oMTBd62YGF+ghob7zqtrvTXuAmU18AMuKeV1UMawtfhJ6nSg
         Ydha1n5LnNt/Urzja5Rz4v6n7ZUw0ixKcHjPlJ4uY3PaJfJG/xCbINnOliVmhtYy0/Xg
         kdbXk2L03htEH/zQc/VbPjt1wEpJsscg/tN7mE+X73ydkHZD4Ty7xsous2ssXVkxEMaB
         61uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678864; x=1691283664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZFRcwHJeVSh65Kz3mZ7lpYUowAafMtprlMPT1r95fA=;
        b=WcNVZS9u8fQpQ6jhd3bPVr51I80rTzxQBci76VeLq7ZRAWYJwlW5R9BrO34MhCehTh
         nq5jnXduQ/pKC2u/+z7VYRMgzuvKwfTv1h0o0swfz70p1PQZuBFh6b4U/kGuqV5Qfe8z
         l1DJ+h9DC+5Lyiv6rrWH6eTCNVM48NxgaS6E/Tsy0qBEXeukk7vUExPCf1BaCilabPv3
         uY96KJWuTXoMKfjwAY0dbdqwlp87TFivGLuxwoBD9MmtHvOAwUEIBrnLLOXpvXa0r++X
         ZMfb7lIxq+PxQXTUteh34CxYnJKQSmga7wmHzpDJrqY4nWDwNOUpOYp4Xd3wFFKfArNv
         iMrw==
X-Gm-Message-State: ABy/qLZOljN3t2D7+lf6Zi14+Oo1uG6UcUaFiGmUw9IRnw82qRQxRC0C
        mkdnnGx4neKXUgq/vugLVEOeCQ==
X-Google-Smtp-Source: APBJJlGtmyY9p+cYGHzyJojaq+edbB2ZxTMVxZv+lA2/UTIIcqd5S9h+Jmc+h8AX0z53+TobLbWANQ==
X-Received: by 2002:a2e:9a89:0:b0:2b9:e701:ac48 with SMTP id p9-20020a2e9a89000000b002b9e701ac48mr174745lji.32.1690678863977;
        Sat, 29 Jul 2023 18:01:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:03 -0700 (PDT)
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
Subject: [PATCH v5 00/10] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Sun, 30 Jul 2023 04:00:52 +0300
Message-Id: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apply several cleanups to the DPU's core_perf module.

Changes since v4:
- Dropped the 'extract bandwidth aggregation function' (Abhinav)
- Fixed commit message for the patch 9 (Abhinav)

Changes since v3:
- Dropped avg_bw type change (Abhinav)
- Removed core_perf from the commit cubject (Abhinav)

Changes since v2:
- Dropped perf tuning patches for now (Abhinav)
- Restored kms variable assignment in dpu_core_perf_crtc_release_bw
  (LKP)
- Fixed description for the last patch (Abhinav)

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (10):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there are no
    ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 154 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 77 insertions(+), 145 deletions(-)

-- 
2.39.2

