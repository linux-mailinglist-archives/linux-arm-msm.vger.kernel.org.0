Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7AF067CFF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjAZPTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjAZPSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:18:35 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E4920697
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:18:05 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id w11so2207234edv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
        b=GXmG/u1h816X05sgf8P1FECsAAVuqm7W8uZuzMlJ3yYinH721+FYFN9aDfAmNDTt1p
         X9WWXSUesFBuZNbZ5sXvXaQLbK7szTktWxlPz8/sR7fOQ6jSW/EE1ZexvSS6g58+CAEd
         CaOmskiFbo7tqyydjQV7uLLRxEo/8jf8AsSF+y0cW7iHOMUC9LVv9YTjn2VjVCHDC1uC
         Wn48JLQeSpERIKxWCkbVTLUQ5rD1nve44WQniwh5GbVBrVkkjPvHkoUcyVav3Adia2j1
         IgxcaUYHYDIYJINQsTEg9zm/4L6Gg1nOz4Bzk7kqur55bEQpPoeZhDBmxAhgIXwobgYg
         M6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
        b=dhnxux9gSgkNnFo0L9dZopo+GmYtYf3ZE0nR6sIe2whSpPQXaXbCeSGXYQiKS/o+CW
         BbfmionNTuaGAhKTZTXHWm9XCHo7Q94F9Z+SANhP76nD4zhfQDpgYWQYVH8GkIiG1s35
         vzx/J8NCdI7u1TRwl7XVvOGsNfWWBrhT0XWyIj1ECJ2fnoNz7J78PfUaOFLMxndxvan6
         mIOpj9uUuFySVPG5mgO3aOOOWKjG1UlcTuV1qy2ur5m0C347p0JRkwTHlQUUfGz0LSHr
         zl6g5sUdKEPkdMIvNB50G+Vk/QAUUTschoyony0Pj7Rs7+2imZejUQ5tvb7q9zq3gSKc
         0j8g==
X-Gm-Message-State: AO0yUKVf2yv/urTucvH3KeBmXFTxRTJugAzM7PUDCLh+u/FfffRNIwzi
        XA9iGIJLJRu5xQPi+UmnsOzpoNViEYUsNpWQ
X-Google-Smtp-Source: AK7set/ykZUSLMStAUNJlo7q5VvG2BHWVGFSh8/CbaVeBRoljyctPOuurEQckisZ2pmnXW2EGweKww==
X-Received: by 2002:a05:6402:430b:b0:4a0:afd5:df81 with SMTP id m11-20020a056402430b00b004a0afd5df81mr7170467edc.35.1674746274366;
        Thu, 26 Jan 2023 07:17:54 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:17:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] drm/msm/a6xx: Enable optional icc voting from OPP tables
Date:   Thu, 26 Jan 2023 16:16:15 +0100
Message-Id: <20230126151618.225127-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
for us. This is however not the case for the other GPUs. Add the
dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62f504ed7ef5..6d6b71306ee5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2335,5 +2335,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }
-- 
2.39.1

