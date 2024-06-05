Return-Path: <linux-arm-msm+bounces-21800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62A8FD61F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590B61F2431A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 18:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B758B13AD2A;
	Wed,  5 Jun 2024 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l8vdB7Oh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6432F2B;
	Wed,  5 Jun 2024 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613885; cv=none; b=LTFmABl00h9UjNYyhl5hgmUrmF9o+YtOitCdMQPrPBPaqA49IU6RoeJYVMo9UDPia3sea0Bzqc809V8JSyatuchHXOBK7B7EOcmZhoH2fQdvjdQs792cLfE4GxZeSiDBXz/9B+CXqVqwKph981/TYCqhw26rfDINzgq77ZRxcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613885; c=relaxed/simple;
	bh=zVcdp7lJW+ZxItdsTRRf7VFEIBcMF3/oI6awBrH+fH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=taLGVNoxBkkREt2MqO4aO2lmRV8JZPL94tG4fflIKIS5y43OXlsrZNDxukT6L/wUNlMpC9NhEzSMLnwSw6vxYkretip3sXO78Z1ush82SfruTgJtZDxcz2AMd2ihL0iwqogf61TJrEinkcMD+7DV2wOOBYsFvRcKlNUF7Zsp1+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l8vdB7Oh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455I31AP014221;
	Wed, 5 Jun 2024 18:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RgN0bSk7mYI0CkqM5sPTXz
	2iOQPafeDR5xxg0Dk/4LI=; b=l8vdB7OhSDoJSgtM+PhbnmKgcp5XaEd4wEPdst
	8zlzAss4/PQC5Tdv7O1AdcUgvlYd4IbmYLf8Lkh+sMVgPzWTA1xIDMYH8NyuBCMZ
	DBhnUz5roSQsQFgD7KRcyiaXRiXmYXPviXiixxu6lDplAYuaIPbB3S1ADslbhPsQ
	YlhRWPCpGCEvYQPZMZQd5ZEHGbuuT4SRIkPFK7mQdCpKqNotPuTPDiyo1hIh0muj
	jOnQsII1LE6tnhRmLnN9TNBTsLFp4iEZktl/JkZ0HjpeWDZhPGusod+wdJAx3H2k
	aJrDxIMAxrhBVASyYYqZKWozVTr0272ch00PyT/2dv0AVhzg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxy83y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 18:57:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455IvXi0010536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 18:57:33 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 11:57:32 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Wed, 5 Jun 2024 11:57:18 -0700
Subject: [PATCH net v2] net: stmmac: dwmac-qcom-ethqos: Configure host DMA
 width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAA21YGYC/42NQQ7CIBAAv9JwFlNQrHjyH6YhDSxlDwUFWjUNf
 xcbH+Bx5jCzkgQRIZFLs5IICyYMvgLfNUS7wY9A0VQmvOXHVjBBdfAWxzmCguwgesjKhZSVmQb
 1RJMd1ScmjRBcSm5I7dwjWHxtj1tf2WHKIb635cK+9lfn8o/6wiijB8u7tjsLNhh7fcyo0eu9D
 hPpSykfMgiVy9QAAAA=
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
        Andrew Lunn <andrew@lunn.ch>, Andrew Halaney <ahalaney@redhat.com>,
        "Sagar
 Cheluvegowda" <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lJDrR8CNTC68DMMN-mHzEyjdQOFe9xJl
X-Proofpoint-GUID: lJDrR8CNTC68DMMN-mHzEyjdQOFe9xJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050143

Commit 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
address width") added support in the stmmac driver for platform drivers
to indicate the host DMA width, but left it up to authors of the
specific platforms to indicate if their width differed from the addr64
register read from the MAC itself.

Qualcomm's EMAC4 integration supports only up to 36 bit width (as
opposed to the addr64 register indicating 40 bit width). Let's indicate
that in the platform driver to avoid a scenario where the driver will
allocate descriptors of size that is supported by the CPU which in our
case is 36 bit, but as the addr64 register is still capable of 40 bits
the device will use two descriptors as one address.

Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Changes in v2:
Fix commit message to include a commit body
Replace the proper fixes tag
Remove the change-Id
- Link to v1: https://lore.kernel.org/r/20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com
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


