Return-Path: <linux-arm-msm+bounces-36366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664799B5C3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC372844AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001EC1E0E1D;
	Wed, 30 Oct 2024 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gzkCd5FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC31E0E07;
	Wed, 30 Oct 2024 07:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271786; cv=none; b=gGRLbanDUZvvc12NC6w1jmoMCkepRBY3IeN+hqXbzasVt6Sj4ruG9q84RMcvOG5E6ujViz/8A3ihkeEP+qJS4IXrkXXObPyTmwQ7FBnks4FzxKtMO4Vlym0BRaNFQE9ci+q14S7I4iq8KgIE9Cdn3k+UbQStgozdoC4N5sMizA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271786; c=relaxed/simple;
	bh=5WiAkWihH11CzIDFl4kz+Q5IJawTmDqs+Qy7z9qTFIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J0CH0teUmKRvvUDPQPM0Ebs0PejIUAqmnGYcngo2rt7UhIRqboQBLt4r1gtIEN96FHxmVqBZoQU7aUQ0Hl58g9smOOfsVhV6TxuJNL04SkWQiko2+e1B3wy2+/7+FmCM7xYMj4dETsRS2BZNXY4qAtOuM8hJ7M0rYZ9uZZUW2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gzkCd5FC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TLipI4001060;
	Wed, 30 Oct 2024 07:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s23tqQyzpVVdNyZHuQNiSwIPGeoBVfPbBXg4onrEcUI=; b=gzkCd5FC+4qqnwX1
	JeZcmB12dLWsqbQVVa7RS7PyqGVx1iLwO9Yxnzqw6Vst/wb9UuCp0L5zQ6D6pUFB
	sAji5H8uZnjEOmHMfuuXGB4LAJIcxHOIo7F695lKLt9bxfIT5k3M7MHxb0zWXWV1
	m9YM4V0tCQBlSPg4hW4pfCgqmb11aeEIHGfAjnsOGYJYfjHCE0/p6SwAnNkHS4o3
	Uo1v5ibf5M7N/yy6ef5589lAeHUJ2eVdibawquJrEDtjnY6xCsvXBWEo2LqVsd7A
	7pCk/VG43uIJu0m44af0Bz9tHegIXfQXRQSoNXZMCk+ldq5qyPAdoV64QdKeBaLu
	Qpd18A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn531th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:02:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U72pvQ009408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:02:51 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 00:02:44 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Wed, 30 Oct 2024 12:32:03 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
In-Reply-To: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Puranam V G Tejaswi
	<quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730271752; l=851;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=jl3C/K5zNs5Qz73iOQT3bnzXc+XGYQDniyPGtEtpHRk=;
 b=QoJYQ8RbW/+IIzDsYJDxaKrsD5pK9zdaqAVQXr+oHQZs3a967xaKcDVIn2ZI8Y0B/reOmCb1q
 TBHMjBOvIopD/ENhuL8vnCTcdhPcP6yMJaMytAAiFRoqApsznocL++j
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 20JNOFAimu6eWBSS5q0NZcMQNwXLMudx
X-Proofpoint-ORIG-GUID: 20JNOFAimu6eWBSS5q0NZcMQNwXLMudx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300054

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Enable GPU for sa8775p-ride platform and provide path for zap
shader.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..4901163df8f3 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -407,6 +407,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&qup_i2c11_default>;

-- 
2.45.2


