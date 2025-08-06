Return-Path: <linux-arm-msm+bounces-67834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA492B1BF41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C9317BF10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6FE1E5705;
	Wed,  6 Aug 2025 03:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KryAoK/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBD1E51F1;
	Wed,  6 Aug 2025 03:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754450305; cv=none; b=jC3OfuMTTqYR1m0vdJ/qXmJfsOaHAEuLHMZQ1CBRRwzebbnRet70lchaCV3PzTXvVE53unBeiKON1nIQvsSJcAoKLIcYGjtwRSOnZ5l27Ow+ur5TO2pxJdbPtExBr3dkHJWuV/oorCKKlUeGj0K2bIbnPKTVd31vbuOH9WrB8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754450305; c=relaxed/simple;
	bh=NVJKK4rqt8V2ccvknALSHEvbbLNwQvJThM7B5dXpbrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PLwg0yjzcF/ysWa22IAZf+kb7F9FUmgKpne1wQmZ56Td+Kur7wDu7G91nZHc/Ye01r8xoHR/dLZjg8Ny+QeigDISUFHvRiyCvLN5c0xqMlA8IorM6igatCEfTUXiwCfGSnpZiA1kPnxWF5+cGBCafJ3MmN0tH0shxkzxYAcjRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KryAoK/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761fAdq014984;
	Wed, 6 Aug 2025 03:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMuFghrd01AH/MWxPBYGy+BvAX5eeNijY9JTlrpooLE=; b=KryAoK/uFzdMY6Jm
	ssaLfiPfxaNAumU03DZrpOw3UpFVcJhohvvdauCBtf5jv3aqZeHElf1424eIr88l
	DgIurrXPG973WFfrXqCXfrD0AaOHkQWilyGIO5ih14RzcmE/j5ahUybjZKefN8fN
	jE3HNyPnGH0jmecCdmr1+Z8O6ssp3l6SbK9ifhhgAfPDv6k7mgWlu3utR1VBHLBw
	L/JCUERalFXXBVtShcVZtJk8CHfGzuhooLA2ZtVFYW0aX+JWF7p6Ela03qIv4766
	Vjnbu0LrB3rHIXp845KYqXVQxYUpJ0iVkGy024bcO3RDEYObsIAheQ3QaMlP9bxC
	DZTcqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpycs86e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 03:18:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5763I7Y1017695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 03:18:07 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 Aug 2025 20:18:01 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 6 Aug 2025 11:16:48 +0800
Subject: [PATCH v6 4/6] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
In-Reply-To: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754450255; l=972;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=NVJKK4rqt8V2ccvknALSHEvbbLNwQvJThM7B5dXpbrY=;
 b=5CaZkSEZSEeJLMjlyjyv8jwKd2c8F7CZMuhgBDDcqkby2ZZCWPJOrxfRsy/nGo6anyoZZC/hb
 ZEGZdKgLTYmALkzSzIOUcyjeCs6pR9BGYxv5ZKG4cSFlo4gGL4oLY9E
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y-rlWFYxsE-ZfYrZpyNRmeRVEKG4N9h0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX4L8OEIYZOH6I
 OTSjknaedvcLQxR6/A44gMQFNCXthZra/4mUhJmlDimaJLM9KgQNAmCsAzXl2Fq98p3Uszyh0PG
 yAHk9BMSn88aTZ3++xylxcz4nre+JMD8S9mVtNfaZfkyxpnLmIPGFbT0iRGH6o2VS0U0akLhUpL
 uajHhLEq2bn+knsUn06SjC5QiAEbEIYdrHcGRC4b1edOfTKVXO0m4InHnKGRxcwQ4EVoyH3P0og
 vNWIGWQV4XurKTnxLGJ5aPzIMF8XwrprfgMdCccdIED73L2pHAZ2ldogv05zGqto65QdDG6VmEj
 vlPxNWPxq5qK3WgCHt+fiAczugcCimlZVU6ixw3XOMXshWy0culTfZODDzJSmP2dNaq3ycVVbYl
 1rEaTyMN
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=6892c970 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=56KCLgTT6E_AFdM1kc8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: y-rlWFYxsE-ZfYrZpyNRmeRVEKG4N9h0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1f5fe7811e016909282087176a42a2349b21c9c4..d77b4dcb6d798f9f0598c64a593f0bbebe85e831 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -556,6 +556,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1


