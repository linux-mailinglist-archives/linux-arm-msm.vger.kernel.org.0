Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794C76A07F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 13:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbjBWMGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 07:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjBWMGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 07:06:49 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF5954544
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:06:46 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f16so10556105ljq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkKPkt6K8I16jd1Wjb3aZsG77PYKiXbGXPYI41OEs9k=;
        b=tAtajSSPzl1mwYWBXR+0tmHgiFeEgpsbv3vhqLZrkDZ160IQbHlKrTLzcDtbPe2GnK
         bUSt4QBfE5L/8YPcXVNvMh/DiCh/LpGR2suG9IBm7TfayIG5sEgH1qQYYvnf97vxbrR3
         PVLptLfbUV+5d8nq0gc60wfgvdbMCh+j7G5yATau85zvJllvgKTcvQUXrtbVhU01NDio
         r4nsGE0G72ZyI4X/WK0RmT9wEIb7WvYe3iFDFOqqFYcXeAiD1AemcBlHptTEQ+CUP748
         AqNO+emEW9ik5UvDYrwwZu2ZVWw/AdNQ8G247lRrSKlKvac/fIVbC0WYzXG6D90WHrND
         RcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkKPkt6K8I16jd1Wjb3aZsG77PYKiXbGXPYI41OEs9k=;
        b=nAF04MIOVi/Zt2RZ37gnvcEDAFUXCm45e6fhct0GTgOKXXafJURLmgWxIy+C1wdAKR
         bGuTXYjrczZCQBJEltF8IEvpe/Pzs+upwqZBShC9zfuYp53N1OdRL5eCbcwLyAyva1hL
         atfSDNV1LFb/moiZMGVlVx8FIc3aHwaT3ZQ9elX6KMoLjXfo9NalzF9BSv6K2NYdeh4E
         t5g8XrQ7QPJBmMuRhKGTNT0pRj+fK7k1krLUguwaUT6WZ+SBFRwooXgRq+S02Gp0O4Q8
         g5G2JQqqLsryHTq3ayjwNd9Ac+hjLPURPvet2hC0h6xi3y2c36JopTn50E0V1v0jNFAm
         Ex0Q==
X-Gm-Message-State: AO0yUKWvXZn+Irv4Lr6uL9qzt0aWwOt5f5Fx1psQ5+na7uZalttO/Tl7
        263QE94uVlics5+SwvXZ7iuziA==
X-Google-Smtp-Source: AK7set+6aMuX+fIwu7TKmnFH2zI+TIWMDx0P1BNXDkNGx33VUkBqKOt28i6yC/SpfOfFe1jifZ62qQ==
X-Received: by 2002:a2e:7216:0:b0:295:8a9b:d8d6 with SMTP id n22-20020a2e7216000000b002958a9bd8d6mr3366493ljc.4.1677154004555;
        Thu, 23 Feb 2023 04:06:44 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:06:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/15] GMU-less A6xx support (A610, A619_holi)
Date:   Thu, 23 Feb 2023 13:06:34 +0100
Message-Id: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpW92MC/x2N0QqDMAwAf0XyvIC0Drf9ythDWxMNuFpS3QTx3
 xf2eAfHHVBJhSo8mgOUPlJlyQb+0kCaQh4JZTAG1zrfOudxXYokHN/bV0MppBg7Zr7y0Pe3O1g
 WQyWMGnKaLMzbPJssSiz7//N8necPqATO1ncAAAA=
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=6803;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SrO+tT9dL/Vn3p2tiDM013OqjkJMjRrAWfBDI0HEZLo=;
 b=0TZ4tmSBt1jWJ+b2r+8ZhfTgB1jlxMKBIVSE8fbdBosET7znKqmGYTuujxpBrWgzTTuSvyGRzH40
 /hGS6u/IBLM7pjKrUGaAIEcazqjEroPQR7IGJtDLm/Pk0F6CQ5Tb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2 -> v3:
New dependencies:
- https://lore.kernel.org/linux-arm-msm/20230223-topic-opp-v3-0-5f22163cd1df@linaro.org/T/#t
- https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/

Sidenote: A speedbin rework is in progress, the of_machine_is_compatible
calls in A619_holi are ugly (but well, necessary..) but they'll be
replaced with socid matching in this or the next kernel cycle.

Due to the new way of identifying GMU wrapper GPUs, configuring 6350
to use wrapper would cause the wrong fuse values to be checked, but that
will be solved by the conversion + the ultimate goal is to use the GMU
whenever possible with the wrapper left for GMU-less Adrenos and early
bringup debugging of GMU-equipped ones.

- Ship dt-bindings in this series as we're referencing the compatible now

- "De-staticize" -> "remove static keyword" [3/15]

- Track down all the values in [4/15]

- Add many comments and explanations in [4/15]

- Fix possible return-before-mutex-unlock [5/15]

- Explain the GMU wrapper a bit more in the commit msg [5/15]

- Separate out pm_resume/suspend for GMU-wrapper GPUs to make things
  cleaner [5/15]

- Don't check if `info` exists, it has to at this point [5/15]

- Assign gpu->info early and clean up following if statements in
  a6xx_gpu_init [5/15]

- Determine whether we use GMU wrapper based on the GMU compatible
  instead of a quirk [5/15]

- Use a struct field to annotate whether we're using gmu wrapper so
  that it can be assigned at runtime (turns out a619 holi-ness cannot
  be determined by patchid + that will make it easier to test out GMU
  GPUs without actually turning on the GMU if anybody wants to do so)
  [5/15]

- Unconditionally hook up gx to the gmu wrapper (otherwise our gpu
  will not get power) [5/15]

- Don't check for gx domain presence in gmu_wrapper paths, it's
  guaranteed [5/15]

- Use opp set rate in the gmuwrapper suspend path [5/15]

- Call opp functions on the GPU device and not on the DRM device of
  mdp4/5/DPU1 half the time (WHOOOOPS!) [5/15]

- Disable the memory clock in a6xx_pm_suspend instead of enabling it
  (moderate oops) [5/15]

- Call the forgotten clk_bulk_disable_unprepare in a6xx_pm_suspend [5/15]

- Set rate to FMIN (a6xx really doesn't like rate=0 + that's what
  msm-5.x does anyway) before disabling core clock [5/15]

- pm_runtime_get_sync -> pm_runtime_resume_and_get [5/15]

- Don't annotate no cached BO support with a quirk, as A619_holi is
  merged into the A619 entry in the big const struct - this means
  that all GPUs operating in gmu wrapper configuration will be
  implicitly treated as if they didn't have this feature [7/15]

- Drop OPP rate & icc related patches, they're a part of a separate
  series now; rebase on it

- Clean up extra parentheses [8/15]

- Identify A619_holi by checking the compatible of its GMU instead
  of patchlevel [8/15]

- Drop "Fix up A6XX protected registers" - unnecessary, Rob will add
  a comment explaining why

- Fix existing UBWC values for A680, new patch [10/15]

- Use adreno_is_aXYZ macros in speedbin matching [13/15] - new patch

v2: https://lore.kernel.org/linux-arm-msm/20230214173145.2482651-1-konrad.dybcio@linaro.org/

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

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (15):
      dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
      dt-bindings: display/msm/gmu: Add GMU wrapper
      drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
      drm/msm/a6xx: Extend and explain UBWC config
      drm/msm/a6xx: Introduce GMU wrapper support
      drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
      drm/msm/adreno: Disable has_cached_coherent in GMU wrapper configurations
      drm/msm/a6xx: Add support for A619_holi
      drm/msm/a6xx: Add A610 support
      drm/msm/a6xx: Fix A680 highest bank bit value
      drm/msm/a6xx: Fix some A619 tunables
      drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
      drm/msm/a6xx: Use adreno_is_aXYZ macros in speedbin matching
      drm/msm/a6xx: Add A619_holi speedbin support
      drm/msm/a6xx: Add A610 speedbin support

 .../devicetree/bindings/display/msm/gmu.yaml       |  49 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |  63 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  57 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 513 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  33 +-
 9 files changed, 655 insertions(+), 94 deletions(-)
---
base-commit: f122501715b5bb8ea340e077401257795b6638a1
change-id: 20230223-topic-gmuwrapper-b4fff5fd7789

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

