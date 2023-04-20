Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4F56E8755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 03:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjDTBPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 21:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbjDTBPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 21:15:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA7F46A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:15:00 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z38so966075ljq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 18:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681953299; x=1684545299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epBk3RwMybFn7x+cojKYcg5l0hhz7AzQ1DVSf9AMcPM=;
        b=cS9vI5JIjfj8J5DYtl7wbWoZqTkkyBcfYbcoL2IZy766+qF2N3cm8s+2fwzJadX7jh
         h4ThSfULpRO8hNRz5f9FUs4VPYgK0KPkVtCG1aPp97oiHu8S971v4R7GFD5oYYDR2U8b
         xWxHKtl7slUArOWsQ/lAvSyEQkASgVNx/9Z+CjSLxXXJ1RCLrlZrDdS6CAVLzMw1dDd9
         uG5Tb5AUQsP0HsSspiazkX5vTrhIe/74oislxLAgiWBAb1Q926Oa1krXKoFT0uH9tWnh
         NITl4lAn5Ws7DqeQuhvsg8NIuX8P4F8sdHdxXI0mb3PwKyK8t5ca17e2K8En4rnHaB6m
         fh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681953299; x=1684545299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epBk3RwMybFn7x+cojKYcg5l0hhz7AzQ1DVSf9AMcPM=;
        b=LAO8rwMBH0H72gS3LTwVc0L/Wdi08crWIQkKACVZwh1jifyumSlKb9tc2QuV3u+IjN
         nHkN+YdHiko6sJtk+dV/t3ZQEzYQ5/VZ+4QWz4e1VUQotLYjwZKpLG+fK+Z21z62SCOX
         BzaauCx3uyVS9c6hOxDs5GjZoSEyhRH/kzOzMahnmGBMtFIGqbmQ8WrYHSaPoAy9adGs
         F+9ZU8CsVFd/JCbJWTw52JoVCOv6NFax6yRPCZ4ywbiqhi/+48uq4ySdfE6dnTZ0FBGx
         nY8R0GAx6I2z5TWUs/57TdSAml/BkP+m8tCV/1iJJr3om1/HhtQCzlmSolTY6HfeRyBp
         ckFA==
X-Gm-Message-State: AAQBX9e3eKqGTp5SSq7FVq60rHvmxLoFDGmC/VZRV5UeTLdum03alIYl
        DEYnZsHBVHlJq0pIhTLzRKe6ZQ==
X-Google-Smtp-Source: AKy350YUWpNDFPEHz1Bt2rp/6DLBMiO2n0njYdAkHWOP1SPtd67PPc37XtdJ8LUX0a45UlRsx+84LQ==
X-Received: by 2002:a2e:870f:0:b0:2a6:3570:72d1 with SMTP id m15-20020a2e870f000000b002a6357072d1mr2671823lji.19.1681953298942;
        Wed, 19 Apr 2023 18:14:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id k25-20020a2e2419000000b002a8dce82cf6sm28853ljk.32.2023.04.19.18.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 18:14:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 20 Apr 2023 03:14:55 +0200
Subject: [PATCH 2/2] drm/msm/dpu1: Enable GCv1.8 on many SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230420-topic-dpu_gc-v1-2-d9d1a5e40917@linaro.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681953295; l=8668;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QVtQDfqK3It08LFU0wkflkqkKfPf5Fjkojt8olul9zU=;
 b=xOUG96Fng8s7DGGyX1U0c3LFk6G1IUdyzoRkrICsv+NBs8gz7jaefwTfUtt0l+u8UmcMFbyiHZW4
 2qknP6p1Bk8EkbG2nr9397t5boBG8LJt+2uOBuRSbaRhmMx7YGHh
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's a plethora of S(D)M-era SoCs that have a GC v1.8 but never
declared, let alone enabled it. Do so!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 ++
 9 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c555d43ef0e0..a49e4d265b73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -117,13 +117,13 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index c8a174352ede..80252a96c2fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -118,13 +118,13 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8250_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 00f82b2c18ff..ea89ba1ab0fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -55,7 +55,7 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm6115_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 5f103140abc7..739c1a4f6618 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -52,7 +52,7 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 };
 
 static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 257e898fea18..f90eb457ff3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -116,13 +116,13 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8350_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index e4d4e47418fe..27f14a4fa882 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -110,13 +110,13 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 88ad81e03622..0f97b4cc9e25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -117,13 +117,13 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8450_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 /* FIXME: interrupts */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ecc034f76441..2fdf0382cf1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -122,13 +122,13 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8550_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 69af786b66a0..c4d3aaebb06f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -461,6 +461,8 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
+	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
+		.len = 0x90, .version = 0x10008},
 };
 
 #define DSPP_BLK(_name, _id, _base, _mask, _sblk) \

-- 
2.40.0

