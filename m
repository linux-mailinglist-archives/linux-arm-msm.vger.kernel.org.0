Return-Path: <linux-arm-msm+bounces-65792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E0B0B5E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F9E17B1F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300A921516E;
	Sun, 20 Jul 2025 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htWDOlAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C62144C7
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013825; cv=none; b=fIygsqEVy2fTuI5TElNHKDyALRtx4Pu+7pSF4hkV7Z74MaGYJWGebbDpxaY8M+0hUyq8Dk6My2gwc6ilGkn3LJ7qioJ/OE486HQajUnci8Zfe9OapZrb+ExNTZmNEOmymBqC1BuGYWt8QgLPXlcXWImWlLq1o4QHbpC6gaNyIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013825; c=relaxed/simple;
	bh=FEX4gllwWRzFTPzD5y94Fxz57/D5CyfbPDxIKY/FMHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fw/eBtZVgc261Ln4QoYI2++UpEoIGe5exMX6arIUAa7CPEv/Td96bVWtnyEkrKn2WBHD3GqnqxYLBFfgnRMlYz5iQl6FeqtMWjxD6yhAC/71iMZncIPwFyLKQ3ykX07Ip6jrxgSs+dCdqmVClbp0X484+2QM3MXgVlfqSqfT1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htWDOlAY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBDAxX031469
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=; b=htWDOlAYefHQTczi
	QPo0hslP2C5MFEVtTH2FAQS4MBnRJUgMBcrsKyVuHCc5drZJgeJIOWb12KxCvSTY
	vQYdtI8IRjHNRtHfVGmDEdhdctYDznzEdKiJz3dH342baCGI1U85VlhEU3qk1SBh
	Vu9gyhve+Q5W0qWSldmbjfCuPtMHXX5O5sEqT315GuRATe/N9tExL2/CVjY4bXgQ
	vBaZbhJ2r9l4CErOP3BMfP7KKPQ4E/DOLl+Gjee+nBZtaTHoOow8+6MUkkfTr6Wm
	4jlmOVzLCesgmTQuqRJqOp6p9aJMXWxWLJ7FhmGhdohkQPyUweKneC2KjHDNoxj6
	BztGVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso972093a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013822; x=1753618622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=;
        b=osmPxa9cWSyFFwa94VqTwCB65KHZehU3eR/wlE3Jt2A6Q0X5yraD5R7dXG4mmOIBW+
         Fl3iPOHWYAFL4847TQsFry0D1qnJiOBx54aIN35zd+rwChgdxt3Yf/oJuqzH8YBiG9+B
         fmUBEUlh2D7kDew9Gnsq2gpXMcl2B98n53GibhY5o9w/zNqpr2GU79FhCJ/5dNTB6TVI
         i0MzGrAwrxOXDvTv+AKo4Kss4RdwAGWfi3TFvqpudgGIqT6XyzRoj++35T/fvoGeBBVb
         3XQnUpdYJKKs2+XUjmoe48C1aP8VJk2RY61yvjBNL9phYonKqFyX8Y/BANPhtkr8aExW
         6+wQ==
X-Gm-Message-State: AOJu0Yz9uTNd7SDR2a/mfb+9J78CJcvibUFVNQmgBrJVBkKydjGqpmd0
	YY3a8SLi8KKpfwfS/8fqApn/gzuFwyjQLZcdWxQjKRVexfgC6LurYxjxGU3MPwn/GdEpeC3rSw9
	60RihC+HhV94Bg5YL6Ew2f5cqBkKIRrucJdGLcY5/hFEzMdOTjVSZ08F0j6JfHlukjP8U6eIKBG
	/q
X-Gm-Gg: ASbGnctgEeDWHhsK7+LNDcpI+xWKlEcj42V8/zev6NzVEAobbpH0CK6nh7mo1R8DAvm
	LJkB67DxxF8bki5m3Ms95IE8Jw5+UZWXIHeiMDtcXRnrEzB2qve08S+Tij9/np01Aiwsv0muxuX
	/6tmkTIbRaP2cJVME4sWsQxPQJTC/ERhj83S5XGJn+KTRXngWxDz+0dgie08Cf7BJz7plBU8+Rt
	0dSObEQ/eqZKK0IALvpYNoF9Ly8R2PJgEYofioGflva7l9mnLI25yrVlVXM1g6ARSfR4MIIlOPX
	r8Q2THEh27KGuIrb5Poayd3bdGQijXEamTHbZkDR79P3/HMm/fyYn0SvrhJFtb3l
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id adf61e73a8af0-238351aa167mr17819750637.46.1753013822100;
        Sun, 20 Jul 2025 05:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiWwQwtfLMcB/87qX/+tJZdR+Mt+Z77vPLlFgpUunMGDPIC5fMzAPTtacb5vIt/CbB4/MmWQ==
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id adf61e73a8af0-238351aa167mr17819729637.46.1753013821656;
        Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:04 +0530
Subject: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1436;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FEX4gllwWRzFTPzD5y94Fxz57/D5CyfbPDxIKY/FMHo=;
 b=WNF6fhXZNpLcKewFVHkyZ/9w1NDmAhfqENUshg+HaTobcQUFQ+1wvwT3T5lx8e8LomX+8eQpp
 WvoeoCpfdVOCqz29mDOa+2xKgqFH8UfRS+v8e8JIYk6DifdK0rXQLd5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 80ugUoR85rH42cygWOa0J5MUxfKVT3iT
X-Proofpoint-ORIG-GUID: 80ugUoR85rH42cygWOa0J5MUxfKVT3iT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX9ZaY7iF2KKRr
 znf1lmj2uFLnqGfJM6834kpbRp8sTskFf/aM4H+AyPrYc6Odm23FQBz6arp3Zuq5VWqML7Av2Hy
 vNRbuYD+FjNUzkmG3aoM57xcVqZfCqhVywpwvWw+pQxuk+PrhH1zuSPf9Kd6MQcI6WGTrf+D8Vq
 mc8KWteAs4At/EhZlw0AfqtuP5r53c+XKhY7MB4EForReAp0xNgvuBYi/qn/Q1806YNWSiKYbtL
 mu49AodkZoZPifpSxcHWAWVwM+oAr3aqvcJJblZ6iVJkrUv3btJ6zgubi+GhaiJQR8i6d2+7Xk/
 R1ocGW/Mp+GZ6E3bPM0WFtO+sxkr11SS8Px3mNOS+wS2Gpec/GMMXzugZJ2zoUA1KFpflWxtcWB
 0LDyZy4LvpOnPmiy/aZtz7eqDjZuKSoJMOHCZo/Cnv7SaN30v0uEaPBjLr1bVrDfVjvtMPP8
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde3f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JNXRRqm57C3p3bqa__oA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=875
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200117

Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
different in A7XX family. Check the correct bits to see if GX is
collapsed on A7XX series.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 41129692d127b70e9293b82bea5ccb6b911b0bfb..790ef2f94a0b0cd40433d7edb6a89e4f04408bf5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -93,6 +93,8 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 /* Check to see if the GX rail is still powered */
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
@@ -101,6 +103,11 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
 
+	if (adreno_is_a7xx(adreno_gpu))
+		return !(val &
+			(A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+			A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+
 	return !(val &
 		(A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));

-- 
2.50.1


