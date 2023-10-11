Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DD47C52B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbjJKL7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346445AbjJKL7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:59:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3C28F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:59:39 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so6394217f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697025578; x=1697630378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypZLjFj/yUIWoitz4PcHioQX4LRMOTCvJjVyG9KPkRY=;
        b=z6sTqRVZct2aoK4ypVviHgJouaCKUmaJU4WzLjRRIFJAdKplZlJHLe+4omfw/+op11
         tLh1Wfgmy9WPHadlVpx5oCXGlYcttoC6rUJ+i2qf5tpZHO2uzJgmaoyI2maEHbcvA1ih
         3P5H92Tdd8BSgqQfU4iFAQxyMHq6HGWfTpM99JNZ11qDqRO0gpqZFhpX+ZJzdDS1jsZG
         VBOg+xcu0vsKXOrEuocrkHyWUdlTgk6lRcme6mDhp2FYiCaR86jZwSB9D3gTiuXLgvnc
         1KLiAqbt4kuDBaWwZS4xMt125VrbCU2WirgITnt20OZk0KopOIg5NjS/nQCe/SZy0q86
         1eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025578; x=1697630378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypZLjFj/yUIWoitz4PcHioQX4LRMOTCvJjVyG9KPkRY=;
        b=Vd5FmuPuHzd4Gq35/ytwahMs5K3dEE26ur2i1vT/9fRhBCmFWrS7x0ajjBEROa5mn6
         1LRdkx7+UmLyx5MmelDAO0aDI/UC8r27U6gbEOmWEQzuV4KeSpT9XAlWPuVM27+KCNFI
         4sJwEBZLBlMy58EvpXtXkhMzo462zbThq26G9koplsrfNXcIGd3PHscm6+P9flAMfFEm
         slcIVCAfieGNT1rtCb3+/FBWt6EAo5/QLNvIB2X4wKbNZ51wDfZvN4xpfNzWTzPoKb54
         wLHpka84Dy6kSie0kH9i5H8yojN8E8erCyPfUN3QWjNpdQn39xC7ONA/NCp5Kl2lMdOx
         OiQA==
X-Gm-Message-State: AOJu0YyLHRAbEaRq6SOtY7QwO2ZIaBcTdtZb6aq9WwA4ly1ykzpoyG+Q
        /w9Jm1/e6mQ6G9LtOP+TE64H9w==
X-Google-Smtp-Source: AGHT+IE0vOD/HhyJPdT0M4nw8HCtJo7Zf9XCJa/sS9OTv2kgb5THxDzUlz5laR9Zjiw9C23idmj2yg==
X-Received: by 2002:adf:ef4a:0:b0:317:5b32:b2c3 with SMTP id c10-20020adfef4a000000b003175b32b2c3mr16726202wrp.6.1697025578249;
        Wed, 11 Oct 2023 04:59:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b00323293bd023sm15447805wro.6.2023.10.11.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:59:37 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 11 Oct 2023 13:59:25 +0200
Subject: [PATCH v2 5/5] drm/msm/dpu: enable writeback on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JhqMYcLj+uN+4eIp2Decg5MnbJ4iLpGbOzwcBZr1/B0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJo4jyU+gKZPPaw85852PeLjRN6/jgbXJby90/CHB
 oKwbALuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSaOIwAKCRB33NvayMhJ0Y1DEA
 DITK6IPeKYg9ocdqRsLNjJk1h+x6xT7bCrHA8A9kJS0p1qmRPtr5jdA/Q9S8+ZLAl8gzJoA3Fc+oWR
 rQlgwPDSaMCZhB9zwl3A7MJzLoNO7zTilG34snzkE2s9SnpUXSeBzkLXsTk1YstCg7GKrwcq7X64tI
 IU+I7EifSWN6dhVexpSSMkVLux1XFweVhZYrI7ApewMH0IKwsuDsA26hImzw9KyAjKYBD811pPb7rg
 UucxL0+Uta/6RUfcFaCBx79f/p3seWSVk0+GjJ65iYZQd5OIX2L87Pda9ot4r687L1gpWF3pp7mlQ0
 nzyl1CAIoqAEupZJ5TdmMNdivDKwyHsGKIpS4R5DoD1BKCQk+hNlHttEBkiToQnPShFwdsxrLx0+mQ
 hTrmz3M15G1lLC1L7qwSpgmKps3QVLQiadT6UM8MKnr7r1aOZAmHrvvKlpKPuFHTuF+oWihY/LJsA0
 DeQVz1mjyyPpGYjzOxdOxDWw8ePgkM88pOLPocYX/6MgaN1Qr2YE7EnF+4SwxoBB8zmlpeMJmbwBLo
 S8PdoXyEch5gQ5V1NtKpRaivYbOTf1O0vwWiM10WsA2B0nLKI0socV/mFqmtVqdsxSVHbqSHze1ZAe
 IoCh971pcBsmdoxWiFXVyVCzOHpSbXV0inImFHo3+h3PLB7+iHkMvKF4jmHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 4590a01c1252..d83a68a2cc0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -321,6 +321,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8550_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -418,6 +432,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.dsc = sm8550_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
 	.merge_3d = sm8550_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8550_wb),
+	.wb = sm8550_wb,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
 	.intf = sm8550_intf,
 	.vbif_count = ARRAY_SIZE(sm8550_vbif),

-- 
2.34.1

