Return-Path: <linux-arm-msm+bounces-51361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34FA608E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EEE3BD95D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FD1157A6C;
	Fri, 14 Mar 2025 06:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W188Kt0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8D18D634
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932581; cv=none; b=ktedhNi3ILqDWokp3aN2C/L5c2EVeWJsPFgW50uIsHICerZTDAZ0hNo/aHgLCVsnwrkEXrizbEM6JZ72QBRDalShdyEkhT+H1qYcBEy1+bwWd7qbDnPJg/Yer9OpDKQf4Ww90qDf/jjY+MFVX5cqw/O/POPKnogVigRhJSoUNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932581; c=relaxed/simple;
	bh=UmyjtCBtvf6or154F5rGp7XvUVxTnoqgmeLIBcj20hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVRO1TZhya5m2BV3zz7sPo9MFqvIfYrI0uuM5oXsxElRtcNAv98pWbqyBVjFuRxhoi/eu8cX9jumaUHRxiDF1tCAOFAPgh+GK09xY1CXa4oSvJg9GZb3ngL8aWdabg4Ynslp7EufP5yko7UUXdJvm8RZDvHSzm5QQ/d6+bnuDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W188Kt0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKD7jD027558
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=; b=W188Kt0AvYyBcZa9
	gWlU69bJyXRBplBjSsD8aty3xl5ccNH12sTsyhdE0ybKtqYg+wPWsOrWwW1M89/K
	kw4Oni/Icewiq8uOcRUdXc5iPytOnC+xO3ZSFlZsJPV9C1S7/ybU+eg3JLu35rm7
	ohiA7j3HErL4d6QI3roXT6tD6KsZImNiHI6rAV+sdz4RZHGgMtK2lfsosLlM3AYv
	7V7/mBwxUa9l6T2Ob2sLcqCtplwUJYo68VSdIgVIeKodlOCh1WXYzz+KFTGEK8Fu
	XxwL1+01tTszdlfsDKKoxQHsEMHd01iDixl5fHNp0ml0iXyHV7taW0egiww3Tw+C
	d4Wqqw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67314re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9450b19so39194986d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932578; x=1742537378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=;
        b=GBoLXjir3/FfEGgSei9Qvm8uPUH3QUqT3xi7LJNKkYMvIpWyoRU6p+G7fmIJcNWY6T
         Yw2TbireoDbGalWx7YLIfRBwpQR9X0NkMka2RJY2KKR3hFBG4v3840esiirkk7Wl9kxm
         dZSIT1lg63oZvSsYJwgoadYfJpD9wxkmhUCSf2E54/P3eUeHGqLxbJUxzmyAhsrAhKzr
         n32fu7xgGfH6PhDkbTBXDw9Dp0NyiGcrBzUrL70h/jdQ7gHan4wkdWGjjELRwpAJXbAi
         WAMZH61JWDsDY6NocW2CUKrWC7ESbbtS4tSETQa08TD6Eijs+4yb4gPArkLtRJrHn1Yb
         0UIQ==
X-Gm-Message-State: AOJu0Ywd0WGYtTChjETACP1qNbDPTrKuPIqf/YWpI7rg2ymNaw0zdrYF
	DruCN8dTQHT5XA5q0YFAdkxOLx9jmBlkxROnXgxPu6npjrciBKp6EUiOikstbclifzZQv1a9GMw
	on8YH/19meo/34MPmbUQgV3XJmax2AYn5OgmZ2az7OrxzB6JWysTqs+e+gJHqe3nm
X-Gm-Gg: ASbGncuIyvZSFn3k4xXfGENy9seb+gzw/0GCjpAVbIxG5lynNlyMEhXfLni5YiSPidk
	1IU2TJilYy59Y9ikv98Of3iDGmq/kAsSHiFvsA5gqCfCWX4+NfQHeaaIFdr4H1L7jFbjWgRv4iE
	2S1HKGm1gL+bkkL8L7Qqt5HuYNeG9zwTbvrYhDeyHJeNX+Xj6e+h4RdELfMNueaVu4kNHPhh+gP
	wvzUM/JE/n5YeE+fbROUytYGDy5dgsZnuID+2JGrhkE5omA6pBe6FO906KKBFVngzpn+NJiZydx
	XuBKu0S/tC2UEiYVo9jISV/nNBnVPCFZ4sfXFvJDSCruEfj3ik+zzCU+i8kGF1zgbvhqJfMgbFY
	ZzX2vZ8ZBNHUQLPf17mCi6Y0YWH0b
X-Received: by 2002:a05:6214:3210:b0:6e2:49eb:fb7 with SMTP id 6a1803df08f44-6eadded98damr91700006d6.3.1741932578352;
        Thu, 13 Mar 2025 23:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmphsJmME9Pc/U3siitGJHcFAyJ4/pnqiucdsVoPe9o6GwSZXaaKymgveDgh0acioXgdvsfQ==
X-Received: by 2002:a05:6214:3210:b0:6e2:49eb:fb7 with SMTP id 6a1803df08f44-6eadded98damr91699676d6.3.1741932578051;
        Thu, 13 Mar 2025 23:09:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:09:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:10 +0200
Subject: [PATCH v2 06/10] drm/msm/mdss: add SAR2130P device configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-6-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rlE+wNfpe5nlUHPDnN0xiTeW+ivm3u5pjFqcJvp10L5
 5mQdaqok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATid3L/lcwP03zSfOz9Sz1
 ayfUBkuuKlN+H/X8m82pMtMbDMWvMiOshfoNNe/ZaL6szb8efm1fzmF5z7RdV/lvcL1I7Lhqkn8
 2+fjdzgb2l+0sVz0CtDbEuCqbr5or3l71Y+WJ1nvVLqyHJm+zd1DrOHDil2nqY2YD8Tf8j85u0l
 yuIR3sZLpxqrQt56HvrUcyonpOKHu/4Og25fqq3PZhornSjzNVMxv9uYTC/lj9Dec0Krf7WOyoe
 OXXx4kffl/ldNyVniGk7r360MMgbob9MiYvqrn5ll8u+pTXtF6MXd5hc3hKQKwDY02AxObGZPsp
 9Scv7LaWEzzufc0wUUv0weREzc6lnVOvt9g/etd31/8MAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c823 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=PM8Rf7rFGDq3tjJTke0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Zo5osJ_hLvpWLrqn2MNpQ0P1L39GvFWJ
X-Proofpoint-ORIG-GUID: Zo5osJ_hLvpWLrqn2MNpQ0P1L39GvFWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5


