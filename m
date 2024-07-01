Return-Path: <linux-arm-msm+bounces-24758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9391D5DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 03:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810C92816BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 01:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25345382;
	Mon,  1 Jul 2024 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g3RurggF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2638BF7;
	Mon,  1 Jul 2024 01:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719798511; cv=none; b=Z6cINPw3ABmORDcPQ11cz7PdzS2ttJAzv//fuFMpc5OJXkr0ZKKBIL9zw2uec2pEp2AhkY1llK+6v58oh7uvWfP3sQ5TYTngvls7kjRp8k4SR6pPXI3ClSNSOp3+IcJEgWSyZAfIWuTl/wTlhmSTJMA7GXy6UvUrq8aukus9bMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719798511; c=relaxed/simple;
	bh=LndvduBCTugN+zBgpjFGTFw8L6tV1GxLf4ARV2GO3qI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X80EnCuPPbwGXD/ibdxvQDTas7yRUc/Nj4DDXqTNh3/9r2hcpyAwO5lBkYJFSbqCVd65w1TkH7jvxT7ARNcC9apwUJyucdk8mrfpIAXM4lBR/6w+BYhosJUfNaY90c5QOT5Ku069Rj6V7WZabUxkBsuP2QArReyuNdHdfb5PGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g3RurggF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNeK7L008799;
	Mon, 1 Jul 2024 01:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WFZ3rpLyvbaEqpM/4Iq05h
	1u6dg1spWjaj74z8leeGQ=; b=g3RurggF4njQzSpBy00U0kleC4Txb1zGsvbgpJ
	8Z3yZzkoFQhkdwH3wB/TPbiXeSiaEj0lN190RgNRRCVka9qa+AX0YZ0hId4MutJz
	EN3gytJyqNQQGe++sxVTmmJiEArr/HCS7Ij3PGveRIakwYIOvP9VYVFc3Xi47DsY
	aVbnIWaJMxTSWamTUjBhaJSVikyrkzZMgZpWAN5PmGMkhi4jq7ek6eU+NRwwOUF1
	LiLfsYEKh5K0dnNRnhthJEdF1TxBbwT8QeHoltJ2IRj8NDe42xadLkmR3/IKzEzR
	vD0vUvnWkEldXkQzGU7GYosUT/IybJu/eED20V18Wgrtk/IA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnk1a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 01:47:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4611lcHI019116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 01:47:38 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 18:47:29 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
To: <vkoul@kernel.org>, <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
        <bartosz.golaszewski@linaro.org>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <kernel@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_jiegan@quicinc.com>,
        <quic_yijiyang@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH] net: stmmac: dwmac-qcom-ethqos: fix error array size
Date: Mon, 1 Jul 2024 09:47:20 +0800
Message-ID: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2gfIGHlo93uEszPcsCr5YxwpAZcB6C0B
X-Proofpoint-GUID: 2gfIGHlo93uEszPcsCr5YxwpAZcB6C0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_01,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010010

From: Yijie Yang <quic_yijiyang@quicinc.com>

Correct member @num_por with size of right array @emac_v4_0_0_por for
struct ethqos_emac_driver_data @emac_v4_0_0_data.

Cc: stable@vger.kernel.org
Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80eb72bc6311..e8a1701cdb7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -272,7 +272,7 @@ static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 
 static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.por = emac_v4_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",

base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
-- 
2.34.1


