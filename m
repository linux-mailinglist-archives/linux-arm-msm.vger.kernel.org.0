Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FDE7A8F8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 00:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjITWqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 18:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjITWqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 18:46:17 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80652D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 15:46:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ae22bf33a0so325828166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695249969; x=1695854769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEG5QbTle/wsryhp0cJXy9R4gVUkkTUcGpE6xI5qCmE=;
        b=cePh5Hz+BHbiiLOYiRopSbSf/v25ZrNmcgYLb+FWY1E97H6wlQD1GekL+QWLrxkftT
         oFwXDw5TDU6i/OtzniFhKygqFHjcepvI+CBJkRfTBnQvc+3L+fpGGrBGfkDNr9EdK44i
         SNXaVTkDbluKLusB4nPpXPYGtIXC5Mg96tcT1903XXEe0B9I1qrfmtBpwi5QbTVVkVh/
         Hhoo8/F4BWXRQz+WZ3mhiRv0xTBpdVvLQAOSOPw4SvOqBfo457AvSamETzPKyyHDl4SS
         1IalEmAaMNuSZs1h7ltVtu3s44B1FxWZMfbB/x/STeGIv4XZGaNXbP+hPTqnjadwFPDS
         CNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249969; x=1695854769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEG5QbTle/wsryhp0cJXy9R4gVUkkTUcGpE6xI5qCmE=;
        b=xHgmiGDEb0mwVojgaGoWHCLCPvfJqJ2U2EJ1T/w2u/PrG4qeVHchXQdunaMdKmzi5J
         cr7MTXrt+Yua5HJaaPjLQf3hsjytiip7+ax6lhqpn2tmwMRij9M5YISlaAnjuzFJ89Si
         eI5XFC6FBm7yMEN3QeO8KUw4krlQe5gObc7R3LL/hQObaVZ0jKTu81HIAxvZ+AyHK4g7
         1YK9RogHPAq0HgDnMgP1qAV0HOufvSU7B/TkVsdk+cP0lhuuYLtqk5zPBJtmGcyAvaoI
         EcLEehoUeEny5F0MgeSFwnAO9zA8FB0gBgxW/vWZj2Oab7vNsZHvo+Sj/rvCW+JpmAfN
         zCxw==
X-Gm-Message-State: AOJu0Yyg+HAA3q6gJRP4mykZfWRK9PzT3rkY7UylCoPRgHNKoMlR7ZQj
        T3gpwZhTugEIG4iz4+cyf/b1ow==
X-Google-Smtp-Source: AGHT+IHA8VMEhO4O0eEpANFMtvmSJUNJ62SQx1MRheCQmJMRfCP3X2rdlzItwdFMdHhxB9Yv2ZNubQ==
X-Received: by 2002:a17:906:739a:b0:9ae:37d9:8043 with SMTP id f26-20020a170906739a00b009ae37d98043mr5990977ejl.31.1695249969069;
        Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:46:08 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 21 Sep 2023 00:46:06 +0200
Subject: [PATCH 1/3] drm/msm/dpu: Fix SC7280 PP length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
macros") unrolled a macro incorrectly. Fix that.

Fixes: 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..dc3198335164 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -126,7 +126,7 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
-		.base = 0x69000, .len = 0,
+		.base = 0x69000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -134,7 +134,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
-		.base = 0x6a000, .len = 0,
+		.base = 0x6a000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -142,7 +142,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
-		.base = 0x6b000, .len = 0,
+		.base = 0x6b000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -150,7 +150,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
-		.base = 0x6c000, .len = 0,
+		.base = 0x6c000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,

-- 
2.39.2

