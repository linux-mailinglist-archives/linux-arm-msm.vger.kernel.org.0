Return-Path: <linux-arm-msm+bounces-39052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4219D9D7BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74FB7B20A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5869C18452C;
	Mon, 25 Nov 2024 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1tRqaat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329F17D354;
	Mon, 25 Nov 2024 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517908; cv=none; b=gsD79FNAoR4IkbzsrXxnlQUup5YtQawJqkYYt5F0zUIRmc+TspgAj5uuSFQQXc6XAsEi/6+1o92mFu79cRGwtsr1yLmPdkMgG7ICDV5hcGWGMUHyrkcyYXmavSDW/Ad55T/TQ1B6t1J850ta533V9zteKVh3QJzrgUbFs1al7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517908; c=relaxed/simple;
	bh=7aq/kzwFg1Ui9DP5XM/zqAzlJgpvl6u4seXqQYJb038=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kZwyjbBgnyIwjoXte4ikGH/ns2+a4pLfcl4TcxkW/oqpssKF8PKhyLBwQSa3rgK46RAZHoywI69uBqqhG9Wzz3wG9DdtOVJLJhENyttZdvhmgtgMxs2cSK4IGperWACY84672EUY605qhiOuuM+dpLeT38My/eapWbc1g1tnZKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L1tRqaat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMh3IP027381;
	Mon, 25 Nov 2024 06:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SwH9aIBnVTCBuwuBQPpWDk
	eFngglAITjoh7+TUmiACQ=; b=L1tRqaatjESJNl/YKMqVWECwsZsdFbbfsAc/cu
	kYWfW3qFOmprQGzKEe/1VcASgtFAGJMJvPDJA7PdBbKtyxmcRD6L1PteWucX2eYj
	LyjBiMn6/07qE5BrFhHQef6tDIWIdhFq8SinHLc0P/+fq3m1G+64DrZ0lslhpV89
	9j08IbAkI4ZeTLID58AEu0jPTFVJSqc2DJVWYu28C3ypZUFyCKsiCdhD9k9NG/bJ
	g1/0sepXKd5bMihm8oOYzbZ8bfByLV9aDHKFkDOOC3XtBbcWjGx7GpvtO4SULWys
	3bw7EV38sIaES1zrccFFWZ6Y/TvBeJrLIq5B54MB1+DdiMKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmuwwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:58:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP6wJdC020110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:58:19 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 22:58:15 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V3 0/2] Enable Inline crypto engine for QCS8300
Date: Mon, 25 Nov 2024 12:27:59 +0530
Message-ID: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sJx0eyTOyDoFkV2O7gnjrfjvGlQUx4OC
X-Proofpoint-ORIG-GUID: sJx0eyTOyDoFkV2O7gnjrfjvGlQUx4OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=662 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250058

Document and add device-tree node to enable Inline crypto engine for QCS8300

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Changes in v3:
 - Remove "Reviewed-by" tag added incorrectly
 - Link to v2: https://lore.kernel.org/all/20241122132044.30024-1-quic_yrangana@quicinc.com/

Changes in v2:
 - extend UFS ICE to the full register range
 - Link to v1: https://lore.kernel.org/all/20241113043351.2889027-1-quic_yrangana@quicinc.com/

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: ice: document the qcs8300 inline crypto engine
  arm64: dts: qcom: qcs8300: enable the inline crypto engine

 .../bindings/crypto/qcom,inline-crypto-engine.yaml        | 1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                     | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.34.1


