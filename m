Return-Path: <linux-arm-msm+bounces-49759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73EA4898B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A8316DE5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD73226FA6F;
	Thu, 27 Feb 2025 20:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="anTcqO93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B75926FA5E;
	Thu, 27 Feb 2025 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740686959; cv=none; b=aVkRtcVyW6TtJzB0Q20fxqpfz54LXKxOCZah+Xt59C5FzKYQh7eufqxsVwm/9DG1UmPQn0TSGkwZNYviCeMavJxJca6kDs3MtoDYN4HnXNZjALMsIDFli+nypkwb7wMgzbXU9ddl1y2mezYm2DS1LALnG44Un2n30AvS37pOViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740686959; c=relaxed/simple;
	bh=F7usVzQ0Inta3JlAjy+ox8aqluRqb7vk6q7e3z8Z3jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jSEJ4fDzHybzcNnsqbjwPDxARS/pzxoy2EXqxD4HQZy3yDPpITEhmbDgOR8NF5di2Ol0QU9QCJc0brQvdJmYwDmIQKoiBS/Of2Gzpp5Hl3i4RR1KYZnsoAbY+nynDu5mPcwMHbgtHdKLg2T6tB9BznB6qBedFBiTNf30V5hrSu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=anTcqO93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAmHB3003268;
	Thu, 27 Feb 2025 20:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJNGRAA5W0d9okVSXO4BPgs6c4elS/ruoJbGIngO90I=; b=anTcqO93oAvRqGJW
	V+bJPq4mRy/R7tPZw95w+XgLksV2l5tOyc0pIjbnkdLfczIvUx1PuuNh3PCf7dM+
	VE/vANreklv6StsuntP24kQ52t3E8cvKipy5nWxHb5n4MgpZ3SLBDW62uCeujuDJ
	U6SnbABYAhJ/+QqAF7gUOyLLJ3tKTWeVzkhLHzccvBhLbbmkjAYfyGtoqphAjPV/
	QP6jESeOehxyLPt6E9xJRZphe+shMOciLvhAeKwW9AUwErK4zWunF0lSNwcNcWTk
	Vbvo9/8YcBPSEYgoMA/8dGF7OsqE32J4BmV/MaIUzfM1QjibmtWkATYTRm/4Mk4k
	ghfp2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7hm4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:09:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK967M011700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:09:06 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:09:00 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 28 Feb 2025 01:37:54 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-a623-gpu-support-v2-6-aea654ecc1d3@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
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
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=851;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=SLqrWslc9+dGwuPw0tM3Mj79iVa07v05e8RMDZ8vSlg=;
 b=GjgGEWCNcuSuAhrs4NRCbkTyvXpuudzqusrs3VbsG4Usr3mmhLa3n+AbnXKxHpqZbPxU5ah83
 y8RtwyG38scAkFCInwDN9QVM4zyU9LsXVzM6bQVQaifQVuI9bpvTP4o
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eB3NaBkxDhdsfrlemjyCe2jLhi0af0gr
X-Proofpoint-GUID: eB3NaBkxDhdsfrlemjyCe2jLhi0af0gr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=902
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270149

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs8300-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b34356bbf8387643e8702a2a5f50b332f..5f6c6a1f59655bee62ca9ab09c4ee60c1b826a66 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -285,6 +285,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.48.1


