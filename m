Return-Path: <linux-arm-msm+bounces-72523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C24BBB4872C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7BA7ACF22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD482EC543;
	Mon,  8 Sep 2025 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlxAKuTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B302EB5A2
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320097; cv=none; b=PfDuEh5aRSeDoIcYB0Hagr/itXsOz2Vvm9+4XMm2sGN9n5oGvnOBftF0A7neK74S6gZekRkpHkhK9GUk1KETD9NhqQHnlUpBMqyRVNrgTs95YTfThRUM7a6Dy9jtLQaLkidpsBfIT7xzBueIQ1iasrb/a1JxJDoNq4NTiMOyBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320097; c=relaxed/simple;
	bh=/iBCcOjQRFAJtVUwHHvMO3maSUVXqEkyAINnqw7b6JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4K05eujc8WHjt2+IqJSFU3pcl+pT5sTFg5ODlcUEow2cxm6QyTf64lfcDZ0Gpr5yEjAIIELzkMGN55Zy3fdfLI54AM3nj5C5WIllc5D/R7HxLm74y/V+xlD0UgALIDXUxteS8oUSYXRzbPP8P6/jxoOq9hk7CFQcbQdmm8v9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlxAKuTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886gQf8006157
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz6TxjIbrwRntYK8rL5nZ8VrVI87LAGFTolpn+41CWI=; b=FlxAKuTa4YQFL5i3
	Lr1Sg7Eoigr2sQIO0vLqBg6mSj9SZXCxpr/kMckJKu7W0BZK6ctCa6C85KyWZacR
	rf03JNWe8WzFItsNSKuoNCzHh/ciZ0kBGRe0GHIUoAzoFLBj4WhT+Pr9u6p0r9Io
	18DeaKNYB4uUnuOUVHk+yrGYIDgUDq+COqXit9AIdR172Nr8WQUL43/0WE9r9SMm
	w2PaRBk/E/DBqSP/6w96J46tmcP2uKwkdaBMkZemLtne++fOHhte15IVSacR14ol
	3QZ2bRbB1cFlLiQgdebwR6Ioow68/e9tu+5DGsbCRhGFMTXZFcgOUCZrTr0eUZiX
	SM1pFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r9wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:28:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329dbf4476cso3782758a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320095; x=1757924895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vz6TxjIbrwRntYK8rL5nZ8VrVI87LAGFTolpn+41CWI=;
        b=Kjcf77cFIV/ZuMA4cpASnEU6ICoVF24KA5vsQlmD4jbK/YyhUjNcsX/4DxXyMpnQtX
         MabKfZ54MqrKqxK5gVrQkz3bec79+PBMVe3fQb5RwMk/8bTiByYRI42LwErbtJ0YyZDR
         cOAzrm/oZt6WpGxsNBrRsagtUx06R74RxOOe+yBmNIYsxkUuBmmJmz+xwsTR0SWKF7zr
         mHFNQoyo/WDB5jkHDI0/eXQCzFH8E52zO4qPJ+FBlr66TuMlBDYHMbC+gJ1WrfDLFTHR
         PK8/wrkoUPpvirfbs4qpGZtil8GGBnJb2vhm9Hk5IBRsLD3DQWAd4MokghS/d1Uoxy1+
         ZgPA==
X-Gm-Message-State: AOJu0YzL+fYJ5IpsMVk3iPnP8sFRBq5xahiI8j4uBS31sh+UWa8pcwZ0
	XoTiy61g+VdrrU3mflLPo6+EB1sj/18sXpXQ2bVVTmjB3Zg00Q9PZCtYTwQLC8HEzWGoFLBi/dm
	vBiISq8jDDRLKCBRhvCUPmxoyNCYd5TI+VAschY/PbY1GkS3wM6w5ZNXMHJcKLX8v5DTB
X-Gm-Gg: ASbGnctjTASYkEAzlPypAfjYW7nIgPFJP5HdjaOP9GrjkPuzNbj0MuMptJafDqubGC+
	CnxI1nWmw2TUViR7xdy7lrI4MPB6RCmG9/FQixtM2vYWmQHxGO0HBKp+JEQo9OU/xyBLm2Df2PB
	TjeZkaMQg0YNelhoN296xKA8eKAN8UbrcXFJh7Z7gqS3imL8jmFeBujhxhJMp5o8HZCMlS4ym3t
	aIY+C8WEZW0CjGBsQvXcjVqmRHzREJg/WdVBI5+I4KQY8UyJDXjBn2WNdxfteV/GnC3cErcRzQX
	JGEQSAiBsXdoKLqxmSiyiWggdptxkeeoMosZPz/naXJMQ9J7Xn5d7qspm290Y0mf
X-Received: by 2002:a17:90a:5186:b0:329:f7fe:19a5 with SMTP id 98e67ed59e1d1-32d43f98f05mr6293829a91.29.1757320094455;
        Mon, 08 Sep 2025 01:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdVtgX0M/N/rY2LTPdVh7osZsGoVH4LY/vXWFtabGHHLKji5snSpH3SYJgpihN+vwguCSC2A==
X-Received: by 2002:a17:90a:5186:b0:329:f7fe:19a5 with SMTP id 98e67ed59e1d1-32d43f98f05mr6293799a91.29.1757320093944;
        Mon, 08 Sep 2025 01:28:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:28:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:05 +0530
Subject: [PATCH v2 12/16] drm/msm/a6xx: Fix hangcheck for IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-12-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1733;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/iBCcOjQRFAJtVUwHHvMO3maSUVXqEkyAINnqw7b6JY=;
 b=Yc3JK87kaA/kMtzrzX+y6eNZdaAWw7k+Obs994LrA1qoz1b8udhNxiU9ISGaVPNd52mdKns7W
 Z0IwaVVAB7HCHJIaFZwWBSBsREqhcuWIDUiL/aTaxmzWKwQtskHSNn2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: wh6Uxmow3ZzYc89qqpguHDMvvha6O9Uy
X-Proofpoint-GUID: wh6Uxmow3ZzYc89qqpguHDMvvha6O9Uy
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be939f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DHE891H7Gske2VlohvUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXw40WlKkJSalp
 x1isypeiqNTSXY2SbA5ShgZFqBrNmzrCd/o9hu/uGR9C3T9Q5+gg1c9E/6AmhLNV9DnG3N2P3u5
 V0pKfslWX0gdIDD/3rTKgqZWwFqkGM9+OoJEJ7L56Mpn1Lt1k7WBEwDya6DyCr9/b1E44TemQNZ
 fkwnS/ZYYNrslwTWPJm2WfK9YUI3kAiXcO5Sr0IUezHclLLiJ+E0iZotfy1IS+bvWtZ/BPacGJF
 egwmY6QMehaA1eXJyZAFAhnfAFDHxppMnFTNP1rLN1MGuTg0qpAzUqZSpruee42IEGIu1rWqUzD
 s4kI1GkLKWXqaThGVp8wANHHuzWaGODGKOGFqVJuXXzIwg73WqzdtmD5l4cEb8UB1kwfztV1qu/
 3E3PXMMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

From the hangcheck handler, KMD checks a few registers in GX
domain to see if the GPU made any progress. But it cannot access
those registers when IFPC is enabled. Since HW based hang detection
is pretty decent, lets rely on it instead of these registers when
IFPC is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bba09c02f9809ed24b4a9c30b1eb993ce01c7ec0..61538b6912883a0e7ec7802cf5f5cfc8649ece2b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2417,13 +2417,24 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
-	struct msm_cp_state cp_state = {
+	struct msm_cp_state cp_state;
+	bool progress;
+
+	/*
+	 * With IFPC, KMD doesn't know whether GX power domain is collapsed
+	 * or not. So, we can't blindly read the below registers in GX domain.
+	 * Lets trust the hang detection in HW and lie to the caller that
+	 * there was progress.
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return true;
+
+	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
 	};
-	bool progress;
 
 	/*
 	 * Adjust the remaining data to account for what has already been

-- 
2.50.1


