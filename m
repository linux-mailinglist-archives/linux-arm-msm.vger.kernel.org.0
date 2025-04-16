Return-Path: <linux-arm-msm+bounces-54569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7692A90F6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A6D19079CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD09724EAAB;
	Wed, 16 Apr 2025 23:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVyu1n/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA524EA81
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845415; cv=none; b=bNdtrQ6KFBPc4+ni9WXtQ1HRLTnYO0y4TB79v/fnnV1gx20mBzso86kqaGEjcN/utRkRq/bsUHANjGOqe7HyH5MoSIEpDjwY1pP5fBJwGzssap76c09ZGj+uk/k0zac8CYT4ppOKFHHzmw7/jCjKX0rinVuAXZD3DJvp5ijJDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845415; c=relaxed/simple;
	bh=+XsaSgAsO1FjVcsAVxtjYZj9xVCtve3/WJdsHZ6Fhdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnyJ28qG3a3GhUDgnDnzkvj2mKwhhJT5VAnWhrn0oeDztaDdKV1zaNp4AEIVfBvT5Y3elMMULjrRrv5MxlW6Xq8i/jaeNmwVWpUk4MPdWtroe46QG5+I3r4Tl+cE+qd2TythOdggQQZkivtS54uFShP3pnZngUykj8gj7ug1gMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVyu1n/9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN2L5h026233
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=; b=FVyu1n/9qG3bAq0I
	rgKJOHEmOxHGMiAHw6p3GEfT7FWbvVyCyUtmpvXJqW5o6zBGnDe6XiDWmfGfingN
	gop5Gx276WqKbbxEx5FBfFndWM6IDEnHc9CESr4MZyRWMOs0qfUM6YEwZafyyQby
	DUABDzJap7GT0paRlCuGpANyUifVjGQ4SVy82CPeqyLV11BSa8Mu+aZwJo2egzk1
	s95EXzJG8pq7gg1PoAj7Y75sl/FdsFYbTiCOdA4Q6qX72I46b5W6t5mRPzhUuB6Y
	sBTUFSw47IyWS0HMs6a+i6X8DGLnEpheb42ix142ikt9tPD+onE7v4s1Pgfvi18x
	h03NMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1cxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so4310586d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845412; x=1745450212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=;
        b=MKchsGLPxduiLThpU7Xxbe0r6sRTZxAESASL0Ixskz+JpcPGexbq8KIzBBdsKBvnhm
         Srfpwcynw9EQpa5ZffIDYtrodOIq1wW9S81B6lBYrnVsOwipnq1YMCOC/Mvn/ONozz1V
         jEasgY15pxaMGQTcrIOImA/Yf7Tha5HFWDvwaUinmqOBDus487UwsKNRxXlXCQM9Ex0H
         tSsTLZ7+6I4fB6pLce8Cyhyv01yo38kmo59px0HAKg5aDAMnb+DrbRW6tOo5Z0mTccMq
         KphpOMsoMyvYrlGuXoGEuP80eimXlWl4qRa8pB9ZNh0/sxu9mXluhSnQxAjoJgQqjCOY
         o6kQ==
X-Gm-Message-State: AOJu0YylTDCq1LGwk/1lzr/397z1t6u8ZZbICmIA0XUSTjGQOedvGJev
	11T2v1R5fQXg7zbO0+IG9C2sswy6BIL/oG1tE0Rd+Z7QcjMmh0A9JipjYaYJhKEEPxO9+/mXVAk
	ef2TYcPzOHQBWKP9f0g24fpZ7JHZ2e27AFhU61GFNLvyq7RAjWG5XvEuLOXFYkHyo
X-Gm-Gg: ASbGncsPA6SX83LfC1hAKutIGrVJWSnjyI2rrO90wJGjFa+N7mhIMLXW0Yk8QM0LuCI
	7f7enn5zgFG8cYw69zjG03CgUbWcQ4E5c3qeJFrBI3rGp/6HqJIHyHjKyBKTBbR266BEuA3jt/i
	0+WOOkJi9xCi0KVjCpJZpFfKn9JtqwaBedRvBSmLVgVW9lvx9MJaRwGLGjnr9mdsffiRIscMZH+
	Md/YdlolOhCO0LaLRXmXQUev0bOI17LQJnWGC+f2dWOTERks9uH2033nPhtbY+pWhFa3IR9pSwy
	CdmPccPd6VMR5ExRUFILBrtHQRe4gUsO36cFYrG0BDUWwzb+YJuFhcMiDvR9B/FN0hW1Wm0Wyp3
	pn905aSAkSxtbS6pT9cXIFYTz
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6f2b2f41eadmr64009866d6.18.1744845412137;
        Wed, 16 Apr 2025 16:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdi/Heb10IV0ebjI/uQFj+TvnCj5AqRX0Qjt6hNOsivt7/zrNZzuLbnO/trLdOyvbT5hnuRg==
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6f2b2f41eadmr64009456d6.18.1744845411694;
        Wed, 16 Apr 2025 16:16:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:39 +0300
Subject: [PATCH v4 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-9-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NsF5aI5nusL+eHX5Edd+WVqyrIto2M0m5QQZuN1UEGY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpSKnBU7awkHhZMhjgjHssIKvg9kvxarVper
 lFtR4MryhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UgAKCRCLPIo+Aiko
 1RGTB/4pE1Ow3LIETtniR4dobV9KAs9aiHQuBL4xDkuFXUvHcqLMPBm43yr/IWRC1Vj1R5NZcto
 d3uwTS7Ec5SGa5NMjQyzh2TsSFE/EKJ7stGggTNPq/CCk9cw0jl4b45lX4M2M8kWznS7t1tijPe
 S+ogjHMwMGRLoyJ5SAbZb40dnlY8pZ1vnizWAQ943AE3HEk4kVl6R/iPbK214SjG4hxgtyNLYCk
 AZmXiPEwlGnWLFcRDijSeD0nsaUcaH3buR13R8islUBME9rnyQK2w0qfvl0juHq9cM387onaP+o
 d1YhMF4TOGDt7ZjO5R150dtVREjHY5iHizzyKbYL3BxdPzBK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68003a64 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GY4BWdjpb_dk1TMi0HgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mKmivVvlcrsMSofLyaVIRFViKqp6Zb_d
X-Proofpoint-ORIG-GUID: mKmivVvlcrsMSofLyaVIRFViKqp6Zb_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

From: Dmitry Baryshkov <lumag@kernel.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5


