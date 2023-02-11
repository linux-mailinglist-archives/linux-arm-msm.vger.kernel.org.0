Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602496934B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjBKXNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjBKXNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:16 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5710C15CB5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:15 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id jg8so23960042ejc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
        b=C41KQCwzE9jkUvf/2FyTtIegB9vbMEEW7WPPlEUuhcsqfWpkvf6FsHfJYcnWJU7pDY
         QOA8222EHNSWSPFvrGcQBGNze3AVSDc3IQVglx6eXQ1G7urnq2EbgGGdOvk7pt38t4PG
         zCBZeQbV0PNdjj2whY5NlhJ4Z7coDyDXU4F9rW5VxUsBP9KckR2OEEQDEuaHzOrpmh2d
         7pgYoZbCsg7gsg+HWZREAlwaTO5Vid9PDDs31H/a/N68Ba5qU04NFX/pLUDJQSIV1xeH
         QB3i3JNwKwNI/F+Q+2qiEnmt2ez2Kb+b3qFPdV03qZmsAS+BMXjhNVcrUnTSl+42EWNy
         CxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
        b=KDjCoOa+ZwHB6maKNWVtjOssW9vbO0ZLXsFioPESpusrxdpEsjPTdftOOl5QRx2u0c
         /tTbwwLbnc6d8CxntRGphV1REOvnouuHkWqZtx+TScQ9Qk2esGwyxoQskAQzR17f+SWH
         5rHWEmLltMy6dRzbcIdHoZcjk9wmTG/dieQoi7+EYybU0SB7XoaeQVuV2czkHtMZ8HtQ
         /3z4amlLAFCTrjO06QCWZQeFECxQEIKS4oJY8sWfRnqZsgzvAET97EOtTsx7WSna2Pdo
         5FjzyOuTUCV4xyhl32Rt1Y5SmdXZD8a1cNas+i4UQuyFsB5soLzKneQJmXL2azO1gGig
         OSAA==
X-Gm-Message-State: AO0yUKVPEez4/M+mVtFfF+PenVzMrd9Rr7dgk0/WaNerJqpmZo+aDN0Z
        bKvs2DzVuhxoEIsx8kkzj39USQ==
X-Google-Smtp-Source: AK7set8V9CAzt5pfWmHVkPguemQENHK7B7i1ZlxK3RjiOM6ZttJ1M7g+8eERNLxlxzuGYIGYpclz2A==
X-Received: by 2002:a17:906:dd9:b0:884:3707:bd83 with SMTP id p25-20020a1709060dd900b008843707bd83mr17475021eji.69.1676157194934;
        Sat, 11 Feb 2023 15:13:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 11/50] drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
Date:   Sun, 12 Feb 2023 01:12:20 +0200
Message-Id: <20230211231259.1308718-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

The msm8998 doesn't seem to support DIM_LAYER, so drop it from
the supported features mask.

Fixes: 2d8a4edb672d ("drm/msm/dpu: use feature bit for LM combined alpha check")
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a26ef7bb024..02bd8334d67c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -52,7 +52,7 @@
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-- 
2.39.1

