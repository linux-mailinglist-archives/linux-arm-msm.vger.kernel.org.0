Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4ADF736A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbjFTLKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjFTLKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:10:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DA4101
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:10:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f769c37d26so5969354e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687259440; x=1689851440;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoT2GR/Uoi2aGgdfRzromK+7BmskPgx1PJTo67yINu0=;
        b=SjWj58M0HawcUhEnQUhjDM2rl2u3ACNUOQeMLzsfSi0fTfnUMqvhrYeKRIRujPz8eW
         O7EEYwV0QGDFDPaCpuyfIx23shDmD5szRESu4SFz70X5NOVfeNgexNX7qzjUAgWn4v6h
         FwyolvZ1znYI46bFZgQcjoaCwKRHBQ2+Imxbz9y139MVOilQxeRvXK2XLDyqp3JUwCKU
         LUcRfiEI6VcFsvIQ9Ll7TwR/L9A7nVmyDthePNoE5cr6DgJ9mMcA70dsrYIJK9GWyuxY
         hLgXz/e7892voLDN5mNhNxyw3NuYJMK2nO8PWJZu4VKw7rMMyzFK0WzB0ebL9rcW0Rv8
         BQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687259440; x=1689851440;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoT2GR/Uoi2aGgdfRzromK+7BmskPgx1PJTo67yINu0=;
        b=NbpAvKjs/njoJJ7HOx7q9I6VwAXcqSPElmnvkyEmclZkGoZheNBjf36N2GzVIPdtYT
         0rb56yvkKTJg61fziJD1aeg7tG8wrYEv4r+nNiw7pvgfKOP/g5tX8+mFoYg2ydPMXPve
         ZUH0cFnplwyzt19scnGiRR67RBnowWpi874rywiEeROE+gwYrcGbZJNDTVRQkQBFYsla
         XFJzzSpglIx3YtPNw54a98tcKXLjsBC9BVMyhWB+AuqkLuAroiCqzU+B4YZyIl7Pk8na
         nSNpytPfRqIdzRCVtNeBOkH/k9960xwAR/uHzwx/XKwV2fTGEYYKYk+pANmkw+jZjuip
         i6AA==
X-Gm-Message-State: AC+VfDzhlWqGKwLaGYayrpAIlaJOqSRLqOBhqstmAms4WOL86R4YDoFf
        Q8ys5wRPsaV9eJGrMHG5C7+6Tg==
X-Google-Smtp-Source: ACHHUZ45duw0feSQ/bSA0cRlMKEsqbS53ljbZe0BeA7XZhGamKkfrfynxW77p5B4lFpDMQzTPbmzPQ==
X-Received: by 2002:a05:6512:288:b0:4f3:a99f:1ea1 with SMTP id j8-20020a056512028800b004f3a99f1ea1mr7040192lfp.45.1687259440360;
        Tue, 20 Jun 2023 04:10:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:10:39 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/6] Adreno QoL changes
Date:   Tue, 20 Jun 2023 13:10:35 +0200
Message-Id: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuJkWQC/4XNQQrCMBAF0KtI1kbSiW2MK+8hIpM0sYGSlKSWi
 vTuju5EpMs/zH//yYrLwRV23DxZdlMoIUUK++2G2Q7jzfHQUmYgQIq6UnxMQ7Ac1Txfh+wGrg4
 KG21VK7xn1DJYHDcZo+2oF+99T0f69GH+zJwvlLtQxpQfn9Wpel//D0wVF1yhbvYenNYWTn2Im
 NMu5Rt7YxOsAEBAbXSLCAasFz+AXAEkASitkwpqeajNF7AsywvpOsZDRgEAAA==
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1738;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eX5ZTxH/9LwPpvZBJk24YxyZZoovg4iLjcTUF8O57GU=;
 b=eYdW9DwxTwYnC48PMFoXBqN4XCttHvlsNmTdrnieqG6ADJHwq4DgAv5Euo8IT8Sgs6KGjoJYS
 bcv2VpLfEIlB4d9XqRNEN7KOTFEqoKzs66a9BGbti6xQED2Id7N9kH3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v4:
- Fix an issue where half of patch 1 got squashed into the cover letter..
- Link to v3: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org

Changes in v3:
- Pull more definitions from mesa
- Decode CP_PROTECT_CNTL bitfields
- Rebase on next-20230619
- Link to v2: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org

Changes in v2:
- Drop switching to using the GMU_AO counter in timestamp
- Add a definition for REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, may be subbed
  with a register sync after mesa MR22901
- Link to v1: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Add some missing header definitions
      drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx.xml.h     |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 ++++++++++----
 4 files changed, 32 insertions(+), 8 deletions(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

