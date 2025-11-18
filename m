Return-Path: <linux-arm-msm+bounces-82215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33408C685B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CC803656B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F31320CA2;
	Tue, 18 Nov 2025 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6Wl2jGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dxo0DoYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4972E30E0EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455975; cv=none; b=Bc1XyeEezRxDz2OoDaxTytPjMFwrfH1QB7vr+J2FdM6v+9hlwVhoSbpPQABx3OV+LujdvsSkOzPy/zf0u2dIIf/Ws9kPCJV9nDJYxBkz31cmwuBKi07V+DapZk/H1tlyRXEvw+H5PHS9tg84MvXNoTDnNFJZd/uhS3sTBla1yGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455975; c=relaxed/simple;
	bh=vKTta3TyeGhxCas1ssgEN2kljhDiG+toGTM3SStGt9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKgiHb+oh7c3CAPno5G3zMNLNQ/FQN9AJzxbwEnmPd+EMRet9Xt7FxpTD47TRJ3D6FWWLH6blU/JAtZBFTmCgA5iHwa9/ExeSpTLPs+SL/rTP8ndsfq3B5kWPrg67AymRM2i1UjwvwpLtU5pm/4tuNlnrF3OL6hFoI7vKtvd6Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6Wl2jGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dxo0DoYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8l8s62755312
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=; b=C6Wl2jGTF83SghDw
	cjpCfqtoBfgYeZlVvyVZyJymt5wmM6PXfDeqK/2pFfV7Tva0gu8TScDTvoOTH2Ya
	kIxiqmrzfD31BQHCiKybYdtfDmBxY4vPcc1wZnXyi/U6X6R+uNHsCTKu9/QVycOv
	2LchNttPmewBb5164oDXNA1jBU8emZyAGb/CorvOhTPd1XPUccfU8R24ulOHW0fR
	DRRYC6kZo3hrxloK9K1+RMccykIHzZq/XPVrvBmKYqjD8nahfqJsMlXnh3+lLzkz
	C31R3yIyWDNs6pAByqT5gTBxTmfmuMBqHLdcAgLutby8n7FBSOZXTdfI5hckgz+b
	P/Zovg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj00k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297df52c960so136919645ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455971; x=1764060771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
        b=Dxo0DoYn0kSaWprAu5MRDkaxsedtwhE623kh8G3BGmh7TZvutfQxMNAvX692AukJeT
         6WaInrUUtaL4vLYs95jxOBuxvMA6K8IA/LEVBwhYYPOsQ17J4VnrM7/YQD9LmYMsArK4
         +CsfMjTM926Xf77S/hK9KJzdyvEiD6tv76Ml8wq1EKDwPsCrL8j3kQzRRc8Csg790aAr
         HlSThMJx/A1ajMG0kzX1B9okMesVal0nEMjvj7vnD+95xfqZoEWOGJ26w8KE/a6nY9q1
         p0lmdEes5Zwn3XTYMDGVamQ665xqrTBGxWncKZG3OGwAK1hnBLYH+szGUVwEVLT8yX+q
         FTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455971; x=1764060771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/LS6JB3TR9Jq5PNnoArY9FVy6stZEsKrBfA/VJEO2c=;
        b=noIPSMoxAaSnIIQinw7OGMy8JnDpjOF4OGJ34VMwL+54+lSQFB/0+reHol+NK9OK/r
         aVMGrOT6q1LS3lA3ged5fhZSTmWG/PoEQX9LHrQtq7f5kYdOwPj/nOJgu5YhQAkLBUUC
         dGlvBs9iXnLNMIciXRbJ9cr9BhLAbnfKoVWP2psf4iRFMafVPoywAJCJkgp00OGj/LQr
         yFhZoBotUE+G2dYcrCAuXrenKBnYYAE5rl3E078PPjULRESnUg9zdZuO4QfeOTLnHOUK
         x//5Ks42esmkh56sTB1HJaJPTCZWQlGlz+hXhv898z9lRSNUCvrmWaifTyxHP4UWbe2z
         fM0g==
X-Gm-Message-State: AOJu0Ywoslgi6/dOGdL+zxpdmFA5B8a81vSpT5uLSnt+5SBUyLCKu0jZ
	lcxT5R6VcbiQwz90evn9CUlaDJz94Ew3Wk0QXuFJ01DzrDD7a+sgC0B+v5iphw/vL0j9lZaAJZz
	6/4hYwTcZ7qBs5lgkDTqAUNHCB/hpdBjUNhCecODgK/uQsNlxeUd2OEmj0twTaJUpP6DF
X-Gm-Gg: ASbGnct9mQrkACO/H34U4j055ChlkULpvNEcEIC0YpmWUWrWcOHuDzoOZGdGcgsrBWI
	l2xLF3kUgKB2LToW/egCV3RdyUPBTzOBf/cS9Ht2dKCNM2GHs02+2PnvYjTuAxgMY4oGCO7rDTZ
	8SLulm/DjmqfB6FEJHQJ4zw7nFZdMlhCsljyXc0k6p+4grUrnLwMLpOZXUCwQLyXd8cXf+YBvmX
	eH8upFblNRbAQiZc6Mw2FWi2MpYczfX2Cv8Yihqpo97C3ru1w4LgqvUz1l/63g7bl1PMMuytQZd
	K+vHyRNUPRpEnFzoJVHUTbl9wIF2C8+r4zTDrgfb3Yw+LSl7424eYmmjgVDd2wpxbraYOrpiBFm
	pdMY5r8QWDRS+s37z3nfyrc8=
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr156640585ad.51.1763455971198;
        Tue, 18 Nov 2025 00:52:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd2hB7SzLzqaWuYwjQZyt6QMGhA+S+3S+Uo1umciwE5IFO5bu8yrxyvQu4iby3vFSrcek1bA==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr156640325ad.51.1763455970710;
        Tue, 18 Nov 2025 00:52:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:39 +0530
Subject: [PATCH v4 12/22] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-12-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3011;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vKTta3TyeGhxCas1ssgEN2kljhDiG+toGTM3SStGt9c=;
 b=RTi8VnHIWT8h3mjbCRZH3IO6SGjoieTo5yBHNHvoxtwhuGebkSTBl9jpJvKg+l0B9GXKeOno1
 bZ6HLGu4TV+AIaAEzsslZ9XMqZdc5d/c7TXsVihukbzwTQYTIb92Dha
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: llNsEEqL7W6DyFO0vTq01oxShHd791eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX+cm4c6dZ8gAM
 tt6X2blm8NSKhXNFjfD1Cb4UDvG/SLiFXHCS+cyIuOL3nQ7H7wMis+FBakx34X4Angitb57NEo3
 f0wOGNkrUBP0eftHJCFG9YfEh0NuBxEF+UPX7bQ6Gmgc+CabkFXnoipFkKQxhB4HYakLAwtvw3t
 yunxFtpjzBpDD3BiRZMu19Rtlhn5pRfMWYZZWtq9ou3ZthvNPkGqpwHtENSYDZXQTVZqrK3Ri+w
 wZkm7qd7y9wD5q288gahPFdbpxYNJW4NMJN+cfiz+ceRmdcZOtANOWDshjuOE1b65iEex/cT2rq
 frGQGvO3vnm4ALnogC+FLuqK0o3Gtv4RNMGAPl6NUkQZWixICdlPs1Pn08jdtzn2U+VVJ9vA3Tl
 kkWXDLbqTeJEy1y1fb0lp0ZJXMh4rA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c33e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: llNsEEqL7W6DyFO0vTq01oxShHd791eQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e566f3b7eab4..b76960c6d444 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1544,13 +1544,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
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
@@ -1561,13 +1562,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
 
@@ -1635,15 +1630,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
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


