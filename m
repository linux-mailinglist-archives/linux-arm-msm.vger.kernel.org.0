Return-Path: <linux-arm-msm+bounces-85208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D9CBD056
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9501305F67F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5A332AAB1;
	Mon, 15 Dec 2025 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPJiS9kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5+lrP+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3032ABC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788074; cv=none; b=oLX66wC7rbR4GK2KhOsz3gsbhNFM4VDMoYJcEHFkDAaMYfhuBN8NY+m9Zsv48QBy1g43sJoiyXn4L15bdqM9DKV1Y/thyb/A0qSH9styU3XFzS3LGSmlsk0eQxNBXjdjdezB2l170cEvXr9bmlVIL2QiWVPZqyFu9ClZOk4+oPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788074; c=relaxed/simple;
	bh=28XPRDu7buGoP84le8xj05AnjvLSe4hCZewdbDrbl5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2wSyb65OTNLu1QBAFvuLRtWxA2TkTxEZvdIWU2SVb1xkAKeZ2ea2B1jj378EOVoSVjQFxP+/Y+xI4fOCrlrns2OjhQ7YCfk72hOKmqkNjM+6BJ8koEkdB4CTVG2ASTxOZ67IbUnVpAiHuuxPNpoX4fI7UY+rdikezNgvluO0vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPJiS9kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5+lrP+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BENPlIn2884898
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VJ6GOkwdElu
	7QOYIBZ7JvlmgR56LXPMI7jXifO2+Kvg=; b=nPJiS9kS7eDgw0GGjRMoIzPmPlY
	lSDg+I3HsV9Y7Su048VyMnTgQnQUdMRetJ6aBtOd0nx+vO9cBo5I/EY+VIk2G8bh
	NRElvR9n1Y9kow8eE8Fyd9P2Rs0942NUYK+3ykzt0YvZEx3i/qD39A8CytdwLNSO
	8rNFTHbF/W5ID7eNxwRkyydeFhgS9iSdPTvoCv8k+HhjSpyKLXj34C4AmrgPUN4D
	xLQjbx/CLy9DFqg42ZT8Y4ZIDRgvcCJvQ/IvKNOlk1cH7N51JGzxBHlnHZ6YR+jo
	j4GFobPQQyM7aaAmvGOo7Unuquu4ZeylT/ty8k1y7Dx0+xcVg754UNvyPYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t3sxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:41:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d7ac8339so92610321cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788070; x=1766392870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ6GOkwdElu7QOYIBZ7JvlmgR56LXPMI7jXifO2+Kvg=;
        b=Y5+lrP+kfq8d3BqmrMu7oN4bVEDzbNTkweHYmzspldyHLX9iWVQBmwyAn2D1PVsrxf
         LJuK4ny++Kk0s88CM1KItVDlfRT5UcQS0799AIkGND5HKQq9A8jJbRVCcujmeYxFRL2C
         5NmxIUQuGp0F0esdMQd7oTx5099uGuP6ZnjUS4Rk9eaaCRtViAzoKb8jVdhR91da+8RT
         D1U3pmw7OE759Is/8MLjbwC60GH2UIPBwBkKOJ+m32O2wQwrwECugg2OoCQsU4Z0gpEI
         Jcq6635z8EVqDlXEJoDe+B6Q9A5ZtWwkSAS7Llitm1Sq9XT9lRz6aSbKahyFpmGlCErX
         Aaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788070; x=1766392870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJ6GOkwdElu7QOYIBZ7JvlmgR56LXPMI7jXifO2+Kvg=;
        b=lKlXhJg7FXYIIqF3scbXjDqkMiROijsF8DLsKEehTjb45JRC5drygBpq8+tljE05EJ
         TdaMCeYt+03FxAyNZY97SLJaMneZOC4l1MRn6httf6cCbWTzRi/4MfVlD7xpv7tCmXsn
         qsQz3kXedFgoM7jCqZ4PiZ+zVrW4dJStmOlnahk5fUiKF7Ha5zOo9tyQqtch1GBevSmz
         RMvXYBdQb68gf7W37a872jouRTu07M6KSG/sPAkEbj9MkIA+MzVSQJMhJLJQ4tG66SZY
         MxNO/FGippf3bWZ9+3Hbqt45i80DKgD1F9ZmvqinCqzJd/Y17Y2PaWnyWSY2mPFy6zbX
         820w==
X-Gm-Message-State: AOJu0YzQ758QhCzPRhPY0iek64XEkYH+RXI+OKxm+q23mQ/EJ4KOthkk
	gPLrE8YHwimV2z/JGLVJJ2x8f0nfDYh8m1Ib46AQ6GyTvU1EFMC5XlAr2TMjGnymxq6P3Tmo9Sn
	XGIC/bw1WrZv313KfNF1aZMvgbrcevKp18+HniBAuBZatmquG5imBAabmF76akMzUFQE9
X-Gm-Gg: AY/fxX4mKd924gZNiXX/3VT895JHL/psY3MLVQ0Wk/Qd2+9SbmeFGT7Y7VCh2El00Cu
	XkjdqK1amYNQhT3MxXq0Xr3ageNbBhl0ovWXZHJlud7gViX1ARHxl/CN/7jQ6oOlX2h3mwLubTI
	IQhVr+13xuc+TFjqUJpEjvfB7hSFN+/dzr8ZmNNk3ykM9u7oWzh6etNr7VmsTCNcIvl2s/Iek5j
	8tM5RNtICwoh0TKMJ7M+7LmEA7dAAYm7I+T6jt9d5Vdwt9hmJnf4h+lHWN8kY7j8pKsZB9lVLkT
	cF6/sTb8hhwCjS4jm4ufDNctKyChEuVIhABKahX/yg87r+Gm1eKCTSm/ecQ7bKT1eB34zbzAp02
	obqjxYRNOTYZ4AQuxkRgFG5kW9a4g9RrUegOWvpHllw9Mh4RKDAHSZoKfzm6qnT2zkSU=
X-Received: by 2002:ac8:5790:0:b0:4ee:1857:2673 with SMTP id d75a77b69052e-4f1d04f4a4amr149228801cf.35.1765788070331;
        Mon, 15 Dec 2025 00:41:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5qZ5aShA2fnui2E7fFtHaTn8n6OmnSVzIDmY1zhgwwZ6dUJgbi6+vNPnxXciErRmhpeVOHA==
X-Received: by 2002:ac8:5790:0:b0:4ee:1857:2673 with SMTP id d75a77b69052e-4f1d04f4a4amr149228661cf.35.1765788069861;
        Mon, 15 Dec 2025 00:41:09 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:41:09 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 10/11] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
Date: Mon, 15 Dec 2025 16:38:53 +0800
Message-Id: <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX+ZiAb1Z80JwF
 K6tJsmQP2q8cWn2R9yrz2QZ/xS7BSJGrz/GTFcFREkP7g41vwNz+jyS1cgfz8zbPuh+kijXXljz
 UJfS7ffnMcnIR6gcH736vghQeBTOxRwVZ+TLBT4y3UJ+PVRspFFVzP2WgPaa71C8brmQDB7SMv7
 99XyF/NRNQph9dZuaDthks1h1KyvWCQlGVEOulCNnhF9pyuwTsdpNKHz60qOlQUizS0LCmD9vlI
 cauj8hBZ6KBPvM03Oe5gH5BdmTIcqu8cfCgzXt09XuBIZ/2ZLegkQvBkSzR0aI0/TBdk5l9LZii
 nCORPoWtc+X+gHBSPagqgoGc96ZVtn/0meMfddzLgYTTjm6dFW/ABQq7vahRBU6Pd5PPyzPVgSN
 +hMsT3gVp3NMkl4Ze0YyiSj/pKbu7A==
X-Proofpoint-GUID: BmEZnyar0oSiHVqyxgcfrkimpzT2-h_J
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693fc9a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZMRFE71WIASCzucPcdAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BmEZnyar0oSiHVqyxgcfrkimpzT2-h_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150072

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces structural changes including
register additions, removals, and relocations.

Refactor SSPP-related code to be compatible with DPU 13.0.0
modifications.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 6 files changed, 191 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0eb7cdf82ff9..f2aba9bdfcd3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -208,6 +208,18 @@ struct dpu_dsc_blk {
 	u32 len;
 };
 
+/**
+ * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
+ */
+struct dpu_sspp_v13_rec_blk {
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
+};
+
 /**
  * enum dpu_qos_lut_usage - define QoS LUT use cases
  */
@@ -294,7 +306,8 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-
+	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
+	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;
 	const u32 *format_list;
 	u32 num_formats;
 	const struct dpu_rotation_cfg *rotation_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..7ed28009c463 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -145,11 +145,18 @@
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	u32 mode_mask;
 
 	if (!ctx)
 		return;
 
+	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_MULTIRECT_OPMODE);
+}
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx, u32 op_mode_off)
+{
+	u32 mode_mask;
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		/**
 		 * if rect index is RECT_SOLO, we cannot expect a
@@ -158,7 +165,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 		 */
 		mode_mask = 0;
 	} else {
-		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
+		mode_mask = DPU_REG_READ(&ctx->hw, op_mode_off);
 		mode_mask |= pipe->multirect_index;
 		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
 			mode_mask |= BIT(2);
@@ -166,11 +173,11 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 			mode_mask &= ~BIT(2);
 	}
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
+	DPU_REG_WRITE(&ctx->hw, op_mode_off, mode_mask);
 }
 
-static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
-		u32 mask, u8 en)
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+			      u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
@@ -189,8 +196,8 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
 }
 
-static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
-		u32 mask, u8 en)
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+				    u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
@@ -211,10 +218,6 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		const struct msm_format *fmt, u32 flags)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 chroma_samp, unpack, src_format;
-	u32 opmode = 0;
-	u32 fast_clear = 0;
 	u32 op_mode_off, unpack_pat_off, format_off;
 
 	if (!ctx || !fmt)
@@ -231,7 +234,25 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		format_off = SSPP_SRC_FORMAT_REC1;
 	}
 
+	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
+				 unpack_pat_off, format_off,
+				 SSPP_UBWC_STATIC_CTRL, SSPP_UBWC_ERROR_STATUS);
+}
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
+			      u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off,
+			      u32 ubwc_err_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 chroma_samp, unpack, src_format;
+	u32 opmode;
+	u32 fast_clear;
+	u8 core_major_ver;
+
 	c = &ctx->hw;
+	core_major_ver = ctx->mdss_ver->core_major_ver;
+
 	opmode = DPU_REG_READ(c, op_mode_off);
 	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
 			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE);
@@ -273,31 +294,34 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
-		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
-			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+
+		if (core_major_ver < 13)
+			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
+				      DPU_FETCH_CONFIG_RESET_VALUE |
+				      ctx->ubwc->highest_bank_bit << 18);
+
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
+				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				      BIT(8) |
+				     (ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
+				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
+				     (ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
+				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
+				     (ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
+				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
 	}
@@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	/* update scaler opmode, if appropriate */
 	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
-		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
-			MSM_FORMAT_IS_YUV(fmt));
+		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
+					 MSM_FORMAT_IS_YUV(fmt));
 	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
-		_sspp_setup_csc10_opmode(ctx,
-			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
-			MSM_FORMAT_IS_YUV(fmt));
+		dpu_hw_sspp_setup_csc10_opmode(ctx,
+					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
+					       MSM_FORMAT_IS_YUV(fmt));
 
 	DPU_REG_WRITE(c, format_off, src_format);
 	DPU_REG_WRITE(c, unpack_pat_off, unpack);
 	DPU_REG_WRITE(c, op_mode_off, opmode);
-
 	/* clear previous UBWC error */
-	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
+	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
 }
 
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
@@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 			tot_req_pixels[3]);
 }
 
-static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_scaler3_cfg *scaler3_cfg,
-		const struct msm_format *format)
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
+			       const struct msm_format *format)
 {
 	if (!ctx || !scaler3_cfg)
 		return;
@@ -405,15 +428,11 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 
 	if (!ctx || !cfg)
 		return;
 
-	c = &ctx->hw;
-
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		src_size_off = SSPP_SRC_SIZE;
@@ -427,20 +446,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		out_xy_off = SSPP_OUT_XY_REC1;
 	}
 
-
-	/* src and dest rect programming */
-	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
-	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
-		   drm_rect_width(&cfg->src_rect);
-	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
-	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
-		drm_rect_width(&cfg->dst_rect);
-
-	/* rectangle register programming */
-	DPU_REG_WRITE(c, src_size_off, src_size);
-	DPU_REG_WRITE(c, src_xy_off, src_xy);
-	DPU_REG_WRITE(c, out_size_off, dst_size);
-	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
+				src_xy_off, out_size_off, out_xy_off);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
@@ -497,8 +504,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
 }
 
-static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
-		const struct dpu_csc_cfg *data)
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+			   const struct dpu_csc_cfg *data)
 {
 	u32 offset;
 	bool csc10 = false;
@@ -519,21 +526,31 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_fmt_layout cfg;
+	u32 const_clr_off;
 
 	if (!ctx)
 		return;
 
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR;
+	else
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR_REC1;
+
+	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx,
+				 u32 const_clr_off)
+{
+	struct dpu_hw_fmt_layout cfg;
+
 	/* cleanup source addresses */
 	memset(&cfg, 0, sizeof(cfg));
 	ctx->ops.setup_sourceaddress(pipe, &cfg);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
-	    pipe->multirect_index == DPU_SSPP_RECT_0)
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
-	else
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
-				color);
+	DPU_REG_WRITE(&ctx->hw, const_clr_off, color);
 }
 
 static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
@@ -547,14 +564,20 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 			      cfg);
 }
 
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off)
+{
+	DPU_REG_WRITE(&ctx->hw, ctrl_off,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 				       bool danger_safe_en)
 {
 	if (!ctx)
 		return;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
-		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_QOS_CTRL);
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
@@ -609,7 +632,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
-		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
+		c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index bdac5c04bf79..c6b19cb4d158 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -331,5 +331,57 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
 
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+			      u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+				    u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
+			       const struct msm_format *format);
+
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+			   const struct dpu_csc_cfg *data);
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx,
+				 u32 op_mode_off);
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx,
+			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
+			      u32 ubwc_ctrl_off, u32 ubwc_err_off);
+
+static inline void dpu_hw_setup_rects_impl(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *cfg,
+					   struct dpu_hw_sspp *ctx, u32 src_size_off,
+					   u32 src_xy_off, u32 out_size_off, u32 out_xy_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 src_size, src_xy, dst_size, dst_xy;
+
+	c = &ctx->hw;
+
+	/* src and dest rect programming */
+	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
+	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
+		   drm_rect_width(&cfg->src_rect);
+	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
+	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
+		drm_rect_width(&cfg->dst_rect);
+
+	/* rectangle register programming */
+	DPU_REG_WRITE(c, src_size_off, src_size);
+	DPU_REG_WRITE(c, src_xy_off, src_xy);
+	DPU_REG_WRITE(c, out_size_off, dst_size);
+	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx, u32 const_clr_off);
+
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off);
+
 #endif /*_DPU_HW_SSPP_H */
 
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


