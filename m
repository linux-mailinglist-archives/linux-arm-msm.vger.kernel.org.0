Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A647677B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 23:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjG1Vdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 17:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234180AbjG1Vdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 17:33:41 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433F244AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so1651049e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690580009; x=1691184809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0nmQkrFJ1qTPckiGBd/pQx7xzpmDvjfPbdpqRUAvKg=;
        b=IZYBx41OdMDoVKczPPi9p+OFE/GF68QAiP/6RdFsxBz1dvHDdk1U6fApz34gJ1nkhq
         qFmhuqPTRH9L9sknWaTZFh/2yvxpAX5svFrnlFh5R8N3YE55Qq/AU5JKDX6iBnAZPOCy
         J+wOyPjYeeqAEn6AZLAZZeNZd/rH0ppH6sxk5YCrmG+N7Ypn1dKD7H+QP3CyymIRdIuz
         bVoG0oH3OyfBgIoMOLuizs8uPrBMN9+ky6aRh0wXzf1Zh4vBNUceCHI1jUkUuY0VXFSe
         tKmW5zlg1syNmrSJNEDyw2z+Z8DVkEGoX/3rggDP1V2uinIMxIM2i6yPgVyoyt9Qbf4r
         T+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690580009; x=1691184809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0nmQkrFJ1qTPckiGBd/pQx7xzpmDvjfPbdpqRUAvKg=;
        b=lVGMlXslIi+ldqjVgBaveHODscl/15g85Cy7l6muwLjraF9Gpe7OS08TgJDS7z1BMs
         63VusP0S3IXL072RvviEtbHe0WyT8055khbSG6Uk61HkW1Qh5KvTN/zdRlnfy+chferi
         iKZ35tqj3nvLbqvL1cFB5J8UWaQiCIph7gVNQnGFCX57CByK7n/DFoJap8XK+jaYw/eH
         1dZUyK5XJgbET7r91Uw9HMwuu6+MHabgOgii3ot+q9LLi06pXZWfxED2KHjFC3N1mg4C
         QX7Iq1yAj9k2NBHfWpbeRJLc3hAcZWgAV9IZeAFny4Efm/FYluG8NCy+1EVwWbHZ365c
         jSRQ==
X-Gm-Message-State: ABy/qLbfzmTeFbnDsWznddQY6JkjKhI4+tGSKKKejuS0gBo7bz84zSN+
        qF77V2JnrCu0GectOBnaIpdPUQ==
X-Google-Smtp-Source: APBJJlG2M61J+6qFH5o3JAMVC7nbKN6aqxJaAONR/c9d/dlPYtaMAQvSYGfPBTm2RiGt+Zk1b6+uJA==
X-Received: by 2002:ac2:5f7a:0:b0:4fe:f24:cbf3 with SMTP id c26-20020ac25f7a000000b004fe0f24cbf3mr2431232lfc.63.1690580009632;
        Fri, 28 Jul 2023 14:33:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:33:28 -0700 (PDT)
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
Subject: [PATCH v2 4/7] drm/msm/mdss: populate missing data
Date:   Sat, 29 Jul 2023 00:33:17 +0300
Message-Id: <20230728213320.97309-5-dmitry.baryshkov@linaro.org>
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

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0189811bce4d..c2b4cf9ad2eb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -558,6 +574,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm6125_data = {
@@ -589,8 +606,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.39.2

