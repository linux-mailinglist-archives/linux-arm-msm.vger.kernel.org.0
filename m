Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FA8692CEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBKCL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBKCL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:26 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1688975346
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id lu11so20241165ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
        b=ntWYbNEj/CkNod+cQs9sigJr+hky565rND8VYa2yAD8GfbdloZtJo9rQ1uZjiSoOLR
         k1Y/k0Cozh4CdRjNCaJJsfpxs5Gx86djdCUPcMiNiSbfRMgVMlN7E8Qd3mLnm/B0Hhe7
         xPTk8uGOyNLBV7B2ldtnhSzFhROLQUNzFN1esr2cXFRVzNe04Xbb+4ayXJATOfPu5ZzV
         rRLFtsW36YJutStch0Yo50u2AqfNOO91r0cBlvfKUzWZSTwDcbKk0JOUkhBiCn8F30fv
         wVKFXR88vp34xd2YarcypEWT2I0EWoClYFYXZWLkqTp59NFcIKJgS0zSAs4keonheptH
         mKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
        b=jCZEMEmUeV2q84NRdZkiTHwbDyW0JkRjfDvKCjz4RIICUbUyfM0lTO/fHqNTDcXcS/
         67uMdyopSwIbHgsEF4dhMltZMEj54f8wX64sKpLCXGyRMdXOG9AUesqKy2HHgqU5xgUN
         sLjlasQJ+Mx3iipKMgXr3AUJrcc6TC7ZMNz+B152NkcvlOGo+9e10nN0jBr97WNkzQz4
         zYtYJDI8OyaBNKdqTG3/VpeFqQE4UbOol1RMrOidsZSat75DNXoDTWTFHAZPQ+ZCuTzF
         4YXz9N+fDDBAj2FjXtGGd0KrvXuqnp4T3/TXGwQByW7R1BccmTmmAW3xN8xSCu3PmoOu
         JmYw==
X-Gm-Message-State: AO0yUKWP29wvROhECMHV1Xzpvme9csvUh1bTOfxRBWVy7emWrjltvIeS
        kXDaCcd9UdRRR343QUQSvFuSzg==
X-Google-Smtp-Source: AK7set8VHD0OkRisnqitT5g+pGQ26vwd7PgOHCT964tqum7SjJ1ztCsOAVtN4zLrwUdSvTVGgtDKcA==
X-Received: by 2002:a17:907:8b06:b0:8af:391e:e4c4 with SMTP id sz6-20020a1709078b0600b008af391ee4c4mr8792982ejc.41.1676081484734;
        Fri, 10 Feb 2023 18:11:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 28/43] drm/msm/dpu: correct sm8450 scaler
Date:   Sat, 11 Feb 2023 04:10:38 +0200
Message-Id: <20230211021053.1078648-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8450. Fix the used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f3649ac9cc70..1acd109607b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -415,13 +415,13 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
 				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
-- 
2.39.1

