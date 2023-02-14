Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABCC696B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjBNRb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjBNRbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:31:55 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02011B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:31:53 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id s11so10762663edd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3eQEZV6QiZa+hDM1b2NqnB6hs+XTHoWjEMCUlgNBE8=;
        b=WY/E8W5KbJNCENZ4Q5HGFL5YIBJAz4dkhZgKwcYl9yCp0zo7JvmGFb7Z9Tagr8gZY0
         hWwGUK5tCo+uQP0f/+sk4brqPYAZRdnKsvLE29zcyzGVB4ZK4YGMtP73+CxxmUELlVwe
         cObNBvGWrxO/l+DBpgIDF6Srd/kN5Bt/cfP/RQvSBWa0e6Bo1yZYRDE1YKwfh8aanvym
         cAaAkbrtyrUan44/P1z8PmPAfa8B8CUVnSaIr3uCGSpmLnicAv02KYTti8/S7OCoCVOb
         rwWis5Jop+MCR9c00UGPE4xHV7bTBY4XieUiOxov9KQQqUvzh8iFL+VOr6ixhWlXqKyy
         i0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3eQEZV6QiZa+hDM1b2NqnB6hs+XTHoWjEMCUlgNBE8=;
        b=kkfv3iHCraRzLb7zjDqUZhENdzJjE7RVaKq8u2ZyZ9xMsloEak0a9HvKvrXVdpRc0V
         jW7lBTeGWrRBfrBiVZBC7INfqhT4ZsCReHPe8ChrFuJgO4obcGrtg4vFAIvXiDtsE6ii
         8/zo1ZyNIrBZpzuGg5nYtPU+Fpys9gCx5cYHRGycz4tde1/aEpU1hCevadr7DcCTgpqq
         1j24cAAkCRgM6TJx9QkGBE1ohIkyf1XFFYRn1XCH5hkghxxaWuEtQiZVdq8CqElpZn5D
         U6yQ6Yxe1WqIV4Nk8hKhIlPsw8x3KeaFFDnSeczI2RpAxWFP4uO2nnuXTmA+PFmhmr5e
         VVhA==
X-Gm-Message-State: AO0yUKV1wz6W5hUbcFRWgpn11t2M0z7zBwuSpjQEzu83E2SFwIHtC/oe
        hQF8zPRBJFr8qFBiKLdP+ATHdnF98dBMN++y
X-Google-Smtp-Source: AK7set8fX0vccCadQYOeFjxq34Gr4FY9PCvLkvH31NcKREI6tlA0G/qvsaxwARgzXeCdBkl5y+XsIQ==
X-Received: by 2002:a50:931d:0:b0:4ac:c029:ea72 with SMTP id m29-20020a50931d000000b004acc029ea72mr3246927eda.36.1676395912272;
        Tue, 14 Feb 2023 09:31:52 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:31:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/14] GMU-less A6xx support (A610, A619_holi)
Date:   Tue, 14 Feb 2023 18:31:31 +0100
Message-Id: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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

v1 -> v2:
- Fix A630 values in [2/14]
- Fix [6/14] for GMU-equipped GPUs

Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/

This series concludes my couple-weeks-long suffering of figuring out
the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.

The GMU functionality is essentially emulated by parting out a
"GMU wrapper" region, which is essentially just a register space
within the GPU. It's modeled to be as similar to the actual GMU
as possible while staying as unnecessary as we can make it - there's
no IRQs, communicating with a microcontroller, no RPMh communication
etc. etc. I tried to reuse as much code as possible without making
a mess where every even line is used for GMU and every odd line is
used for GMU wrapper..

This series contains:
- plumbing for non-GMU operation, if-ing out GMU calls based on
  GMU presence
- GMU wrapper support
- A610 support (w/ speedbin)
- A619 support (w/ speedbin)
- couple of minor fixes and improvements
- VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
  A6xx)
- Enablement of opp interconnect properties

A619_holi works perfectly fine using the already-present A619 support
in mesa. A610 needs more work on that front, but can already replay
command traces captures on downstream.

NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
two occurences of 0x18 used in place of a register #define, as it's
supposed to be RBBM_GPR0_CNTL, but that will only be present after
mesa-side changes are merged and headers are synced from there.

Speedbin patches depend on:
https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/


Konrad Dybcio (14):
  drm/msm/a6xx: De-staticize sptprac en/disable functions
  drm/msm/a6xx: Extend UBWC config
  drm/msm/a6xx: Introduce GMU wrapper support
  drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
  drm/msm/adreno: Disable has_cached_coherent for A610/A619_holi
  drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
  drm/msm/a6xx: Add support for A619_holi
  drm/msm/a6xx: Add A610 support
  drm/msm/a6xx: Fix some A619 tunables
  drm/msm/a6xx: Fix up A6XX protected registers
  drm/msm/a6xx: Enable optional icc voting from OPP tables
  drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
  drm/msm/a6xx: Add A619_holi speedbin support
  drm/msm/a6xx: Add A610 speedbin support

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  55 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 427 +++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  19 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       |   2 +-
 9 files changed, 492 insertions(+), 66 deletions(-)

-- 
2.39.1

