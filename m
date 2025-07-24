Return-Path: <linux-arm-msm+bounces-66546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E3B10C24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593435A5D92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BC42E1722;
	Thu, 24 Jul 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NjnhSo5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9D2E06DC;
	Thu, 24 Jul 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365103; cv=none; b=eDIsUg60Qppx+btnk0DMHPfV5quNNJHb/ARz9BuM0/WioyuvVgs2k9eekSTbTZos/jOiGklyXhnZonGErPmstJPx92tbt/1zRwoXboALcx/7DxRm8VbCjoiAAsCLv4amImp9smn7ZKkSmJqBBImZKmj9R458zsyPiEF91RFgakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365103; c=relaxed/simple;
	bh=YYNHiQKKHckLkqpA+dzLt60GYuE11vc7QFncysOZvno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cUVlt/b8F7NdHeZY/joWhd2KCP+mPJuskIQwtZPTWylbBpdXvgQoL1A+s02SueObms+Cvjdny2fWgUjSBDW6nPEjDYO3OCYhd1LLMXiJzx/fe0NiqfcZ8EY8Nqeo6447yCwVzlET9vCCSfAS2ZYMyuEtDhU0pLV+wnnohdXYrKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NjnhSo5X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6ddVL028406;
	Thu, 24 Jul 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9R30NjnW1XkveD9AQU4/KblfksuaSGAowoFXnO6ISs8=; b=NjnhSo5XHtZt2SlE
	YBIuEV+vG7Z+fO6Ax7TMSFTPC31O7QdOfg3+O6YNePNB+fjaoFRhgPJYqMPDNurj
	YPBcUPjk6uExPoP6ACNlharlGgTXfBkSSY2DPdz7BPJpYOiqeWIRRYItemofkJqd
	UXvR6RMKGluRmBVKr8Jei8/m/O248eil1vN1huT5luxmRzrPQSdAXSWdeDG+0iP/
	Zfk9p4+ykrje0aXZnNRl9ha19p77PaPzOTIKKqBcBjkwE+m2Mfa0Jb81e20LVijZ
	CtLhyhLheb+3GZviJa4RRi13dUk3O8b2mDOWa5AEWSHseNRTGb/bhgFhAE/J89Va
	AJ5sOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483frk17m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ODpTaT002866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:29 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 06:51:26 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 24 Jul 2025 19:21:17 +0530
Subject: [PATCH 1/4] net: mhi: Rename MHI interface to improve clarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-b4-eth_us-v1-1-4dff04a9a128@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753365082; l=1871;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=W2KSa4SU78w/Jr0jZKTFlX07+cK0V3U6pDN38+bSuHU=;
 b=KsL9ICDcgG31sblOraD+SOL8sh3r7tcQkItu1KJRU+IbcMRvP/FPHvK5fbQ21vUULc+FJMnCT
 iIu6JeN3G8rASyUgTJQt0Gab4vW5KwpNbNFYQgkLCVStaAJdnn/ryqz
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNSBTYWx0ZWRfX1rCftQdZmCka
 hvXnZKskw5qq4shI3g6+I/neR0Q5qCEtexeLqv/9RgZ8Y9lu8+DAacukl4CoVE4oilzQpDUDDkk
 AMRxcUp1wfl1EBUHdf7zvp5PINWN3mqCSD3XLLJcSjPQVBJk5NdUPcc2aIppQARqlqCSH+aZVE2
 5xIYDNvTCt3QlVjaoHQg8gQHyGvHzIkbsHHHsB4p92nRabGXiV9qHb5DUz1eW87IHwH/WehroCo
 5ZxZG1HmktpuRSpA93TSswwG0BlyMtmM9Fmf3AOacRai5H9c2HKgYwMu/tObXgr3qIJDg0ZlMTE
 M81ZpCzRez8TxwHTeZxs88Fgk0xmgsptdQPgJFmRz+ExKyhG0Fgs1/RSHncjs5Nlom0nGJPgdXu
 K5b9A0jRHd2rGgISkRFe8lvgEBB2BAo0n6eqXRKOQvVxVLvBHTML99CE4cV8Ex4mFvWnByec
X-Proofpoint-GUID: 3KD4lm3W75-7VKxvPYA7sWEBHC9NqaTx
X-Authority-Analysis: v=2.4 cv=WbsMa1hX c=1 sm=1 tr=0 ts=68823a62 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=uH-DrFrSxwLtvk6aROoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3KD4lm3W75-7VKxvPYA7sWEBHC9NqaTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=789 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240105

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Rename the MHI network interface to include the device name, improving
clarity when multiple MHI controllers are connected.

Currently, MHI NET device interfaces are created as mhi_swip<n>/
mhi_hwip<n> for each channel, making it difficult to distinguish between
channels when multiple EP/MHI controllers are connected.

Rename the MHI interface to include the device name, for example:
- Channel IP_SW0 for the 1st MHI controller will be named mhi0_IP_SW0.
- Channel IP_SW0 for the 2nd MHI controller will be named mhi1_IP_SW0.
- Channel IP_HW0 for the 1st MHI controller will be named mhi0_IP_HW0.
Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/net/mhi_net.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..08ab67f9a769ec64e1007853e47743003a197ec4 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -351,11 +351,20 @@ static void mhi_net_dellink(struct mhi_device *mhi_dev, struct net_device *ndev)
 static int mhi_net_probe(struct mhi_device *mhi_dev,
 			 const struct mhi_device_id *id)
 {
-	const struct mhi_device_info *info = (struct mhi_device_info *)id->driver_data;
+	const struct mhi_device_info *info;
+	struct device *dev = &mhi_dev->dev;
+	char netname[IFNAMSIZ] = {0};
 	struct net_device *ndev;
 	int err;
 
-	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
+	info = (struct mhi_device_info *)id->driver_data;
+
+	if (snprintf(netname, sizeof(netname), "%s", dev_name(dev)) >= IFNAMSIZ) {
+		dev_err(dev, "Invalid interface name: '%s'\n", netname);
+		return -EINVAL;
+	}
+
+	ndev = alloc_netdev(sizeof(struct mhi_net_dev), netname,
 			    NET_NAME_PREDICTABLE, mhi_net_setup);
 	if (!ndev)
 		return -ENOMEM;

-- 
2.34.1


