Return-Path: <linux-arm-msm+bounces-89494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 773BED38CEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 07:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5272A3036998
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B33093B2;
	Sat, 17 Jan 2026 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6ZGO5UD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/DAWdB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54E329C79
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631764; cv=none; b=S1OYlxveNBH1DJUkzlTYuLzfPfZhXvfcp2VBHbRGHaqggYhU/Z4kzCZfbnay/RXO6XU6Yoh2Woc62jE21bKSlQ5vHoznd8SLt/+Xg0q4/TG0QAhBvzhZ7p9GTsneFM6yDGDgZUmq1fJWX0IcbYPk25em1XxGflAqmCXXcHi0jaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631764; c=relaxed/simple;
	bh=Rj8iAyMfVncSKRo62kAtziE4yMoYdmQABsHSh5kDWEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVYBwhISJH3wqE64bDqniQu9t5v/jXc/oTbpeVBD9yiMvC5qrwgH6GUWLCOGceR6BJRhjDEVaZ/7lBXLQqlu3eXrNtVlzAyDS1PHVlrgUvS90flD+hiHtXvp2IoZrvkeh7GW241BMO2IHOdXjaGpnYPeQjH36Vrw9Ivo+uUtuMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6ZGO5UD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/DAWdB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H2pmUL2151630
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=; b=H6ZGO5UDfKJ9ThXp
	7/j2frgM59P/RJzsMIxNqq8aC3y2O1gGrrd+B8xRl66TbCGN1tKHdXeBN3QhSPKN
	Cn0NsVJsdLbMz42ZdAEBbVAlpDTrpRBCmtlkT7o09788wg8m1pXIA6rFVGvIjBZZ
	qrhZg+PNfq1OAChIaEgcABeratz0aNbfHuLdx3BVywrBpocXRweW+ObUyC49xWHd
	no7vRTHWgoWpeLPgBsKM+m5ntou0TXja8Ge9dSTxsUsv9JcT5IsoBl7BGB2dffUp
	RFKCOWbMBcDlPHN9H6iC67F0mdAfqrvVJaT2/D3BYbG+lCtJfoGJwRNd7XwBN1mi
	Bjs3eQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x0dsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823f4666abso71351126d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768631761; x=1769236561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
        b=F/DAWdB1z0kKynDKFV/e1KR5O1gy5MOHGYxLuyze3SHfkWm9A9PpYUwzMUAS6OHmFj
         MBbtbZA30nPne0JoTh+0RKIdW33Gq+TFbSJOuDWcDpCRBiMSwQG0I/vPHtOeyNcNYfuN
         xwFbiFlEVu8i+64/hD/pyg84HPw3qaVRHurzpjd0ZSPMc9UcMw64UuzW1tybedJ6wxZO
         qPlsMZS5ZGhjpUd0ISaOfatPdjmiXMqRN1iwbTwAyPHJMUwTU+kPW7wLYV40JFhvo/kP
         HLyaTjIcUlz+cnSOPSrj7syYIg88k2okPNd6LyCJpgyOj6kQKh61FiYwiaU2eaBVtckK
         dAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631761; x=1769236561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
        b=jOMyJDSQNlRVqs8YH7P3m2qUBORNSui5H+y8JM+gwvtC17txB+XU4CCQPbC+GQ+giV
         3DXbDZ27hj53CgN7twlGxlHJb4+vSVYGlLaKAtfXyqq5vGeSFYNLPNwzpj6hGlWuLASU
         tYKCamK8tWDo4KvZoHQQT8gnrWtDpA/TVGVG5oTBtOnA5x7sHqV9mvj5X21Z/nmNizKT
         pq4RhHyHv0J1uGA9VyDzeU23YHOCyVKUocHZ8sIX27elIVZvRsYNgsg+jD1nYrT8xWPP
         93MKsjLJFT2Xg9lk668LBheAqVeSKlgMxfeXPLaC09eeZqRcaT8+dAhuVqkE2QW97ouo
         PO8g==
X-Gm-Message-State: AOJu0YzCI1p3qYbGf8qYOy53Jgi8CWi9A2x3PV9i7wZ5/LbU5rBMXRzr
	C4lGCKXrqfvZjekMbqE+cUFvWlpOI/690AIU7Iuliki8LIF1xjD+kWVK5avvAv/15ZfFk9q1kYV
	ywZ0fw+PnJTyYdqDJ3lPreu8dXQffqO5DoXL1qc+lGcPWyVlVqYCW9vKXvGwRpHpxW5/e
X-Gm-Gg: AY/fxX7lIJxHn0fUV7zS4VokKyltD+sJ0lAi4Q/AfQs9fSVZlQQTMEIk3jnhdBYnSMC
	KCQ5h2Dw4RKbQOsQ629WMPablOE37hXUbOyZq1osNj4AW4Dwgpl7C8Ta7xKW6sPC6i53EYtr2la
	Zo4gDp3JPyxwqhHY+AmHqqEzqqKhTA/OBCSV/H6bmC2uVXTs/puSlhyRjv5Ar0kM59V8vgWidC5
	ofY7s0EcFdM3eBnZONOFBjNnEz7Q2maoEjsPxTzFxANllTDOcqZ5yfsyorH/dLt1QBUr02WeP0m
	U/IIL625Iv2AqKbSnk2l0rJTn6ZGoaiZ+BboqgHW5cQ9Ok1tcAHUVM8fwZiVsM0fhw4PhnV6LIr
	DyL+9bitJBSt7fAUHb4F6UfgEGiM6a6qoTnFMLyY+FmV+jGxnpCuCwl4l36KW//KTNpt558P+wR
	3VehYz9hI1L2VYGWhv+d7oKYw=
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id af79cd13be357-8c6a695902fmr797747185a.85.1768631761497;
        Fri, 16 Jan 2026 22:36:01 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8c5:3869:3f28 with SMTP id af79cd13be357-8c6a695902fmr797744785a.85.1768631761035;
        Fri, 16 Jan 2026 22:36:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:36:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:54 +0200
Subject: [PATCH 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x and
 6.x devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-1-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LXy7BviCDiClLOQ2PK8+jm9Hcs0eMu17i7
 xUfA2+3DIWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1V/KB/46WgKJQQ+Lx/fXdiYXGiGzZRRziXq0o8DqaUBQZkJIKcpHd/e3QAEcEzG1qzWUoKJDGVM
 CWj5dcjoOz4GOfBp02RahyGcVMfRWym/6KWCmq/5onHWRgctC/scP9O/8j9W5gHMIR1H93ijpIo
 It2YM/n/pooiBA3EHr6Dx5r51y44w4kSrwNo1t3Pl8sbQxq/xHuIYFLXnIvLDxXdTOcwExyzlXe
 kAeomzjiB3znPgp28UWNmTb5tyBYNSTFgOCAoVKS8tBX4VbnWUGB6CijhL619Nb5TOkvAu/2Yz4
 /Ybne8HeCKGMg8aQMXO83qJyYQWiWZ1lUHur2rjvge8JL5zy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfXybbXJoE7VeYp
 4AkJElGhOSUarR+S/30ap2MQioS9vSy9ZbCMGzUSOyXsn+NFfymGwm/fQshVjnMg6wWdp6udh60
 r/AaVCZiKixkPcIZm56zJ4H3emkbANRi20ZHZwwL1L9eozCoM0++oSG9HO1fa0yfp8HK3eiZSWc
 5sbqibo20v7aGdTzWoU1VJb/bdISHsgwe+A9otGNTkdvodO0cO/+DaJ7MkYaS+6KkaxvOcYsK/R
 jV3lr+xqWRMOKkn6ks0xJZUKqMFORh5quOfXnBtFjzROzQzYr5zW+jnod70lVtTrCMSiaNff5k+
 giBKkXhxPl/wddGpTUXeikgZQsL68i+vuJzvwTZ3bR0r9xRapNlxSdLJWNWVjVpzBJMDjnlZrlB
 dne2XG6iKSZ36y1pJGBwOHQCyDboxXYPg6yytde2Nqs4a4dePaODiQXSHOUfWZ5YRQMTJwjfdCR
 mMPXAc6RwMo4aCtjruw==
X-Proofpoint-ORIG-GUID: RRdZyFGvhw355-6nBMwOcxosib6-5C_J
X-Proofpoint-GUID: RRdZyFGvhw355-6nBMwOcxosib6-5C_J
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696b2dd2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052

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


