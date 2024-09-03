Return-Path: <linux-arm-msm+bounces-30458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79919969392
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311841F244AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614641D0DD2;
	Tue,  3 Sep 2024 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EYbUHWsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF21CFEBD;
	Tue,  3 Sep 2024 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344532; cv=none; b=avd0g+v7lWBrRA7KksWc19oJ6tjDefrY2vtkM6Ckis9vKmnVg2HFtxAcgUmB20Fj4tmKIS3vahSADD80HWG42cr7DzHUIz6aPbFntxxgMrexiyhZyyekJTU9uRBf3crTkCS1Nj6glUOuxWEQggWvRgkpzQyR3+29PogX/YcWRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344532; c=relaxed/simple;
	bh=GqvPdGBNDoggpY0n5QCHd39wSlDF81G4hRsV2AFOkmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BM9QkNUb5iK4LuVSYJU3cxv2tm76ZKg/nHP8HqiFAx9JCP/FcwzwM6r03kCF6cyKP6ULcAeU7q39O6IGr6QoNqscokSh73jyJu157PwKtwQItvBiWMhMn6ibMCkzc4uD9hBFcskWN6C2Mbzlguo0N4t8PtBUAeGkQf++R2Au6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EYbUHWsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482LinIl020956;
	Tue, 3 Sep 2024 06:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SY8oVpGSZcJQC8wrel36MYff3hMitaaKEf5Tu0S7Uc=; b=EYbUHWsGzlEfOFes
	KfDSOWdUv40wOWc92s8jaVMZv47/oDGbwF6es6IA2zICXxTck4VhgdBcIQMyAYvX
	k6ty9o94X4HqxfmT+6MGglXVMBI8tjeuBhld7+sIg609WKJOesWj7rLCcpARAPpk
	pwgHlcOvDwPqLMym4CX+Vlut41u9H71vFzbXwtjVDHnFN3zu51ygGA3H4gJIHDaG
	DFkj2g6lIq00RkPr8zrlgpCAF2g3tknBiJGzQ+64ZEVhqltKXtlVxKS9PxhVTTCh
	HeyDZgWIHoI+MZ615MIshVi7DHsfD3haAr5Hfgtev++hEE400Wm+WXAA699b2gMx
	HsDotA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxp9q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:21:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836Lsfa015136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:21:54 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:21:52 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Sep 2024 14:21:29 +0800
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: add num-banks property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240903-qcs8300_llcc_driver-v1-1-228659bdf067@quicinc.com>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725344509; l=748;
 i=quic_jingyw@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=GqvPdGBNDoggpY0n5QCHd39wSlDF81G4hRsV2AFOkmM=;
 b=l19bW8Sv7etrVPdQG5hwIb/8PUAYqjE1nuqnrY0UDovya6KtKefHoVglN8PULgEWHKyp7/hnQ
 oasNUFB72PNCA2XfobgqZPyq3QxTwu7sCh7K7fNXu/H3ICO8fjh3MhH
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=3tHAHZsIl3cClXtU9HGR1okpPOs9Xyy1M0jzHw6A/qs=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MvookBzKm98v8NdstauTpi54fwdTJ-6y
X-Proofpoint-ORIG-GUID: MvookBzKm98v8NdstauTpi54fwdTJ-6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=662 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030049

Add a property "num-banks" for errata.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f..03241b719c98 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -56,6 +56,11 @@ properties:
     items:
       - const: multi-chan-ddr
 
+  num-banks:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The num of llcc banks
+
 required:
   - compatible
   - reg

-- 
2.25.1


