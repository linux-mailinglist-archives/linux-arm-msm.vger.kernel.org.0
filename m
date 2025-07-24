Return-Path: <linux-arm-msm+bounces-66549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2532B10C27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D886F7B34E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACD72E5B18;
	Thu, 24 Jul 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V/vOZ7h+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49742E54B1;
	Thu, 24 Jul 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365113; cv=none; b=gtwpvsIdUheMLfsxMzUZrPjCWrUAe1sDnWGAlL/m1yRVVlbaW/pdHdafcrB0Kl4hAWMOuLLEk3jmf6faForMSrs/LJsKm3tZEUtM5TV7m9YSqGLB4wn3P3ZEdCsqpT3ANKa9YLOSAmS34TMYnEGpqVx3ot+D9Vyuo9HuRuQRJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365113; c=relaxed/simple;
	bh=C0KaWG3UaVCTvAFte9PukGywak0NcwRCvR2morYFHRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CVyeS6qSgX4GXqvkn4l7w5lftdvnC5OEscBBxtjN3bXi0gUIIE2hjIH/5tb6b13NFEvjsz4vavb9TtePCVp9D/4zzXaltr6+0HdUNWysga6sYsekDvyJ7hRtUJxcEkwKUJMg73eQgqDk/1MKfoaopy0QKhvc85QN9kR559BWKe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V/vOZ7h+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9gfvE001684;
	Thu, 24 Jul 2025 13:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/40Wo5UUWu0Sz/qOc/QNMizm/2acpbjTG31Dh3vLEdE=; b=V/vOZ7h+ZbFo0Myh
	Oh9+bE0+/7Lq/OElgLfRE1BeQTU2SRAIjtudrWOIN75W+9/hHMBJ+MQKS9GDcxUt
	PZqmlpqlCwa6wJc9hFgMlfhMzekmt57CVcRRwD+Soa15qOqzacjjivWpsPfzxhGH
	06J0dHLB8K3dzpT+a2Nq9u/ToZdJ1pZ7zvLRZ9owZhNBMzyDGJtXSnWE5rRtlELz
	39AggAE6P2NQT76Q/bdipuJSTk60T/QRY+YWGeLttCmkeWqRJNrLKPfPw3lee5ex
	KPYl8QvvRpgKiOASE2NypamIfnjSO0BCnvkq6c9q8s0ufVPAWWU6wfPGA4rBQDlQ
	yadVMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ufgda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ODpejJ021586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:40 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 06:51:36 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 24 Jul 2025 19:21:20 +0530
Subject: [PATCH 4/4] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-b4-eth_us-v1-4-4dff04a9a128@quicinc.com>
References: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
In-Reply-To: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Vivek Pernamitta
	<quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753365082; l=1446;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=msOAe1B6pQUukTAiXHa2MjjPNJ9dY7qx1gMAl7k1Yx4=;
 b=MWKzDTouoQYhUKG7cUqj6oUsKlWsAlrgf6/JIw4/GchIruPlrAc9acRMRaR6Wp5XMm7KZ88r1
 Ymlmkd4XargDO/n7WUGdwQuDHlh3hflwM2zlJHttHtVuKdYZlVeYqpr
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68823a6c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=Vo5YzJSDI_NEo2NC7oIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNSBTYWx0ZWRfX2+LFjzN4nG+o
 DD7kqOKon5Av/cJzK5/Q1vPS54U3WbriV978IYEryyBvFEyatXxF7wY6uw6YQvAM93VnQg8SouL
 yhh/zuGHDr5MqOYRNhbY4g8jHmhYdqVZ65VlbP8yNNZzUz4E74ZAhiNXCkX+sREvas+JATkh/m3
 EXLjTLol2Qkr7+SqAhIFM6d+dPh0MC7NdaYyXAP4Fj3XQFlMv7iNwQ503IYlnP9QIHSk4wV107a
 DEEr5qLxDJgzwM1bTlVhDThixJ2yAbCFNN2QClM1cXGoS7SSH1DFsa8RMI7qjwfvrJClx/eePMs
 6wfzVzFJPxyXt7AsnL+UxCLe/z3ig66UotgcTudkHHqrpiDhK0CysUVx64iigSjwk/v82eYZgkR
 gPN27SoJ5rm5YV77EocmxHvrOLeGC8otZVfbxiby325uwtctX1Toyj3rkJ8AeOZkhSdGyk4o
X-Proofpoint-ORIG-GUID: Wk1BbUWCdY6bIFQg8Jv2aXLia7G7Zf6p
X-Proofpoint-GUID: Wk1BbUWCdY6bIFQg8Jv2aXLia7G7Zf6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240105

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476baf02af02aed00be0d6bacf9e92634..1527e0b5ac24bee5d99a36ef6ab47ed619e77db9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -263,6 +263,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
+	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
+
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {
@@ -278,6 +285,7 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(5, 512),
 	MHI_EVENT_CONFIG_SW_DATA(6, 512),
 	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {

-- 
2.34.1


