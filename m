Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B92B67CFD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjAZPSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjAZPSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:18:17 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF22C6D5E8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:32 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cm4so2135128edb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fq4afDSISDyHOLK8BorLngEW14v0Q+wTOhxEZ15M9Y=;
        b=EZGNBUFShDRs/UIsdi9L120POvkvcPgrMrmaii+pMXvsMsRLeRWQNOG9lOll55cjTt
         fGZNRXauJhlJDnU4ZnoPj6vHIJ3hXJYYfsxfkiuSISqx0zv3G8ret5+hNAH98P6+DfdV
         pXaH1OgxafEBjKkAlMrEYjmydwi9mboHhyb5z0P+Swt0sObvVPtetHBj3wGXWg9FhxeS
         5zswq/MRKsi2NR97TPqf8EjdHYCw4Yx0veklZJ0DcY7Rw5YwFfjodteenOATGmmbKX1J
         iuLA6zF9cNVZ+ZWp2KEJUT+S4rBMz06jk255/Mv2oXQaXIty+OGV3rNUcV9P1/PirtSD
         b33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fq4afDSISDyHOLK8BorLngEW14v0Q+wTOhxEZ15M9Y=;
        b=Obsg8luY5FbSTG+xAOSp84MtEoM/KKG7qxcikj+Y/MH+pwaUfh7kmgr9KRCbbB5cei
         YJBTMxQu3Ng7V3hQ00lziEuW/Uodb7F5SBG8shd8tsed+z0MJTanGtlzpGBxZGc5lmhQ
         VtmwGtjmzOt+t/QfVz+tcuc6sXbtbLTtyLzH/Hx2mCROiNWpIoXGkvdlegDzXhhugnSd
         3Y7xCCbVX+V38HN0fJWygfv2V/dUnF3YvhuHwkRvaH67fxG1tOwrW/bWiIZZ8OdUxdli
         E/dJvHV8sBdxlUj+zm1unDeRbounZSpu2Hdm4XRiRQ/l2l5R7SHVE4nmqwrZGu2Nn0+x
         SFZQ==
X-Gm-Message-State: AFqh2koDzPsoUQEmQTtycQtBYxZJXP028LFouVgPeNliN2Vq/YGokRAB
        /0ezAccHz9wPeMm4LjVtW8B8Dj9ZG6iBHrw0
X-Google-Smtp-Source: AMrXdXvWFRu4EMAgrCTCu5/gosf+1kjh4Lkdy39fE6NF6qhETSEqt4LaOu1Rbor6tN/QUeNvNstlDQ==
X-Received: by 2002:a05:6402:3496:b0:499:70a8:f91d with SMTP id v22-20020a056402349600b0049970a8f91dmr47372448edc.2.1674746223971;
        Thu, 26 Jan 2023 07:17:03 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:17:03 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/14] GMU-less A6xx support (A610, A619_holi)
Date:   Thu, 26 Jan 2023 16:16:04 +0100
Message-Id: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 424 +++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  19 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       |   2 +-
 9 files changed, 488 insertions(+), 66 deletions(-)

-- 
2.39.1

