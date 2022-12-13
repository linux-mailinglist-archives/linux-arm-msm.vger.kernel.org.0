Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4084264AC57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiLMAZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:25:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233250AbiLMAYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:24:36 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D063162EA
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:34 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b13so2336486lfo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuRIOsbxJSRJCVkuwOFtkE5bn27vzsbdYBn710S1tsE=;
        b=lmwePmqSEsF3OnAp9cC6PduAdpMwYQXJYh2fNPY863g5M9oD9ZWSLPEBTqvp3ngl4o
         9ySGQONxcxowsk7bT5fAzavUXJFT2Mm+pOmUafAwshUkw50rBcmP2m1ZHzBfyWvUtz0Q
         sDk7fOuV3OjsEv1vhYNCb3FY7izl6cNJg7dHscP3ev+wJlHMdNFYNc71G4Ld0ybIzEEi
         0F9Grk4PBB8kEWXbSDxhmnT4EKJ/XMDY8X+odIVwZaTSvKTInZK6MGwuMXWXvBkbdVyf
         nALPrAHoNvXCh7amnOwUIcnLg6b5FyAoJ/kvP8QNoNHNogg5RzE1a5yhoyrkJJx0HNvp
         rTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuRIOsbxJSRJCVkuwOFtkE5bn27vzsbdYBn710S1tsE=;
        b=RsTVZFI+pXOmM0DKYxMsDRQETGFZRYMV7/Mh50jrjhYL66DDTLkeupuXXr0Mdl5Chy
         pkG+G1kb6cHKKLxBSOI11TDSJQdYIYlcMtGCvvcLt+jACx1alYnPqfaOT2mQ9E+9RoFD
         o3Ls/OXu0xCvPMxHuSOox9gdSDGcQnTlrjkyzKKqiFCId7/Ee0dsL23mg1253EWsB7de
         utbQ1fo49i1ye8WaOqH+TGnkd8uZBbeC+uJmKsXPccYvW//gkSdU9elDyPGwjzz40Av3
         5ncD9iweyr/twIyyWA9rRA+hwNtOX/uZgBw/giHRP1xhEB2MCS4/BjAyKFk6Sx3bm1pm
         jl2Q==
X-Gm-Message-State: ANoB5pkhteg2/k+kxz+jU9s8PfF73WinOHDlB1YOIhVv9T2AFdlLH8LR
        Mf96H6dyrohkqqC37u7i3Ct6Yo3xHesxARv5
X-Google-Smtp-Source: AA0mqf7FsYGwTEB0R89kNgfKs8NWR0YiZJmq+AA0ekGPv+hZSJMEhTrIOyi72Pmtjg6fC0kbmH3mpQ==
X-Received: by 2002:a05:6512:150c:b0:4b4:b8fc:4ac5 with SMTP id bq12-20020a056512150c00b004b4b8fc4ac5mr5905858lfb.3.1670891072964;
        Mon, 12 Dec 2022 16:24:32 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:24:32 -0800 (PST)
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
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/msm/a6xx: Add support for A640 speed binning
Date:   Tue, 13 Dec 2022 01:24:19 +0100
Message-Id: <20221213002423.259039-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002423.259039-1-konrad.dybcio@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
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

Add support for matching QFPROM fuse values to get the correct speed bin
on A640 (SM8150) GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 36c8fb699b56..2c1630f0c04c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1877,6 +1877,16 @@ static u32 a619_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a640_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1902,6 +1912,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+		val = a640_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.0

