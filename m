Return-Path: <linux-arm-msm+bounces-20999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D21148D3E78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6B0284B83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA6A1C230E;
	Wed, 29 May 2024 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ouNulVwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661C1C2305;
	Wed, 29 May 2024 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007984; cv=none; b=bgR8cNpTBW2ouoSxfYrHfiqmERyCK4K85KIzmCcZg5xlri/8GWYgh9gIcxCjsqVxk7I+yK1w7g9JIN7BZFn1/lFm4mrpkwaSZ+Tqt6g/P90rYszSK7jk2aAstnzK410Zuzx+2r8bIAaEofeirYBcr2rb5+pMLDKgl11q5Rb1QZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007984; c=relaxed/simple;
	bh=DhNEauDfI97TAmjRWu2qRxUMXDkWyhLuWuOVMey/HyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=hN3tVcNMpRP9stT6HNMJwqu9V9+6C0fv7n1KtEK9F6ea3TkH9dct8HDld66hqivV4w5BD2tcUtmkTpbNUtxYTPaoefhqYQ221vLpnCZj6AqtcZtNTtJ3jgN9SSsMLvgFqalJEUXQL0w2ADUc3e2deF3aW144eHWqnraljimmqAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ouNulVwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAEldM017183;
	Wed, 29 May 2024 18:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q6mgGgupOvxmpqFBBvg9jB
	QlqS0t6X5bAyhR+6y3Ers=; b=ouNulVwoaMnXsuTCbjYy85bQA8Rpx8A1Xb9Sys
	h3UpNUvj1MtaxnxtXGPVr1YxEBgAcLtr1syDshx+Y0JpuNBsc+vKm6AIxtq2g7gq
	FP6twFribyeEGuPaguOEm3AyAvRn1Q5dKCmbx/GWIoDiZP/e7nMI4iWTa7R+hPuL
	44eDS9qq3K8VoQdG4dF8SEpH7l4HB7wRPQwbP1EKai6rPOTnP77SwMfegt0TcFPB
	DCLQnXnIBSBXb0nMxGeLeo426WUS2J3BkZ4+WbpLxZRFwEy9oxAuKnlrw5QShTbG
	WrPPI0AHlz9f66UKFfb3vIxT7927vvNY269wK50XjVTx8/IA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2nj2cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:39:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIdFue009060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:39:15 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 11:39:14 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Wed, 29 May 2024 11:39:04 -0700
Subject: [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEh2V2YC/x3NywrDIBBG4VcJs64QpRbsq5QiwfkTZ1Eto71Ay
 LtXuvw25+zUoIJG12knxVua1DJgTxOlvJQNRniY3OzOs7fepFpW2V6KiJ6hBT3m2nrkxxI/wj2
 bdLGBvXchOKbReSpW+f4ft/tx/ADpmka/cwAAAA==
To: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Jochen Henneberg <jh@henneberg-systemdesign.com>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Sagar Cheluvegowda" <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r19ogSDgF-B-g4W12boA6fUbXRYbygwK
X-Proofpoint-GUID: r19ogSDgF-B-g4W12boA6fUbXRYbygwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290129

Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Change-Id: Ifdf3490c6f0dd55afc062974c05acce42d5fb6a7
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e254b21fdb59..65d7370b47d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -93,6 +93,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	const char *link_clk_name;
 	bool has_integrated_pcs;
+	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 };
 
@@ -276,6 +277,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
+	.dma_addr_width = 36,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
 		.dma_chan_offset = 0x1000,
@@ -845,6 +847,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
+	if (data->dma_addr_width)
+		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;

---
base-commit: 1b10b390d945a19747d75b34a6e01035ac7b9155
change-id: 20240515-configure_ethernet_host_dma_width-c619d552992d

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


