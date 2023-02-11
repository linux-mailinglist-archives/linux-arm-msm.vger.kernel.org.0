Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DB96934B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjBKXNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBKXNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:18 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41F415CB5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:17 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ud5so23985189ejc.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohoTDuktmPgTPKpM9UbVJ84b0US4wb2twZe0P69YWH0=;
        b=JyeYZi6iKWgf8TfvEpWzxi79ntEyS7dNsdilab9kK6HEmXI7K85Qf90dg/XkCTZL+z
         LgGaD15C9VFfozLVGUwt5kSNRTaDxBYSCN/ucZbHkUOh9T7yDmM7Koko3+P3q4Cd58zC
         9AZEqY43r5txFCPz+DrDug4px6LtegLGmzHJoP/z6OpUx+hCKKi76R3Tkq3KXpFszNgg
         xweQwAtd9dNjmzbSAUUP3d9LkLltZXQTuKJQrYn0GsaX6tWNGMIo2DvFHKoDiyxWIaqI
         l10fA5VbSzyJnJX4yjbYvmvleHKFK7Qx8cgRuTE0RxJGFP4Q769q1k2j6JVovu7sPkX8
         PRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohoTDuktmPgTPKpM9UbVJ84b0US4wb2twZe0P69YWH0=;
        b=DTXyT5wWSInPVsSfsdTjPle3+bUgKo7ek2ePm0i5j7flqM7iaxxZhKeYHb01efk9u8
         ceZtix4eM7HnynzqdDMngfFsf0REBAfC5ULTwnZM4BiFZt9tEOn5raefdub9ADe0PxLk
         wzMLDmf5i+YZdjJqdQoWN/S2T5nuMj5PvGkDzN83h5CeKkqrpeMsjeL6LAXhbIb5EMdp
         3WX0yL3B081S6CFUvwfC9vmyJ3EJSXQkexTRIWETVKKR1V2uJq72jnACYvVfxh6aEd7t
         q+GpD8tzkxp3vnX21sFDCjJ2UiWS34L2QIi6WcA2KJKSqq1X0aKPTqBm97uMXtcTnvSI
         JUqg==
X-Gm-Message-State: AO0yUKVN2Sbmtw/QnP0NRMWjg4qfCKQ+CqzWVeaEzsU7SLh6iqmomPpI
        zKpFHdolANjrAiTIjcozdi7kag==
X-Google-Smtp-Source: AK7set8abnjMfj1xE4UtRP/ZXbQlX5Pd2dn0KzZN1iScaqiDq3532s1rAr2Yi1sWJmC6rmjqagYKGQ==
X-Received: by 2002:a17:906:f0d9:b0:8af:4dab:cf6c with SMTP id dk25-20020a170906f0d900b008af4dabcf6cmr6904783ejb.23.1676157196273;
        Sat, 11 Feb 2023 15:13:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 12/50] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Date:   Sun, 12 Feb 2023 01:12:21 +0200
Message-Id: <20230211231259.1308718-13-dmitry.baryshkov@linaro.org>
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

DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
planes). Correct corresponding SSPP declarations.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 02bd8334d67c..e3460b35058f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1190,9 +1190,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-- 
2.39.1

