Return-Path: <linux-arm-msm+bounces-35291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 900879A924F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0781F23727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4F31FF041;
	Mon, 21 Oct 2024 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="op91NFZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2411FF03C;
	Mon, 21 Oct 2024 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729547237; cv=none; b=dMrxuKqEzuMA7lXMUnpSRfUbX/kfmeUmkNU1Yppovt/7Kgw7saaFbIXSDKmwBEcZZW+GIT6CW/MhJF2IcoSorY1KMvboS/4qV0xukx/D9yWzCE/2Yvkk51C3FdH3Fc4g3GPr8xgxHcNwUPsNqlW8FTwsi/mx5dTEk1vcyOu9zJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729547237; c=relaxed/simple;
	bh=I85jtUxjtU48rl88MM4H/0XmHUTM+LJ18JgBmrDST3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kO8BzOoeVuv20XBbdPxzZYJF61AdgjB1LIbAlgkb+KlDcYmdnuFGRb4hZCa3diR3jPgbxSqYXOOfjvxzyFgxbIvcF/+N4qGq+eCDzqDwBQmtXAYy1AZkvuiVFbKnvleM47i41blMdc4krEFq+nOvBKkZ8dxmSVr24cX82ixRoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=op91NFZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LI3TbC019311;
	Mon, 21 Oct 2024 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGggl/xOJY/lZZoDh3sAVjiQOt4H+Uyj1ITFYxIIxrY=; b=op91NFZ4VQHdPNcv
	2uF8lVHKzMDLZMu1PuxOhRvhg6/vJo6kTVYfMBBFt9SNGJ7N6DtMeP2ti5sFYEVG
	BQKEfKV67bdavllDEfOKdIlOQALbRw4bdwEKm/FiaIViGzF6FT++nBNh0U/Dgfg4
	MpAuwDRb40bPRNB9CK2o8429c0i4jhHXNMrQULRDwK7U65zd8ov9We32aC5raFWn
	Bi0N1G9yiqLfGy7yYze1192AfoMEaZq88pqAlHEuGI0h9v5JS/VrvLG4kId+1c5Q
	kH8LoglImDNQTMWKTzwfWkqQ8ZFmOfh8X0YCMYpsUzJd6m8i83wewwUEBz3N+SgT
	NeXMcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc666u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:47:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLl2CM012185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:47:02 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:56 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 22 Oct 2024 03:16:06 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-a663-gpu-support-v2-4-38da38234697@quicinc.com>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
In-Reply-To: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=790;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=xdZyo6wGz7PQ/GZCPH51SYKINn+9TUvUW6JOZqiYDao=;
 b=oEspt+TDCLD3brYf15CY7EVDTYVFK5qXJLcBUrbHYEvKcLAIxRb+wgN6OwK3tXWS4OnHxE8/H
 Hx/lN/58lHdCEqd0DI65ICzMzZXTkDHTcRSdLta2YtMX+PBF+zlXunQ
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fHO1M4sr2e3jBCKIx-yEVH6I7aCZy5E6
X-Proofpoint-ORIG-GUID: fHO1M4sr2e3jBCKIx-yEVH6I7aCZy5E6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=975 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210155

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Enable GPU for sa8775p-ride platform and provide path for zap
shader.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
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


