Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D323E732388
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbjFOXWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240151AbjFOXWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:22:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71E32D49
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f845060481so1674413e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686871303; x=1689463303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfaunTIpb+/JoaE2P6J1QB9JUjqHG1mwiTPg5NcHdcQ=;
        b=w3Kx1SA00eZlb6JC0PPb54L1DnPi9w4zvnnhpAM4RsVgwcvM+cTuGhIDGFnVNcPFsX
         0bHAGRGFhrYQnk4ONN92/KJKJtCVvQSyj8ZGUxMEpmGO5B20ttqKKESQeRC5tENVpAg1
         Csp8gZ++1lD8BYEEGNCeG4oNZlbWPn07J6k2Wx3HpeTv5ZkkhCLr9KpHSViaVSzzqwbd
         /uNuTTJvzJe+Sb57WYdd0uoGX8v7YwZrqVT+axJquq5knWSPdc4fYA+oSvLhUOM7hQ1F
         g0H7hmx6z0XHYhn2zY0bWEH1CF7uWRUkdoHfDgy4wyBikwGso6CRotxf/9Ywpi9Wdrix
         J51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871303; x=1689463303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfaunTIpb+/JoaE2P6J1QB9JUjqHG1mwiTPg5NcHdcQ=;
        b=SA2VAux8T//J+oc64UAe9xwyFZwDOV4nGatDABFXF+OIeGBGNyygj7EOnqnGEpr842
         Ri2OoPLA0aGYwNNkE/gPNo5dGrUQO/vMJUrYsoFKBqBCJNEwr4MV/D2N3WP9wkhE2YRS
         QYn31v+FZOroQxJyYIjYgzFt/bc+/92B8I1dEhl6Un8nMowaVM5EW/oQ+WDRhJ1LBiST
         Ib+cCFAVQJgpZRh+sL+S8glrrjOGkKiE5PvIh6kljuulIxLpI5U5Sbh7J0Z4YhOFg/HH
         11/DHIvDGzsa11IQohoMmpm8eMDCg6BTqZRm7D+5YoIMrTEZkC303giwAVwUygVg1Uqa
         +5Og==
X-Gm-Message-State: AC+VfDz2jpnMNjCgzckBW1I1eAe+EoItwl5PV47lL5C4ilbzhDTsvOi0
        Sqnj9ciLth8SpvPQViMmpI6CMw==
X-Google-Smtp-Source: ACHHUZ5jgZXxBLpuIjWhWV9Mgll9v42yr+AaAP/NNiIc6Ku3QmceO4Iy+8LG8uwL5++Sx4bNC+sDvw==
X-Received: by 2002:a19:6d0b:0:b0:4f7:6388:5ec1 with SMTP id i11-20020a196d0b000000b004f763885ec1mr66782lfc.58.1686871302845;
        Thu, 15 Jun 2023 16:21:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:21:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 16 Jun 2023 01:20:57 +0200
Subject: [PATCH v9 16/20] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-16-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1593;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4Gkjo2VDVoi67z3y3hIRakJY3LPFFJYUf+088rGo/nQ=;
 b=plJVOj6DU3u87R7U6VX8KOxp/8dRK/42FlGKYQ7gNc1INHp6+QX8s1lmrdm+M4+MaPJrbMWvx
 ML+PsOizE9eB34tgy9ZV8Xxcz1cu5Tc/vi4y24gMwVwfEiFZ1VmlY1i
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 47aafc9deaf8..97e261d33312 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1306,6 +1306,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1323,7 +1325,9 @@ static int hw_init(struct msm_gpu *gpu)
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
2.41.0

