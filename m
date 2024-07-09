Return-Path: <linux-arm-msm+bounces-25664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785692BCA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 216D3B24002
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD91D19D087;
	Tue,  9 Jul 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M1MOeqXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B7519D06E;
	Tue,  9 Jul 2024 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534451; cv=none; b=mO116oqfpjyg84PZz9ulLZL5i3CiV9s8uVt2SOuYHeJhvjekCG5KF6RSlUTru7Wh7x9h3y3+DjkX4q/cTknOlD4yFL/Q/7ZQR1zid0nNo+u6BitIcZv/oEEz4lKe5yaLrFGp4lKvyNNwV2m38zBf9NJEB25qQlV6Up9V70WWOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534451; c=relaxed/simple;
	bh=2R8n9swqMPKqhzvq+Sc3kKnhz9/FS9CmryYs9B6BlS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ee6UaGGZ/y7Hq9zF/RzzWfSP6PdfzzaXB4h+mdnvHjAK2HrDPeId8Fmj9iqrOfvTE1wNbJEr8ILvPwRHJj0E+2V7Stq8bnFYD9f4CaR/2vsflLavLmpC3YdHV376Jc6MPBRleEaSgkwSAibQaFiACA8zcjIdPGZfsKzie1viPjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M1MOeqXg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469D1rDE019898;
	Tue, 9 Jul 2024 14:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64pCyR4mrpw0sFbk3DSIa6dAzta6OQJ+6j6xfMdA3TA=; b=M1MOeqXgs+YwPMEr
	Ss50EY8IpEOTYnEo3M+OGOKXdpKJBMMaYm4E5XX8hGcQTh7WBcwXflh9oRrMY6QL
	12icJR+4rm+yeg9KH8R7MhXqGAqCGFAJ4dBrhL/FRQUBJRQWwzQRvfgMJEaLMaej
	vPoUMf6oF28ivIGoiQjF8szKZue1sdgnvoX+HS7lGwmcMdRCXRnrpiPlF78pgsId
	oubRfcQcdTL0yn15OqODi8YHSv4NFj0XUtrIX0BvaVem6o/DNl+jgoSi4lJLOI31
	DQyiC70rWkG5Qrx4R6nElblQ6HdI4GgaSpZqhblFPGnVyjCek3o9C68XrR3jw7Gv
	cPIC1Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdpcw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:13:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EDl98028766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:13:47 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:13:40 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:13:18 +0800
Subject: [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos: add support for
 emac4 on qcs9100 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <kernel@quicinc.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720534411; l=1435;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=2R8n9swqMPKqhzvq+Sc3kKnhz9/FS9CmryYs9B6BlS4=;
 b=oKx38eVw7GrDCi1bHx4QEsAwqI0HCvAwj1kpQExD9H0OEZo6g1J7cPRos/pMlQA+aJyb3SrGs
 Nm7sPdjKeJoDj6nPux11duLot4nSWoMf/h6edRB5LBtsE14Xj45lRVW
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zvKZXGsAmNMXrHYU1Ei9yFNnjAk-Gdt6
X-Proofpoint-ORIG-GUID: zvKZXGsAmNMXrHYU1Ei9yFNnjAk-Gdt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090092

QCS9100 uses EMAC version 4, add the relevant defines, rename the
has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
and add the new compatible.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-ethqos" to the ethqos device
match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e8a1701cdb7c..f3c5ae54bd5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -864,6 +864,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs9100-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.25.1


