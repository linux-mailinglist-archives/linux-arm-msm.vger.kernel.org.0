Return-Path: <linux-arm-msm+bounces-35289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED69A924A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1731EB22875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F411FEFCB;
	Mon, 21 Oct 2024 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FhNqj20G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B031FEFBE;
	Mon, 21 Oct 2024 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729547223; cv=none; b=nnBeTaxu7TjsA9MD5Tr7pMCBtJaU4R8U5RH65x8/prSBMd9sCRLbpBK8G9ZgZUbg9A0gcIUW3ijnvhVxYHboKr+GO6HgfaJPuD195b3wHn5HUp829A9LSxbxo2C3wCfJzaLexzkWeFl/8dJte2oXPJGFdr29LpvE8A+oAUWiogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729547223; c=relaxed/simple;
	bh=+zDgoEY0xz1FFelkH/87klaYqkm1t6oPujs79j+pQrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eXegzXLBvzWup0LG0DhWJeGObax2jPSVJ/ZDfj90+TG5OSi6aofGh9NOKU+qa8FD7JujJU05yW5umPNltDGqmMGASIsuDzhDO6dvwO+S2LJaoFl203JAVgkkI+oNvJ75syjS9halPyq6v3m7dtiTZ9ycP6AEVSKy17EOg4TjXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FhNqj20G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJ4XU5001068;
	Mon, 21 Oct 2024 21:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+7pe0Etglq+m7T6Gth0ydJMqi2ONqoXWMPn9BEw0xk=; b=FhNqj20GHVbOi8Ec
	z37NNb9eaBQSjjp3jOoCHlSyUXpDccghrJWFj9hGrXXDEPw7erGGeyoeBeKnO0bE
	v9rUSURpEQOFnNZqWtSJmRjibNg+qrpgtX5DVcjRv8lH9Mr/AEqLXhKV5qJycdA5
	JAeAl2PEkkh6jQh0nfIcMWjvmId6BzKn48Rni71mRqxnVv2Fux9LU45se7lTHT0F
	/4MOVQnXXKZb5csRhdtwZBc6zCckSbsB/oCZgjH0siSZ776RAQ9CPbgBt2yT5M2u
	13nQbXCLxKk3opwHMmniQSCd9qZYzP56GuDGsNRUffwj9JyabMtKwPF2T2qvl4sj
	qrVqkw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj122gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:46:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LLknVf027547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 21:46:49 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 14:46:43 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 22 Oct 2024 03:16:04 +0530
Subject: [PATCH v2 2/4] dt-bindings: display/msm/gmu: Add Adreno 663 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-a663-gpu-support-v2-2-38da38234697@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729547190; l=853;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=5ty9yWB04krSKP6oXUH4fF0IPi/sf1FWkqRzOOo+nNo=;
 b=cxt+BsccR0s2Zw527V7TeTDxCV69cKVoqQp7tOUg7JZITmweJOjWY9aw3kKKX7RfEayb7Jvz0
 3uTUNny9owuAvCOmpBzo6V4efwaDueZePsPP4dsUIyLwJBsVm2cfDnH
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y0WTXpwukYtZ6oAl1iBviPlP_GagWLXd
X-Proofpoint-ORIG-GUID: y0WTXpwukYtZ6oAl1iBviPlP_GagWLXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210155

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Document Adreno 663 GMU in the dt-binding specification.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..ab884e236429 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -125,6 +125,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
+              - qcom,adreno-gmu-663.0
     then:
       properties:
         reg:

-- 
2.45.2


