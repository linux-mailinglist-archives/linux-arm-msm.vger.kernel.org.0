Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9D66934A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjBKXNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKXNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:05 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56931114D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:03 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id sa10so23911875ejc.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=klX8Gu05uLxUPMLxAWhxmZEz4L07M9aHLS/sF2xndig=;
        b=yTjTqElq2EUEZpj+6zF0Ez5GDHZQmtAeitEULYW+eK/kvyPLP/R7lfdLvJKg5hnU0Q
         YVCeNOOUGT4Q1wvYTrBH2soGxJta4OywoBfksUcWWrLbWy1qBg9CNEq6Yuj/cFelyhPT
         tx4znnDEfolU7YCiVncIveIEWIOrcqzY1STQ0n17mxpl1WLSBGfaL306exS3s7+I3mWF
         kmrF4vypwcIBPv0LqrYAlqBcCNM8SviXr5hvhS0YG7vHKAdjmf53ADXVQXiZZtQk4P9A
         z3bS7OrDR5tBBt+mdUUNSEKlEDI1ZOKUzmavgDyMVtjKbRABPPJpoMeE/d7Sy+VqFFTY
         R2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klX8Gu05uLxUPMLxAWhxmZEz4L07M9aHLS/sF2xndig=;
        b=6Gvk0enWc+yCamNYLVAdIPodTlq465O++lHKl6fUYeHnlgq17uV1xC6UQZj4bbRWit
         4NMYKK4IaybMcVi0vgotust5POtZGT+bXrElOspXf6vM/tqx+z+Rs4E95HFm9hIvbrg2
         1XGKfzNdT1HEUd/D7SPJ/5P0bLDkIi99IdF/9JA1R8lJu6gu4N8ikb4jokxOahmMQLBj
         fSnGyxNxQ0dt+QTU10wnYVQa8adO2MblK/6eeoAIFNmRaA75P1xF5LiDdBLw1hWU11kD
         4UcDY10CuudMM5EEHa1I80vSKDTBfGbaep/qbxNgBf+XPv8oCWGVDUx0rItdEBqdppI8
         vkuQ==
X-Gm-Message-State: AO0yUKU4yNeKR2gnspdlf+dkivECQYgvidmFHD/v1rxlnOhyforMwHZ0
        vFZUPXu2DXePgRYMhIfhZw8b0g==
X-Google-Smtp-Source: AK7set+Ur2ylNzOrSh351MIcPuUw7NVZcr6iYgGcFFvHSXOmHpQrHpwcRmJQOxgXRCsVwiAvNBOlbQ==
X-Received: by 2002:a17:906:7097:b0:86f:5636:4712 with SMTP id b23-20020a170906709700b0086f56364712mr23478649ejk.7.1676157182224;
        Sat, 11 Feb 2023 15:13:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 00/50] drm/msm/dpu: rework HW catalog
Date:   Sun, 12 Feb 2023 01:12:09 +0200
Message-Id: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This huge series attempts to restructure the DPU HW catalog into a
manageable and reviewable data set. In order to ease review and testing
I merged all the necessary fixes into this series. Also I cherry-picked
& slightly fixed Konrad's patch adding size to the SSPP and INTF macros.

First 12 patches are catalog fixes, which can be probably picked into
the msm-fixes.

Next 5 patches clean up the catalog a bit in order to make it more
suitable for refactoring.

Then the next batch of 13 + 5 patches split the hw catalog entries into
per-SoC files.

Next 8 patches rework catalog entries, mostly targeting QSEED cleanup
and deduplication of data used by several platforms. At this moment only
three pairs (out of 13 devices supported by DPU) are merged. However
this part lays out the ground to ease adding support for new platforms,
some of which use the same configuration as the existing platforms

Last batch of 7 patches renames existing macros to ease using them while
adding support for new devices.

This pile of patches is submitted in a sinle batch to allow one to
observe the final goal of the cleanup which otherwise might be hard to
assess.

Changes since v1:
- Picked up Konrad's patch
- Picked up dependencies into the main series
- Moved qseed3lite vs qseed4 patches into the fixes part
- Fixed sm6115 in a similar manner.

Dmitry Baryshkov (49):
  drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
  drm/msm/dpu: disable features unsupported by QCM2290
  drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
  drm/msm/dpu: fix len of sc7180 ctl blocks
  drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
  drm/msm/dpu: correct sm8550 scaler
  drm/msm/dpu: correct sc8280xp scaler
  drm/msm/dpu: correct sm8450 scaler
  drm/msm/dpu: correct sm8250 and sm8350 scaler
  drm/msm/dpu: correct sm6115 scaler
  drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
  drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
  drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
  drm/msm/dpu: constify DSC data structures
  drm/msm/dpu: mark remaining pp data as const
  drm/msm/dpu: move UBWC/memory configuration to separate struct
  drm/msm/dpu: split SM8550 catalog entry to the separate file
  drm/msm/dpu: split SM8450 catalog entry to the separate file
  drm/msm/dpu: split SC8280XP catalog entry to the separate file
  drm/msm/dpu: split SC7280 catalog entry to the separate file
  drm/msm/dpu: split SM8350 catalog entry to the separate file
  drm/msm/dpu: split SM6115 catalog entry to the separate file
  drm/msm/dpu: split QCM2290 catalog entry to the separate file
  drm/msm/dpu: split SC7180 catalog entry to the separate file
  drm/msm/dpu: split SM8250 catalog entry to the separate file
  drm/msm/dpu: split SC8180X catalog entry to the separate file
  drm/msm/dpu: split SM8150 catalog entry to the separate file
  drm/msm/dpu: split MSM8998 catalog entry to the separate file
  drm/msm/dpu: split SDM845 catalog entry to the separate file
  drm/msm/dpu: duplicate sdm845 catalog entries
  drm/msm/dpu: duplicate sc7180 catalog entries
  drm/msm/dpu: duplicate sm8150 catalog entries
  drm/msm/dpu: duplicate sm8250 catalog entries
  drm/msm/dpu: duplicate sm8350 catalog entries
  drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: drop duplicate vig_sblk instances
  drm/msm/dpu: enable DSPP on sc8180x
  drm/msm/dpu: deduplicate sc8180x with sm8150
  drm/msm/dpu: deduplicate sm6115 with qcm2290
  drm/msm/dpu: deduplicate sc8280xp with sm8450
  drm/msm/dpu: drop unused macros from hw catalog
  drm/msm/dpu: inline IRQ_n_MASK defines
  drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
  drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
  drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version

Konrad Dybcio (1):
  drm/msm/dpu: Allow variable SSPP/INTF_BLK size

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  211 ++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  211 ++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   92 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   84 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   54 +
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  159 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  117 +
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  123 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  118 +
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2193 +----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
 21 files changed, 2434 insertions(+), 2164 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h

-- 
2.39.1

