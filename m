Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CED7677AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 23:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbjG1Vdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 17:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjG1Vdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 17:33:40 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5A144A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:27 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso4426892e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690580006; x=1691184806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fq4BsQ2n3v4yrWlc5gMVHf5q5uxQavIrNzukx+hQcbg=;
        b=SuOgeAwCl5UFgYI1zwafXHwKmUs5tX9+KclAvcCwMbqbo53sQgQkSLlmcZZiIsg6/7
         nG6EBN3byXNUmYQh0mtG5J3zSYYW8Q8LrqketcvEDrKwwlMLrqyKGAVfQ3kIA8bqXyzC
         enGg4a3fBhv4mFIknxuLzEQthggIgjuaF2fF4pibrjxigfsvDbkNWSOtulkUxKIcB9ll
         0yst9T3+wKBaxKgjB1toIncKCUzKDwHbD3OlSejqL8aaH3Val9IrNm+s05FNDbK6Nv1P
         QbWlDZRT1A3KWvfhaJByQrvAk1PB46DmKpH9xUXXnxlenooEa8EA6lqTumbWvgQbAe91
         ayPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690580006; x=1691184806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fq4BsQ2n3v4yrWlc5gMVHf5q5uxQavIrNzukx+hQcbg=;
        b=TUHHqEz/7FJz4pDrGnF5NHaIILryKJzH03kr40hQ4GhnhkQb3beht5KI6nrXOu3kg0
         UrFPzRKqOoZS1R4KN+15oSpKAQEs4PoogHC8UyaT2XRiXYjtDZFB+Hv6CFcZomX6S5Mg
         VKG1YdhqddVAnH+tW/TitLSOyWZoAEZjLgVTHF0AoKsuapOFuw9Od+AhyERYfduhfGp5
         sMs7na5p/ui3sI89sw1963WH7yGvdS/qz+CuWyqX3qIvhTjGJXrlNaFIrk1mPaDJRiYO
         eYoqMxngqRUDvBJCEZYoIC0kjzMlVuo8zkpPrTjSviJLyYVrzQ6qdv1CD0wMtOxVlqt1
         w+BA==
X-Gm-Message-State: ABy/qLY5fjfcQ1f6Y022J6NUPsud271KjEsvb0fRDqVvXG2IUF6O3JIu
        SpObfme7gQnva9THxzZu8i2Epg==
X-Google-Smtp-Source: APBJJlG0jWCkBUs/qSW+BdPHzdvTVHlr/ObZOV4IBCRNvXKCqc5nMZR+B+dFyaKNqaQYf2RjYRrssg==
X-Received: by 2002:ac2:4ec5:0:b0:4fb:9772:6639 with SMTP id p5-20020ac24ec5000000b004fb97726639mr2719718lfr.6.1690580006246;
        Fri, 28 Jul 2023 14:33:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:33:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/mdss: rename ubwc_version to ubwc_enc_version
Date:   Sat, 29 Jul 2023 00:33:15 +0300
Message-Id: <20230728213320.97309-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename the ubwc_version field to ubwc_enc_version, it denotes the
version of the UBWC encoder, not the "UBWC version".

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e38929205134..67436a5a8cf1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -27,7 +27,7 @@
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
 struct msm_mdss_data {
-	u32 ubwc_version;
+	u32 ubwc_enc_version;
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
@@ -205,10 +205,10 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x3) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	if (data->ubwc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= BIT(10);
 
-	if (data->ubwc_version == UBWC_1_0)
+	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
@@ -224,7 +224,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 
-	if (data->ubwc_version == UBWC_3_0) {
+	if (data->ubwc_enc_version == UBWC_3_0) {
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
@@ -507,13 +507,13 @@ static int mdss_remove(struct platform_device *pdev)
 }
 
 static const struct msm_mdss_data sc7180_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 };
 
 static const struct msm_mdss_data sc7280_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -522,14 +522,14 @@ static const struct msm_mdss_data sc7280_data = {
 };
 
 static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -538,13 +538,13 @@ static const struct msm_mdss_data sc8280xp_data = {
 };
 
 static const struct msm_mdss_data sdm845_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6350_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 0x1e,
@@ -552,27 +552,27 @@ static const struct msm_mdss_data sm6350_data = {
 };
 
 static const struct msm_mdss_data sm8150_data = {
-	.ubwc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
 
 static const struct msm_mdss_data sm6125_data = {
-	.ubwc_version = UBWC_1_0,
+	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = 1,
 	.highest_bank_bit = 1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
@@ -582,7 +582,7 @@ static const struct msm_mdss_data sm8250_data = {
 };
 
 static const struct msm_mdss_data sm8550_data = {
-	.ubwc_version = UBWC_4_0,
+	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-- 
2.39.2

