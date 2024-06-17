Return-Path: <linux-arm-msm+bounces-22785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536990A11C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 02:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA7A1F21A66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 00:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045C8C142;
	Mon, 17 Jun 2024 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jBAM9rLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CF4C6F;
	Mon, 17 Jun 2024 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585955; cv=none; b=e5wI0vBS5uk0aE4mvIpJQ4Ycn4RstjCZWwaLU0wkcMyAIpsYwLJGD02OXim4d0SKJ5CxxxZZsWBo4dELoNEHwXECDOh7AUG1TCX5aBCrcZ6BKaQs9JmlSunXYG9vSmin30UgjsP2MoW0QcGg9Gw72eLq8U9Uzza5I+A2f2ZNtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585955; c=relaxed/simple;
	bh=T0omOsOo4rta8Oyi8fPRyPGJpNrN0+tPjxGN5h4MItg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ic+uE7JLw3yzWZwqsSE2cgCnqXfEZoHhM+Dfm1W377vTdPbRGe+QBuRwxtznZQ78EcTw2RmpMJoGBr3ri3sTuhR5eFNvG37KAYzn0dDOEH9BtWEYlhMsnyJzZeG5KiLRxa3rXe7eyvl0dmDLm4N9DbE6AMIRQx2qEfPNlcRoOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jBAM9rLh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GN9UQS009282;
	Mon, 17 Jun 2024 00:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpugRdjxJRbwsJPcN4weAuZVrmPFNz/TmxEF7yQ48zY=; b=jBAM9rLhcFk3biGK
	sJhTbW+CgBExGMo8NAKFmyuuyTuc2KBm/9mZD1cZaDiRogq+sVWqLPf0RCquVnFp
	2/PM9vO62aPhFFw/G9TBdypUSFM17nOwC784QeCWjdVMEW9Cipe8lgmLtbDCpFyn
	KkVSZeU4CqNJMuUhM7MaWQppmBsNSU8RpjSMiDZbyo5RfktYOW6ZHwdM3U4f44D2
	lACsT6D3V5VdzQymETA0wQhlZk7zwDyO/Q3eNEz60npa9ukp2Sv8ydQp2ucQpqBt
	UXbEJnnuhU+E+iS/3zmghITkenY+kWZ32LI9twNxiL+MiQReDA9etshOMebayx62
	GRBv/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0nfancy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H0x1RV027026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:02 GMT
Received: from hu-gaurkash-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 16 Jun 2024 17:58:57 -0700
From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <andersson@kernel.org>, <ebiggers@google.com>,
        <neil.armstrong@linaro.org>, <srinivas.kandagatla@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <kernel@quicinc.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_omprsing@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <bartosz.golaszewski@linaro.org>,
        <konrad.dybcio@linaro.org>, <ulf.hansson@linaro.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <herbert@gondor.apana.org.au>,
        <psodagud@quicinc.com>, <quic_apurupa@quicinc.com>,
        <sonalg@quicinc.com>, Gaurav Kashyap
	<quic_gaurkash@quicinc.com>
Subject: [PATCH v5 13/15] dt-bindings: crypto: ice: document the hwkm property
Date: Sun, 16 Jun 2024 17:51:08 -0700
Message-ID: <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7_sMiCFICe22CpF9pnPz5uYD3GwJJFu_
X-Proofpoint-ORIG-GUID: 7_sMiCFICe22CpF9pnPz5uYD3GwJJFu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170006

When Qualcomm's Inline Crypto Engine (ICE) contains Hardware
Key Manager (HWKM), and the 'HWKM' mode is enabled, it
supports wrapped keys. However, this also requires firmware
support in Trustzone to work correctly, which may not be available
on all chipsets. In the above scenario, ICE needs to support standard
keys even though HWKM is integrated from a hardware perspective.

Introducing this property so that Hardware wrapped key support
can be enabled/disabled from software based on chipset firmware,
and not just based on hardware version.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..0bb4d008f961 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -27,6 +27,16 @@ properties:
   clocks:
     maxItems: 1
 
+  qcom,ice-use-hwkm:
+    type: boolean
+    description:
+      Use the supported Hardware Key Manager (HWKM) in Qualcomm ICE
+      to support wrapped keys. Having this entry helps scenarios where
+      the ICE hardware supports HWKM, but the Trustzone firmware does
+      not have the full capability to use this HWKM and support wrapped
+      keys. Not having this entry enabled would make ICE function in
+      non-HWKM mode supporting standard keys.
+
 required:
   - compatible
   - reg
-- 
2.43.0


