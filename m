Return-Path: <linux-arm-msm+bounces-89262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F76D284E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 051633055F48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A031ED6F;
	Thu, 15 Jan 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mthU4qzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLabAuMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266B25F798
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507549; cv=none; b=ghI5VXv2m7VyKEwAmc5P+xjbB+akYX0XAnRJ5b3Hf57wqUvdiIeHlgejVH0QPgheSf3r5npNekVJehRNh2nxgzCF5iRF1fe9f3Mkpoq7rPE+4M+rX+Sn65cslIjE6C/KI+SrlZBNqUiFv5gPPzaifFHgGt0d7rnZ4w4io7UO510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507549; c=relaxed/simple;
	bh=xCYpyxz2Y++3bSOvFHpWng3+Lz48nC4C6QeLJXM/NFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mh2lqcpi4Wp+AvE/iBIeXLUjni7BcO9QkdXS5LwLwgEWHo/yjgdrTskxJFFLhHXV9Xb1AQtRtnXiyQmkMb87aL9keQyYSQnKopuo/E3NCvz34PhjVhia5MGOTfxYcfmoue/+0NxLB89TkfL+2yhVJ+DKHNK3mvUdiH0BgXMQdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mthU4qzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLabAuMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDrC347773
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=; b=mthU4qzsZz5I+ucW
	iwOjZiK+6bpkiJYpr3K1jN9WMMhX0GecJZafQhvWcnZ4y6ISfXbi9LvyhwdwQzz3
	Zvceu9KKl+LjCe9Rc3jcikWQKWqjHZyEMe7wFmo+s2W+oOGfXF+9MPDMZI/ldXEa
	S96Q5CuUPAgJXooNYrSJB9cREwe8eDxYEArZb+UarrATR6qLpfXI9r3F4T2XRr2q
	5Hri9h5F6MQ2/U51rIj220xByDC603EDvNbUkYkOIHkOwOCQMLZZ9tLZ9H+hncxy
	APDmLubeRqOQaNVtUdE1IoReNmbLkrg4APq1jC4TC313JMgKt/mqEdNoc4hjBWv1
	hq987w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07snfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so421553485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768507545; x=1769112345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
        b=QLabAuMSSStXGvOUvEsJZZ5HMutmJVUALh3tRKcFOxqS3uLOtimXjtKcln3obzsz8o
         UtUs1p84aBCdPNIfD7deCRDo/QVESj6m9TBZOBfx2S9qifG9KG3qOP1G0EZ0GiQNmlOF
         A5jTKLVyVceTdO7w8ps9uzK7wfrFeacffClLvvmGnMB7Sb0beqfuSBLHnVa3MKkhmqOz
         qsMews/UUEtxm2MHgkgzuxTU4XDdQ6e4ETRvuRwUK76qSY/fcig3fiFmozrXem8yT2sX
         n9bT24BcDJpjr0R4OGYGZIsUBoM5IP2mbnXdAg3egO4ojgvUtkTCoaQjGcqhGlvIbM+h
         qVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507545; x=1769112345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
        b=APQg0nKl+piV4oHfqI04cKiD0pqXyLHUsYgbb9Iah2ZJcmg/AbUhxjpvHZPbYaOc9V
         dRgGgYgXPHFzFqYLhC6D5VZ8KVdaWhd823/nm9Up/cJnBdIDqOw5iL4IIJslykxoilU3
         gLELWxpzb2Fhxpov7G4Teugk6SNbdLVGkkNq4c/EXy7t7NgTZgvCnf4GjrLOc1bOXHuC
         /zoypdElxAUSXiWumMnYvH/iSuSWmrvBlTrK1zuGmtNR7z17WyRYyogWNjdNHvNS1ff3
         DNwk7T6KoUIMMvXeCnWTZBo6f/FeMqKoph2BD4dHFkTtMNxMnukhOspCI3HLF5gTA4/Z
         T6rA==
X-Gm-Message-State: AOJu0Yy1/lIL4srG+HQdhzP8JNsE3vbdovn5VbMAzu8agtubAzFCldFN
	0At6zVoWA17PNfvY+1AdzsUsEl32bf7NUjoAXfGoZKAJ6Yzky9V0P3XhIMkvRaOlSttPAILqMdQ
	6evfO7sXFn8xIAoajUjIHhdB4Wth8aaqWuNhYjyRSseNFBzYVlR6mOa3pSTMs0I7uBWi1
X-Gm-Gg: AY/fxX6wlFghXfNLnTSHO5nnkkygCW3xK4Dky26JdiYakiMJMOdiQ7cYS9BlhAsv7QB
	CigMp6aZikF6g6fih3GJa4R32i1U0V+t7YRPtGKC7OA15K/tpsAM1e2/rNp1PSjh0ap6Epnnp6l
	KisznY7rW5TNw/WiGoYRphmBo9TFoVPIcYM1qdHzEcHrN4FWGpxZl8/4EqgNBUJ4PNDnFJQuIeq
	UFbiqTwC8sOkYy0DlF6CRsoPk3QJ1vEUhlcOMKrxdEOJk5awDOHxoHWZgqTVPrc0nuSJmYnCSAo
	fYGjoaeiE/DVXJ2Tm9u74mqwX5S1jxTdkYcXMnRbpjnMogZnopEBbfAuCJMbtrCEGsC73pYjjh5
	sLhfwJgAF/1Upd/NLzgWOSETtS/N7XEP0164XpPcee5vsZdNs4i3SX+KWdV+RU89ETLSbjaOuwj
	SVXh1LhyKtS5x0qjqThsxgtPc=
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c6a678e8c1mr113035185a.47.1768507544909;
        Thu, 15 Jan 2026 12:05:44 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c6a678e8c1mr113028585a.47.1768507544295;
        Thu, 15 Jan 2026 12:05:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:05:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:05:38 +0200
Subject: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCYpyxz2Y++3bSOvFHpWng3+Lz48nC4C6QeLJXM/NFw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaUiSa+LQBrNcwNslYVUlAqVNZ9NlLmdtfWaaX
 ubVvRo2GlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWlIkgAKCRCLPIo+Aiko
 1YLOB/93x1oEBQn3+4s4f1V4tQPtT/OFmIEoQR9Ac8P7YDJB+7Bom8kDcNhCOQ4BpxRcqnLccuS
 P/vLOepyMeMebSCIr7TINb/ZkxAToBK4uhUIH1z/A/8AdAPh+hribG5/jifPfqM6kNGVGNI5jAh
 /zL4kS2z33raiR74Mdmkzy8K+XTpIu8tHIH8VhptRoyizb9ojl0iomwRbHTzx3Cy+x2w6HfSB/y
 TntlP5sesrUtoTOTLjlNrwLP83+TeJKmNc8Pxqc0BarIA2Mo0aMiR1QvJ84Jyu1zUVu1C939I7y
 y8UoHyMT1Jf0PBlphk6nxG3X3xpAopNPQ04vPFJ6pJNnE8+q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QiIfxIzkGi9dwJOO_cTOcO_ntO9LOXyo
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=6969489a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LiGtz_15ZcBlpgV9qhMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: QiIfxIzkGi9dwJOO_cTOcO_ntO9LOXyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX3MHpF/oRoEB9
 G3Epk104QMnQyANbJ/tRZyYRu+7Lj7qL2CBI6krLF6h2sJK4bxztxWmpSV+s+h7VvJFUiuemaXd
 syvReGxBRFgq6A2Dx//QM2nCaD8uSdIufOMB7tb90DsnxINDB0IarXldi5Vfvk4ZvbtxUsH+ftB
 xBE/Aayrz6Z4Qv8LBhqeSl8Svev2G/c9XunfK6pHGexXYVPKhb/tEt93/zRmrBf1zUiK7se75DL
 gegH4znwlkDxejOg/ti02GzWBKPAPndA0GRN/QKvJRrI4j4Bmef8WAeGyyGwxzcGu6xjCRfe2bH
 DvYiPMJyeQodJmCdz20KAeulSgsa7gSWvSaSD/Ql5FkwscghpyufiKz9Sqk49vUwKzdX5A9qs80
 rDHbqHf7T7i9gNLu2dbXjpZtPW9qSf8hqov8I8oBJZAh1KoaParTHKJq30Y0q9KLveUy1xW6qvU
 WJFjiRM8JqY2g4UOrCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150157

Some of error messages in RM reference block index, while other print
the enum value (which is shifted by 1), not to mention that some of the
messages are misleading. Reformat the messages, making them more clear
and also always printing the hardware block name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f6568ed8375f..7e77d88f8959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -315,20 +315,19 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 
 	/* Already reserved? */
 	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
-		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
+		DPU_DEBUG("LM_%d already reserved\n", lm_idx);
 		return false;
 	}
 
 	lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[lm_idx])->cap;
 	idx = lm_cfg->pingpong - PINGPONG_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks)) {
-		DPU_ERROR("failed to get pp on lm %d\n", lm_cfg->pingpong);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks) || !rm->pingpong_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid PP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
-				lm_cfg->pingpong);
+		DPU_DEBUG("LM_%d PP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*pp_idx = idx;
@@ -337,14 +336,13 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
-		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks) || !rm->dspp_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid DSPP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
-				lm_cfg->dspp);
+		DPU_DEBUG("LM_%d DSPP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*dspp_idx = idx;
@@ -364,7 +362,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int i, lm_count = 0;
 
 	if (!topology->num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
+		DPU_ERROR("zero LMs in topology\n");
 		return -EINVAL;
 	}
 
@@ -468,13 +466,13 @@ static int _dpu_rm_reserve_ctls(
 		features = ctl->caps->features;
 		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("CTL_%d caps 0x%lX\n", j, features);
 
 		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
-		DPU_DEBUG("ctl %d match\n", j + CTL_0);
+		DPU_DEBUG("CTL_%d match\n", j);
 
 		if (++i == num_ctls)
 			break;

-- 
2.47.3


