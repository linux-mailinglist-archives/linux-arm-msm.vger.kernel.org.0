Return-Path: <linux-arm-msm+bounces-86214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4066CD5B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA2743069303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF7633C1B9;
	Mon, 22 Dec 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qm14lPhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DK+DtXen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEBE33C1A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399140; cv=none; b=ae14aRaEM694FfcW4QCIsWsdGAQDGiyikdKFuK0P+4yDI2GnC0r9MK890vQTDEzUU18Zlw/NhqfHyBE5/c3oCnYw6DwAf6+lJcPtWQSFffoIw8sgg0hxUVVUT8ltJmeBWIfOn82mY/2IW+HvOz2xdRBCO4Iqz3Ue+XL52s+SlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399140; c=relaxed/simple;
	bh=jVDp70UU9yS/utuuU6jaAmxjIwohsqiywoDSm6q+qZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T1fkeniPLxKBXIX8Oqye6qE82NOW+h3/7nsIooNuOzU/Bc0yE/tjp1iPn4V1p7F/zlS696xT9CQpjlilstdNg5vrdCI1iidKY9VuLWFGnTVajFejvlXwJMVSjgXFYfyiV3zs/98pmBbtRaHeRhq6gl7oSNLPKLcYgjGDFv2TO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qm14lPhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DK+DtXen; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8QPKt3498980
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4rx3RTCmg9c
	cTWJTB40R1qqTXQJX4P8MJFSbMIhlrpE=; b=Qm14lPhi2W9WFG55yFnKSdLPIKT
	Tiw7vKHUQzrvGoyu0HlOHRNB4IdKbYgNvQDK8tufvFfcFcu+o0pNaffqM6d/M5Pm
	xjsBN8TQW77UxkRhvumS7wybQ8288QYd7oc7wRObqcwS7wH4zv+80cgNpEfiY7Xg
	ZbhLnZRJfFJlHHE4qfTJQQsAXpi2cxG/PmS2pdycEYSP0HjQ/7QZsdrNu/V72r79
	yg4Q71BNfsJYl/viOk31O7pO0DAN3VKON6StKWXF3il+TdrAyErK6jPe5TSE964i
	F2I0/O5opWXqAqNEzDwkFX8Ihr+j0oMrpb9k1y6yb4Cr+2Jp53n9Zw71R0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmpk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb6a7fea4dso917325885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399137; x=1767003937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rx3RTCmg9ccTWJTB40R1qqTXQJX4P8MJFSbMIhlrpE=;
        b=DK+DtXenSCbqCsJ5FMBvNRjb3u6dP3X1kC+Ie5nXm3NTo+f4lYm0hQI7Qe0bkjDrcq
         tohU9tF5m+pWu4vwc8EjSEimnRDNYuIoalSFDW0ylSeMZACKtCIGDMn9fvBfvVPN+raH
         tkVhxvZBL5igZYZUibOJ0WdRU4st9xHQfo2d7y6fcoe2/ARfSebupSt2E5FwSGIIeUzy
         5H/Kfp2TMaPl5fqSvKiSUBhssT8lEaT5bn3OTLjSmEXNCAi9fIAqdAfbyfzQcr6Cb6Od
         kd8vqXtWdXcafpXqmIyWPpsKAMNeVIPQUelnd3snXTJIKFL2iyF3e+UWLSD31PBRKmY3
         1suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399137; x=1767003937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rx3RTCmg9ccTWJTB40R1qqTXQJX4P8MJFSbMIhlrpE=;
        b=Z4n1LnFyhxVoKB8EFOlbyWZXDz8acA17RKluMopuddRfq4UWo1zKl9ADTqbhi3azBw
         gxrZyf+25mI+TOstdZ3vk/hLzaUf68v+SudfaqcCYVxMMMpi3grTl8TIDYgwDH3g9lYQ
         /DVPJexIMkendLyeCtSB5dPQDZyVaETkPgdGPn1lqTpv4P/9tS1TqVosOIwoHz3ZPpyJ
         6vSd93X9sdguyOR7jjnjtOgks1QoQGmtrZvjE0ZPAOsJJ00q/x0AKmHwG9AIPtl3SQfc
         iSjZVjge4Zr18KIPJLyPpMxYmrPnPUWxkJL0SBJjRGonIQXUZWDZhKyRulUVMeu8Vjwa
         7hFg==
X-Gm-Message-State: AOJu0Yzu0Tt17+EuzdGhRfAEaBeqNwSN6sU7q/vPUQIHRI2KtPV1EtRQ
	B6xuRx4cHq2/NoPRhokezumgQlF/Hlp+zgrOhsSpQ7lS5sigzNz5YVzTGIKsoziViP6LIkW6dc8
	wOCqRo/ugzk2I2IQBjODqmB4ZnMb5UW15hUD87EqD1ViPeiNlj5VKs7orIpFCdkd+nnWn
X-Gm-Gg: AY/fxX7i/EtGgqqekEoA/ryswTDkyoztumP+D1t7MMt0Ovwnpf2O1myG+8GCmiP6uk7
	SRsQd4emGx9TcoWCyc0AbuzmuVdK46EHVuQeW7IdE1DoTWbPK+Obq78sd+Df18rDVEszo3Qp/ze
	4R1+fE9BdkEuYaP8b4Tw1S2gpEy3/cflFTp+87Z+lSVPv8lkEZFlY8QYwjad/TlBOlLf/PEC2M4
	ZwOGtaQlUMIQYN5wrjBBEA6qI2BhQR68xQu3u32nrFhaedvHJCBkwJRWEOl9yd912OzVzXGA0Op
	X4Bni/vMP3aAnMWb1I9HecDzgjUO/hPy7hTwUFZeUnh5gjsvbLGg0ADQ2t77z3egeLGXL3CD4qk
	zyJ9pJ+8ItdRsgXLta2R3O0dvDuQPJRDxgU16Iv28pijnATYJBsamwiPNC+2Hw3EStiM=
X-Received: by 2002:a05:622a:1650:b0:4ee:2721:9ebe with SMTP id d75a77b69052e-4f4abda5267mr177373691cf.53.1766399136599;
        Mon, 22 Dec 2025 02:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDLn8QFjiI0GOGFmMbPl8GgAvxTaOgCvLO/wsAYUxaAwJEj++QH7yB17KoNXp2yR3/ihQppA==
X-Received: by 2002:a05:622a:1650:b0:4ee:2721:9ebe with SMTP id d75a77b69052e-4f4abda5267mr177373451cf.53.1766399136110;
        Mon, 22 Dec 2025 02:25:36 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:25:35 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 10/11] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Date: Mon, 22 Dec 2025 18:23:59 +0800
Message-Id: <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G0-oxE3BgdAtQylKUhd5sG9ozCStobS7
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69491ca1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IoldKcXwaph4SihcyF8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: G0-oxE3BgdAtQylKUhd5sG9ozCStobS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX730TAD1PJIRk
 R8q4aQIgABXanqQEGY7hE+u1Vvt2zFdhys7CRpZarioBFJ1c0kIChXCdVUhTBGpFoQv0M0ipcrC
 MWaAleIU19fvrmGgZ6ohWSXE5cr32LQj7BNhWsenw8NgjzPSl+i6FzV9O8WLo1Kb/3yBaU9s/iG
 pH9sWQYnEgjH1/05Ty3RYEkBb/PcvtVdCd3ZoPWWAd9fab6qYwEs2FS36RqJ3scAPtqWeChPqCb
 Wng78g/Cx2aw2GI/9CxDBrp5t6BGFXKKU50np3kNPtJbylOXvLZLAzErI9fYApMWq1xTI+UyLy9
 R4qzUY3afRRQDNaJC0D2RJKvYrGH4HTf80NtsHCL0ZwNHY1iaa8agTQ2v7mEiMm8OwcvG/mshXR
 UsRtaWWWvXS2K2gyhgLjtLC7YK6cA1ZyAAxMjDW4mgA8rcWTGqYolU/e09E1lOGsNkYzgCVH9oC
 XKq0AKGWkWAadoikM4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add support for Kaanapali platform SSPP sub-blocks, which
introduce structural changes including register additions,
removals, and relocations. Add the new common and rectangle
blocks, and update register definitions and handling to
ensure compatibility with DPU v13.0.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 7 files changed, 371 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8aa7d07303fb..8b94c5f1cb68 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -86,6 +86,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_hw_lm.o \
 	disp/dpu1/dpu_hw_pingpong.o \
 	disp/dpu1/dpu_hw_sspp.o \
+	disp/dpu1/dpu_hw_sspp_v13.o \
 	disp/dpu1/dpu_hw_dspp.o \
 	disp/dpu1/dpu_hw_merge3d.o \
 	disp/dpu1/dpu_hw_top.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 197a2c584c73..c6d8d7fb3880 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -248,6 +248,7 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode;
 	u32 fast_clear;
+	u8 core_major_ver = ctx->mdss_ver->core_major_ver;
 
 	c = &ctx->hw;
 	opmode = DPU_REG_READ(c, op_mode_off);
@@ -291,9 +292,10 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
-		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
-			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+		if (core_major_ver < 13)
+			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
+				DPU_FETCH_CONFIG_RESET_VALUE |
+				ctx->ubwc->highest_bank_bit << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
@@ -724,7 +726,10 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 
 	hw_pipe->mdss_ver = mdss_rev;
 
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
+	if (mdss_rev->core_major_ver >= 13)
+		dpu_hw_sspp_init_v13(hw_pipe, hw_pipe->cap->features, mdss_rev);
+	else
+		_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index c6b19cb4d158..309af4183ba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -383,5 +383,9 @@ void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
 void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
 				     bool danger_safe_en, u32 ctrl_off);
 
+void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
+			  unsigned long features,
+			  const struct dpu_mdss_version *mdss_rev);
+
 #endif /*_DPU_HW_SSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
new file mode 100644
index 000000000000..e78a20b45300
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
+#include "dpu_hw_sspp.h"
+
+/* >= v13 DPU */
+/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
+/*      Name                                  Offset */
+#define SSPP_CMN_CLK_CTRL                0x0
+#define SSPP_CMN_CLK_STATUS              0x4
+#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
+#define SSPP_CMN_ADDR_CONFIG             0x14
+#define SSPP_CMN_CAC_CTRL                0x20
+#define SSPP_CMN_SYS_CACHE_MODE          0x24
+#define SSPP_CMN_QOS_CTRL                0x28
+
+#define SSPP_CMN_FILL_LEVEL_SCALE                0x3c
+#define SSPP_CMN_FILL_LEVELS                     0x40
+#define SSPP_CMN_STATUS                          0x44
+#define SSPP_CMN_FETCH_DMA_RD_OTS                0x48
+#define SSPP_CMN_FETCH_DTB_WR_PLANE0             0x4c
+#define SSPP_CMN_FETCH_DTB_WR_PLANE1             0x50
+#define SSPP_CMN_FETCH_DTB_WR_PLANE2             0x54
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE0            0x58
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE1            0x5c
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE2            0x60
+#define SSPP_CMN_UNPACK_LINE_COUNT               0x64
+#define SSPP_CMN_TPG_CONTROL                     0x68
+#define SSPP_CMN_TPG_CONFIG                      0x6c
+#define SSPP_CMN_TPG_COMPONENT_LIMITS            0x70
+#define SSPP_CMN_TPG_RECTANGLE                   0x74
+#define SSPP_CMN_TPG_BLACK_WHITE_PATTERN_FRAMES  0x78
+#define SSPP_CMN_TPG_RGB_MAPPING                 0x7c
+#define SSPP_CMN_TPG_PATTERN_GEN_INIT_VAL        0x80
+
+/*RECRegisterset*/
+/*Name        Offset*/
+#define SSPP_REC_SRC_FORMAT                             0x0
+#define SSPP_REC_SRC_UNPACK_PATTERN                     0x4
+#define SSPP_REC_SRC_OP_MODE                            0x8
+#define SSPP_REC_SRC_CONSTANT_COLOR                     0xc
+#define SSPP_REC_SRC_IMG_SIZE                           0x10
+#define SSPP_REC_SRC_SIZE                               0x14
+#define SSPP_REC_SRC_XY                                 0x18
+#define SSPP_REC_OUT_SIZE                               0x1c
+#define SSPP_REC_OUT_XY                                 0x20
+#define SSPP_REC_SW_PIX_EXT_LR                          0x24
+#define SSPP_REC_SW_PIX_EXT_TB                          0x28
+#define SSPP_REC_SRC_SIZE_ODX                           0x30
+#define SSPP_REC_SRC_XY_ODX                             0x34
+#define SSPP_REC_OUT_SIZE_ODX                           0x38
+#define SSPP_REC_OUT_XY_ODX                             0x3c
+#define SSPP_REC_SW_PIX_EXT_LR_ODX                      0x40
+#define SSPP_REC_SW_PIX_EXT_TB_ODX                      0x44
+#define SSPP_REC_PRE_DOWN_SCALE                         0x48
+#define SSPP_REC_SRC0_ADDR                              0x4c
+#define SSPP_REC_SRC1_ADDR                              0x50
+#define SSPP_REC_SRC2_ADDR                              0x54
+#define SSPP_REC_SRC3_ADDR                              0x58
+#define SSPP_REC_SRC_YSTRIDE0                           0x5c
+#define SSPP_REC_SRC_YSTRIDE1                           0x60
+#define SSPP_REC_CURRENT_SRC0_ADDR                      0x64
+#define SSPP_REC_CURRENT_SRC1_ADDR                      0x68
+#define SSPP_REC_CURRENT_SRC2_ADDR                      0x6c
+#define SSPP_REC_CURRENT_SRC3_ADDR                      0x70
+#define SSPP_REC_SRC_ADDR_SW_STATUS                     0x74
+#define SSPP_REC_CDP_CNTL                               0x78
+#define SSPP_REC_TRAFFIC_SHAPER                         0x7c
+#define SSPP_REC_TRAFFIC_SHAPER_PREFILL                 0x80
+#define SSPP_REC_PD_MEM_ALLOC                           0x84
+#define SSPP_REC_QOS_CLAMP                              0x88
+#define SSPP_REC_UIDLE_CTRL_VALUE                       0x8c
+#define SSPP_REC_UBWC_STATIC_CTRL                       0x90
+#define SSPP_REC_UBWC_STATIC_CTRL_OVERRIDE              0x94
+#define SSPP_REC_UBWC_STATS_ROI                         0x98
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI0      0x9c
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI0               0xa0
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI1      0xa4
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI1               0xa8
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI2      0xac
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI2               0xb0
+#define SSPP_REC_EXCL_REC_CTRL                          0xb4
+#define SSPP_REC_EXCL_REC_SIZE                          0xb8
+#define SSPP_REC_EXCL_REC_XY                            0xbc
+#define SSPP_REC_LINE_INSERTION_CTRL                    0xc0
+#define SSPP_REC_LINE_INSERTION_OUT_SIZE                0xc4
+#define SSPP_REC_FETCH_PIPE_ACTIVE                      0xc8
+#define SSPP_REC_META_ERROR_STATUS                      0xcc
+#define SSPP_REC_UBWC_ERROR_STATUS                      0xd0
+#define SSPP_REC_FLUSH_CTRL                             0xd4
+#define SSPP_REC_INTR_EN                                0xd8
+#define SSPP_REC_INTR_STATUS                            0xdc
+#define SSPP_REC_INTR_CLEAR                             0xe0
+#define SSPP_REC_HSYNC_STATUS                           0xe4
+#define SSPP_REC_FP16_CONFIG                            0x150
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_0              0x154
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_1              0x158
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_0              0x15c
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_1              0x160
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_0              0x164
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_1              0x168
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_R                   0x16c
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_G                   0x170
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_B                   0x174
+#define SSPP_REC_FP16_CSC_POST_CLAMP                    0x178
+
+static inline u32 dpu_hw_sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
+						 struct dpu_hw_sspp *ctx)
+{
+	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
+		ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
+}
+
+static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+
+	if (!ctx)
+		return;
+
+	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_CMN_MULTI_REC_OP_MODE);
+}
+
+static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
+					 const struct msm_format *fmt, u32 flags)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 ubwc_ctrl_off, ubwc_err_off;
+	u32 offset;
+
+	if (!ctx || !fmt)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	op_mode_off = offset + SSPP_REC_SRC_OP_MODE;
+	unpack_pat_off = offset + SSPP_REC_SRC_UNPACK_PATTERN;
+	format_off = offset + SSPP_REC_SRC_FORMAT;
+	ubwc_ctrl_off = offset + SSPP_REC_UBWC_STATIC_CTRL;
+	ubwc_err_off = offset + SSPP_REC_UBWC_ERROR_STATUS;
+
+	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
+				 unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_err_off);
+}
+
+static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
+					    struct dpu_hw_pixel_ext *pe_ext)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u8 color;
+	u32 lr_pe[4], tb_pe[4];
+	const u32 bytemask = 0xff;
+	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
+
+	if (!ctx || !pe_ext)
+		return;
+
+	c = &ctx->hw;
+	/* program SW pixel extension override for all pipes*/
+	for (color = 0; color < DPU_MAX_PLANES; color++) {
+		/* color 2 has the same set of registers as color 1 */
+		if (color == 2)
+			continue;
+
+		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
+			       (pe_ext->left_rpt[color] & bytemask);
+
+		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
+			       (pe_ext->top_rpt[color] & bytemask);
+	}
+
+	/* color 0 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
+
+	/* color 1 and color 2 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
+}
+
+static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
+					struct dpu_sw_pipe_cfg *cfg)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
+	u32 offset;
+
+	if (!ctx || !cfg)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	src_size_off = offset + SSPP_REC_SRC_SIZE;
+	src_xy_off = offset + SSPP_REC_SRC_XY;
+	out_size_off = offset + SSPP_REC_OUT_SIZE;
+	out_xy_off = offset + SSPP_REC_OUT_XY;
+
+	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
+				src_xy_off, out_size_off, out_xy_off);
+}
+
+static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
+						struct dpu_hw_fmt_layout *layout)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	int i;
+	u32 offset, ystride0, ystride1;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
+		DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC0_ADDR + i * 0x4,
+			      layout->plane_addr[i]);
+
+	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
+	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
+
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE0, ystride0);
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE1, ystride1);
+}
+
+static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 const_clr_off;
+	u32 offset;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	const_clr_off = offset + SSPP_REC_SRC_CONSTANT_COLOR;
+
+	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
+}
+
+static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
+					  struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
+static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
+					   bool danger_safe_en)
+{
+	if (!ctx)
+		return;
+
+	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_CMN_QOS_CTRL);
+}
+
+static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
+				      const struct msm_format *fmt,
+				      bool enable)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 offset = 0;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
+}
+
+static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
+{
+	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
+		.reg_off = SSPP_CMN_CLK_CTRL,
+		.bit_off = 0
+	};
+
+	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
+}
+
+void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
+			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
+{
+		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
+		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
+		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
+		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
+		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
+
+		if (test_bit(DPU_SSPP_QOS, &features)) {
+			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
+			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
+		}
+
+		if (test_bit(DPU_SSPP_CSC, &features) ||
+		    test_bit(DPU_SSPP_CSC_10BIT, &features))
+			c->ops.setup_csc = dpu_hw_sspp_setup_csc;
+
+		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
+		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
+
+		if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
+			c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
+
+		if (test_bit(DPU_SSPP_CDP, &features))
+			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
+
+		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 486be346d40d..3cf22ec62792 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QOS_CREQ_LUT_0                    0x14
 #define QOS_CREQ_LUT_1                    0x18
 
+/* CMN_QOS_LUT */
+#define SSPP_CMN_QOS_CTRL                      0x28
+#define SSPP_CMN_DANGER_LUT                    0x2c
+#define SSPP_CMN_SAFE_LUT                      0x30
+#define SSPP_CMN_CREQ_LUT_0                    0x34
+#define SSPP_CMN_CREQ_LUT_1                    0x38
+
 /* QOS_QOS_CTRL */
 #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
 #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
@@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
+void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
+			       const struct dpu_hw_qos_cfg *cfg)
+{
+	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
+	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
+	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
+	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
+	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
+		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 /*
  * note: Aside from encoders, input_sel should be set to 0x0 by default
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 67b08e99335d..1822ac699757 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -360,6 +360,9 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 			   bool qos_8lvl,
 			   const struct dpu_hw_qos_cfg *cfg);
 
+void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
+			       const struct dpu_hw_qos_cfg *cfg);
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset, u8 input_sel);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..006dcc4a0dcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1


