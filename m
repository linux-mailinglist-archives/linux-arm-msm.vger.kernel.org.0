Return-Path: <linux-arm-msm+bounces-73316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E0B54B3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0581B24F7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0642C301012;
	Fri, 12 Sep 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNO5V6jG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E930102C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677192; cv=none; b=BubYcWX6hCr61soOeGLU4BisRk7rF2KDIB1gzeDD4l+kqvUdfwNi/tPPpf7GjcNVjpK5oCvTHqEczn1amC17VMi47u/Gq3oASWM+BMUfLTGCqraKMBFpK3FByQvNeFCJrAorSvHJ6A+PjhrD01dExAYMz2d//9CtbvTOzo3P2xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677192; c=relaxed/simple;
	bh=zsw44VeIS8tPBhNLX2AbLAqsAEVNVFzksn5mBiXdC5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umsd1EON9guiQ37DDgcXAr/HjX1Vfquypjg2nvY8Rrcve0ZYVS7YO6XekonXfTokKqgwaLqH6KFTERdCRKuuz2VPz5+jbXkE7kpXkhcu7OlAFs2bnE0PpfWr3LdbpIeBtDFykMPFzVNHhynf1gDZ2OAJdICQgE28kx5jumFaaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNO5V6jG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fGpN019755
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=; b=DNO5V6jGRZFKjJ8G
	REDzWZ09eSSOriS7/JdVLBtoVn88r/WwuvHOkJA585P0y+e+z6ZEmljbP8DPV0Ot
	o/4qspZ9s3ZSKCaPymBFcLTi5LRGDM9EEKW4/yFUWPlJhbFJDMAKygzWKZNVNhwT
	0Oqgd9aEybGGihqlVvXGcaoR7UIxquPwRKIogt/SWYk28yGsDGlTo9plUkqbD647
	eLKyCp5pwaZkngbD8X9x1j/3U2PD3CmE9PRPKCgFEVIWXZfTNaOGBW5wUqj0O0WO
	m4jqiI906up6sipn5yO8wnYIXFChb4ZV1GatcVGjRCHO3j+8kMS6aP1yQMsDMzWM
	j81xow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387wpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4d01b30e8dso483464a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677190; x=1758281990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=;
        b=rD4c+Q2QuL6ROf2lvHP/9VMKLY5dYG8/RUrp2LK2V02RVWKGcMjXFjEgTutYt9f+4N
         vxxIS48fc48tCn1KokM0v2iaO4XDuXqVP+avHwKDM31ooFxLC5IIm+zceX9rl05iwEwc
         NO148Y/2f3aD7woePd8mDq9DFGQaDYDqvziaH3YWmfRUOn+rJNk028yGzwxamSR0Qyt3
         Enuf5hN/WHeg1olVIhkLLXAZDPn17ki0kVoxQ5AYAuDCeDmNdFsob8cPRbjPsPPLwqY6
         zs5Ap/qjSPbY1MMSogqmYKx00b+OGKRUIW2g4js2u8f4vVa0qVZJCvzzdXwuxRaVkZsO
         SxqQ==
X-Gm-Message-State: AOJu0Yzx6jfmsZgyT4ju6ViCiUmK5jk9ZvGQWa8KNIt7DbGPNzUrbr8m
	CcIoEnJn1zs7yfN62jCjspchc+U+xUqg6oLrK1xdCnJ/8R+MT5muTKBS2y68HalWycn74vp5oW8
	RuSncEI2168TJY+D7TJLB+UHUATCvsxcAb+53yW5BtFoX1lpsSBigJzcs5+ey88VPs1zf
X-Gm-Gg: ASbGncvCr3hkpOcPmaIcBVQNOlQAvM5aOSwbtAVuddT1hdTWiyVoi9npIdrpfF83gD6
	ihe0Nc0iDpH35bRAqZ77DPAjuH2YJQW0hJ7q6qxk86vznk5Tq7ClZVou2quAEVliWpLSiatD7+1
	+xFcAxyvfzJCZS1KtU+jXYAgOqEYELtiNQwry+T5g/fFqJ3U8hR2lFmT0sawe7L4sGjdEmzzd1f
	AGqRliazPlOMTfrWuGV40lL6PO1uX8QuwEpI5KvMfAhqv3S+3HTxQhh9iSFEkV8U3BmZOc7xHsK
	pSLFvLlQzJUBFePLZWyIbmpoVXMDkuq97KHgolP7etUxV7EgQ9aI3xS14bKYFvysHsIdBxPhxGq
	qV2GmthUzticS3IBQ2O4fhv2fvW8+Vfy8GQa8jWlyyLAcaTMHax4SDQ7P
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id d2e1a72fcca58-77611f9a1b2mr1873617b3a.0.1757677189776;
        Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELFvLrg5kPis7j53nKtzrsgs2TLYs/gVlDCE8CvFTY2T8sgBM9bn50GM9tw577E4AAn+xTlg==
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id d2e1a72fcca58-77611f9a1b2mr1873608b3a.0.1757677189294;
        Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:17 +0800
Subject: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677172; l=1260;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=zsw44VeIS8tPBhNLX2AbLAqsAEVNVFzksn5mBiXdC5s=;
 b=Wiv2VU+0hSjsT91pK/MSZfPi0gQD+MHY26Tlb8S5d2LDXH8c2j+H0K85uR4jH147bspO16+mg
 nDrmZ/85KDfD06aYmXxXgE14luXHDfN2yEFInlheFlMfGQaj7U0A/+I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: GZiNeJczI4NtB96EwTFHU0hlbegHsHp5
X-Proofpoint-GUID: GZiNeJczI4NtB96EwTFHU0hlbegHsHp5
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c40686 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zkzxiq2xDrpwyWBV8T8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0uysaNL+Iz35
 Xma3HusfJZMlRHm9bJJWgbnENt+sYtLBFkTd78NAJ3Ixxxmq+yDsbzW67KRszDbharP1UXEmR7W
 xbdO1iuo6137oiJehww6KX41sG+urRM/6rwe1M2RC2TxzIG6MtYlbryWmUttvq907ZX0bW2Zx7h
 EhncsDOd7CEr7ePFCVih6aTto+8uYtAnNSiI0pxic095DkmkB03Td2VdFltcAzkisEkzKktkSCm
 Za4VrZjW6eJoLLD0QNuuAGCVN5v7fPMKUeEMX9e37rvclMRxKqGy3MDv8AaU4egA2jBW0VHSf0c
 WJL53JL0orgY6CVRa6TUBvL96Ax14WMKdFrr4MewtJuj0WeAOoLfbgQefnAm0xiHxCAkqKaWy0R
 jEZxNJZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Add support for SM6150 DisplayPort controller, which shares base offset
and configuration with SC7180. While SM6150 lacks some SC7180 features
(e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
explicitly ensures future compatibility.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1


