Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620FE792CD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbjIER4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 13:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239373AbjIERzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 13:55:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8D0A278
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 10:45:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so44109411fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693935835; x=1694540635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
        b=yAxw0KROyDrkKyImx5BiGbPZLXpFv/5zti5Kitly8otKBKlYBwfj6IMub8NXv2Qa2x
         YUBtDriuft44wS3Uwk3sGQINsm8HrYMDbtQdGfFeiotA6al0nuBGkZa8xX+yxdE+6oAZ
         Bb+/mIGBhBLG9IKyIyBFVNgGaCEk/V84Xa06iN803o2epgQ/jvqmesqXQWkcAr8Ka2Vu
         S4CYr4qVAeCEKsgZAaYUa09L+n5xGazXeNm6Frob42Gzqj+Apa19yOS9hwc/RPfD81H5
         gTyTfdVUBSPN2rewzxFbh2SLXbNv0ZES+LM5osAoADzoH4JSNGG88Btd/sOc7lFWssF8
         R+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935835; x=1694540635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
        b=USFBghfJR1ucVx7sDk+SbRFK7r5scxw7UC2yC4MoVG9ud2jbSa/9GikLsmxS99gqhM
         kwhXlqk6tBt4gXs702zXCWIv7XxdQcRw1mHGu9CoUc32VXunBHK2PQKpmCwQVRrYwp5E
         qKDEA5D8FCZ26n2CNDzHWsLup0YuuQnjRjuQoeNrEJ1oABk1OMeIgemeh0AUsgGrA305
         GxuQ084q8JJhH4FFjNmHSYBqlZyFh479klbZT1IIqIGdE28v0/WThlL9brFXuJNxCcDn
         Ro+RYqjQLALS/FHhHc7zXgI8/9+3nDwMBTnOGz6nSByupuslAxvJIb7eXsS34WROf0tG
         g0lA==
X-Gm-Message-State: AOJu0Yx/wSUqbCp2Yv4r1NJ+jkIE4u8aE7Fuaipu/HyRcmTezYwb6d7a
        cEf2+PvLmA1xiRB5HYN4iIBS3A==
X-Google-Smtp-Source: AGHT+IElplN6q3KFvRAG7bxs0uJXFAJ4kcpfHHWT1BEJd6LPmr5dcbRCi05pi0ZBBF2M6/jFBzdQyg==
X-Received: by 2002:a2e:9a8f:0:b0:2bc:b54b:c03f with SMTP id p15-20020a2e9a8f000000b002bcb54bc03fmr349675lji.5.1693935835498;
        Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
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
Subject: [PATCH 2/6] drm/msm/mdss: generate MDSS data for MDP5 platforms
Date:   Tue,  5 Sep 2023 20:43:49 +0300
Message-Id: <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 348c66b14683..fb6ee93b5abc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x100e || /* msm8937 */
+	    hw_rev == 0x1010 || /* msm8953 */
+	    hw_rev == 0x3000 || /* msm8998 */
+	    hw_rev == 0x3002 || /* sdm660 */
+	    hw_rev == 0x3003) { /* sdm630 */
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x3000) /* msm8998 */
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -231,6 +261,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 
-- 
2.39.2

