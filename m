Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C8F765505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 15:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbjG0Nb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 09:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbjG0Nb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 09:31:58 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AE8271F
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso1757900e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690464715; x=1691069515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVF6Gl1t1mutYFS9NN8YkCozNIb6oFM89YPHjp3dd3o=;
        b=s1dXptnePaBLtDB1/mEJggAgj2cfgysBQ8x1Iki2zCzmMTZVqp4XmrqfgPVnJuUBaz
         uoHuVCuwmveQxah/MjYXmQNUqDOjWdZG+cZ1ypLSM9kY7elsYkVciMRYPIpe1AEk9Bl3
         iYuTrFvr9E4YSI32b3JneOPW4evw7q19KEeA/QshNdcQf2LE8zoFgKrHyiVRaBzMzeXI
         C9Ml6C2OzsugocIZLI/5+FXg4DejmhCKA8Unp+RwU3QcQbV8Io8sJQvWMvxQxji640o5
         swKoWWOZLD1rLGaWKpjbtBJ+4ENrlVjuLikWvU6bGyLcwcNuVF5BT5zqbYJWBrS+JI4H
         5HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690464715; x=1691069515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVF6Gl1t1mutYFS9NN8YkCozNIb6oFM89YPHjp3dd3o=;
        b=KJJ6XBwSyR7lxlD9dkxm8wUcJmR2B3w/8Kshn2e/woT/0KPzJD82T7rVMZGcNvphAa
         Fgldz2JosvgnLdVaeJdRUjlEHZXb4GpIrJBQne7uSwtk9ZpIaeOPCdu6tI3JFot7ZM1p
         KQFmSiO4qB6xmw8tC6vj8foq/OEILmQ9gw3W9TWinhQo4awGuUWwYcD5cIdH0QerH3R4
         duh4yip3IrrA5HLODXJaJoXqwZit1pFiqWGc88C/xso0BURwDNr8EkRlcFeZMap8wPMO
         fz+ESTKT3g/Ke+PBf0EfU+IrNLe5YSokku2EVTWTocFpV7jyuvNVVl2EnNqe5GMV1cw3
         2ijw==
X-Gm-Message-State: ABy/qLZIPIcSXvrJQpwl0wQ2M26HKXCHG8GkwIt87KuOAztsVWfokKCe
        jj0SObQu3451MXV2L+L+Siw5Mg==
X-Google-Smtp-Source: APBJJlEkC9CoQoDX2Y18CoZv8e3Tg6vTM4kIP/co/BmAx6SKQSkAAgZysB4OCeNhgPcoA+UJHQ93Xg==
X-Received: by 2002:ac2:43b2:0:b0:4fd:d044:cb5b with SMTP id t18-20020ac243b2000000b004fdd044cb5bmr1690109lfl.55.1690464715148;
        Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 06:31:54 -0700 (PDT)
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
Subject: [PATCH v3 0/5] drm/msm/dpu: rework interrupt handling
Date:   Thu, 27 Jul 2023 16:31:49 +0300
Message-Id: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v2:
 - Rebased on top of msm-next-lumag to be able to use core_major_ver
   instead of adding yet another flag.
 - Dropped the DPU_INTF_TE movement patch, useless after rebasing.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (5):
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 19 files changed, 94 insertions(+), 190 deletions(-)

-- 
2.39.2

