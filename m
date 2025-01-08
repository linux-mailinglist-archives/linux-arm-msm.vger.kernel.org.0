Return-Path: <linux-arm-msm+bounces-44469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788CA068A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12A6616442E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E963F2046B4;
	Wed,  8 Jan 2025 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W/UVThOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636092046A3;
	Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376206; cv=none; b=t3C2xE+DGH6nJJ2rmMkzA/lE88XKpOZd8odYskrItnY+MmdmaQEa4dEMkHtDjy7NkGT9LHrjdsOa9Mqiveq/lVGOJ0dGq5f6U2mQFT+V+1bpkZBa37RXEaaCpVIEpV+9TfD7Fgb4aLrIpNSYtHIhZSE+IaZB4hNI/+RAUETKIYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376206; c=relaxed/simple;
	bh=PxnKtY5gI0+QRjTEljYpLxoPBV1v0B5r5dUPZ38e0jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SA+kIlKOXGbco1qWpotOzmJZyjeYxOsYGU71V1TxN3pWppMKykldlIkbOX2Pvetk/j1Ae/UmjRwI/qvChmc7l8+KP/cKLHdx5xI+hEHVZkLtlLmXD1RW5YcQyDv07ZJ0NgvM4l4s/l1PvMJVS5DePAAm4Hhger94VIz9e4O1j6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W/UVThOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GcaML002436;
	Wed, 8 Jan 2025 22:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBHOo25UrNq+L+x/nqcsi+UvzqyZWh9QkF0vrVd6Pd4=; b=W/UVThOzBtYBFlsp
	/0BHu/9zlV9N5Q3aA45E41/+LAOwoVQqv4ZP2HEEYNZJA6onpkklR6UKrAMAx3uz
	nl0CCB+xrlubfw37f+y9SagG2yZeoZ+S6U7qewJsqrfwU8C2YsWKHSlMIc4lEW7M
	05xNaSqpAaoCcadae7/ZJejWc3oSxl03KJj9E1Xni/D6P2NyeXxvCodbb3A9V1aP
	qlwLHxZRC1HraTA5XqNjEkXFPABd5YdbyC3rtDMviZhEuwB0zamaK4PosgFw+Tv9
	SpMj2qFecxDGIARNk8iGnB5mfFurWlQ633T3ggxfpgsNohXNoDjpWcKN5ly5pd2L
	8kPe/g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w2j8sy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:43:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MhFqR020870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:43:15 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:10 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 04:12:40 +0530
Subject: [PATCH RFC 3/4] dt-bindings: nvmem: qfprom: Add X1E80100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-x1e-speedbin-b4-v1-3-009e812b7f2a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=806;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=PxnKtY5gI0+QRjTEljYpLxoPBV1v0B5r5dUPZ38e0jc=;
 b=29gdT99U/EiFaSG6w+dBXbtKbflLTau4MlJrhMBGFAMzggxyOJq3aHbPwIrTv9xvtQ3Mt4KQB
 udWO/FgMjVDC3sKu6KXquV9+gaq6utyMrq/WenGFRgwUDQKXXNza2b5
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ow6Aq6EYRzyxYBTgVLxoHRftgwMCwxrs
X-Proofpoint-ORIG-GUID: Ow6Aq6EYRzyxYBTgVLxoHRftgwMCwxrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

Document compatible string for the QFPROM on X1E80100 platform.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 9755b31946bf9d4c1055a993145d06c274b61a37..25f07f93345af83015b2c2917993e460cfd6799e 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -47,6 +47,7 @@ properties:
           - qcom,sm8450-qfprom
           - qcom,sm8550-qfprom
           - qcom,sm8650-qfprom
+          - qcom,x1e80100-qfprom
       - const: qcom,qfprom
 
   reg:

-- 
2.45.2


