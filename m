Return-Path: <linux-arm-msm+bounces-61628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C08ADDC0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE5C4021A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 19:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFBA2EAB98;
	Tue, 17 Jun 2025 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B04T2Sdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83132EAB96;
	Tue, 17 Jun 2025 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187329; cv=none; b=LN3ju3eFfv84CelGm6ZikOe2QDgiFL8dQEzNk1TXrm0bba0T6/EjP49jAZtvK75Uf30oRchBOhIUvDmrKt03fl8W+Maax8MGOdD+swB18Zh5hG1wsRwaVodihRlI4+lHIkAT2IE0GuHdC5Lif9LXKzylZ4XRiAUa2CtXLMMmzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187329; c=relaxed/simple;
	bh=n1RnnRn7zcKBf3aubASb2Ui9nc+UlhqFfJbpjP1A0OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q1+oV/w/706wZoO8gkias8ZgICXexPtVS1kDlbVXE9F8v7h6EsI/OFn3ciOp/OXLgdkTbKnWcD8EPxE+0wIzoRN0deZlXWotez7SC9bJ0+uNRVPPa00/oYGZD7hCOz7gZT+5HM4NkCfnIg3bU/9j4OSX92gJ8U1mMdnUkveZGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B04T2Sdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HA1ToC002309;
	Tue, 17 Jun 2025 19:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oH0lYP8nwi7L/U/n93qxQjFZYHUtmZHvTGV6rV8Ua34=; b=B04T2SduON+slpyN
	mUhwbdPWk7T2IUOFpEgOiIoOyq4bkdvLbNN2XPVhHItGOiAJzGzwCK4Ktq3uUtBD
	ylnox+iBabxCtGNpgmoq+EUUbzb3Psl214uITeeGHDxvhmjq2ueMJ9Dch2uzn8VW
	QP0vPmKo7OCe5KqyjYcspAZPLDf6emF7clYLq+YBMIwDvgjA3WixYEovKl2Tqdt6
	XmpHHpxfxAYy9uXC8OMLccWIvQRpTmG1K0n+CFYGrZCWPgUthev3k0XVnTzzXyGa
	5IlmcFW6Y6nOeRDS/4u/9/p5Qgcm6GqkA38PBvDLSb0GR9Alvnv83ugeanS446+J
	SHZ1+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwcwxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HJ8ete028326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:40 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 12:08:35 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Wed, 18 Jun 2025 00:37:27 +0530
Subject: [PATCH 2/2] dt-bindings: clock: qcom,sm8450-camcc: Add minItems
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-2-02e83aeba280@quicinc.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
In-Reply-To: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FkNtoK4tNTFRHR-SRnlZNJjUZbTLSvHS
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6851bd39 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=itb3sOZw9SQNzPTiAAwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FkNtoK4tNTFRHR-SRnlZNJjUZbTLSvHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1MiBTYWx0ZWRfX8PqFOPUbUl6Y
 Ty6m9YmNqFLRncej6wjY3Vh473LSwV+vtWg8M6/tsBd8LmN1ObSTW1xh9fFof8vM+fK/59G4yQ+
 ErQO7QN6RJ7Zy9tV3ORBLiKUp0WTAlWHDYbsqjys3MbrA7ZxtKgC0kNKWHQZExsQCa3aiF6ECXa
 L8EGCPC23f/VxBgf6jxvurxfS4D7Kg0p1zSfFUaKIHBwEiEB0aGQkGyJrUT9OUoR/WOCFiuiaOU
 M+UaL5hUrGDwBRLQT3Y+2X+KqH/WugPdy5F3rzkL2nswTbkimiH5o95XvIX5SleqPMoWeoIuOr7
 rxSHjJ/4v4le8l51j/RIozdkMOARF8+rNHpcbF+QjnQkBOGt9bCWM2nFpTWFizAzP+e67H/Wxt0
 O6JRRNELwNCuqNKvT1iuUNxfju21hTOXgZV4272gDCfH1yd8FOYjBzLUu/2Mvr/9h+t7QgHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=822 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170152

Add minItems as 1 for power-domains and required-opps properties
to allow this binding to be compatible with both single and multiple
power domains.

This fixes:

arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000
(qcom,sm8450-camcc): power-domains: [[106, 6]] is too short

arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000
(qcom,sm8450-camcc): required-opps: [[55]] is too short

Fixes: a02a8f8cb7f6 ("dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506151907.LcLf1RIB-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..6a530270e5533977ac11863703156122b93690cd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -35,6 +35,7 @@ properties:
       - description: Sleep clock source
 
   power-domains:
+    minItems: 1
     description:
       Power domains required for the clock controller to operate
     items:
@@ -42,6 +43,7 @@ properties:
       - description: MXC power domain
 
   required-opps:
+    minItems: 1
     description:
       OPP nodes that describe required performance points on power domains
     items:

-- 
2.34.1


