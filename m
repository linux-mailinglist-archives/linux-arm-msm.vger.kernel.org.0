Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077CE746758
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjGDCVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjGDCVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6120E64
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso81566561fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437307; x=1691029307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AABxBjQ8mnBdL/9akGK4SSlhhfijwl9PFk52ZwNBqI=;
        b=Ou3/LwdrEVLGUCX2IqNqVi5oeo4WsExGZwdOTR07UwSwTanr+qOME74gXEF7U2h8ha
         rY+g+kQFedZuXj+cEmczwBegjzsQRvybQ+zy4wyGnPCAyf5aE4N2s3mbzt54vxacXQxJ
         NnuqYIuKg4A8C3fY32MMsvyX5iycC4zdWy4BxvNd2bo7r4P66Vc9+L7uBuH5w4jlz7Ag
         bk5lxpbhcXiCUCch4MEx/EaiIVUAZr8bnYv8CA7aEE2/w9/mkjqnAwV4h5ZUrpD0mBAW
         6Zew4hPoS2sVhuaVY3RGNnpcJdi2lKOvW5VEafhxrB3M/l3lKcYEgNP02lXA9arWQ0Pa
         bSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437307; x=1691029307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AABxBjQ8mnBdL/9akGK4SSlhhfijwl9PFk52ZwNBqI=;
        b=hETVLeWB3W+mq51aou97W7fz+Lqn/t8FpnBfqWG+UXnRjs4dxes7TIfPj1PGiPuUge
         avR+c7ANI5XAWm9FfrrEG9i4ulU/RBXcjifvHMllG4HNzx/U/oRD2IY7WXbSn5qoQE0Q
         1bQ3Jk8+2TbgtBIeAmiTqAKu8oHzmGi0hVsUOKmn8jcvC/2b4fpMRxT8knQYBUqIjj8d
         QaktckIn9QnCUru13set4KlXz9qV+7RuSra6TZT3tjNH4cw/bKYvSRntEpPPD+M7am3j
         XtJbk4q31IkSdJywwlkVqJfkf4lDXXzgBQjA9VV0w+IjwaX7sAbE4Jws/YTjqNQ5TBqc
         mN5g==
X-Gm-Message-State: ABy/qLYOP4ucoeRycIJIxM1ofK6+BBHYDg6D4OENFxmWpcrpURtlHzh4
        /QVLTkBfXFWWNNWMyXxbWHPFMg==
X-Google-Smtp-Source: APBJJlE/0L45HbUK+tUpcT4Cb+S8NG7tN9NPGTDQdPoDHL8O3cHxxMF3acpXPMcDtjb+d61fg5LRQQ==
X-Received: by 2002:a2e:8757:0:b0:2b6:cd71:6235 with SMTP id q23-20020a2e8757000000b002b6cd716235mr8307718ljj.42.1688437307149;
        Mon, 03 Jul 2023 19:21:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:46 -0700 (PDT)
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
Subject: [PATCH v5 13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
Date:   Tue,  4 Jul 2023 05:21:30 +0300
Message-Id: <20230704022136.130522-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  9 ++++-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 +++++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 +++++++++--
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 ++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 ++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 25 +++++++++++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +++-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 37 ++++++++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 25 +++++++++++--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 25 +++++++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 --------
 13 files changed, 189 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a07c68744b29..d5111f3782a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -200,8 +200,13 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 };
 
 static const struct dpu_dsc_cfg msm8998_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
 };
 
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 786263ed1ef2..b6f52b3864ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x140,
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x140,
+	},
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6b9bfeac6e0a..9b2de5986e82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 414f0db3306c..683602e54c0e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_4", .id = DSC_4,
+		.base = 0x81000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_5", .id = DSC_5,
+		.base = 0x81400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index db3a65b011ca..a98d63f6c47c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_2", .id = DSC_2,
+		.base = 0x80800, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_3", .id = DSC_3,
+		.base = 0x80c00, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a996c39b7b1f..605c628b938e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sm6350_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm6350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 0cdb77599583..4c3ed4416961 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 };
 
 static const struct dpu_dsc_cfg sm6375_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e08b29e9e146..8a9bfc4af72a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -248,10 +248,27 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8350_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	},
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d5faa1816cb3..9c0beccce282 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -146,7 +146,12 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	},
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8e4299be2b1c..b676819db42c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -246,12 +246,37 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
-	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x82000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x82000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	},
 };
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index bbee3c621943..568523abc1d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -259,10 +259,27 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8450_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	},
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ea7bffe252a5..419624948e83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -273,10 +273,27 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8550_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x29c,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	},
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6ef0dc2e1a5d..ee24402bf253 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -495,21 +495,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-#define DSC_BLK(_name, _id, _base, _features) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x140, \
-	.features = _features, \
-	}
-
-#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = _len, \
-	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
-	.sblk = &_sblk, \
-	}
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-- 
2.39.2

