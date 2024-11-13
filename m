Return-Path: <linux-arm-msm+bounces-37708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F39C6718
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 03:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FEBC1F24C29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 02:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE157081F;
	Wed, 13 Nov 2024 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D7hthHVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0BC2FB;
	Wed, 13 Nov 2024 02:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731463729; cv=none; b=OXPQdtMDjzkPavn8JEVKRc+pH6NmAhYjA3fyXqvOfIlDnmzgYhw5vBO7kWN4rvhLsITviP51DN2VSwYkQsWJml/BIBvjqnpOFcDxSg5D1C8g5cNUvlYo+qwGLWxlS1NXZ99OaOV80POsRh7oHr43zg4PZI7bfF+nMyiYRsG8xP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731463729; c=relaxed/simple;
	bh=+hrdXFbO7N2VDw8DvmEgshdFI+lLDLFlb8jv1xnAsJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UMNcNsmxnQYKjoEm9G3KU3tBatwgWpcKbJFUe4Aru+EHf8nRfK8gNIUH9qRKGw/Z67MGmBM+JF1/NxmPHaHoThsvD6U3l5dpB6ZFkkIOySM3ZdLX3Yaol0ZUsH+BjyaEG3iZIO+NzZ3QYotcLeKX8WSkVaSfE4Ztxp21aKvRtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D7hthHVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRc74006727;
	Wed, 13 Nov 2024 02:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wrS5V6QqQdjAm1CJE52Yfz
	EYxOapXl5moYDQhB+kuK8=; b=D7hthHVqsWDnTv6qlOeJcLceiYytUOgvmfQQkz
	8tyrVoqr35Y9z4mbzXLzZlhq18ugKPPFEExo4rb8mbm2wMgw9K+lSebo+YVmtuBn
	Z/KZrTHyTWNvpKsOD6rrzZey5hLaH9wxEeZV9shGLYUjmJmVxw1VaMdfGaic/3bt
	UxLldz3LYGxfACFHcVKge8v3KjjGYniqMYTya+RgjbCx+gXbtJvXA6gpaOpVmyxH
	rXKBB+NesYgXQBXaif+0MKG5eEgkGErOgvSdBEf7sPKqdRt5QGjibgeiLsv2K+G7
	4e7CoziDRwiYqqRXeIAXChvzSqAFnqFddFBYgR8cXZqHtAMw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqham1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:08:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD28MKT031728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 02:08:22 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 18:08:18 -0800
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 12 Nov 2024 18:08:10 -0800
Subject: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAkKNGcC/x2NMQrDMAwAvxI011CZDm2/UopwFSXRkMixnBII+
 XtNxxvu7gCXouLw7A4o8lVXWxrgpQOe0jJK0L4xxGu8IWIMg+60ss0kdVrNqRr5lrOVSvs4Jw4
 9pjtKevBnYGiZXKQ5/8XrfZ4/4ZsP8nIAAAA=
To: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "Andrew
 Lunn" <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JmDc_Ndj2oTaDky6KH4Ep2BtCJEGIwsk
X-Proofpoint-ORIG-GUID: JmDc_Ndj2oTaDky6KH4Ep2BtCJEGIwsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130017

All Qualcomm platforms have only supported EMAC version 4 until
now whereas in future we will also be supporting XGMAC version
which has higher capabilities than its peer. As both has_gmac4
and has_xgmac fields cannot co-exist, make sure to disable the
former flag when has_xgmac  is enabled.

We want to keep the default capabilities as EMAC4 and enable
XGMAC support from the dtsi based on the platform needs.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 901a3c1959fa..2f813f7ab196 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -872,6 +872,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
+	if (plat_dat->has_xgmac)
+		plat_dat->has_gmac4 = 0;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;

---
base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
change-id: 20241112-fix_qcom_ethqos_to_support_xgmac-d1a81ea9cbfc

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


