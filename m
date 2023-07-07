Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7B674B761
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGGTmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjGGTlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43A42D50
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso3734559e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758784; x=1691350784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m03JGQRZzgggDAPSrS4wYM6UAtubbQ6Gy43viyawZfw=;
        b=g6plaU0zekk97tTbrvVUCWPcPT0B6tt4nD7KZFvlAB9F+AsCiMoBKfM+PVpNg+2Ebk
         idh8Prl1ycwe3NfpxDmtAn0X0JUPsTnhTkk15zyaiL8k/q232X30axI7CczaUHKInoov
         0qAyTZQ3+jy8ubE1ciAOpMxJCd/w5R+n8VqHfPUTlJGnmDgy7au/UgnEEmjdnSZYVxzu
         9/oNYChRlgS9yDcUOC+PoFTn+HZDXWBOXJsXRtPRyOCYXv1pNyHKUEmBlrBRm7p94Jrj
         nGRM6mkte1TK7TjeBVWRyvIZxombLPij7gPCOkRUrZly35nK6LsWeVRb6PtsWvoSTSNX
         bWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758784; x=1691350784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m03JGQRZzgggDAPSrS4wYM6UAtubbQ6Gy43viyawZfw=;
        b=cf5B4maaZlshB3Br54uPiZWAZiPMsT2n1Juh5KqeeyAPC6HOwnk5SOu8ZEifVJrzVL
         RoYbiN174kvffsy4m/1Q70Xx0X/E9BJecqNhugRvRYeb7XM3n1yoXLrx7b/mlA2KmetA
         wRWH1RPcH4B0UsELhOZqUQM13JiuNPhJGJnNYsCp8yoxDAyk9lTmRVTaJb10oVIrxs71
         H7F/RShf5ENkxJ75meE2uc5P6dykgBH4AUrV6ivmhajzz0GbcVXT0sY5y6m/+C8PFSRJ
         j/SDCxfnvnzInoJOC/P4N1Lk997dYWlXEnUKbG6xje72ecAns/aPeFuirLo+T80yIv2S
         Ufmw==
X-Gm-Message-State: ABy/qLZ9uSHleEMA/IcevpdKuP26PswHV5BSGmD7ASuDRLaNYZ3OyHxl
        AMPe8Vd1IV1gnYGoDhMAW5zy1Q==
X-Google-Smtp-Source: APBJJlHkviBgOet9eYvf2B5iTWhVAGWaRPlm1BsVyU3K0LCUChjKBcvFGHK18QZLqBB0y7chWcwAgQ==
X-Received: by 2002:a05:6512:78c:b0:4fb:835a:8486 with SMTP id x12-20020a056512078c00b004fb835a8486mr4566225lfr.32.1688758783291;
        Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:42 -0700 (PDT)
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
Subject: [PATCH v3 00/11] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Fri,  7 Jul 2023 22:39:31 +0300
Message-Id: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
- Dropped perf tuning patches for now (Abhinav)
- Restored kms variable assignment in dpu_core_perf_crtc_release_bw
  (LKP)
- Fixed description for the last patch (Abhinav)

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (11):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: core_perf: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 187 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 159 deletions(-)

-- 
2.39.2

