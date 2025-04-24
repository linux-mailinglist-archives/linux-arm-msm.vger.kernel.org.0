Return-Path: <linux-arm-msm+bounces-55333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD8A9A843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB6DE927A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE44221FA1;
	Thu, 24 Apr 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XT5n4v0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DF2472AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487088; cv=none; b=g+buPzBkg3RNPctdxaGKiO41Rd/VNLr8mnw+n8kYoENCWiv8UUWjRvvHC5UzSmpOGtF8y1rJ2KyuC7VZw8guxdIXVmJZbBqAQnELPLyM3f8dccJm5KqWGnbzBxqIc4xlcz4FQlc1JZF9xlaHSqvKZEAcBq1ZpTVjXxqLkW5SFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487088; c=relaxed/simple;
	bh=zhba/E+DFv5DHo9IeNoDqsKEuGA/2nigK9HDz7FMsko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhwVdSMWwHZ/rK2BeuGGFB85Srx8GUfI0fxNqhwY7NbUsYsFYBC3l0P/8RqgEJF+cJqWXow/n0Q8wJx6tC/+LT50xWfXB9mvPX5T2O4LchnYBptmevP19iLqI4RPEXtbid7dvZlkGMtj54FQLwXWSvjycvi3NmIT0eD/whfVK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XT5n4v0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FrS5009868
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuGkZiGp+4CHzIb0zr8gK6WChuwEMD9eO5Cd9Zm7rl4=; b=XT5n4v0O14PnqDdK
	j90Wx824pyuoPp77zqMiAKpTLvCBIQpEDQybS6b7rj6wDuKACoLv8acBuaQGjyT4
	GUABDI0sQuIXfx6yxBjxxT72nSGc7oBU+T1hx8hWucHaEThboBMBL6rxRA0hl1HK
	0SFG89B1S6/SERvRcpWSI2yYnaVWWZq24r19VqRh26VTFSqcSsc4wDQWxY9r5oXi
	7fZkqin08GBsL2zI6poJ8cAbBs5zFT0sIAxmwlKyUufbGkR0Q637j0flurybtI2M
	NCMASF/jrNXTrj5kpRMkMKqQN20yWQ3dNT80vZggVSbolQhkx4/3m2LbLT5fzE8v
	hb661g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cy14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so16545346d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487082; x=1746091882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuGkZiGp+4CHzIb0zr8gK6WChuwEMD9eO5Cd9Zm7rl4=;
        b=Dt8uuvlpnG4GEg7mz+YNHtvpQQDNZc7anPj1qEGA1wrXe/r1WLEBwSu8w1iQ8K1aSQ
         DMWd3he1iOo43s8LHQ7hSRCth1Yfu64llrasC0fGsa7tpxM/uQPR2OxakPJKPx2My0GZ
         eG76hGyoZWStS5Olf2DKURW2Axl0TkK0PDrfJN/9rmBTdLpmK/BLnboW7US9kbVPWNza
         ySk0cBi6YzKr8mshQYVr1vL5qbb3kajz4G9wiuevSZz46EtSaWTz5NZMRgWWkW80OrOb
         42J1QQAm5GQpV0VkWYj5U6Ig++sy/WEQhxha1Pb5AZ5bDNjnfjZVCmroOTTAUmt0tzXR
         gkJA==
X-Gm-Message-State: AOJu0YyUna357GhNICfrbx0/KogfYLmuYmpd9zIblhrk3MGJ0toUkuCx
	JrAZfT9lkSPnwSCZ91VXjeBu2LqOBUytemEK1FLFeJhxW+musqjtEQ0bJ1PqC20d/J00cctNXCB
	DXbZO4KwyG4j4y0uiLjg5Nu7vD/CGEjbb2Xdn8ov+lMR921ZXzUNngHOsfRsmXEXd
X-Gm-Gg: ASbGncvF50pNSci1xPuCQbYPpXlD8z/mjZciYcikt2XS9ypqSiZo7yOe0HRyhoJ87rU
	GsyxERlIw+sjdU23wKGWWj0bvQBbjQfcegsbjJK+I4ICe92kqm4aDPblr1E7XnLqSV615ou3FjW
	j+uGJ/mW4D7H7+tr0RxixxSKnGCICXqDgrzPkvB27cPGTJhgufc5LFW4NhN+aEfEzq3FIvSLLGG
	YP0YbAmqjGAjZLSuBrMCm1ujfL3YUYrQ5klGbeqQPOGgvqz96cwe70SdXollPtGYeoi+99UeFMy
	c22AWWu2R/lAA/walkA7WHKaL6FjzmqQCagptl2CeObmSvXrzLGnHRyQyIIz5JaFVzO2TosK3Np
	nflHaToTgWrhiw+YRu3zjPq34
X-Received: by 2002:a05:6214:492:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f4bfbc3f14mr30134346d6.3.1745487082036;
        Thu, 24 Apr 2025 02:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQv8RVtGoBf4nAQuwL9840Qtc9F+8IqhUyYlPmfaCr/vX/CUtJ+7o2OdPxL+GN4PC4Ebpz3g==
X-Received: by 2002:a05:6214:492:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f4bfbc3f14mr30134136d6.3.1745487081711;
        Thu, 24 Apr 2025 02:31:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:35 +0300
Subject: [PATCH v3 31/33] drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-31-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=19/sQF6QrfTaWj5BCZQZWlAaWBLn1zVu4zT1/dnr23I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSw7G/2CNYPilA2fKV1pmxvQuRa7WrmhzM0c
 yE6bqq3t3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1XLFB/wIdQZk3lL7rB0Wx4ENOW3+dXsazKWrZkSr1FIeLdxk1x4P2RTgB8no0YPaxcFNkrgIjjr
 N5krjarM1WTgL1Y7fme8xSxgeqRfnowkSgNpzxFoYbj0oFn7mMR2T0G1xTsxBAqomWA5u906LBq
 UEu98A8KH+ycuPnUC8EPjtbzlCaTI6nodg7UO0mVEGmtUhTDFYrqjRzu7C6t3LVSfsbUURQUVy9
 2crJhvSPUMWB2wtqrlHOlwpjq4/8+m4NjYDVdIF4g+Ii0aI9Wit5Y/kL+lU6LsBfyJe2ESkioai
 07bJEs3GpZzeb/svulULGtZodpjaZ0oi40yun+QinbpJsvWp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Mf7SIozCb5wmgD7Ilhx1v-zWBPq42JAD
X-Proofpoint-GUID: Mf7SIozCb5wmgD7Ilhx1v-zWBPq42JAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4C/HrH/IdsTr E4S2MWFfR5zD3XEnHmCLUMjViuj30kOOrZZKHQRIu01BIxOMBcCzoTbIIg1LTYD0rnREZCpzo1Z CCXi3ZVPQd6XQGN/WcafYgTXoWOhUlclN/pXiD0C18Q6x7DUYYnAofkAZNj9yZbS9EJYt2cKZzB
 D/IflE2qEFud/nHP3bA28f7rxVq3+A9nrkAYuU9vuG7ClDDgNqcd2H5R8ibAGZH8VxtZaz7EVE+ ry9+Mun29jSaM6zPZP94WuGj6rIjgbVDsEo+KRgIAofJW1GU/HX6MdJjWbiTJCWf6jKPaj+9Qcr 4ilwyHci7xSSGs3WDppe/MwdbB0kk4+CmeuQPLhh4Kt4dJnSDyzfQ/ABj8qzRdLyepgUwGd5Xff
 Ld1VcVU6Sq11pNAE1RoL+F6xFMxj3hZiKWqBnhXbHVZ+LzgUVcE9iO4NJn5iryaHzVwNb+I8
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a04ed cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=bDEOCHsu97kwrKHOfzcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c           |  2 +-
 10 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2007aedc0526854d3d8c4eface5b507dc5c62c58..b8cac2dbec3c963b1a15337c64810a23ac6afc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -289,22 +289,22 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 2c59f0b77a75880df18900fa406f1ea7006927a1..26266d36520e7499feb26da0f3351405bbd2f87a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -274,12 +274,12 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index cbc7e9081288fb8125438ad1cc0016042bf70661..3881dc839db71dd798863067a8469cdf3045719c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0238eb019d98ad5599cc301e47bda43de762b24d..f9c572be7fea9660d03284d815067a17ac4abe4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -273,12 +273,12 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3b2d99de20621a5c47a31212d7fb236e0b784d0a..08d5273554500a00a55adbe144b50fb4f8296ce7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -287,12 +287,12 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 14a1781c19bd8060d338ea52684f756258526996..d4eaf89821722bfccefe930e834cbd83d52123e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -286,12 +286,12 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f6893c7ea13bc0ac84b46d50a132e18e1c575a3d..83dce1aef9d991afb7f30f75724a822854be3e78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index f2a09026abf324a3c66c17264c8a5d8f2d75a580..2938ff15299ecc5002aa1bffd02292212fe51f03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 51b330f37c901b99c7db640a0b77149c7ac8cdd7..0f78958ac4476de414d07b727c08feec1c2e9f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -128,16 +128,6 @@ enum {
 	DPU_VBIF_MAX
 };
 
-/**
- * DSC sub-blocks/features
- * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
- * @DPU_DSC_MAX
- */
-enum {
-	DPU_DSC_NATIVE_42x_EN = 0x1,
-	DPU_DSC_MAX
-};
-
 /**
  * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
  * @name:              string name for debug purposes
@@ -474,10 +464,12 @@ struct dpu_merge_3d_cfg  {
  * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
+ * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_dsc_sub_blks *sblk;
+	unsigned long have_native_42x : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -62,7 +62,7 @@ static int _dsc_calc_output_buf_max_addr(struct dpu_hw_dsc *hw_dsc, int num_soft
 {
 	int max_addr = 2400 / num_softslice;
 
-	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_42x_EN))
+	if (hw_dsc->caps->have_native_42x)
 		max_addr /= 2;
 
 	return max_addr - 1;

-- 
2.39.5


