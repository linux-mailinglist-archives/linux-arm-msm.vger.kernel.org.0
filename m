Return-Path: <linux-arm-msm+bounces-44468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF47AA0689D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05781636FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1AF204F64;
	Wed,  8 Jan 2025 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k4BK9X8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4FB204C18;
	Wed,  8 Jan 2025 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376200; cv=none; b=M3XKsFJZ+5fXX8FkLlgFEszdeRHu482YCI2+UeIpSIj/UscJ7oosgFWoa6Q1gKlUd4zAmQ4Cdi1BTXfBzKvPj+d3+xjXDO+FUqDr2JF96XkD8vKGS+yylpvaAWoFLcnya+KF8uuoSMaTRfYf5s/CJ5AiYMEY+1J2BKpf8qkJ0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376200; c=relaxed/simple;
	bh=MVGmzpqNDpSBUrycPTIpKKCykWrSDGJIT8p/a/z9ckE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZRxBV/bXQM6X210giLernjgs/nDi1BGPkXu/Ti10Bn0CMxv1U1MJQ2PNiRIi6Mg6YBM1Fl2iSu9vJnHyTMtOT6rTrbaIm+awdOGqFX6wr/1anZI8BhW/Fo5bdYplwd1AO4wbjyVe26XCvhySU7cEeqUgTHkaKT40hkdHYe+oInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k4BK9X8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ih0L4008331;
	Wed, 8 Jan 2025 22:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngjlq6XMiYe36MvN4diWa1xHuSQJP9M/mpn9cKbmBWc=; b=k4BK9X8mLVJdUv18
	HLydOBoHSw0ebAoxK+/zCJhRNlAXX0zHCwyBfneS983d5uvPKvamjIlpsskZ3wH1
	6lRiEghj6ivqLLFIW2u1MOn3wUVzO2StXwJHMF2aCslrUDPg0888hIQdPIv78XKO
	SwXnjtKSNayNag79mD4OhchdVAVd4Kl2pogU7LMLPfa6XI36yu1PgaKP2d0WZbyo
	Khp8c0Svs2An6DpcpdFUPxggCvWCufI890a4OyzsQjNjPanllEZ8l3+ki1zi5VCq
	QzAMg7rEQYt63pA1odygb9Zs2+sIvtRVuX9fUOaBIuSBF1UFRTG1EWL1Dkbo5A5E
	XMsPMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrfrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:43:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MhAYh031469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:43:10 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:05 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 04:12:39 +0530
Subject: [PATCH RFC 2/4] dt-bindings: power: qcom,rpmpd: add Turbo L5
 corner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=814;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=MVGmzpqNDpSBUrycPTIpKKCykWrSDGJIT8p/a/z9ckE=;
 b=HHtWlFZMjLVxzdrUeURR4dTtiaxKsxVAf4Pap7cBx47TovmMA21laNYbb65hOHH4n8ozOW01h
 VXX7MjALbEWDePVnwaqTA8v1blN3yalp3k8UxGLBgLajHv6LTHTTCO8
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Yk4d-q1-PXyO2QtbG5o92cNE0Qvh612n
X-Proofpoint-ORIG-GUID: Yk4d-q1-PXyO2QtbG5o92cNE0Qvh612n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=788 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

Update the RPMH level definitions to include TURBO_L5 corner.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index df599bf462207267a412eac8e01634189a696a59..5bc4735fb3e6e06ec62a352e2d40503b01084fd8 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -240,6 +240,7 @@
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
+#define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
 

-- 
2.45.2


