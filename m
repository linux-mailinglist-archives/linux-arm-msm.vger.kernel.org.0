Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9FB16D114B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjC3VyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjC3VyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C36010AA7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c29so26407243lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQg9gpgrgVlfYanPGfaFL5CdShLYRg1QG1Vs9Bge6BQ=;
        b=buVeILSRsPRyJmyFUcd/k7r5bad61fwfiTTztaWYs9KYSWGPXYLmUR1TpD/W6WgqKQ
         p5mVJx135gTwH5ttAyZv/SDFHdIUo+0b0j3+svD2tVZkGdn9XwKiI8OUL9C6MIz+pCa7
         LobilbzS+VoSO+JF3/RTrG4J50rEzjoFV7o2Ug5+ZJhmRrGmin44vGty5qtugRNApNBL
         f7JCvadQxLffmzyvsoc9BU9iCJ3MZnJ+2+aPXukp31FhnwQLDPqp9v3rQs054rBvG+C6
         /XFzH2UQbSbnclx5uATZtqdY1ifkRFHsPnO5JMv2Ul21zCzJwtJgbM9K8ZdcBsdMICuY
         YRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQg9gpgrgVlfYanPGfaFL5CdShLYRg1QG1Vs9Bge6BQ=;
        b=vM2Uucp9bs9/XuGL0TlV8mUktWNY7Jb7gMVFtoS2smv27NuHJphnVlGl+/KunfhHGB
         WAJHRVkyDG46IiMuz4Y3GYZUj+eyykXadLRzJicQ2chPqkWZ49bGkY4gK7dNwr0hPFlM
         67Dj3xe9oIg7iuem5PP2fBjR2jH2KGaHe9bxHFUMiE1iJkKDPoeaw3G6A0BvDn44ou5V
         vJBouek2mEJcsCn5t3phCsvhK7bKWHbsgLLGsbmODpHvTupj1RgokR0h5Z8eVqqUPQ/Q
         5i6WUxlDbWP6O9zBqOmfh9/v2FZbH2G7ykVFBBX++aMbW8Jpwl2hz8NkL47vJUabsWzm
         vLWA==
X-Gm-Message-State: AAQBX9cTdBpvVfbPMB7JOcZ68tPzha90j1EWEm3R6rccGMys+ZwfCHGp
        3+gPQqGG5coqKbt+MUxOdiZ/SQ==
X-Google-Smtp-Source: AKy350YfnMlZQYphWeK+HJeNSvZZY9bLbPg3wSTRKq34/0Ihq0HD8jNRBjkv+sxiGoHCcqJe6lXWZw==
X-Received: by 2002:ac2:5e83:0:b0:4ea:f6f2:7a7f with SMTP id b3-20020ac25e83000000b004eaf6f27a7fmr7154807lfq.34.1680213252906;
        Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 23/38] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Date:   Fri, 31 Mar 2023 00:53:09 +0300
Message-Id: <20230330215324.1853304-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8a2991c48af8..01ef4115ee4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
-- 
2.39.2

