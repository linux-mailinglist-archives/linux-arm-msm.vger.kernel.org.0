Return-Path: <linux-arm-msm+bounces-55329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA408A9A83C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3AD2460F7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03A7244665;
	Thu, 24 Apr 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZqz9OHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB1242D95
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487082; cv=none; b=kXZHVKaJgnGhcPHcUUp2xgKadJvgM2GEK7gCKyr867fiw48PGtoHH0KzlV9e1UxTiIdAm9fMwD1FXxoKfe3iF9kRhuyBdYBc7bNQKlZKHULhZ/eknYz9kUKlaAC4lcdMA8nWDdp4YI/gBHa4GhdDYU7HLi3DXWFaq5WZsJlu4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487082; c=relaxed/simple;
	bh=ApjXnJBfnxHVUl1P/UJxaGGxoUQvDBdH22X4bA3YQkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIq+wq3UCd2wpOrzy5qzSZNWPITGmRfYROB40zfAxEj2KHyNSOGYuNXXz44tpjriGcuYc60pWA88U16R0wDm8GRCVA2FvT3GCDq2x7TdXLythdf2U0W7vUd64BCe/L6X5oRjeleu3Id9Y0qpimgVIBZwe3GtqHFHRqZuWVy/Fqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZqz9OHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAqx011396
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TL9IohemaggxE/oPMb+lGwcuNbosvCvTrU7VBUuq6Y4=; b=hZqz9OHSEoSEbQIP
	ifBwB5Jw3jDZSSd/oWBRIankQxMLuxny2lmsGB6BD0lPYLXixdEOtE0z3PjqYo2/
	v2+84TebJLHg+oWpuqz2elK5C3WEkLdltEb3USMG7PdqzvArCmNl51GKmkI2vR40
	MW4sF6zY6U3sUUvL2L1da7ruYuJJ1aE9uIcryEvsYQnNX5LjG/iQ0WTzAjlyIo9B
	I9ZfsaynQgXUrcZIWR+h6u3Gk4l2jZgGCqvlaydel+A3KxRAAqYViPdImvJN9wca
	aOdivtmcS5Z+qTr4XWHgiAVQg2WdT0V3gv3jt91Qr0lSsz8dgqDd1BvSj1Ppr52Q
	/X7c+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh250hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so10509846d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487078; x=1746091878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL9IohemaggxE/oPMb+lGwcuNbosvCvTrU7VBUuq6Y4=;
        b=c4a+EHEukG8fjDCmUPQWn+wX7l1tP+OxGnmJzr+NuqcwMnksc7F2SPIOADqMgxlTS1
         XOL2IZMMcz7LQ/fwJqYTY4B39+RfK1vFAFcALRN+AhiPLOkA1fxbxmq2ycU3mBiY3SUE
         SOBKRLHe8SEqp1YsHvDJqPF3ZYQlM6LVUK+s1Eqkk8KPSyI9uV1yVeuhD6+jVZtay3I4
         fKJ1qrAlYzJp6zom8p+tqxzgP3sLDngyogn2MFAydSrV51Ya3VqMVQKQbGPkW82rE+V0
         nbTYVtcNRn4I2CXqN0l5hCWqoJvNVCHpRnTBxhA58sr3co8hH8trC3N73nsiHEJ0q+ZP
         ej9w==
X-Gm-Message-State: AOJu0YydjgbUefjCXDFn8Sg+hfNjTF9EO1IqQeisPrxhRob3J1cHbAdN
	UN7VCOXCcGnWTSUCFtphkiYBtF0p20etNkMGWOj7I5jwoLMKz4IrWN195sRhY10oCBpTHSn7EWm
	OYMgpskXkBeIZi2WgMD6c3BxSQG+vrXcwOIa7zb+GQCY6WqAzIiFn37KhxqW/Uz2G
X-Gm-Gg: ASbGncvNwplPkdAbZC8+Y9Er4fgO+UoiEDj252s2sjs+PU4Nqa8PxZyrO61UOmqz0Le
	unZQYdVtnLdfbvNZcSRMX+v6YMhFwH4tAOq+Q4w7C/pEeKoLHfNhrqevVaksuhFLBzvnl6If772
	ucDUM38hXK+xccOni3/h4HI5+8VJhkV0h0x0wtsWC51rOxvGlV/6/6kFwIGIb+ZDbpPR8JvBMEN
	MALnxGcwiPKzf1PVUQt4swILnSBMa4FYMI/VmFpfuzkC9f0CKCpYG+KA36q2BFccKb8rpySwzD5
	3ga5s1FpKuKgxbfVgSl6WE8ZtKfdLliUe2I/TzanBgCrjpoGGJvc+Fm2LeJKZECf6NQF8ZG0Ggl
	pVQUCG1thrc2tB9KqAjLMwL6N
X-Received: by 2002:a05:6214:518c:b0:6e6:65a6:79a4 with SMTP id 6a1803df08f44-6f4bfc85415mr28111156d6.44.1745487078419;
        Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc7eD4luaXza3qktsi5L36/1bV1AhI7q+ALQ71WdGsi+GS/QTNj6mqkRAi4hBHWhJeZ8os0Q==
X-Received: by 2002:a05:6214:518c:b0:6e6:65a6:79a4 with SMTP id 6a1803df08f44-6f4bfc85415mr28110676d6.44.1745487077932;
        Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:32 +0300
Subject: [PATCH v3 28/33] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-28-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Xucrl9p3RVanutrsrXG/AILscg4MPlsZPdz9DRUTfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwyTrNj4d1e9F6CpB67cXEzRYs7VEhZfl8W
 eTHFyvd8g6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1ZNfB/9iaYueFfz8QCVW8D2xKb5xWnzoYesnXm70L0TxaLdwRtSFbd/ajtTZ0mqLk9TJmq3sGgU
 Jzl4XahlCnZWpgF+iC1JmDaaOwaNKdBQWfVEizyeON2D47VvWCKRCkJ4CXC+7AZuMVJT1ZigeGR
 lWhMkYZu0a+w9z1Jpm02Zf4DpjGIq6Uj10LFS/I/yACBWyhUWXh5dD5DPuSGWPxObNA37BH8pVq
 aN5YKcI1l0yh9D2R4OxOty9C/RkPl0AgYMnxo7u2oMxeyFzpVm2PcTxbv4RTBwXS0JXy/T91lmJ
 vBTtjAWDlZWUro3J26bDeNWtS3TbfuCZ3R6LdBi2iwOAP3Si
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a04e7 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=BKnecdA5F2l9gEOK9gkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ILlssJRXyx_wE4-_SBiJmD5KSbRYEIYc
X-Proofpoint-ORIG-GUID: ILlssJRXyx_wE4-_SBiJmD5KSbRYEIYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX7uTOr07wa/x1 McVmwEJaBsW/AyumRspXwJyAf3Q3J0zX9OvxpaxM970jlK+cxzDFLX7jgsllkfzx3u7GzNcE+OP Hd5h39nqT8dFkvLwwAn/+qXdVJ7mWpPSrEixNRGoLIipvhqrLCKeZw92+cb+AMQkXlpziilP+fD
 VJh6JjQP3YbgZh1BXaYohfb6PqyZM/M8TXCCiigxiIECHlPyaoYgvSxEEwL9JkNxO6nCi39YnZ/ QGqtLWH9Ak6so4NC2ib7HEPFm71LzOfjUtO4BLdYsBvNYv4azhtH85oWYtwrBVO4h+tsnB9a5pR EVHWUJdeG6DeLwranueKpBNnbX+2bd0B1Kjf1xuVS7NNbEKxkIp+87xhvscZnu+dIv+Z8V0onEJ
 LMdaRLBju+1i5N0j+hNKp6sWykNQppNYMPYgPokf6U+DQ79NGP2a4YMz9S2bj09AHxSn7c+P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=770
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 436fa56e2ba2d867b58b59ec6b02d1d0f396c23b..7f606be1f79fe83568b467c47e7280537f1ce091 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 38cdea019bf2b1391c242953e4c67d9dc4c2274c..a10ca16d2d63d8b6e2e2165dcd4bf0cf915f8e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 176640bff1214e89606286ce572f74300f6f343f..c1fc91b3f6f85af18cf6a6c1690ec69074fc3545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c..65975e7ebd9ba1970b48d8753a87835677d58df7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 21264184566493ab4e356a4e0c032ee7780cabff..8d5b7033f12f740fe7b9226e93fcece8ed54b890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4b6af58429361c49b71f6067dce8ca1daa6493fa..5eeb693f0e282da2aa0e5a729aed1bc8573639dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5


