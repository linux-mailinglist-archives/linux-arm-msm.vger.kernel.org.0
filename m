Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FA16B993A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjCNP30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbjCNP3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:29:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C456CA03
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:28:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z42so16374720ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678807734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWjB1jo2oF2xwJJ102jTozy9p5TkFnrvHvYrl8qyrB0=;
        b=U0ylajaB+0wEsxIxOVeE8bp50nV7CxYFnDZwn01TsEpGvlJ41XzLpFge1lExLCKA9M
         dbXm6jRnmJIUBJdfmw5M3RlaseAPDoqOaqEgPaUpipy9RJ/OHPmMMykVp4TRuJTtj2y+
         XoSiXksOSBu0WS26LywUay2yycutMKGIa9/leF/5wCs0gatjRzQXcrWCvzemR8aQZGAy
         1ME3wTX9eyLGePVQjhw0HTSlJmj9LDlRGUgTZRdY0CEVPTAAs3l3q2be0W12kJtJiL1U
         gYqn1DQqY1NKeN8ckLrmIDlQiK2LD3BlINgPocgW6JEVbg8VNMpVgnIMyAHfN1PycoQk
         wqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWjB1jo2oF2xwJJ102jTozy9p5TkFnrvHvYrl8qyrB0=;
        b=gVaZurY+HEJAXp/oIZ77K/6HNf6AAVIKOrWLTmxrENL23WO8Uw0emE2H570jwNh47J
         V0Hx15m5T81x9HLoykmrABdbEWqDdyEMhrFxMQ6BIt6r19OVUhLythbGH6moxRrMflJe
         WvruOeeWOTiuveLkDCIkIanEUFalQ77w2kuCS3PdmRqunrtfqgoZy55Dr3tVLQ9vwCgm
         UJLnWkWTGRWuE9kaZIoKa7+at83Kd7FdCaetm41HlXozy4Cku/VtwIrswZQDM+pJ2WGR
         y6KkjwzK6zA6iOE0IOOLQiUO8pTc4d89oWqTC5/N13CBXfeoO+oOOTqD06lT8t0AOpQd
         rtDg==
X-Gm-Message-State: AO0yUKXZmbJcNQSMGgev9DE5pnuoUeDpC92ASy9dAX5Da6RjHuPsk0MI
        D7sv33zA4faw4r3LTmFtgC/m9w==
X-Google-Smtp-Source: AK7set+Nng4rruM4NdjkSTdSWZNX7B/VXQi/2NhJ2V+ZnImu5cY1DbFbss0aIC9ZifEGETiVccp5sw==
X-Received: by 2002:a2e:97d1:0:b0:298:9fbf:61dd with SMTP id m17-20020a2e97d1000000b002989fbf61ddmr875311ljj.16.1678807734836;
        Tue, 14 Mar 2023 08:28:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:28:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 16:28:41 +0100
Subject: [PATCH v4 10/14] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-10-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
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
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WDcj/M9aJ/8+tdxnVyFZAeDamawmN6hQgw+VzGKE91s=;
 b=T/5InnJU8B58RuzS79qY+AAoksalL8zOQ+JCAG2th1CRtFEh87n1KTepybkSWQo5GP+tt8vPUvkn
 2Rj3TBOJD5wBtfFVeCWxK/FzGecgL0PHuYjTC/Z1POdGewZZIxo7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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
index 776db13e2a26..f699f326021f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1189,6 +1189,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1206,7 +1208,9 @@ static int hw_init(struct msm_gpu *gpu)
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
2.39.2

