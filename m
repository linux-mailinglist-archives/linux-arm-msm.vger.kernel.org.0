Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06CDC73B936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjFWN6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjFWN6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:58:48 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01132E52
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b4790ff688so11776771fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528725; x=1690120725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOhWkbu2l8TcyI6GhCT/UC0v9ZBG8+6y99ASll4jh3w=;
        b=gOT4WUNixw1iqApc2hvVhE0lW9ZYNsgY52m1tquGH6LS+PTQVh3rFeQ4cM7/c/Ux5h
         x7cywYZVk2Dq4XyJTHpb28rS2VY+mSLlLIngwNUc9waWV6G2KceJ660ddP9C0tEAzpuF
         Z1+Qcqrt47Iuj2Toio3qx931DbFv8VRkQzFSb0wflAjrP/2tMWqbBeEWfVeVQdw0jpU8
         8IyLpjOQUEUqf/AU1TX9OE48wD1z71a510M5mnVRY24KEVjbNyUWy2RcKwCsVCozuoSk
         okqHVYl7Qdj6BdutCgjVMy/Yctq0RUpoHlj9y2gnyPc4PL5aqf68ByLmC2NBClwKgqck
         9bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528725; x=1690120725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOhWkbu2l8TcyI6GhCT/UC0v9ZBG8+6y99ASll4jh3w=;
        b=WZFeX1idHO/NnhdI0XEONvYpZa2Cafxu+CA2ShVLmkifSvDZth+OzW9uXCl/F2YNDm
         e7mOyqIV+LEpBVb6BnXTCuOrANObEQcUGXyuuo0QyodVB2pnB7FDDugBTI+/ewQVN2ve
         wegscKvc/7r9QxWpqmLAUdenYyL6e7WVJp/4sjdwijk741NpIHnFk7ZRMJQQq8/BuZnT
         QAXU8aSVOqSKt9apt74LQE0Bnsz9Dh32rUXlZOELN/DnymuSRLn6VScWrs6G0K2BbOLX
         lufnELFxkLZ8rzhgnUSt6CdXbz46GCwP24EscuKCCAleev+wKIrwT4m2lhlMenAL2OKj
         weXg==
X-Gm-Message-State: AC+VfDzny5I7kMQI2oUv1TR38Lo6vGIHBgPeLLtFULWEZVPSYzovJvO1
        r0JTyFVA4Ig0TJ6FBxyXnK1QzDCmUeTKkQyCrNQ=
X-Google-Smtp-Source: ACHHUZ7CUw4mSjt7xEoQZLR9dgp37du/c/s9wAc01Q2NRnVzbTqGUFk86gqyTYlJKvykW/TqCI39OA==
X-Received: by 2002:a2e:a175:0:b0:2b1:fda8:e653 with SMTP id u21-20020a2ea175000000b002b1fda8e653mr14243650ljl.27.1687528725225;
        Fri, 23 Jun 2023 06:58:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:58:44 -0700 (PDT)
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
Subject: [PATCH 0/7] drm/msm/dpu: simplify DPU sub-blocks info
Date:   Fri, 23 Jun 2023 16:58:37 +0300
Message-Id: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

Ryan pointed out [1] that some (most) of of sub-blocks do not fill the
field `name'. Further research showed that we can drop the fields `name'
and `id' and further simplify the catalog. The handling code also
usually knows, which sub-block it is now looking at.

Drop unused field and arguments and merge some of sub-block
declarations. I did not merge inter-generation VIG_SBLK definitions,
this is pending another cleanup (which will also switch to using
hardcoded scaler version).

Dependencies: [2]

[1] https://patchwork.freedesktop.org/patch/543903/?series=119773&rev=1
[2] https://patchwork.freedesktop.org/series/118839/

Dmitry Baryshkov (6):
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the field `name' from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: merge dpu_csc_blk and dpu_dsc_blk into dpu_simple_blk

Ryan McCann (1):
  drm/msm/dpu: Drop unused num argument from relevant macros

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  16 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 122 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +++----
 17 files changed, 154 insertions(+), 200 deletions(-)

-- 
2.39.2

