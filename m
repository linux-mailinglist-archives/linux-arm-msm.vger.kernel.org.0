Return-Path: <linux-arm-msm+bounces-43171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689959FB8DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC2D1657A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 03:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D0C1411C8;
	Tue, 24 Dec 2024 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ACktODu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B112C499;
	Tue, 24 Dec 2024 03:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735009701; cv=none; b=EZQha26e3HiVF3uGQ6z837BP2ctKerAr55YacGkf8b79922TqIz97QYOIbLDCpCfkayC1BDWslfcbVDtAOKhVCLFW9nC6AqXUAJ46HlfTmYgtH3Pt5SWPvyMNIaEDKLmZewzOqnuKjzDCY+rdZSnYvQ3uVhXTDm+UbesD+IijNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735009701; c=relaxed/simple;
	bh=V7lalbixoBGJlxP3pf4NJMaXZaZuAQMqMIc+vgd+3BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QPnDO0quKGu/hJZXow5OCmxdMgfpnVbWGPEiHZYN5WUA9+75Q6hlj1FN515btZDZlYtNfDva616RJMDbRixG4RHtmsMuY6z/2J9H8FA7DYY/tJSh2BFVQj33aIx0ZwBIfdpYFO2f6u7bYKlP4SHJpw+FP5AS3GEUrTwiWCKP/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ACktODu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNNU9fg013669;
	Tue, 24 Dec 2024 03:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIuhqDedNNE+RKLFjY7UPz+oQyiGEu+Qqb7U8Kyo+Bc=; b=ACktODu10Z4pDB75
	Q9oRTf24VGYw0jakS5ZiBFaXGhAQJQLh1fam7tvqSbjMQRyoWG/P0oE5mLf1ra6N
	eZZVvU0B25tmDan7nh5axSC/7TYlrg1Q7G5QMUp9O/pNknla+IhVKWS/d9WJJBd5
	kVqiPpFeYY/DR9lTlibaJ44Fd+LHVeu9Uihb41mu1e5xnQYJhyHJZEbqOz22qeJC
	hFV31VhvNXSnvL+UqyloXsCp+CmfYn5gcykjtBIi7b8o0Kb4pGXSap5MgSWNw2RV
	osHTjlh1QzBs+dSOWJpKfFwZy4PBkiKsjRGSIT2eiyQuIsCo7N+Qzy0gidNPrxUZ
	14PCXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qhk60fkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:08:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO37xiR010699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:59 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 19:07:53 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 24 Dec 2024 11:07:03 +0800
Subject: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241224-schema-v2-3-000ea9044c49@quicinc.com>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735009654; l=2068;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=V7lalbixoBGJlxP3pf4NJMaXZaZuAQMqMIc+vgd+3BI=;
 b=/PcuxJDv44ngfb0NCh2hUJrxMhlHV2nGZecD0Mo6JagRjHC7h5siDtAVSLzQTi1Ss+MM5r4f1
 6Fp6PFa1WtZD+7qhygEim3XOkb6FyHsQ/oQz4KfgP846x8rU4HdpzlA
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b9eCqun4IQgnbx5uL1MRRdjY8sp8VVgm
X-Proofpoint-GUID: b9eCqun4IQgnbx5uL1MRRdjY8sp8VVgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240024

qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_por emac_v2_3_1_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
+	.por = emac_v2_3_1_por,
+	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
+	.rgmii_config_loopback_en = true,
+	.has_emac_ge_3 = false,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.34.1


