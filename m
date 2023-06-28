Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A7A7419AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 22:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjF1Ufp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 16:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbjF1Ufi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 16:35:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A732110
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 13:35:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so1857920e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687984535; x=1690576535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkM6eACK+l7KK09aC4iRvpEN0T6pFUWvLy8n57wVeSY=;
        b=Wk87rACLpnAT+qXyvw65l5SaJkF7pt8Q2vfYNiidfMn/ez+0hqT4ECXI4GXSY4YEzn
         pbIus18/SVFGIoizV7WukfwTK+rZcf+IO9dGfzl/ajO2NyB9m8Vcced6Yyuk9/CRU2hz
         9DYQEgsFIMKEFGvkvQfu9PMYu8+97CuRODHAYACzu/Xai9W1EAuw/yRuWTUrf92a7QfE
         bsOxTFamvXGjBPKiamdrrv76NFLZvEfyZ7/67o+JBPu8KfvrpKZjy6nsD1oCV6nDc6cG
         W7ZgZum4RcrCCK1NQuRUTq0LY+AM0Gx1GR/zEPDWffQwXI5T1jizrUjMGEV/HC3kHsPy
         sYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687984535; x=1690576535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkM6eACK+l7KK09aC4iRvpEN0T6pFUWvLy8n57wVeSY=;
        b=EFRmr7ovqOIs63FmvLILoDUk48uVEXSfau3A1l/nRGJFobNeBvzPWVKDXb+Ao4/jGo
         PNIvy354QX9nR/3YVeqylAQJqEG8WJQ/0ZYTiA/A+65/brbMfO2PNzPsz1pOU0vG19DP
         EjJUh+bRItTltyeuJ0q/qJKSOKlv7ev282p8RgjglX5HTx5jbZJAb7eajkvVDNaq2k8O
         wxTJiizyy2IYH77t6ja5C1dhH2CcBgb803v8Oct5VJmDShiYNfPApePgRG0SMrCjx3m7
         KTUuqHQpVPWafq1FA5/2BrtbNY/LFqhkQS/ZvmjYEroxWfxyzVngqSK1lYIJfr+Z5ILZ
         aUMA==
X-Gm-Message-State: AC+VfDxCnGdYFLZXNFk5riXkFRAABksRDMD+vUzlRzPYgubHSKxu/tJA
        2+I1J7BSvt+lNy/Flj490k1Z8w==
X-Google-Smtp-Source: ACHHUZ5yuPrDceywU3WbC6OFqainhsthjjiGoMq5J/QDVEMJF3IKLcjx+7vdLigOv6OeD1rpweVziQ==
X-Received: by 2002:a05:6512:239a:b0:4f8:6ac4:1aa9 with SMTP id c26-20020a056512239a00b004f86ac41aa9mr1045562lfv.21.1687984535651;
        Wed, 28 Jun 2023 13:35:35 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:35:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 28 Jun 2023 22:35:07 +0200
Subject: [PATCH 07/14] drm/msm/a6xx: Bail out early if setting GPU OOB
 fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-7-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=937;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9J73aF30PI34nc92bobMmRBFeW3h6sk6+9cqWlv0aIs=;
 b=zmnxv1qkjjq2p1yEjeUi56tWX0E0Ek0pCy6wtN2JzIoG/ilSwtPl8RZ6guWx36wWuEwoXknCU
 FGScjwrujijAbVyqz0v4cw90pj4jSl6z7zz5YuNJkRicoA68Kcs0n7N
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

If the GMU can't guarantee the required resources are up, trying to
bring up the GPU is a lost cause. Return early if setting GPU OOB
fails.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c1c76fe288b2..7c8345ae1a30 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1201,7 +1201,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Make sure the GMU keeps the GPU on while we set it up */
-		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		if (ret)
+			return ret;
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */

-- 
2.41.0

