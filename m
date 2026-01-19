Return-Path: <linux-arm-msm+bounces-89575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4BD3A121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DBEF303E64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A7133B96C;
	Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8Ckh+nQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob1nhnrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE633B6F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810486; cv=none; b=jlhEAY8oakxNnCrj4J4/BwXBvdSTmnixYmZApKITtAxtEF7ZjLFp19GJF1PBzdg3+HLO5xK3h5Qa+ibqiy+jrPo7x7CuJRGwQmEa8Tx3Xs2b5Fvh3kR54mm0VZtJ7bLHNqhEY0Aglk5wlonmG5rhZFFbM7MAy1V8bTzsNm4BJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810486; c=relaxed/simple;
	bh=Rj8iAyMfVncSKRo62kAtziE4yMoYdmQABsHSh5kDWEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRqUsIeqQzzX8u06xqZvQAoV8ab1LM4U6Jv3L1WB7Y+KkgqEVX1MrXD0chOXH4EDFm1L6MTM4ibZSh9lQfFIUm79oaGRluIx+oF7+DVNXoSTaT2zUo9pcON+NzGb3RwGik+7hJwQf0q90XPWACuxkc9t6kHgtKmQuqCU6u9Q+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8Ckh+nQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob1nhnrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J66lD63029629
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=; b=b8Ckh+nQruCBx6g3
	Yv5/PMCoCm3zn5m4yKZVY8bQmfKpDg/eL0MlBGND1hmbffxHP7cPhbS4fEgNpxH5
	V4UUpIZxikIvZIYP0FF/q4TEq4Nu6uLoSyE2YMYishwGk8V3+5DIG7bB8ZpA6nNE
	K3CtVz/Y/EW5Ch3dDiDCSK/pU8uyj2RwPuuTdeBBFRnEncUUWbBsmNBc5NYOgcCF
	9NTb+4b2YxOaF5cIuS4UrzaRmitT0bmABZSFz0cTs6J4TVFrJA6HfIUowSgBZKVd
	jaTv4EEQ1VmpBS7j4QFC9SLMn7vlgAJGsRLi8xrVxrcwwdKARG0tg8WDxD/E+1tY
	ktrqfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqcf0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5311864d9so878015985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810483; x=1769415283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
        b=Ob1nhnrDZV4cVz+aYpjByOJs7cz1nkwbWG7CWr+AepdzB0q5Q5OlXDh2/mH9iFjZRx
         Q60g+W8RxmrzIArD9PUUcv0co2MJH4BLb5WhpAiaDo9GtwcaDt5CpZTkbqSw3XNzdI6m
         DMebWoj3e2EGVgeLEZ9fpVYVXhe5ZzYaL/22nvqZVsGlQNLGQo57Cu3wSuseDI9PjdEi
         nLvMX9QCr+G3XTElaD5J4Nylb7zQTnaM+OBvUJMqt4gAp6FE99+eeQtAQdye/yQaZctH
         zMSP4O6WwsfdICk/gnlFKqQ+Ah3pyKny5RV31purQetqqkwv6IsbAuylwtJ7dGkzlzVi
         ZNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810483; x=1769415283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
        b=rnqeqOnv5NErjkGeigldYMEfX+wAcXdFk3+A56zBsu5kOEh2dHiNJgDEF4/rNrpdT9
         UnZ69PzGoSKnCy2Xc3Pbez5HQUXO75ZLEddgzN2skbq44HAVuWNSW/xHmo7iATpZHRtp
         R1OOIyuL1dn3B6nHL/ANOkjlkhlzx6bmuc8kMXcZJe5SO5x9FTOjVmHEoSBKkwXDrbfK
         etuApw0fSYT1gyYGcinWkGKCkO3oR+5IHd0Kr1IyU+BlAztfp14Ql8bzZqFT6IAGIFdJ
         s/OWMm/Uoh4l9R/Ab1OJFfk3kf8wco4lqjCO3SZx69+nAxAOptnX+PbIAzFuT54c8V2v
         M4Tg==
X-Gm-Message-State: AOJu0YwGASZpwfk7OWihWuYYYb6/5giMt8is20CZ3XVa7IcZthVAP06J
	aKBzxcDebd4mE5BwIYLsDqa37U77CvOrOIhtg2LmwsZG7vtLZrUlZi4pyiXCjdwjM22IRUzxV/M
	8toaS5sdxcHk4+IEX1mlvdd5iA7XT6Cb1RhNNVYGt2dNdJboiksTZhGcyIwANu2JI95KbjzbewP
	7i
X-Gm-Gg: AY/fxX5FIAAOmiYDvcWQcQIBzHI1PkE6KOWtcUECJvELIT6ouxnceFZgpWeZYr2eTOG
	5Aa/mpmwu0Ll5qu6cMgwwSAfyAMOh5SI3Y9Xpi3qpFGVVrRDEkv/tpooD+zw2kHJtpk7WR4T9cX
	nMJ2SE4Jw25/h7Uny8u9pUjpbP3A6LEz6ECdyILNkSaVHW3Y+fwyxo5py0dnlHGQOhpTFrpKunp
	jSp8kqcrrLQ+73dEIEToY+RQWHw1vTpjyaGc5Dz4POu0hvJJI2zsslXDA7QQHs8arK+plHCg2ra
	y2l/aCSJXyX8CPjvqNOQC8FL3zDS+BsMJRRwFxIo1pWb+9zJuwVE9Z5dquBVl5Io4JKT/4JRQ9Y
	u8AFziUim9Rx2Don4poGiqUP6fqBVAkXz5sgNFXf/y7qyyqr2hScNimA0FZtssFiWyWuFsxCCQd
	qMLYFWI9PcZTl+pR/atPNKu1g=
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8c6a670f6e8mr1458674085a.38.1768810483130;
        Mon, 19 Jan 2026 00:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8c6a670f6e8mr1458671285a.38.1768810482685;
        Mon, 19 Jan 2026 00:14:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:37 +0200
Subject: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rj8iAyMfVncSKRo62kAtziE4yMoYdmQABsHSh5kDWEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefuQyz/KDw5+L2NGZr/8tgfTvkCZZ6LwB57K
 VEiKShTdROJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1dL+B/47onnFk9FOGKSyu2tzszeBJMJknaST8XNmfVXnyT8fSrNmF7Tcug9qjZ+iy/tW8/viW8n
 kcj8bw+OmmOeCpqvAxBfzRbuTJBuI6EAZt60h9SqdwdyJ4lTE8uGF4Z1TRvSD+psuBqrNBYCmYo
 0Em1AMukV4Xw8gYOnQmrW64huNldZEFeeDGulwGIJOVqNDj4cPMn+UZPVFu2mlkdndXp6FhxuiA
 8zuGRmL5u8zO1/BCirhUE5Y66fxqpYt/x2Dukek7vZ/znMnhqHY2kRClGWeA8Ez3RwLC1a+HQ2n
 4MA591fvbGA8hFNktnhBKeLPYe0FhbMsAqQxsdqTG7I+XEnl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fObCK1PfupdCbfW8WNysPfskk7ZDRD_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX6FRo/LIP70tk
 NesVN/7w6Z0H3DCeNIUi0ceb+6jBCVBGCaTIOf319SLRLQwi+MNcuhLSnZjFAgp/N2dV7jLkabS
 8LkADep/YSPNJM2r6bcvVWWA7lmUSDl3ZNxQSf4ShHnjxg2GK60MhjCPu2iwpexii+uXUGLEr8r
 3v7j4vGY7v3VLrJDopvDe7fH0VpozuRYVPlI0OWN1sW8j5or+LANeVZohNgPqG8PMeo3wypxLHB
 sbdY8jsOX/GdWHp8et/s27CQcpHRgYxXZReoIBNLRFupghFXNrB1wZV0fOi7voHAPfj3Im/cjG/
 xk5Ka/JGCaWzXAY4GG+XRzvdGBcURnvce/5yD8ROv2PsmUYcISu+wg3v5PLWeNux7FGFnUoRwP9
 KHH4+fyHtBn8FixR5iEbSlJbZsBbd8/GuvfPQsfMuyyLyuR5nd5iz1d4pmhCR+2GiYk5fP+vgdg
 AbgRwRwX7d4yWztizmA==
X-Proofpoint-ORIG-GUID: fObCK1PfupdCbfW8WNysPfskk7ZDRD_0
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696de7f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3


