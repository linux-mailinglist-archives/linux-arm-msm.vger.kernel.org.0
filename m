Return-Path: <linux-arm-msm+bounces-81078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1128C48282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2DE94FBC2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BC332C928;
	Mon, 10 Nov 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfloY2Uc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/1wypH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB932C33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792782; cv=none; b=JdVyyQtmCRWcx+iNkmR1/vj4b7vOQx2aMr95A1KDhUJbQ8muntY/7bIf6bqd5EnbfG/9/5DLzuSDdcbceasnhJKbc6AlVXAHTP4TdD3Z0ao7Ggh5Xy+GRuvgvwb9jV9isuNGcSUvWj37pibr0vbQWhy8FAeqYV8o+g/62XzmSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792782; c=relaxed/simple;
	bh=LWOc612J9bhiyGK31kvlUfk/uc8PZDAIZt+/ViUR8y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q49TCDXBPqptZym40HmCJwe5NJPIsbI41Ebguk1C7hROuX0U3KP/shxQ86Etpw/EOilFfn2a9le02WbFTppoR1Ek7w6x8FLniBeDwsjSE6LgquOi3qZahubnC62dX1AfDKj9LPM4iZYsysvz0kijp1PpchMJLEDSFKO2GAF4iJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfloY2Uc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/1wypH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYN8n4070794
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=; b=NfloY2UcabBEHbGh
	fl9Eps4ZBX7fNEkkBh8BEYS+32vOxrIK2m6yXUnyWDwM+rERBerTUbwIy0uBH/SL
	u/3DOWkDZeUjVkRKjme4f50ly78gXxUsNDnxiJV+ILo/qTdHLAmqpVtQ0P87xvIc
	ZFH9bvL+B39iKMvKb4P0QavNQ2z/VPkJSrxjl/EZq92g2HwjDzSWFkmwDpxDZSzo
	ZZLF+B6RrkPZLbAZgLbUssgeTb+j8BWwv3up7KXy/9GrwZPlU8z0twkUmiExaCpV
	8RjBZJYAZtzr3kDYlgmwAZDngc/mHntvaZ4GGSo5eIOo2vKfCzjvu/0JD2CBbaAw
	Cunn5Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:39:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2957503a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792778; x=1763397578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
        b=F/1wypH+b+2X4JvJFaO/c1vFFB+xPYBRsfMdemURQEtACA0zee/Vmb4hKSIPIyOgsl
         +oE5DUmL0syOKu24soc2fIPF2srO5K4ZDf+rqrtTsGETEQHzXYo950zygvruwWYYJQLu
         abgHj9fWo/PDTxZSMHXDeoNwsQa4V6OoFvAg+0lCpUOgWo6FMJjbEyjKSWIWqYpTxTh8
         1WqouQDlFA8kc28iZHtHeN0cywSya7isM4dRSN2HowXUUDmXCw9wtFhFxfqBVG+fq8nG
         er6PR1Spp/xuMuLx/KZ/OsFJmNvNMRM9hG0sRBqIkJCRIj7e3IszVX/1QPnfcAF/LUjt
         HiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792778; x=1763397578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
        b=EbYukmiPWtS+EgBFpIobLMEpXDZCeQVtNrFQfQQIcHiKxETpAcvZG/Qb/iBg732ZH8
         v2kycJ0u7bcggVmZ3pU8I5L6uEXDRYWCc+zFOrsXVjkKrCqGmstt9bCd0vx116SQDqZB
         PW9znXSWu401XSF3kf8v9ycdHFYFjFpNYjHz5ke9dRVQBWU/3QTQXzXq1JnBgkmW389V
         BcHtFDqmLLC/cMKgkzFanHhqUURRmkTwxDOAKoEO1mCs1zqd60v0C/TiTZr5ZLvG2jiQ
         PZih88rxIVBG3uw14UKCaFW1nWxDaPHUhc+mhVZnzVWJoiaG2NzC3oj/3tFOtruQITZj
         J1sw==
X-Gm-Message-State: AOJu0YxNZgk2nT3shfZ6DJJCMTAF2gIHMv+/XhpbQ3V7Gzn7l/kAx+H0
	V5uels83aZt9NhCMs29opZDf08pGSHrmqMgDyXBw6rQSqwzcr8h92IQobXOa+CqK7vkst/p2l2h
	SVjmxPslzvWj6kQmfJbUQBmwvrUwnWeDgARDmHadwdIrFaByryVXK3wYaAW5xZ3pa2xMU
X-Gm-Gg: ASbGncumrnGveJLUzcxvsrbey4aDFiEhnRuIZ09vbpSB8ppeRJkkkdIhjuMeUBn+muC
	4nWJFyWG60PI7qBVv2GqMbicBNHmqssps0iHdmYW5PaM2oiYhc/od/2Ad5P5rk3ubjOSvB3Ah+0
	68zoJav5N6Vr7UcsvEkeNphRJ4VOAFkDHl3f8XHjvgvR87LnkaJyKtc/1zGFzSONBWI71s39JM5
	Ig47kv9CZY7vT01eiHHmhI0lejO4Dik16k1VrF1FdDS9QHAsJwItvRQ9T66hw1beFtQHmnxrAYq
	QCF5fmehCA0bmc1Nm/6gpSong3X71zFayOasaYv6FjqTuc5eniIHJuPvXJ3+bnK8AMOaZEpZZaz
	/cOFRLKjsRxyuAnR7xnWLrug=
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3436cbc74d5mr10535184a91.33.1762792778269;
        Mon, 10 Nov 2025 08:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKuivtP5bPOxg4eqYPpqCiRonwpKyitk9efo7oMRmT6OqAejXcK+KdVc51LUlDkH4mfwy14w==
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-3436cbc74d5mr10535152a91.33.1762792777713;
        Mon, 10 Nov 2025 08:39:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:39:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:17 +0530
Subject: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LWOc612J9bhiyGK31kvlUfk/uc8PZDAIZt+/ViUR8y4=;
 b=Dyz4d2Rpgtz4n2FITe1odQAEtosB0h0Bg9zoRd3AwbZUYYMJMDaf74l7QdElyyEqfnmryp4KJ
 0My+qrkFhbTAtvi+hF5ODj3d82ls447n7pfXlXg7IJLPvV878p2Eal8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: i1u3Ob7O4FHRkCB-f66ewVWvZS7jBHtx
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=6912154b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: i1u3Ob7O4FHRkCB-f66ewVWvZS7jBHtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfX4jc2KIxTyHs+
 D14wwErQA+NSXqy9K/6G3LjZ4IH7vLJrLncMN8saqasXDNFYklmObMVHVQu06X4OPALZbz6M5C3
 V7RmN9eRnhyBKGsPOh9mpQKlSnaxm9qSek46N+icaOGaVzvYuTHnJcqHr8iGfUuNFlHApAhNPBJ
 Qq6O4X6YGdxFYgSlXoFDtb0jxoKi4rHNexhM47h+luwcx0p/X3GZDYVHroaVehqUkhGaJ4ee830
 D81qUxU1d5Z2r+w0n5r22YKrA0gDEYWfqyVUbI27KSk/cT5uKQyVbQ0JiK22tbHVUXUt59S0HXn
 Em7wP0WRZMA/49TF/WNJeZz1zqeiPSJwQfBLN3bbCNwe8xh3bd/hg4StUytW7TC8KeFK4a+FiTU
 fZwM+pimNTeMPpQYT86PAiqXxKFdRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 112ef7ea320f..8597d7adf2f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1519,13 +1519,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1536,13 +1537,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1610,15 +1605,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0


