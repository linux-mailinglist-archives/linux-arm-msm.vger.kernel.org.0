Return-Path: <linux-arm-msm+bounces-55202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C1A99A57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC45F1B856ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9530E28A1D8;
	Wed, 23 Apr 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiQLKLD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB227935F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442650; cv=none; b=UA4ShFcWuCIkJpKjLsmOyNsFPK9HZ5o6o0ndzckNE22kQ1V6MPUDUPrnZ1zzco9eXeOxGZ9dVprtG+5IAyNd1UEBMN6V6czRHrOyBPIh5ALJpWSrHf21LIwjddlKjmDTpYGZqtKRRAbV9sqdGKZmzEFop1ztk+fYBr2ostx1rPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442650; c=relaxed/simple;
	bh=vizMfI6yMLhuvHHaci9bTW5mWKS1fnvi3Y8sn9SxswY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kv0f9ecAqe55R2MYXGh5Bu3I/MTTrYUPshKHd28Di2dBgsqqfE9ldSWThO82TcIZ0uwHXJs8/8jsIWeUY3HUZer5E1LmvmnMeaawOoaqL4mGkGxxriwUjbazH18Afgk9UbWfrnpnnvIT+GIyv5r1ros4vmyHIEZbswyxEWopgdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiQLKLD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYYoY016850
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CK0oIxLXlNXLe2M+og8oCajclsmxhm+HTivn4MwCF4=; b=JiQLKLD54AV8fGbE
	JgrgQbTq9hzIDbGebkfNqWaip20T/olSK9thn3t4Reg+qPNd2D6s6ovNAkLi3Bua
	VT7EMvC62fwpgrW/0LR68r744tUv+DeCYNbMakd2UP5hmUSCEGXo+13+1qFPWGzk
	2lw8Ca+ydUhVXs1dv6L699KundDYVs0oBxuirS2ZtAEmCkDey/InXIV1orLGzRfw
	4U+uLEW1ro3ZfZUpUYlCyZRPq7D3F/bUWyrYauWR2O/6BQBJzRLsJA3DF3pyT2yL
	b3GAyx8O2lHjTZ6wc/9bTPsK31cgOqa840Mj+r3RZLvtBIUOgW7e/iWVYjiHla6c
	niMB2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d9d8890fso270871585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442644; x=1746047444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CK0oIxLXlNXLe2M+og8oCajclsmxhm+HTivn4MwCF4=;
        b=eKiBRSLiISjeYLqM1RRegP8c91VMUt+edprbxXCWCzzbvCCwHoPEixVNC7Rk1vEvpi
         x9BVy6EsLflZ9cGnOChQh3ivbpfYsf+/xdHnCBJjH3WQ1MZbQ1vYhoo7HAPq7Yrj3eT7
         3fu62Kib+d67XsfjdwUuWHqnZMFnQj9hsmT376EsidX3Lnclc1DPHEeXGW9llQB9YOW+
         I/i6N1MZsaYai9B8SdmkzLzLaVWipDjGuQTWnGueTJWyjjhYNZ/iXSL7PahIk2g519LH
         ZgxijUNEkG6QhjHVkTXNNZjeCqRlnzMs8eypDyCmVM5p0PKTh1S4o2PdrKmlcD2BZhwy
         p2QA==
X-Gm-Message-State: AOJu0YxXPCkptUnf0p5qAD19deCRgfySfLZ4xtFSvO0kP8gJ+n7Hch90
	bluyl+FuNsoDpXP6uPQ7QWtBX38hfkVjMaBuqAdMeqxlIonPei8sLhAe3LaNFf6Cbrl9YtYMTGR
	PL2sLwpiAM3xVQjgqqTb9dmE3yu08HN5lruX6GH9avkih43nlzqcU02FHeaR/nnYk
X-Gm-Gg: ASbGncvugmMvsVUaOP9DxgINCDd1hSKZb5yGoiasQCd0GTZ3FeL/Dvd5GzXdSFc0TC7
	K88ybOGWrTC3jdFa+uWLSO7dcGyvgS2QcSuOFZEqM7OefGZMgflNW2Ad+wOlv6AxKdHP9DWqOGJ
	pdCx3J8VXsQS+zxs7sWqXUZLMgfPE2u8UVguj5O/cTcuaKDwG8wKiKBgQxBSqG3rxISVJ9fG6Zi
	WvjNCGOsCGDrkeL3Lbu9+3KwPwgTs735Q7g/9jHGOH1WEVgL6scj5q+f0UqPFzf8MNT2rE/BTx1
	Q1SG96jmuqVvcoACK1/uJFuDsHopbNf+pnPJ0TgGVMk/f3ZSO3vSsP6v+0XQ7aOFt474M1KtU2e
	AHjjOjw5ZjrR61InX3doOiAou
X-Received: by 2002:a05:620a:199e:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c9578ca099mr10269885a.23.1745442644442;
        Wed, 23 Apr 2025 14:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhnp+Q/B8Q7VW/ZDiLoOBWrIE7Og1xrlQbSxL3cMCa4YPv8VVuYmFRVbG1Ux6b/tgKba9J8Q==
X-Received: by 2002:a05:620a:199e:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c9578ca099mr10267285a.23.1745442644131;
        Wed, 23 Apr 2025 14:10:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:10 +0300
Subject: [PATCH v2 14/33] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-14-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nt4QhnpHTNYrhzhqV0xbi5+n74LJmsNMY4VbVunyJu8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuM5sSy3+wGZ1dgufq0aaqlIenCe4exYlfm2sY1jcu
 PD6xF2djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI3Sj2//GWFbzcOTrLHh8w
 r3p2saX1ZvzLDJl3flNNprQm/JzWzv52u7tPYf0+5cDd50oclhsn+70rb5K38fF2L/WKlPmxvfP
 Zt+sX4ia9kdp37uHSNx8SOqNa+IqD9qcYRHNH18y5eafinpLPwd0WWxsj+Bcb9EvwZd6LKPG0UL
 0WOMGkbO0WzWMWMt73dec9X5nHLvNBeXKe3Ynk4J4dmy529G9+L3tj3rNdQjq/tzaFJdRPZvKRd
 zr00fivhgyHzWMXffmNxinb7qye8lvu6RXVi2ETudcZLvg0aUp0/cJNX12NNu25YfR1kVwQ94zj
 zAqhTOl6ck05Trz2rA/f2/wyDMg2aS/vqMmcM0HLes9tAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pqB5QYPQsZXyOA7JWOhajlo2CMunpYSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX3nVCNPCi/9/O e4WHU3XkI68ZvPR0s6uw4nNfN2FuXc7VcfCbiINXsLGlF4kAmaIkMRhWofLbRIYKaBbZwCRNqyM X/b0mEC1xJzhHvqPcdfSq00Olv8wRjS7eIUNxftaYO5mfDw27N/wjSJpHSnzTz5C6vTt7xuOWTZ
 vFKXXTF8zCzJZtXgPv8IJWuahFmAEIbSM5qdrOUv4hvKjViTNtNZfDaVvJZwXg+RlRhbuPN5oPU rkvIQXmlgoR5wHRBdsbMfaZ92JFCZtQ2g9BH1gH1x1wtQ1JOj47rtW+t7WSRjUBX+Sd2NUt7Q2/ f+ogNMIdPi6Y1kZtR+9lxijvO3hGaMrwIlTcZEHSgLwolUeGiQ7I2e+wRuGE0zP709TsbvR9mej
 LmciG1M/nrbNIcHRjfPNeA97clJfOSAmNIT43tToBzzOrHiDkTIAnHPSTnpLVY+EtRRZDFHn
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68095757 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=z6iiZyybfqEMMI01lysA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pqB5QYPQsZXyOA7JWOhajlo2CMunpYSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f4700ef9969003cfa4728049b9737cb9eb6229..8808be27593b303a2a199a740827c92ea5339b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 36100e21135fba09fcafdd5d36ac919cd17f63c0..858fd73e0ac3a92fe402001d4796eb86945f61b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5


