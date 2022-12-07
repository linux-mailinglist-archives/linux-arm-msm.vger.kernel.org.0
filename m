Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53962645C9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiLGO3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiLGO2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:28:52 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD366449
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:28:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id j4so28996138lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPYBQvv5acXmkzTDemHHFrRFZ9k6j4P1yxR7/lFHMcQ=;
        b=D/qyDVjvU17bztJd0zm90q3gMl4DPswv//AtyuMVvQBgRPMSunIFRJwtnCYSvTxSbI
         MGFXEoUZiYY1ES4ajXdt28/9loge3kI10tG1/aUMZ30cHmc7e/MlJlkxVaEcz5pJszGr
         CjzmjumcgQzP6AM+tCcsUFWmZXCAGWU/KtTd7No1FCa19c6HqGJRBhT8Nkk4rJexRcCo
         JhAupe/Uu9tNEuK2Ewh04ytfQAYPF4J/vIdqqAuWcgti8vcGZSKFw1kQkPF80KQKG/la
         /xAld0tU5WuCCCir9TdsAXyQUXaOtYDqT+rFZpgCzuFXBq0JItmm1CzhbI535WLEAykH
         PXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPYBQvv5acXmkzTDemHHFrRFZ9k6j4P1yxR7/lFHMcQ=;
        b=GXUjvn7WJ3K4R7jUM8q4V7mdUOGBoQ4fuWsCO0fVxAKRclCwCsvsX/doz17e0Q1kDV
         ULDf9EcePl8Gqpb/dkyyQ/iA3MdUGJDqRFmZa/mBJAwByXe1TRqOg7us2O7BACJevkj2
         ZRF4v49F6wv461L5WgO7beVvzSVrAZqDkaKfSOE3SpxNLEDh6tV61wFhgXi1ktH+FfUY
         R1G4NB6BvXiGpKfgLJrv5IOoX/mhAJHegR8wL4LeQ7CZeIXRr/XPHx6on01o9SBdpE0J
         +WqfLC4qxoaKJCrOQbzs4Sb+mKxPaF/sQTuuZZVvplUNWvE5VSOwpfJXZddBvtWxI6OQ
         teug==
X-Gm-Message-State: ANoB5pm30RHcbYv+cDyGIGPHvA8sPPmDBNtwsae4YLWrqk0W8mkpdxGO
        h/GA1/3Zdo0I9CPBUEqZR2XBaw==
X-Google-Smtp-Source: AA0mqf5YPSZBfNwGLherIDiREftMg4LO0li/pk8Z+mpZuynbABROKC2jGDp0tC2GZIcIXszTAJKTnA==
X-Received: by 2002:a05:6512:281b:b0:4b3:e086:87d8 with SMTP id cf27-20020a056512281b00b004b3e08687d8mr22907479lfb.259.1670423316347;
        Wed, 07 Dec 2022 06:28:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:28:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
Date:   Wed,  7 Dec 2022 16:28:31 +0200
Message-Id: <20221207142833.204193-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
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

Extend dpu_hw_sspp_setup_format() to also handle the UBWC 1.0 case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 691c471b08c2..4246ab0b3bee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -310,7 +310,11 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
 			ctx->mdp->highest_bank_bit << 18);
 		switch (ctx->catalog->caps->ubwc_version) {
 		case DPU_HW_UBWC_VER_10:
-			/* TODO: UBWC v1 case */
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+					fast_clear | (ctx->mdp->ubwc_swizzle & 0x1) |
+					BIT(8) |
+					(ctx->mdp->highest_bank_bit << 4));
 			break;
 		case DPU_HW_UBWC_VER_20:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-- 
2.35.1

