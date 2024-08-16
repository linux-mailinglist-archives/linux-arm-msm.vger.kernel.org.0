Return-Path: <linux-arm-msm+bounces-28770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C9954465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7708BB22C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542D913C3E4;
	Fri, 16 Aug 2024 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HxGMtcnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4A13B58E;
	Fri, 16 Aug 2024 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797170; cv=none; b=rDQP+/9YwqJ+vyNP2OCfjgCN/xjE3OMh11XkaucpM7xC7cU5ZhCmwEFFrQSeMUjajfwy3hMPgQu/WngZLtYGQDPc71LO/wbT4jZ/VcKE3AvdKgps05MfKezsVtTFC7L+4lGjl8Am4mnrkVL0yyEUggJ3Pr5mZ4KJBgeNVNhcrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797170; c=relaxed/simple;
	bh=motf4zbbc6icnNmJ5gbKPHowMnZRw+SYoPHWrnPrlTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tyP5h4XcP7Pj6BOwVIl9UEgyzwRZ7YO5kfomaksShCiAmvk1U/zDjo/7Jv0eQHZxsLRMQ1oxzJc29aeeiOWJuQegDY7AjtndRlvxMC1Lby1wgk77E4+PMhlrUBDE8LEtRyKsMWaLovS7qtopxjaF23JUuepHFrxHEbnFSNLEfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HxGMtcnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKcY7G018931;
	Fri, 16 Aug 2024 08:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ban5cTb3n/qKls9JXkwzawG5+IRuFVgl9Q7z4Uvp6u8=; b=HxGMtcnEz7ooaV9X
	44sfI1/3t88+34CDWj/Xjrsp+T5iXX65aO/ZZ9clVFa0I2HP6UJfbtL7DX6yGKnf
	V+8fHBpkVESHy3lW2oCOwwB1WwLFr9C4IZk+X9zAcqcOh/fZq8TDZN7mEODPzloJ
	oTXtS2QvY8LbReOlmOOLBbIQjVoaUrpdLjxjA87g617hk25+/7uX183z5Zm7/gQg
	tnTdXzRF6DLqROnWMAuzTik50ufzPzx0Sbb7TBR/3H6lHKf/0xP/2Z3out0kcbUP
	yiTS+FET0mVbRJzSYa61Toc4tSPLsefFi13CWP+zys3yGdXlM/uV/8Mp3Ddh370p
	vLoLEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr98e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8WhJk023228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:43 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 01:32:39 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 16 Aug 2024 14:02:10 +0530
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-qcm6490-lpass-reset-v1-1-a11f33cad3c5@quicinc.com>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
In-Reply-To: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _wldcVILx3a5y1w4V9E6NECUM_aQ8Axu
X-Proofpoint-ORIG-GUID: _wldcVILx3a5y1w4V9E6NECUM_aQ8Axu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=927 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160061

Add the new QCM6490 compatible to support the reset functionality for
Low Power Audio subsystem.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..5d6f74cf9c43 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -26,6 +26,7 @@ properties:
 
   compatible:
     enum:
+      - qcom,qcm6490-lpassaudiocc
       - qcom,sc7280-lpassaoncc
       - qcom,sc7280-lpassaudiocc
       - qcom,sc7280-lpasscorecc

-- 
2.45.2


