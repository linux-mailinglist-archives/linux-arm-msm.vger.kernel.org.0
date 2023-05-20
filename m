Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B9A70A7C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 14:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjETMT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 08:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjETMT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 08:19:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9250F118
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:19:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f1411e8111so4646862e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684585192; x=1687177192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
        b=LmHGqYnABUafNaPABeP2QjeluLRpjhLp4yPSE7jl5S8sQp5kHG+RNCouuMliy6IgHV
         jKY9FSOC13BkIrlFhDok7DGcFz4Hp+y/bl8IDyzSvInUhlvHooEXQjKr4D6p9NZFDYXG
         BbtWbdh3m3YUon7XvSMPZYmK0uxh6fxbeDmo9JQwOokLdn3bX/vmqMmz5TTjdtTa0Fvf
         ZUb7ykgoAm5GCQ0n0nmGpUuxHIoXC1rKkJ6jYTTKMWNvFGYNux40/6UtpRZltXvh/ZzZ
         PiNS1NnWaYuBnj3+OuGsQBRskvYG2+QOkaWCWwq3d8rb4IjDcQA5SJvVtxUWjbvZSCE2
         ujfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684585192; x=1687177192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
        b=Z2Ioe9OeMG4zajYYIvf5DT/iLdS2Q4tR+pfTht/MZPdYvkiip/m6h8UQ1cx1RN2B8s
         v6tn4CNGNcc+r3p4MF+kXgQqPVrfh/K4B1/CxyF/d74q+pZCPAwpvCeystA1op7mQRdH
         qTtLNLDTqML95LOQd81rc3ebNVVJXS8cB5bsZoxw6JCrjG/WbDF7w/hgfRHd31S1Hi8l
         BJ4b+BmY5Jw/Xb0JnuPm8VkOBisUtiM8yBXjAnq2gDVUKn53nv1By+DePL1MQgwdUqwU
         HgkNSMpN5wBAe/c7PQCqEAfXcP1s+28c+cc+v1g4OA6h/sialaO6vcjTrUSs75t734wT
         92DA==
X-Gm-Message-State: AC+VfDw+jRfDT1taHqwo82c+Er5Gub4D/a4gLWR3LPH2aHS1Ovyf1Qy3
        3+M+Ts/uylcJMvGga+8QYQmshQ==
X-Google-Smtp-Source: ACHHUZ6ICfLT5YYcL2/wUfqqlVAi7l6WT/IslOFa4mfbkqkaH6uDqf1vcuXSp1Xl5GRUx8S5baudQw==
X-Received: by 2002:a05:6512:92c:b0:4f1:4fa4:4f56 with SMTP id f12-20020a056512092c00b004f14fa44f56mr1400995lft.17.1684585192697;
        Sat, 20 May 2023 05:19:52 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 05:19:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 20 May 2023 14:19:43 +0200
Subject: [PATCH v7 03/18] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-3-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UGqbGuIs6LlGAaix8p6ok6zP4Iy0VYtXRGz1T9C6CU8=;
 b=m8aH8XPh7v5Dj1EndNzZvNNQ6ljpLmn+70wT7ITChRrR4tAj3G2lR/1F9BTKGmJdgK9WdnE+m
 de8u2FyFLxLBlnBWxeGNWgIDt/Xy2w7uBE+EFfMxZislS47gLLwN2T9
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

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.1

