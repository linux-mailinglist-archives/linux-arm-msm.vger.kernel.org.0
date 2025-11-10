Return-Path: <linux-arm-msm+bounces-81082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF1C48243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AFCE4FC83F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996D631A05E;
	Mon, 10 Nov 2025 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDyVu4U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsKLZ99B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3632E147
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792823; cv=none; b=g4hAjtTLutFlzEW6h/7R56XzZqZt98dxqApIXZ5yBVew8hH2DpOwtwbVXA5kkAhVg5FN6jna21XD41kERDufJlMkatPihNQf58Y3rZuAnJXrOGN//vw6BT3jb/xRv7ujzGjhNd2z8CxwSDxM67BcqAOyhjgJf2dQ4BwAEj5Iwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792823; c=relaxed/simple;
	bh=LNBgIzkBqsqfEpWJzwTTcgD/um5V3p8naLGClkQuias=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnRCY34QaZ0b1LRI2Qu5fnkqjeFqDthEyWZNwBtJDlFsbZut8Xwo3nggvA/u3sSbFDcaE3D0Ko5hY7AkMPOy+ZSp1hUkNSILRgRk4GsdeYLruQk1OItwaO6gao7b+q3nFurEIQXund5ZocDClzFJKuI1zrX9jougYFmt5PjTynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDyVu4U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsKLZ99B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACN1Kh3306941
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=; b=LDyVu4U4U23qcm5w
	FXqny6gDZhL2QVqETPkqez060RWmXNWbDqC5fB/wrmkHdwTKP9hBXMOx/bV+cnQX
	R/fkgi1TUDgejop2dxuUQcZ4C+rkj5PyncFNwqR+S2SwREjI6BbCWrhuf8M7tNVm
	WP+oBarVCmY8FWpV1oay1YQ0HUhuFGEDeXL0NbN6RFzZM6XhYtc06uNzZ0hKIa5x
	ofih62wKPsNUwJ8D/m/Dncm1PJUHCy56v0oN2+eQWs5lcU8nEFZf8cD7F/CXcNrb
	4tIGGbPgvhYH1/2RsXrXVZirt71+LH8H+ZeiCZIiJe1DWBX459zh1cYh+L7EnU+l
	ZsRoXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8ryu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3418ada9e6cso3948264a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792819; x=1763397619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=;
        b=dsKLZ99BF85ZYE4l0Yep7TBTtsGxhY51GXW/Wzl4rd01iYGDHcHBeyjrZvbrJ21B/r
         Zvk7b0HMY+6fvoYdY7IQOyskWfh/gCjLZcN09T3GmXeIp+D0nsEqSUEhlbSfZ7Fkzl/+
         hZ77/Nq0UMHBMSM8cUiXNw5w7GN+GOeNtZ8yMyWVPTU4ZEmyF7LK4R4IOB488fadDyp1
         4AX2v+nAN1fi3hu5fwHcqVLrTqiLmHzx03aW4pR2OgiVoC2VzsxbGmgWTMadRtueyXnW
         qBwN6mYfhfq7c6syboOnSwhnn4xD+zz/2nX6uzaXig0YXfN9RayxAi8rIBBqiPlf5gwE
         gkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792819; x=1763397619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nVwNgHskrk/J1QB8XLyxKsyxPDVAl6g84xIBLcijALA=;
        b=eySDT0ReEdpOdFXk0Lg3acuAns/0v4pgckff216aMspaFIYxjdDEh4UEHNeKE1mDJb
         Xddphapbgad4ZNp3uFGQrS/me+jS0f1ZH4Ycp50IhleXb0G77nMYNFFUr0XmrmkaCf/P
         HzDxjoXla7AZ9FoCN7yGtYiF0kw3CpCoI3rbgjqwWHq4XfHRb7UymZSLNXbw5p8V0NRR
         fbqd27CNSP/0uQ2AdyRemu3UN0T7zFWsG73qd1UlQULxRJ6QdDcZlasqGGFnl+Zo/9lS
         3PwiOO8oAkk/BfycHeJtlrtrB5RKU3Vw0a6iBM7hOD4/tw2dz4u8cmdoAyeSzmd/FZKr
         Gktw==
X-Gm-Message-State: AOJu0Yz8/VvyE4EE3sec0UECruJGgAh2ILo7jT5R3XWwtt2u7acl5sjZ
	Ue4n23WAA54HUtLPIjbKaohE/w6QOrvB5M92xTT2pPcL2SEXWzZ+6ZZbVFtJ06aTqCjeIWHW9y4
	lILkMUF5eOXPtxcZeFyhW1R2Ku21AdOc97Gft1DIIeKHgba+KWRj8YhXgf2Qs/XtxfGhA
X-Gm-Gg: ASbGncud+hkV4mlURCdVPozFcqwULUkFphj5F6zjzS4b+vMPyN6Fgh8ZfbUYZHs9DRF
	BUhW65Uj1O0VQ7Thm0xgE0q4PRzTo3OxSqy5o0aT++KUYxZEsur7SCM6XA8C1oTBYecfAtGeUuY
	Iei9+Du5N442dWdoyU2dvnzAvUENlmKVKS6E7545gwgzWS3eaxjK3DoroGH8c8CWDfM4zS50MJH
	m+ChcKukao58RLKXo7WlprE77ijs8e1dqhI6awSa39SZdHGuJugXUOpWj+h5HnR7kV03zfEm4pf
	FXx5CgpimunRM8QlbNtBtS4IDtb2premUcfl20NJYMBAoEZOA5QqCMIhpkm0Vf60rSADXmQoJbE
	9Yo9ovDCPlIPazv3DxbNz1ec=
X-Received: by 2002:a17:90b:1d0a:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-3436cb22a57mr12950712a91.11.1762792818806;
        Mon, 10 Nov 2025 08:40:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzdHoNic/6IFzqu4jl1tCbYh2rPj7vbAgvXHYulBRCa4QJH00zgqH38AHljN1+VXxujQ9dOQ==
X-Received: by 2002:a17:90b:1d0a:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-3436cb22a57mr12950659a91.11.1762792818119;
        Mon, 10 Nov 2025 08:40:18 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:22 +0530
Subject: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=8336;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LNBgIzkBqsqfEpWJzwTTcgD/um5V3p8naLGClkQuias=;
 b=Zzm37hB+BMAVa7JGIfy2qEzDAn4Yh3xcflkn3GYpt84o4E+iYsaXh/sd9wK6PYMy44T9Oj7Bh
 fMEvUTedm+5DgKyJ/B3MZIHfmWvN6WFelLy+b8O+xBiXorjDkRD5/6X
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69121573 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=beDsvRS2jwLRuxpa4okA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX6eMfuDta2p+N
 dy8TW9u+EMRQZzJZq0cQfdjHtf1INpRwHingVfQx7pMw8iGkysOrqhD+4t15xepMeEdsibImlbl
 wMH/UIMHVT1yJFUqNHY/tVNZkNSGLbV2IbPiA9+VaoUvdryJ8FGpPH/128OCjsEtY/vm3sVldUi
 KzlYFIttyo0J9DGl+sEAD3ftLMPJIj2ZR9OrJOTBJgQ1CGhllqa+Z8B6Q8tBSLJHUMfQ4zcss+u
 p7VwooQWyICGgz+U+UdArq6HIBfhhbN2bODJZwRd8ZBU6xxe2Cnx7D0xE74ZkczORN9FN9pIRQh
 x2aZGgnTqgNPLAMgHlzsvFbF4h/jZtScRItRqeHnRDfZ2FquzmteVsP0i/po1udxIogjzRYu0/p
 cYgbk3il8YZLz6IPSTK6PgsGkxV/fg==
X-Proofpoint-GUID: 4Z7r_ap8JmXl6nd5FwdDr8agxqmrwxq8
X-Proofpoint-ORIG-GUID: 4Z7r_ap8JmXl6nd5FwdDr8agxqmrwxq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
configurations before GMU wakes up. This was not a problem so far, but
A840 GPU is very sensitive to this requirement. Also, move these
registers to the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
 5 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7a5887b5ee47..fa3ae725f389 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1331,6 +1331,14 @@ static const u32 a730_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a730_protect, 48);
 
+static const struct adreno_reglist a730_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071620 },
+	{ },
+};
+
 static const uint32_t a7xx_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_TRAP_BASE,
 	REG_A6XX_UCHE_TRAP_BASE + 1,
@@ -1458,6 +1466,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1479,6 +1488,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1513,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1554,6 +1565,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1586,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gbif_cx = a730_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
 			.bcms = (const struct a6xx_bcm[]) {
@@ -1785,6 +1798,15 @@ static const u32 a840_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a840_protect, 15);
 
+static const struct adreno_reglist a840_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
+	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ },
+};
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a31),
@@ -1803,6 +1825,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			.protect = &a840_protect,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.gbif_cx = a840_gbif,
 			.gmu_chipid = 0x8020100,
 			.bcms = (const struct a6xx_bcm[]) {
 				{ .name = "SH0", .buswidth = 16 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cc969145f612..f9c0c82b5136 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -868,7 +868,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
 	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist *gbif_cx = a6xx_info->gbif_cx;
 	u32 fence_range_lower, fence_range_upper;
 	u32 chipid = 0;
 	int ret;
@@ -964,6 +966,16 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
 	}
 
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
+		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
+
+	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
+	if (adreno_is_a8xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+	}
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 029f7bd25baf..66771958edb2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
 	/* enable hardware clockgating */
 	a6xx_set_hwcg(gpu, true);
 
-	/* VBIF/GBIF start*/
-	if (adreno_is_a610_family(adreno_gpu) ||
-	    adreno_is_a640_family(adreno_gpu) ||
-	    adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a7xx(adreno_gpu)) {
+	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
+	if (adreno_is_a610_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
-			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
+	}
+
+	if (adreno_is_a610_family(adreno_gpu) ||
+	    adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
 	} else {
 		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 031ca0e4b689..cf700f7de09b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 2ef69161f1d0..ad140b0d641d 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	/* Increase priority of GMU traffic over GPU traffic */
+	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -508,13 +511,6 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE, 0x00000000);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
-	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-	gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
-	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
-
 	/* Make all blocks contribute to the GPU BUSY perf counter */
 	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
 

-- 
2.51.0


