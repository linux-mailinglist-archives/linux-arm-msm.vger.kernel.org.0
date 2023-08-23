Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76866785833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 14:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbjHWM4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 08:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbjHWM4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 08:56:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870CCE50
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 05:56:02 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso46677051fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692795361; x=1693400161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqJeHpeX/4m5NxynYAumdAwjnVZQoGDC/Sl39nPHglI=;
        b=ZCMHLOIX2pQY8hVPp//5SGcXKK7dF2GxOtqphy8JJbl9yjsoZzNYw+NPKtVgLILYes
         T5ALtgTL70OH0DekGKVkfoN0A/pWI9sgdgjD+E5cpVjK0+aqsrI4wCZoz8PUm0MyfQqf
         7j29v1GHHiKjkDJtsDx0XSDwxvbEqI8hAwMH5EZG9XyOZTg434ZtBNlW23iKZmOL+K4a
         Ispr/DeN18IMerhn2kuJpeOIEJmhG3RmO0TqqYqUF/d9WVmaQ1zRoBTJkaZ1lqGxSDJM
         qKHoZ82wxU7uk6yujcWMUI3Xy9UtA2by4oSbXUUO36Qo6U7wz9vglJrdYVktNo1iyyDR
         3CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692795361; x=1693400161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqJeHpeX/4m5NxynYAumdAwjnVZQoGDC/Sl39nPHglI=;
        b=QxKjk4sqXok6SqAhzUz74T7nEwQldz9SkiXlczXDTquFwXlOrIQSgamecd/xTvDDch
         mhz+aUo1PacSLj6yJCDdhvCh23YSQ2Hr+FEcW+GL/lygR9THi6WCtmwpUjhf6NL1waop
         XN29B9HC0DdYj+GH9FmdOo2J7MXwbUB9NZ77A9gOOe4x3UrVAcAYGb7LrAKPuNUqOGF2
         VGDuFBuYP+tHAo/h4f/ZB6o8CHnAd30QNW7UZJpMq4wl0ufUo1f1ynjcuOCEn9ogRHbI
         LwJFET+B4JPPCtpVsKmVXoTUPKmakuYXzZgWTekEOZb8nLqhan4z/qPymzovnMGUOqCv
         g5UA==
X-Gm-Message-State: AOJu0Yx/I4RKhYfTk22p5wjuX29xSlTwhsBN8yCMjx145xqdcu14SywB
        Hn8R2ciASVxio81tJaMtc36Pew==
X-Google-Smtp-Source: AGHT+IHwNrUI3VbaCReiY6q33DuTK2TQeY+Uz2VFt8Z8kRQ5HOimymlhi+B/px2Ye6SkjwnqEXHmvQ==
X-Received: by 2002:a2e:3503:0:b0:2bc:b75e:b88 with SMTP id z3-20020a2e3503000000b002bcb75e0b88mr8075729ljz.18.1692795360226;
        Wed, 23 Aug 2023 05:56:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 05:55:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/10] A7xx support
Date:   Wed, 23 Aug 2023 14:55:53 +0200
Message-Id: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANkB5mQC/32NWwqDMBAAr1Ly3ZQ8RNt+9R5FSowbXdBENlYs4
 t279QD9nIFhNpGBELK4nzZBsGDGFBns+SR872IHEltmYZSxqjRXOacJvXTVur5aGsc8Sm1ssKq
 tSh8qwV3jMsiGXPQ9l/E9DCwngoDrMXrWzD3mOdHn+C76Z/8tFi0Vi1AUtxKU1+YxYHSULok6U
 e/7/gWjU6wRyAAAAA==
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=4076;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1C4mbkYEO8JAVDJ8cizgufp3TfvEPNQ4yZ8RIY8Lh1o=;
 b=M16HvvoVRE7y0ktf2CwMlRTO8Y99aYa9zyrtbWT0qgSvGyCUlsrGe+fP7cnfmh0r5Lq/gB1Bb
 bS0Y1JJ08IfD4HSxbd7N/sZ3Y1CmEtFgC8jzK34qS9atf5cUc2CFNyK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series attempts to introduce Adreno 700 support (with A730 and A740
found on SM8450 and SM8550 respectively), reusing much of the existing
A6xx code. This submission largely lays the groundwork for expansion and
more or less gives us feature parity (on the kernel side, that is) with
existing A6xx parts.

On top of introducing a very messy set of three (!) separate and
obfuscated deivce identifiers for each 7xx part, this generation
introduces very sophisticated hardware multi-threading and (on some SKUs)
hardware ray-tracing (not supported yet).

After this series, a long-overdue cleanup of drm/msm/adreno is planned
in preparation for adding more features and removing some hardcoding.

The last patch is a hack that may or may not be necessary depending
on your board's humour.. eh.. :/

Developed atop (and hence depends on) [1]

The corresponding devicetree patches are initially available at [2] and
will be posted after this series gets merged. To test it, you'll also need
firmware that you need to obtain from your board (there's none with a
redistributable license, sorry..). Most likely it will be in one of
these directories on your stock android installation:

* /vendor/firmware
* /vendor/firmware_mnt
* /system

..but some vendors make it hard and you have to do some grepping ;)

Requires [3] to work on the userspace side. You'll almost cerainly want
to test it alongside Zink with a lot of debug flags (early impl), like:

TU_DEBUG=sysmem,nolrz,flushall,noubwc MESA_LOADER_DRIVER_OVERRIDE=zink kmscube

[1] https://lore.kernel.org/linux-arm-msm/20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org/
[2] https://github.com/SoMainline/linux/commits/topic/a7xx_dt
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23217

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Pick up tags
- Drop "increase HFI timeout", will revisit another day
- Use family identifiers in "add skeleton a7xx support"
- Drop patches that Rob already picked up
- Retest on A730, didn't explode
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org/#t

Changes in v2:
- Rebase on chipid changes
- Reuse existing description for qcom,aoss in patch 2
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org

---
Konrad Dybcio (10):
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init

 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 204 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 653 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  88 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  30 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  32 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 14 files changed, 1078 insertions(+), 122 deletions(-)
---
base-commit: c26a0f88bc21bf52303b5a5fbf8edb0cc7723037
change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

