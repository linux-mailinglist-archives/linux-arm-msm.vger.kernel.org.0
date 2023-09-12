Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D63D79CD14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 12:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbjILKFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 06:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbjILKFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 06:05:15 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15CF10F4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:05:04 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so690271466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694513103; x=1695117903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+fLUiRNRZ6tjUw29W8ATufauwkRx/MYG3CIAm8UbGM=;
        b=qGA5FkIQVKsO053sI6lYT/fBhe080TF5Qd3zsN76JW+IV275QHLmVTx3xtwHoAf+h+
         WCRHNv9E3DptaUqldh4ruapEUSgmUHanrJivvogU4TsDNhAS/p8/7qPF4w6X5Heijivc
         TNtyEOdg2x5JhR5iKtVeHIBygX7XAcMGeXMH5ZndTQc/dsbidkWF9aW/bd5mWeAQ5x93
         /9Ujbyx4TSutyRlplew6XkCYDOT7f0gKSInGGMrspkYOdJn3pp5ES/AXepiw9xA26vEF
         Rq1b1CGN4iVJ9of2PR6+LY4ahnzEgHZry5jDuhsIGWB8+SgPeXLmcu2vRY3XfMiOlrh/
         swPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513103; x=1695117903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+fLUiRNRZ6tjUw29W8ATufauwkRx/MYG3CIAm8UbGM=;
        b=dYZuaTjz9NqCvbVT0tqFjC/6qR3R4MfsqqYfwd/But4wqlAglut1rRtrZck7ExIA+g
         n0dvf7q/WsqajWuYJKKotz2YDWopQrod8ROCaLtNKlaV4PkmfR8SJOOZcEat+SH5aLCJ
         urhbsb6ucV6Ac3vXocMErhlp9aHr3GzrFUvNJD10z5yGXKQVrDvczWLB6Go2Ysvsgb9K
         hiwiOph+grpcO461qXZvYCG+e1Ub8x3zlzAC3tbpaZWeZ0RAU1RosUEz5owXo126POXd
         ALHfJe+/+qAoKZ/BK5KQJ/jjFCONBcFnzNWiIKdE2dCgh3sD1SACv7qfAtxqbMp/n+yb
         ZuyQ==
X-Gm-Message-State: AOJu0Ywvd9kdGQ3j9Bi81UUaeoiKrpMGFiizqL6FW2Y1GDq/lep2XYRw
        8BTbbX+8qgEmDaphrJRR6AFh+Q==
X-Google-Smtp-Source: AGHT+IErkM94BsrIv+JZqii943toOl3EIjDnkIK21yagra7XZ99rgtvSzrcNsTlA9aoDONK5KDwShw==
X-Received: by 2002:a17:906:2dc:b0:9aa:1020:8c36 with SMTP id 28-20020a17090602dc00b009aa10208c36mr8271013ejk.27.1694513102756;
        Tue, 12 Sep 2023 03:05:02 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:05:02 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 12:04:50 +0200
Subject: [PATCH v4 08/10] drm/msm/a6xx: Add A730 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-8-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=12654;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SyzNVKvt7YJcaBYq/5ySfRKfalch6Ym9boxkFmnOxY8=;
 b=dutMwakJMP9I0LBIjpYEMG8//vhJzDOngXPXBvmhLmAyLES9I+bcUp/iSjAqdF+7t0kLhAPaI
 3+JvVBH8hpUBU8Jvglb/fSQQEw+7JnkTbCo5P+Mnby/YFaZTqSn9gXk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Adreno 730, also known as GEN7_0_x, found on SM8450.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 126 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  61 ++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +-
 4 files changed, 203 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 61ce8d053355..522043883290 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -837,6 +837,63 @@ const struct adreno_reglist a690_hwcg[] = {
 	{}
 };
 
+const struct adreno_reglist a730_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
+	{ REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000223 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{},
+};
+
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1048,6 +1105,59 @@ static const u32 a690_protect[] = {
 	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
 };
 
+static const u32 a730_protect[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x0058),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_RDONLY(0x005fb, 0x009d),
+	A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	/* 0x008d0-0x008dd are unprotected on purpose for tools like perfetto */
+	A6XX_PROTECT_RDONLY(0x008de, 0x0154),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
+	A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
+	A6XX_PROTECT_NORDWR(0x00df0, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e07, 0x0008),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x0280),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e40, 0x0000),
+	A6XX_PROTECT_NORDWR(0x09e64, 0x000d),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x000f),
+	A6XX_PROTECT_NORDWR(0x0ae66, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0ae6f, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0ec00, 0x0fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x0053),
+	A6XX_PROTECT_RDONLY(0x18454, 0x0004),
+	A6XX_PROTECT_NORDWR(0x18459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1a459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1c459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
+	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
+	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
+	A6XX_PROTECT_NORDWR(0x1f878, 0x002a),
+	/* CP_PROTECT_REG[44, 46] are left untouched! */
+	0,
+	0,
+	0,
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
+};
+
 static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1069,6 +1179,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
 		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
+	} else if (adreno_is_a730(adreno_gpu)) {
+		regs = a730_protect;
+		count = ARRAY_SIZE(a730_protect);
+		count_max = 48;
+		BUILD_BUG_ON(ARRAY_SIZE(a730_protect) > 48);
 	} else {
 		regs = a6xx_protect;
 		count = ARRAY_SIZE(a6xx_protect);
@@ -1135,7 +1250,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
+	if (adreno_is_a650(adreno_gpu) ||
+	    adreno_is_a660(adreno_gpu) ||
+	    adreno_is_a730(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		hbb_lo = 3;
 		amsbc = 1;
@@ -1516,7 +1633,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
 	}
 
-	if (!adreno_is_a650_family(adreno_gpu)) {
+	if (!(adreno_is_a650_family(adreno_gpu) ||
+	      adreno_is_a730(adreno_gpu))) {
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
 
@@ -1586,7 +1704,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a619(adreno_gpu))
+	if (adreno_is_a730(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
+	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 25b235b49ebc..3865cd44523c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -5,6 +5,8 @@
 #include <linux/circ_buf.h>
 #include <linux/list.h>
 
+#include <soc/qcom/cmd-db.h>
+
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
 #include "a6xx_gpu.h"
@@ -506,6 +508,63 @@ static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[0][0] =  0x40000000;
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
+
+static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	msg->bw_level_num = 12;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x7;
+
+	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
+	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
+	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
+
+	msg->ddr_cmds_data[0][0] = 0x40000000;
+	msg->ddr_cmds_data[0][1] = 0x40000000;
+	msg->ddr_cmds_data[0][2] = 0x40000000;
+	msg->ddr_cmds_data[1][0] = 0x600002e8;
+	msg->ddr_cmds_data[1][1] = 0x600003d0;
+	msg->ddr_cmds_data[1][2] = 0x60000008;
+	msg->ddr_cmds_data[2][0] = 0x6000068d;
+	msg->ddr_cmds_data[2][1] = 0x6000089a;
+	msg->ddr_cmds_data[2][2] = 0x60000008;
+	msg->ddr_cmds_data[3][0] = 0x600007f2;
+	msg->ddr_cmds_data[3][1] = 0x60000a6e;
+	msg->ddr_cmds_data[3][2] = 0x60000008;
+	msg->ddr_cmds_data[4][0] = 0x600009e5;
+	msg->ddr_cmds_data[4][1] = 0x60000cfd;
+	msg->ddr_cmds_data[4][2] = 0x60000008;
+	msg->ddr_cmds_data[5][0] = 0x60000b29;
+	msg->ddr_cmds_data[5][1] = 0x60000ea6;
+	msg->ddr_cmds_data[5][2] = 0x60000008;
+	msg->ddr_cmds_data[6][0] = 0x60001698;
+	msg->ddr_cmds_data[6][1] = 0x60001da8;
+	msg->ddr_cmds_data[6][2] = 0x60000008;
+	msg->ddr_cmds_data[7][0] = 0x600018d2;
+	msg->ddr_cmds_data[7][1] = 0x60002093;
+	msg->ddr_cmds_data[7][2] = 0x60000008;
+	msg->ddr_cmds_data[8][0] = 0x60001e66;
+	msg->ddr_cmds_data[8][1] = 0x600027e6;
+	msg->ddr_cmds_data[8][2] = 0x60000008;
+	msg->ddr_cmds_data[9][0] = 0x600027c2;
+	msg->ddr_cmds_data[9][1] = 0x6000342f;
+	msg->ddr_cmds_data[9][2] = 0x60000008;
+	msg->ddr_cmds_data[10][0] = 0x60002e71;
+	msg->ddr_cmds_data[10][1] = 0x60003cf5;
+	msg->ddr_cmds_data[10][2] = 0x60000008;
+	msg->ddr_cmds_data[11][0] = 0x600030ae;
+	msg->ddr_cmds_data[11][1] = 0x60003fe5;
+	msg->ddr_cmds_data[11][2] = 0x60000008;
+
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x1;
+
+	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
+	msg->cnoc_cmds_data[0][0] = 0x40000000;
+	msg->cnoc_cmds_data[1][0] = 0x60000001;
+}
+
 static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
@@ -564,6 +623,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		a660_build_bw_table(&msg);
 	else if (adreno_is_a690(adreno_gpu))
 		a690_build_bw_table(&msg);
+	else if (adreno_is_a730(adreno_gpu))
+		a730_build_bw_table(&msg);
 	else
 		a6xx_build_bw_table(&msg);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 575e7c56219f..44599f97db20 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -490,6 +490,19 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
+		.family = ADRENO_7XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a730_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70000.bin",
+		},
+		.gmem = SZ_2M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a730_zap.mdt",
+		.hwcg = a730_hwcg,
+		.address_space_size = SZ_16G,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ad07e788a69c..fe38a1fc962b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -76,7 +76,7 @@ struct adreno_reglist {
 };
 
 extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
-extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
+extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[];
 
 struct adreno_speedbin {
 	uint16_t fuse;
@@ -403,6 +403,11 @@ static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
 	return gpu->info->family == ADRENO_6XX_GEN2;
 }
 
+static inline int adreno_is_a730(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x07030001;
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */

-- 
2.42.0

