Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BD970A80A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 14:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjETMVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 08:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjETMUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 08:20:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B1A10F6
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso1052929e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684585210; x=1687177210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ip+CXVuP7IS2/mYQVsL3Ja3H2zQ181XB1GCMW1tFs8=;
        b=V2JG2a5J5x3ayG/iRny1Ow5v+YHDpYewZWpqNN/sDR1hWsJVBfSBDECP6YrUzAtqY0
         M5uHi1AfWgrb31dpuAXPMiqW20ruCogAeJVQgolKdgvYH0Kbe4VxuppmMgy39jJpzRjM
         0GSwk14yzn/dHchFdgxdiVcPi96YCzkqPkOLHAKoV/L2kv5RqV/AoJqXywW2klb1DC+H
         qysSxO7p1mZjRMk6ui2aJe/Nqv/UKvONqPdPmcxKbYVLJShbA4CRDPZlFtUzQQBBymst
         Mf5Zyut55ftnSRRTKpdq3hYbR3n+VZXbYcNLLTmVvjIrdPWX6v8TcyWlUytkSb5hax8Q
         uFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684585210; x=1687177210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ip+CXVuP7IS2/mYQVsL3Ja3H2zQ181XB1GCMW1tFs8=;
        b=kZw0UVr/RRb82zGb5H4odwUPhl/hbi7sR4Lwd2pOX/zRey2HrmRytbU+K9jmWiPHvr
         bGrHKtCvrkaAhssPBvpgVXh3gV/SG7vshMjJf/HYzCAhi7TdtoDTy9TaUBcBDvYNUvUQ
         ibh51TQOdn2tEsXqevonZCblW6IwC0lZL/md1U36WE2afZH9LB/BIqnVNRSLDzDrPUr0
         Y0iW3ZaldUJkAYpsL6qMbiUNhFHXMPyCPDVVw3DmwO8ZC5hGutT1V0xxSIJfJyiyfd/+
         6Kp+goASv0Vif1cNFE33atVSdiME2NtgduJInycJ4+gNx0K12fr5AmjBJBzp5L5Q0qkO
         TT/A==
X-Gm-Message-State: AC+VfDyv5qot0al1Jd7MFDSuNIRcvLRZGwpQ4w9vBIrp/ifBkJHOZirO
        lVxtNi2NfLXjp9ZZE+WJpQHM7Q==
X-Google-Smtp-Source: ACHHUZ78AGukOnCv6sbkq8FMEQtyJedUdD62YCMUxF/2gDPO4GHSdSnirfO3CFGDkmvI4UacEB267w==
X-Received: by 2002:a19:7018:0:b0:4f1:3d7d:409e with SMTP id h24-20020a197018000000b004f13d7d409emr1775263lfc.0.1684585209892;
        Sat, 20 May 2023 05:20:09 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 05:20:09 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 20 May 2023 14:19:54 +0200
Subject: [PATCH v7 14/18] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-14-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
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
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tiRhEnWKQorRchYKK0xFSXYxLCZIr0JF9605Ln4P3Mc=;
 b=6SwQwq/wcZwxW4yEQVOA5mZvDtrX7nHuyB/e5KLEInDWCrw81IDGPtjfjNDDBsSw+TJRba0C6
 RUXiL0DgPMoA1WRZnBdKZCN2CiNHUN9aJms2zOdcWl8HZoWUpEdm69G
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ca055bff23c8..9f296928c249 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1198,6 +1198,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1215,7 +1217,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.1

