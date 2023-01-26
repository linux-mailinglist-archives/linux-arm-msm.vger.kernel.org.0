Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C0C67CFD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjAZPSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbjAZPSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:18:17 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D1B6D5F1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id y19so2158478edc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
        b=WycDfuOeAMXNIrCnI7mqkfBVYLAdUHyfVKbzu+0R3Kls1cp1yXX0ookuee148acXZN
         9m7ALcUa2MEv5z7jmcZf9NYELk4j5FfiFt6ZG7fJJr6ve2Vov4gvdB1UtgfS04zZPQ7M
         DKnp/WP5UqyhDW6K8I81+MDRt0SXvD557NoNOHkoxAsgQVpng4Iso5kYm8itzDed4jup
         pGmP/XudT9/YV2uY6pIk68JFGbkLl3n7Ww387RBMl72Cm3oghYPhTktQUDg9pkudR4ma
         cdoTfIouJrC0NhnmAD7IBMSEILCU8YCPS29b3YhQRIbxvGBUIzYqWVe8qY6CXkdLAypB
         BUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
        b=P1n+bG/+5E3KIiUxiVJXzqwv0ofw6WtMzE25GwW3Vsx0dMIVKhMQl8QLdUsRff6c3+
         bZPxl6AI5STjZDoqxnI8+fMVxYa4Oa/w4+q77hruWds4mNjBjpGcTl+TW2B4JB0oADJC
         FqX3kcktzWyrTu8aKKD+KBhy+9ArPKELPGzgtH2odI0pjeztIUIwJQSLNGLnRXnhdj3D
         zU7YJ/5Yd2+mWdGpGLZ86bay7+iXrgCA6YmAaL9aqblZI6vD4SKVqvMKXmrCITEScVwY
         hQnHRLCzTmYGgvjFWDBFybawFZ68pXmkcgfFm0CslBPuEUm6WvTolN3SHrIg+8L2+3O1
         uj5w==
X-Gm-Message-State: AFqh2kqie8rqBm2lB8QXkH98JU3klw5XIJIgSxCZzwfpKLJaVQtHqQYa
        ISwfuBUAmKegPdPZ1JEKJGPkLzYbp4GPCQVJ
X-Google-Smtp-Source: AMrXdXtYw8AIVUi0iCcQsXJSz4GqxpS6e3+ueaMfAGJ7o2t91Civs5gXDDQXTo9MmSbmEMnio0pmiA==
X-Received: by 2002:a05:6402:524f:b0:490:47c3:3d7f with SMTP id t15-20020a056402524f00b0049047c33d7fmr52370898edd.2.1674746229163;
        Thu, 26 Jan 2023 07:17:09 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:17:08 -0800 (PST)
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
        Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] drm/msm/a6xx: De-staticize sptprac en/disable functions
Date:   Thu, 26 Jan 2023 16:16:05 +0100
Message-Id: <20230126151618.225127-2-konrad.dybcio@linaro.org>
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

These two will be reused by at least A619_holi in the non-gmu
paths. De-staticize them to make it possible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..90e636dcdd5b 100644
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
index e034935b3986..ec28abdd327b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif
-- 
2.39.1

