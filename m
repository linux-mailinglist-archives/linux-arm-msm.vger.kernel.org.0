Return-Path: <linux-arm-msm+bounces-72527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8018B48734
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747EF17791B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9532EC09D;
	Mon,  8 Sep 2025 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhlPoUiC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C952ED143
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320114; cv=none; b=tKp1sa8Dv0gm/l+hIpNIq4URT05q2L51VJjyPS4YhQtS+j2q3aOoswJGIJrezFyx6QTqfjQzbbeXw7cdzjDtodGSo+9VgrUVSYlaarC1KlpVS5mJxjQErmLAaZ9q4kvmwL4Bio/RqQVqRxeNr7GgmP42QBd55+ZfB+i02y60Rd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320114; c=relaxed/simple;
	bh=8YnJ0ONhzBIexy/neyt6NTzPrJg4+1Ll8SHaMIGWprI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVzP+l3d0jGXc1PtwysgXu/SGP7ipFA/FeugMCtVLYeuqcr6vC93WCZmoWyWRClhD7xIgeXAmX/ynA28NzFL4PhZuHgoSOKVRpsZ81NO7KdChnminHJKsMK8o6EXpE9zwGKCuatwBpFheO6r7eUo8hSZFqex91VPniEOaavlMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhlPoUiC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587L02eB013523
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=; b=hhlPoUiCNfS27+hK
	W8kcydaEFIN7wbBcbZDohWadLDBGzBG+XqIIPwt7/lOJvl3HWf1IagYDkhdPuhkS
	l5W/q4Plc2J3JswDd5LIqGGniohUIqu0o5AAmF2zjSU73/vNvqhbalP43AJL3NND
	dMhU46/Pix6wWIY5xa7dvJUb3ZgHv6nbketj6G0VpA6Kh6mL0uqnaBGthAYw09Uj
	//jZJ/LZEeK9kFpl8c9dDrwZDKzsisiZ3pUYGvL84o/qatAhekCZcv1YmuS/xnlp
	CjT6VK//11XDQ24/OaGnZY/Ot/KihuSiibB0cFdnyFZFpCSRZdJPj9Qx8zIiJKPD
	CSQqpw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfuqxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:28:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24afab6d4a7so89570435ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320112; x=1757924912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=;
        b=IFvWoCg/UKKyz5wHF50EdHLFVUJE8sHsepE5huhw9SHjhd8cMNmP2BtJ9iPa78ira2
         HCi6rc7tAF3kvGf17PbaMlNl/LpcG3H6KEIGhSrTtTraYqO1uUqPhUNCvinziV3jRdW3
         V2zYzSNndIC/4WjDE1o5bRfdjXvZzHeGHaCZ/u3jXuKd+iVBkcVyv0uYaJasEkl6jZj2
         pqYP6WASWkP0GuKC9tKjj0UYzKgoUN6AAgsFEuc3jlbfnPk1rbR2CZWjOjpPVw48t/4q
         p+DmbsgVtaJW57nogSbXab7niNj1r/88b5bdVI3+OAL+DZXE1lvAC3Je8iLHD3e5cfe2
         C0JQ==
X-Gm-Message-State: AOJu0YzXNncomPWh6iuRQWZdzcSlxC/yC8DTLnLg0cX355LlttnqG6Xh
	TbpevvzY+BRvjk6cZMtKOcfn5wF+noqvW5esEE6dwkYRgTi/22+9sL1vMjzvYzwpNpRV5E5aBkB
	lT+l7aQwgO/ZJKXBM5wO7voUfYy8QwvjZYGRbs3fE0Rc1TJZEeSQoCwkLNhxI8fnGDLnM
X-Gm-Gg: ASbGncs1uOzZLkd0j4d5VPmwH2URwtPjmrIPRUWajhChbI0TJlDlidMEzvBGmDhR5Rh
	AXyWUGb1PE22jj4TmgtLH5zcTX98g6uS+DiFxfl1UK97yd0hURK8FWdEB5Ppg7M/Kb+iA4L3/c9
	C2Mn50cvW37t+hZin3Wghr6sf+TEi4sF5qNddgBJHRiwpW4YbhcgB7N7YlW5vBy3shPtCCY9AXU
	ImlWYP9HXg8VcnTwFyCLTrDzBKjRi37/x2g8OGouHcChALpcjgjJveFLQ5MlwDzXxSdkVukYyJ7
	4fsN0sYdFD30qiW8+HXmkjRDc+w6N021M5F4vH8jiSjLSl80Tci022mTRn/jR0/c
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id 98e67ed59e1d1-32d43fc847bmr8554019a91.34.1757320111812;
        Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZA7JoDEnmt7AqwJdt4pyUQnNwI2XcSGTu2xDVrasXY1aPxGl9PN4uLyeJFuDudO5O+4Dzlw==
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id 98e67ed59e1d1-32d43fc847bmr8553992a91.34.1757320111383;
        Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:09 +0530
Subject: [PATCH v2 16/16] drm/msm/a6xx: Enable IFPC on A750 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-16-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=978;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8YnJ0ONhzBIexy/neyt6NTzPrJg4+1Ll8SHaMIGWprI=;
 b=/l1IvAErG5vS1H8AZRE6E1eJuAQqOfkFg2PgpjJbxAG0YmEzCJLWURhkAddQLIvu89grMp8AN
 7tnV9+P5wEOD63JzvVh74oiN3+mutYEfztOYd3dDeQff4WWaZUvRxaO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AJtP23QQJ7jMALBxZqGOAje_OI6yzwks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX9FIonyyLtBL+
 mN6UjeO7dERp8FEC1LaMEl+O/tlgeLH0l7TepGPH/ZB9zIvf1uCXt1lUQiBr98jWgzsCQUeYj1K
 uIS81ITObt9GyA/DW+r8S1eM477/xcE9JGgWiLEEbt2auzq4B8/MnbVFkah147O7lkmk/tkdufz
 uOkHsFr7lIPOFF+DkfRQIMoNCDaRZPI/5TgoSCb7NOkivtzkieOWKDg6GENNSyYEj6Xqu/HcWCc
 3LuFTm9gKjH07Y06MPUxUZT6vA6z1hHw6/FhcDmPORgUhKLXw88o24Sa/bH1fCw8RrNiUMb3DDg
 DS1zO018sy/nLeWFLWR957hQG3h4vZpLhOCyUdK7WlbYhC1lq0ovw7Vqrq8anQ6K9qPHOpnAu7s
 XXxxyYWC
X-Proofpoint-GUID: AJtP23QQJ7jMALBxZqGOAje_OI6yzwks
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be93b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cz-sm3QmoJLqeNSv7C4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

A750 GPU has similar IFPC related configurations like X1-85. Add
the IFPC QUIRK to enable IFPC feature.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 547c046730a9b50a82cc9b27f08a5b1eeb08dced..6008f8b0144456c5652dab4c6393b3abb7d709c9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1525,7 +1525,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.50.1


