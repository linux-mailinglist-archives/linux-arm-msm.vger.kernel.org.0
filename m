Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF2473235A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238573AbjFOXVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239804AbjFOXVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:21:42 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBA02D54
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:32 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so11608850e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686871290; x=1689463290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWBWjSF1nxb4y2V3Mv+crQrjFgIo/GaLCfzRkH/TfkU=;
        b=QVZvniBWsJ8h+OenYCRnew/fLXwpZpO80jAhjXA7MXEUE/ZzSR+yMw4R5zSIcSbjR+
         W6h/FC0YXKdMFEUk+W+ojWh0KIAZwk6ldV4h7WMSY5BvSCZTVYlsDi0aQ9+LbfFs1o2K
         blXy22YZFwOcu/EWVhyVDz0oodfxks6FYTJZaRgs4GhnJdbIY0VEGL5y8G1q0yeLUrnz
         p7S/MJlTyHXC9R0ucPi8qC498tpjzeqcbwp9wQctO5LkIWWjrRfhPQPBleLhPuVnK5eV
         fjmFjHKhVW/7wxWcm5WyP3tPsN8Ia3GwbuAvEW9tHa9lVPRyofbMKtr0a3HHdJC6Gymq
         vLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871290; x=1689463290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWBWjSF1nxb4y2V3Mv+crQrjFgIo/GaLCfzRkH/TfkU=;
        b=IvztbuPWLj2ahzzjibDOsSU5jAWxWq5ZXMSScemK9uli0DOIl72v9pwXgFpLT1sONa
         DI+YH9ROYcn4S+ljYaA3nmwyxou1Yii7SlWi013jJ1vq85e0IqhZvNGEda8bMIFbTpbk
         2g/cNQkIpq9JJq35Zp47BY0rh4UoeNEQcpWrnQur0E65d97MsVXJm33YMC7fkaGy4FYy
         P6KQC7/YMDA2/g37V70nw1ye2uJjY5Q7l2fk+Jrf5N3X1Te5xOA0pgCyirTYPzof8sTD
         ooVPCfYmt/KoktlxW5ydA9F2brjq/e96cZz4oAlgJ6NJIsRK4aB5/Utl8R4otskMG5Y1
         LaaA==
X-Gm-Message-State: AC+VfDzlmG7o0CDbAx14iMH133Yl3SrpHWcDhERhBhH4UtsIrnkQErk8
        uhXDTm15XR+Ht2McATXiPtTZug==
X-Google-Smtp-Source: ACHHUZ7QNw8GxO27TLJN76WVDNXmdi40/BDzJLma3CCK4sCvQG+sDQyDejq9JeWLtVh22hvAlvrOow==
X-Received: by 2002:a19:711c:0:b0:4f6:3000:4d5a with SMTP id m28-20020a19711c000000b004f630004d5amr68373lfc.38.1686871290719;
        Thu, 15 Jun 2023 16:21:30 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:21:30 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 16 Jun 2023 01:20:49 +0200
Subject: [PATCH v9 08/20] drm/msm/a6xx: Add a helper for software-resetting
 the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-8-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=2561;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+qs1naLo5mMLIb06LDrZUW3mvvjoeZYSPQxSiYbvaL4=;
 b=hePXBLkkz1Ku4+iP0379WgmcuORZblLksSBkEmpkEPT3q5TpvmWGcT39az9jXcbBY8XGdkpeA
 4tnNZzcPdSEBQSadfv5Z1vDy8YZzaffSfOBtB6b3QsoCbrLR8cKBUFc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
GPUs and reuse it in a6xx_gmu_force_off().

This helper, contrary to the original usage in GMU code paths, adds
a readback+delay sequence to ensure that the reset is never deasserted
too quickly due to e.g. OoO execution going crazy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6402544f6849..906bed49f27d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
-	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
-	udelay(100);
+	a6xx_gpu_sw_reset(gpu, true);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d5bd008c2947..b627be3f6360 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1742,6 +1742,18 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }
 
+void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
+{
+	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
+	/* Perform a bogus read and add a brief delay to ensure ordering. */
+	gpu_read(gpu, REG_A6XX_RBBM_SW_RESET_CMD);
+	udelay(1);
+
+	/* The reset line needs to be asserted for at least 100 us */
+	if (assert)
+		udelay(100);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 9580def06d45..aa70390ee1c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
+void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 
 #endif /* __A6XX_GPU_H__ */

-- 
2.41.0

