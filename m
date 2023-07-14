Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B76C752EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 03:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjGNBzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 21:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjGNBzH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 21:55:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E23E272E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso2402521e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 18:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689299704; x=1689904504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
        b=oxikwUD1+/VMep89kyaaz/pBifhAydfoTAGiPNvERMr7AQJD63XHWZM8TZ4unCAsjf
         LxfhMfC7izHAyKyzfSZa4w+ko5foe13tgBdLeSIgunnYJlj/hK+lil7Gq/MfsrOQ/iuL
         z/JP3OB/xVaxzV6YcGlzu5Nw0cRR0gEVD9MEdIPfvdm2PnL19s6ixOPone7TecQy1a9W
         ps1UaLXrRwubYdTvzCOEzQ90yzrQUdXYUYk6MP4cGowRA+PmEB31eQR6ZSlvou2X/qrq
         +RmNco0ih0YLfu6rU9oLloF5T2wigLYPbR4ZGcZ9lJXL6+8AljILRgnkvQ0yzDLC+ExU
         waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689299704; x=1689904504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
        b=keMejDZ12UoF3nuOxlcAscC92iv3kjq3E5G7A671ml+74WBeoAtr0J3ULXU1LPSr1U
         sKen21+6C1jPS3LoJCTX4Xnflrx5Ai/kG/LYSYRMtE4W1L5ay8jjTIiqWrtennm0PY5t
         Yt06LMfDiBu0B6wl8le4jw/N8Uow+jhh1da1IReVOoY6WO6lyMNwRRH6ZdZKtU2QktrW
         FaxFtRLgQmjXANbPjniXGfVXD6/3cMGZcNnGPIUDD+j+xYlQdErUwuBA455b84eNdBvJ
         1uJCkY4a2IuxWfRcPOOjL/G9sASjBCk3gUiFl90hWz9dOPnrCGPnWHi08XU58XioLYZZ
         tJRw==
X-Gm-Message-State: ABy/qLaGtO6Es6R6ZneE+hDNwzEq809bU0m/ce3yCCXpf1yhC++zV/Rf
        oG8E3UVFSkrOPs3qJd8/KuMQKQ==
X-Google-Smtp-Source: APBJJlGcwnCRoXxf++RPSnwgkdrhPb+zS3oX2wz734qK8ZrTlhVimyqZ7/jDRPWxgXeQa3+/eHtxgA==
X-Received: by 2002:a05:6512:3f10:b0:4f7:6976:2070 with SMTP id y16-20020a0565123f1000b004f769762070mr2650059lfa.40.1689299704105;
        Thu, 13 Jul 2023 18:55:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 18:55:03 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm/msm/dpu: simplify DPU sub-blocks info
Date:   Fri, 14 Jul 2023 04:54:59 +0300
Message-Id: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (4):
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 +-
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
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 100 +++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  44 ++++----
 18 files changed, 141 insertions(+), 193 deletions(-)

-- 
2.39.2

