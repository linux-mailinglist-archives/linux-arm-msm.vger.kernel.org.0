Return-Path: <linux-arm-msm+bounces-55219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD89A99A81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083C91B64E18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528422BD5B7;
	Wed, 23 Apr 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FU98TDO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EB293453
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442687; cv=none; b=Bm4Z34bDgjfqNCyhsrC4+aM9xmoJuBqucnxs7nKelnsPkUh5q38IsTbSa97aBIsM5V0Vo3dzD1c3x++seiiEN30IVn9aLYeaSWw7JwdHxbAu2nGN+IQPk2WCaOGp6c+xDOWFZLZg8fk1lg0HR7ekeQI4b/XD7fSsDT9RJJ3ckms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442687; c=relaxed/simple;
	bh=tjLaEXS6saL4Tjk3z+TVeg4Wlv4axFBIVr+nnvsQZO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn0gC3/lLWSDflsS+p6BN6oJrpd90pIwMnEVelFX3oZ9mcjOjxxydTEE4VyLLKlT7aCZPE70SvVU+AQnw4X/ra746ZT1JP38VaRKk6Qzf0ooBQSBNtdHIElbd871lI79TrRxoWK2cKn7SlcJ8SmfzzUnDs9x+KW6SwqRNKt2EPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FU98TDO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAIRoW016863
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=; b=FU98TDO9NfzCSINF
	h8UOecwQXmOxIO5r5DzzTswUsOCi65LPZHm7pmo3cafXg9JFnMeKd9N3ZGZwYCQo
	l9XBhNfInmTCcBJVxomKEvsfft75GLvGOiDdR5UNdEQSWnYpphWiUdQ0ZsR66Ed9
	BQ5gRElF0lWmbwCUwyXrlSQnKiaks5vl5l1MDd8K9VoCDgATCMv0ad/qBJtGMCcr
	7cZcFcOkXFr4Bx0cOvh/YASp6QwWo/JxB9wQR3qtzqC8dtkaz0z/zbF/Hoyo4aup
	zfsrOs4pdyIBdXelcoN8JHpIc6fT+FIQthT5ATNc0PLgSv8W2Lzuczs8IPFMMe9/
	p6Id5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d9d8890fso270951685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442684; x=1746047484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=;
        b=GCqXngTVz/8FwT/bdM1NWRb88dsLtwNWdLjDODR1UAW7R94iTYgNvKl8w8GggS0d4p
         ksCbn6i7K1IJGB5SWVW/aRU0vDyQLMiB/sPj8PfmQATIKHzautJs8eUWQkbvpHklnJyr
         nkU+5oqjfMWpk7SF1/JFbvp253MjjHxIwUgfUfTSyDfvu4QZt4DTivTyMbvSDtCGdgMA
         COVmMRalA6m4C3cuDbdGG3nXJ2rCJ/XOibaiWBC1vMxnWzg6efdNyWDXKMoFAvSILt+C
         i0+trsTflufnJg9L14xAyFIIrGUt86JyDopKdEiXFCks2Xot8H/06jzwe9/dEzTuuPz5
         yeUw==
X-Gm-Message-State: AOJu0YycaurRBldfYrkRR4DP2lfEMeul1I+l01J7sH3wBpci57XKiEMc
	K2KTo6RYEQ6IxCF+69yuKygL0DfcAN+t/rkpTiZsQrTeDxqqKldeOPYqiYoC4xCcxX/1YuW+q0R
	vBSSoZ/cL6lAqGT2jX3DUv/J/VnsyXpRq3wVXVOoBT6d6KDQ4uWk6XZir1KXbNEx2
X-Gm-Gg: ASbGncucLJ3kZFkg68OGRy/A9RX1wmNuh6kA1KiGiYLmM6X5haIh1ARgOga8xCxbtfJ
	6YmiY3vVMCPxtC+LuhRG3+RxnWP+HTGWvuTwmlk5ef7jfkXmBKCP93tXnjR0uDM4JPrj1vX5bG3
	yc4F4vpBLIykuY/hM0JBL+6vBp1ouu0DQjzltZhQgUBKCo7NUYw1DxxsVWkQZ+KRbSPzoiaLOsl
	1mOOvUJxfW6WQ+O8PRnGR6CG0PuvG64iAMT6r9pWgtqpXjrS7eKg3rYBuiecv2AFCXcygnjepjF
	QVfwHEUEo7HiHpHrZFUK3iI9Y089YQ0OjPEq6Eqqs3KBh9l358KLGw8+jiITEGaJNahrY+bJhf2
	CaP7RnvEKQFr+cXZWMTrLHVNc
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c957854052mr11854185a.17.1745442683534;
        Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbEJvNAoP2/UxaJGavz+cKgjLPAcAoimjNe/UsaIMkbpMhagGwiYJ/zs3p1tSQw61czn09yg==
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c957854052mr11850585a.17.1745442683161;
        Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:24 +0300
Subject: [PATCH v2 28/33] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-28-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Xucrl9p3RVanutrsrXG/AILscg4MPlsZPdz9DRUTfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcu3InOIzon+HTk/sVfvnvpQ0BT6uQ12sZlM
 J2l+5MvrQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1W2JB/9q7xY2GLIB0nQ+zYlua/+2UHgruY7PGWRW1j3dNlJIYsawhn49BuqQ4pykaDQsqXu6HqT
 D+T9ZVQfl4oEwMrmMoT+DpH34kYnGKEGvDHugYScQj6xXEn5ON8JhdRo/A48FAW2qhvezacGKoV
 At3vRuI8s/Z0xuTtoct1dYgMr4v1BH3i1ek4bZlURgSty9Tz5fIXEWBfY88LhkbpzCgNLP6+Ax9
 DF3D8ytfVLthNBJsBY/EnyHZPIgDucVhqFM+OkL1Hj8IXGsl//j0MIYvBUnFa5St31f7nVZfvRh
 /Inmc0zljN84uW4NgEkVO0vCL6y+xHZ3uoe+bbo339WD+L4n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/hdqPiIdkOTM tyPLkXMSjwZJQdIxHzomV1JZys+Oj165Tyt3x8+gSZFB8MV0yVQmRsMF/xoEW4DAam0M6mc9TLb Li/5tZnI8MOn6T7kmUxmnToZrMa7oQIPyVL0QKFCvpIPRXgR8kh0OSd62jx/EYoU8eEmnXepPlB
 0eKEDfn4CStcQ2Aw0pVdehmdC0E/PaWh9yKtQHtz0BgH6pJWTD3b3mxHHQGLFdpR3MghYVBJ8Yv g5BAds07s7clpQpZE5GM2Gk0gHPSqjOjOfnz4Dm/2mlFEl9EEa1cSBr8Fx8FF+l+lGTFLQ0vgO6 0phoO2SqjRpRt2nnz/7GGI3AXtDsdTmlKA4iMtFslgnWVitd0tkaGttp8GuVk1Oo7Pslvhn9d/Y
 8jtlZcgpjXYqOPKNf4ajcSREgq61CYxni4YtORKh3iqvl76VShoPokTmwIkMFsG1Bzop5XXk
X-Proofpoint-GUID: du741Jj-cabsXxMWJsGV5J4AaTHg73cD
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6809577c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=BKnecdA5F2l9gEOK9gkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: du741Jj-cabsXxMWJsGV5J4AaTHg73cD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=765 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

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


