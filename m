Return-Path: <linux-arm-msm+bounces-27976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266C948848
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9398B1C21193
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 04:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD301BBBE5;
	Tue,  6 Aug 2024 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Do6Ar4aV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01273BBF5;
	Tue,  6 Aug 2024 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918017; cv=none; b=dMdTmCLBhal0RIbgPJSQaWuCaLk1m8Od1qMLj0gEeIPlOFpyZR6ta4EVPq5G/ndPTUG0XoZl7qqa0j1SWaOUmPIez82te8cWqaLWUfr7DIqrkJri0FFzAyMEtn7lZ33dGI4wsTrwdhkswbAIDMrSMLKfKw8avsndS9V8NBgwIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918017; c=relaxed/simple;
	bh=6IE6QFQ72YSl/W2wpLgCCNdm1yydIP1VEiuopPhl3l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EVJS8x0OcO12EaQBUKzoEcFIF8G/wn9vnNploufv4V/kLxrFjNR+IlBocIjVn7WrZHMg2Qyl/0o2LTP4xwPMNFaEbEse41reHE3IyVlKePYBJs3YFokEk8FyMFV5BtB0jKAEJpLypYWI4tSSF+CDmQ0ruWTHHh+LSCPq+bN20Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Do6Ar4aV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762AUCX011343;
	Tue, 6 Aug 2024 04:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCzPLq1YhkXmXatuzryj9TKstLbraoqnirLEPDQUSAk=; b=Do6Ar4aVbFuYjyra
	atGA+f5Sb5jvRA1paI6QumVJN3l6bxltrR7cMJw1DlKcl5RWH7TK7QS4udBx7bos
	83dJMPS2nfG11UJrfwUIhnEz/Da5Oh7KV1nV+7sdati2hMQwZ7gYm+krJ9eoHu+o
	fKUH6FQ8ZdZxEpJIxOpQlJ5btf5fhpXjZejtLecdnXdeNr4Xt91Av1r2DZKHg55w
	bkVVq9TOt23pmHN8HIyHTqxPYXyxR0eUXykBtofF/p+n2Zvog1wy/L+RmQgUBky+
	Qn7L5P7qsmW9xQokKuBot0bRfWcIq27PN9ep41eFcozY4uosdTLNGYi3b0KLfz96
	NQyFUg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6p3jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 04:20:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4764Jx9s024838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 04:19:59 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 21:19:54 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 6 Aug 2024 12:19:27 +0800
Subject: [PATCH 1/4] dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240806-add_qcs9100_soc_id-v1-1-04d14081f304@quicinc.com>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
In-Reply-To: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722917991; l=644;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=6IE6QFQ72YSl/W2wpLgCCNdm1yydIP1VEiuopPhl3l0=;
 b=se+KgH06g+s9j5Uo8Q2dzvnTYHL+5NhZrn6qXIKQnDh10Fktu26gniKcBd/RgzdfWtL3Fsj3Z
 q+2SdtXwON7B/74TYJFSdVNihb1ZrvSiCYxwcELU5mhcIt0zAliq//9
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5fF7tVCE4QIntKjOL_-y9P2iYyWpWKGS
X-Proofpoint-GUID: 5fF7tVCE4QIntKjOL_-y9P2iYyWpWKGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=569 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060029

Add the ID for the Qualcomm QCS9100 SoC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d6c9e9472121..d0396e8c9af6 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -274,6 +274,7 @@
 #define QCOM_ID_QCM8550			604
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
+#define QCOM_ID_QCS9100			667
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.25.1


