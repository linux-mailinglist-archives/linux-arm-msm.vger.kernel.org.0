Return-Path: <linux-arm-msm+bounces-27977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4494884C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 06:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485FB1C211C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 04:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E211BC06E;
	Tue,  6 Aug 2024 04:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LHCCo6Td"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74F1BBBF0;
	Tue,  6 Aug 2024 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918019; cv=none; b=YaQb9neFl7yD6oGZLX4o/zsYomeX07jGzEmJr/xMo5aAP6E+TxwnOUEVnJCLeklYvW1eMxwLwGphg/nxl9zDxL1kFUdb4ix3Cofv8o5ztnd1QvEJfiStwWPTlgWH+DdsJVPN1SiZqZ4gkjkHzNNw/AGXkFstVvOcahxsi1W4/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918019; c=relaxed/simple;
	bh=H7IVRNOpmTH/1XkIWZ3scT/YHvGez1NLJANfZWlQIkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VNuIhtxLlTovv7VOspEfg3anUnxNcjL1UqGKdjipGwfTjqvf804N9vLr36C8EDHj0OHkHrOBweXKm/9kSKjq2UUJ6TaikOqgQf/ZiZSiZ8E2avaCR1Hvv919k8YN1mHpbbVphnkZRmdpbDhSYS4pcBE59cNVS94kdxV3HXMkfyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LHCCo6Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4762AUCY011343;
	Tue, 6 Aug 2024 04:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7whRdMz8Fapt/xgxsKLfNPhYp7Z3zFwkorzOhjM1wk=; b=LHCCo6Td7dNrMW+Y
	GYqUNAuuUWksTMzo6kRWJMKEjEC0bJQzVTE1s0a0ndzf7uXkB5ZUM1OvWtJmn3QE
	1N31QTYdWWXJk2I9oPoHueZP9YdGscYVVwLa4Ks0ZnMWNv8k1PMdijPYZG0H5/K1
	LejXAJ8aVlh2PDey8CddVNsaAEtHqbsS92W0KXIWT1RU9pD993VMchn04paJLd0F
	jPGNjdpuIRI8wIbu4y/mu5nChlYFWQTLKgOC75+WFihR8L/l5avrvr87a2HpBPfw
	SsLF3fUvvtQfcXeDo/7j2BZUJKh+71/fn4pkhzvWgzNfahJ6maTTY5RPsUH8r4/S
	uSpV5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6p3k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 04:20:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4764K1kw005579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 04:20:01 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 21:19:57 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 6 Aug 2024 12:19:28 +0800
Subject: [PATCH 2/4] soc: qcom: socinfo: add QCS9100 ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240806-add_qcs9100_soc_id-v1-2-04d14081f304@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722917991; l=635;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=H7IVRNOpmTH/1XkIWZ3scT/YHvGez1NLJANfZWlQIkY=;
 b=g6x/0eaCQ3wvCc7Ok3k34HGw6bOKkI88xpNwm5P9HOtqEX+vBnPHVAVCa1UrkcmmmnU35NBvJ
 F2rh14ua6dsAZoN/QkW/WD0zoS5kt7GVmLRIOxi6XYdCEpmkePPTlmo
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9xqiaf5FPxVvROMmhOBCYjSmq9mvnfpz
X-Proofpoint-GUID: 9xqiaf5FPxVvROMmhOBCYjSmq9mvnfpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=725 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060029

Add the ID for the Qualcomm QCS9100 SoC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index d7359a235e3c..6de6afd518c5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -441,6 +441,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(IPQ5321) },
+	{ qcom_board_id(QCS9100) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.25.1


