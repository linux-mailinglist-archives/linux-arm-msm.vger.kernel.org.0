Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891027A8F8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 00:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjITWqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 18:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjITWqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 18:46:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C21EDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 15:46:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so27118666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695249969; x=1695854769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
        b=zmUHaUEdzDyYlqyrB4Lve7V6uUU52sqFV2Eu67kI3Yw/niDrOviUbZKaghbDLJj01R
         XdRJKss4/gAaumBGg+m9vcAiabkF6OFEzoD93YVLUiDIPNitvnx6GsgPgtbAu+WNN2FV
         vq6Zx/4n0unzW23nG9qTJ4XNiTQG69/cPo2GQHwLGJ+/kbtM0dJ9SdpqkAijamJuA04V
         eKcdvEagDCpsWUy6ny4XzRNoRhAgZcmswmgbuJe+HhPZzYhOK25IYJ2ru847YeUc3A+8
         5O3Yw+XAflTT7srQ57egs+ASPdgLHJbPjdGbx/7Q5+9jQMN8qdxQ05OWvvvzg5/pzesF
         I06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249969; x=1695854769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
        b=M/Nd9jk6bdQ74mLTAvATEN3zB5CgGixOlsVfnMeByFu6pROntyXBdv51HKOTfhmUj+
         qGiiPOpuHEv1ZksXmLY9biW4X1wQYLpBxxsuRFFpadnDkskh79umQPN7fbX0hqZPOFZy
         duKR0jICsLd7sDq1G/bbG8Ybo/TERaQyUjFK/a2W/XoMAHRHpAlFEFLlOJtI86JNHSEf
         wVfqPauLqdUvDutxg8fj0WwquEHzd5uf7yD7y4O+Fi3RREJotM0oHe2qEUl51PH6it8d
         WNF4fSPOqLHdrN7UsKi3nVao8M1WHG2Ehs24Ab9UDjGqCuMiw1JpwAzGVVBnSUBmmM39
         yWFw==
X-Gm-Message-State: AOJu0YwjIc3vJFucnW5hdxHaRLUapN1Z/VZ5Rs8kYyKDzdDDcKgF0pyw
        UhAm4rly6ISwwxE73ami7kw7ow==
X-Google-Smtp-Source: AGHT+IGmn7SRDvmNps2xltWiAV/8ypq3MJY+6zz/ooTGSLT7+Q/E1kHCXDOP6lmDewqMh5Dw1MUueQ==
X-Received: by 2002:a17:907:b609:b0:9ae:61d:4248 with SMTP id vl9-20020a170907b60900b009ae061d4248mr3049732ejc.48.1695249969770;
        Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 21 Sep 2023 00:46:07 +0200
Subject: [PATCH 2/3] drm/msm/dpu: Add missing DPU_DSC_OUTPUT_CTRL to SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-2-6912a97183d5@linaro.org>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
In-Reply-To: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU_DSC_OUTPUT_CTRL should be enabled for all platforms with a CTL
CFG 1.0.0. SC7280 is one of them. Add it.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index dc3198335164..b6a59d7b94c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -164,7 +164,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN) | BIT(DPU_DSC_OUTPUT_CTRL),
 		.sblk = &dsc_sblk_0,
 	},
 };

-- 
2.39.2

