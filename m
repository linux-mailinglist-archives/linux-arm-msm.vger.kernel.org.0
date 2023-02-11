Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CF6692CC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBKCK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBKCK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:10:58 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C29773942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:10:57 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so20248609ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6hXY5qH7E6QkEVbSGwR80wGsqXPfBW3dz3Y94maE6JY=;
        b=b05kldMrVKaejm2R68XOD3ANon3jqRUn9tj69avSInETqVyQeCrpUzrYfI3HXF9tmI
         P+/NptKfKKTkmOG6rZkjHwOaoZhNyra9djB1FMHStvGmAomoO02wHA7GmIinY3DIY9jJ
         GBNkUzxSutucEDH2PLXv4om7jmVZU5vredBk+zZIJoJTDyKxqoTxz5ei7GspKGTF60ZI
         Rq0RPRwJWr0UuDWKzy8bt5IdxVqT9C/aMTJ28U7rw/OXEJQbaTnFA668PnzUX0fOkbAD
         9nqikMqMAMl5YkUqf8NyVfXXdzyRLeopYj53zIkkQqIX+isOrwxSDIC1cpQCdA+qY4P/
         KYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hXY5qH7E6QkEVbSGwR80wGsqXPfBW3dz3Y94maE6JY=;
        b=CjShcbw2PDTevoq0Nol18A8l9pK5tcmKz3vXIOTjk1At8DRp9LeCmjtc/EmXHA6QvZ
         OkSQpmhX2e7jDs1fYeyQOfufmh6yqjS8JtnT17uAvwjbAseuijGzE5fAHGDkfr0+M/em
         P6Eb37P4+7EBXi/FUlsi5zP0n/4cj+8U/KHUzG9ixb7GMeyD3WZpx2jJfBL2218qq3G6
         oPsVv8Y6Iq+qUgyTQvpAf8IX+dWb8Is63tzeJIBgU8aOFae4VOjuFpka84bGaZBdN9uZ
         3Gp06sL3wYmrsviJqzEJGEtYbCCg17a9QOYxME3U0Bneftkcf+84CagXxn42VVCPpDlb
         fS8Q==
X-Gm-Message-State: AO0yUKWNyiEN3H2TJsHBL3nWXLDQ9mxdg7Mk1yIubLsDyM6UViVHHxeI
        tB1SW2cHqAsEyllVcgP19MtORQ==
X-Google-Smtp-Source: AK7set8PJOR2U2iajUihDbLspiFSxFRTazkl/1iSqzcfV3oQIjOeLvCR7mB+LkGWB7VnAdkRnVCkiQ==
X-Received: by 2002:a17:907:318e:b0:8b0:7cf6:104 with SMTP id xe14-20020a170907318e00b008b07cf60104mr166609ejb.67.1676081455379;
        Fri, 10 Feb 2023 18:10:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:10:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 00/43] drm/msm/dpu: rework HW catalog
Date:   Sat, 11 Feb 2023 04:10:10 +0200
Message-Id: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
manageable and reviewable data set.

First 3 patches clean up the catalog a bit.

Then the next batch of 13 + 5 patches split the hw catalog entries into
per-SoC files.

Next 14 patches rework catalog entries, mostly targeting QSEED cleanup
and deduplication of data used by several platforms. At this moment only
three pairs (out of 13 devices supported by DPU) are merged. However
this part lays out the ground to ease adding support for new platforms,
some of which use the same configuration as the existing platforms.

Last batch of 8 patches renames existing macros to ease using them while
adding support for new devices.

This pile of patches is submitted in a sinle batch to allow one to
observe the final goal of the cleanup.

Dependencies:
- https://patchwork.freedesktop.org/series/112847/
- https://patchwork.freedesktop.org/series/113894/
- https://patchwork.freedesktop.org/series/113206/

Dmitry Baryshkov (43):
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
  drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
  drm/msm/dpu: correct sm8550 scaler
  drm/msm/dpu: correct sc8280xp scaler
  drm/msm/dpu: correct sm8450 scaler
  drm/msm/dpu: correct sm8250 and sm8350 scaler
  drm/msm/dpu: drop duplicate vig_sblk instances
  drm/msm/dpu: rename VIG_SM8250_MASK to VIG_SM6115_MASK
  drm/msm/dpu: enable DSPP on sc8180x
  drm/msm/dpu: deduplicate sc8180x with sm8150
  drm/msm/dpu: deduplicate sm6115 with qcm2290
  drm/msm/dpu: deduplicate sc8280xp with sm8450
  drm/msm/dpu: drop unused macros from hw catalog
  drm/msm/dpu: inline IRQ_n_MASK defines
  drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
  drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
  drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
  drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
  drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  211 ++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  211 ++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   95 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   84 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   54 +
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  159 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  117 +
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  123 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  118 +
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2170 +----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
 21 files changed, 2423 insertions(+), 2153 deletions(-)
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


base-commit: 1d233b1cb149ec78c20fac58331b27bb460f9558
prerequisite-patch-id: 0898891b053cb26fac9905ab98ec0c80ff643200
prerequisite-patch-id: a2eee8202ca90755a5accc450b34ccd0851c862e
prerequisite-patch-id: e9c11a97aa84bd0f560cd13a54943ec53a8686db
prerequisite-patch-id: 1f4d1c2fdd7700dbf00f466c0a03d0d890e9f4c3
-- 
2.39.1

