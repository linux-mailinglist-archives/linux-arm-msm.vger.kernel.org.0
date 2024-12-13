Return-Path: <linux-arm-msm+bounces-41967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 990DB9F09B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF4228359D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415291DE893;
	Fri, 13 Dec 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQx7+RON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB651DCB09;
	Fri, 13 Dec 2024 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086220; cv=none; b=FxMRupze1qvuRq5iZltG/iu1NMQZjg7M48VJgNveF7+9bfsAzykOUvkXiDpkJs2PBEN95b0PoDP/RWu42r6YfZe2Lv0c/EsrIWMZy++zeMWt+twZK4GhAs843SlATg4zsN7qR/QZEoaaGoUmq52EsxwGq6VJ9wUXVVBM2e/dM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086220; c=relaxed/simple;
	bh=RR508Py0GrsIVm1vO1pZu/kfccFAX8fO5qihsw6OvrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HLdl4fx9HNyokaTDR8Move0Kz0OnjSf9mO8QtmwBhcBkUQhSHAuhm0Skf6/UKL+JmNWaeZwr5AC+sp6cqCd/y6/pfce9bngG4DcENCOzULjgA2xPpn4Byqb0LxorIcbZn1wCMxMw6JshGynhHy/GV4TeMiu9VSzdHpSyrGbK+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQx7+RON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD2ktxV000477;
	Fri, 13 Dec 2024 10:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSrvOeBqw6/BKEcIxK90LwVEjb815UgCKd8egNa/ivY=; b=DQx7+RONLd+Tp2Kr
	RJsfMJSaq/XdiLf/SZ8MPi4HHYzV7TC3WlqpkImNrgqJo2SfAaT3b1yBgYjl2vIA
	E9RqMxQrwKNW3bxG0YaQ7FlXb71npP2ZzOnys+C/bkGl6jIpID3MWejUG4HvO1gJ
	FfSMSqumka/CkKWNYzct1FfbTMw6QxhydSEbdV6wer5g2E0KWO6WwwbFRsTuqATC
	bs41wo0yDSACfmZFpPd2810JiIqj6i9qEy6s8LB0SsBrNeoGqd4ngsHJkl0y8FiD
	5bj3a/6ewdE2oKkcyy/Tnajm68BK+QhX8ewjxK5LNfDyzNHhqNIKDxihCWwzbIhD
	STci1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4gxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAaj5f031660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:45 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:36:38 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 16:05:46 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>,
        <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>,
        <20240924143958.25-2-quic_rlaggysh@quicinc.com>,
        <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>,
        <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>,
        <20241122074922.28153-1-quic_qqzhou@quicinc.com>,
        Jie Zhang
	<quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734086167; l=738;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=u+iSD3JSUDA63rKPrQGUzhwFM1Y/Nk8GByIy9VWSoz4=;
 b=vvLwt35uXD/X0XkjjYE+BXnbdBhZ8KaUCane9s9VNAqtkmsayHZALazje2/228rLRWnOXpFDN
 v+6hhEm0m5yCyMLIG1QalNlBNW9k6LIqm4TWOqJWUUOZirQmgtteS7M
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dncyKcYaL35A2VGAfhViVDVVmD2xpQOi
X-Proofpoint-ORIG-GUID: dncyKcYaL35A2VGAfhViVDVVmD2xpQOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=969 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6..860a0db1908c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -202,6 +202,14 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.45.2


