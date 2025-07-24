Return-Path: <linux-arm-msm+bounces-66547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7EB10C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3755F1CE4490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41BC2E2EFA;
	Thu, 24 Jul 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gNBHUN1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAE2E175D;
	Thu, 24 Jul 2025 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365107; cv=none; b=J7VTxz8pJ2HV10V5EfiOUZVylsRqKm2Gd7v+MJtheREj5WQp+iJRrDwz6q+QA5BesQYW0Hb2/E1KywlEtBRlN85aP5z1JViszqaUqJqmJ9sXty4HfiIRMNDi923ZJR9tslSueWwsIm4EOuvYiNluJySRbpmww3UPzOicProQT7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365107; c=relaxed/simple;
	bh=3RbQA7rQqKKiMYCM5G9F76QaUNDM9jXrUn0AWnzw754=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iDYa5hodqT051ogptsrFy2H4SflS46hBE/tnC8/B5JezYBi3WwUfAuhhGyOuEhEhruuSs3vjTeb49DKSm+OZSGCAwtkzRifOCPU5+4q8PHH4s/0RlA74ZDnMxaAgnEtS0T2qcJwB2U0nlTkkelqV2OlrCUgE6LVNafwARKoz6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gNBHUN1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9csNI028541;
	Thu, 24 Jul 2025 13:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KtdmWra5wDNu9MbFjV+sbjL40+T5ARbhElS9ruMEsM=; b=gNBHUN1NaU99Zcim
	4649NEwMJtVXIz60CXeXwCNu9UZo6t/m7CjGeyuT6GyZX6tE19YgtYMz+Z2MF60k
	19xinKG9VWl7hAi8Tm3MGP5AtuxXTYNvblSS/kTXx89KjBRO8FLzk04egP6VN0fQ
	HKtXVZJAvJluoHB/wgU0xHr/RsgXpzyScT9XYx9gQK3RtSNOPfgMlbM79naOZFst
	CktrzbredNnbBSrrZ07A1+V6/+pnJ/lwpLVPqzKPvDrztZfniOzyfNDoAzijn3wo
	ymGUtFuMbXzyMWYkHXPLRAxGx2DWLFCmhDWWPbwSxd80Z4OagL7hLngTAR8ybal5
	ptogTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1g7ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ODpX1a027925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:33 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 06:51:29 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 24 Jul 2025 19:21:18 +0530
Subject: [PATCH 2/4] net: mhi : Add support to enable ethernet interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-b4-eth_us-v1-2-4dff04a9a128@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753365082; l=5357;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=N96O4hZS2+R9j1oeB5QWPq5b0CwbgAlHsZFldKvCkIY=;
 b=SAIZ4HojucfGDSNruonsoyC3En7A0jViJbke5cnfThDQYOxqie5NAe9WIilokStktRr392O3z
 Tvoxxdu/mEpB+INdXEnjaUk1E44AOpCINjwoRM+11H+4rCMaLYXzTfh
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uS61mD23xbIsAp_IX50wc-k0smzVwWpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNSBTYWx0ZWRfXwdL48Ck21AhH
 RA+MlUWe1x+6OwR9gstGeyzwyHoCWor6pnkduO1w6i/3rKRWiYO0+AgyqIsNY4sN7T056W/F9zd
 eGLFuIhvt/ubBu3YOoqnGCx9hWjuwG8XGUivHVZUmCXXdxEe8Z/1eQw0ov4SnYCmErx7SdSHUGw
 L39oz3jME4fQxtaMpW+kvIH6nHxhyFCsDKrT4KmZyk6IcHb5iXx82iXKKvrhbf8aGf4lMkRqK8I
 zwDLcdZadYALWHbYJe5eLuU9N8iR7sYBpqzQWquYy8HlnI7vLksCrMJTNSLiQwuS9u2L1d0flSA
 4p9efKKG+AIMM0PUd7zrAcG4aDXm9FUbagUa50Pk55QPp4E2tRvZ/vzzBK+Ir7lnkc23LJBYqlH
 h8FMoxAbFbGs3k66963RTAcrexUGaRbtH5GUmIAI0azrMOhKrOlmnlnDeliFgj52hhOu608D
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68823a66 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EOBA0zxbHDKDm-sSy-AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uS61mD23xbIsAp_IX50wc-k0smzVwWpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240105

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Currently, we only have support for the NET driver. This update allows a
new client to be configured as an Ethernet type over MHI by setting
"mhi_device_info.ethernet_if = true". A new interface for Ethernet will
be created with <mhi_device_name>_<mhi_channel_name>.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/net/mhi_net.c | 84 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index 08ab67f9a769ec64e1007853e47743003a197ec4..ba65abcee32a253fc1eb9d75f1693734f4d53ee3 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -11,6 +11,7 @@
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/etherdevice.h>
 
 #define MHI_NET_MIN_MTU		ETH_MIN_MTU
 #define MHI_NET_MAX_MTU		0xffff
@@ -38,10 +39,12 @@ struct mhi_net_dev {
 	u32 rx_queue_sz;
 	int msg_enable;
 	unsigned int mru;
+	bool ethernet_if;
 };
 
 struct mhi_device_info {
 	const char *netname;
+	bool ethernet_if;
 };
 
 static int mhi_ndo_open(struct net_device *ndev)
@@ -119,11 +122,37 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
 	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
 }
 
+static int mhi_mac_address(struct net_device *dev, void *p)
+{
+	int ret;
+
+	if (dev->type == ARPHRD_ETHER) {
+		ret = eth_mac_addr(dev, p);
+	return ret;
+	}
+
+	return 0;
+}
+
+static int mhi_validate_address(struct net_device *dev)
+{
+	int ret;
+
+	if (dev->type == ARPHRD_ETHER) {
+		ret = eth_validate_addr(dev);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct net_device_ops mhi_netdev_ops = {
 	.ndo_open               = mhi_ndo_open,
 	.ndo_stop               = mhi_ndo_stop,
 	.ndo_start_xmit         = mhi_ndo_xmit,
 	.ndo_get_stats64	= mhi_ndo_get_stats64,
+	.ndo_set_mac_address    = mhi_mac_address,
+	.ndo_validate_addr      = mhi_validate_address,
 };
 
 static void mhi_net_setup(struct net_device *ndev)
@@ -140,6 +169,14 @@ static void mhi_net_setup(struct net_device *ndev)
 	ndev->tx_queue_len = 1000;
 }
 
+static void mhi_ethernet_setup(struct net_device *ndev)
+{
+	ndev->netdev_ops = &mhi_netdev_ops;
+	ether_setup(ndev);
+	ndev->min_mtu = ETH_MIN_MTU;
+	ndev->max_mtu = ETH_MAX_MTU;
+}
+
 static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
 				       struct sk_buff *skb)
 {
@@ -209,16 +246,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
 			mhi_netdev->skbagg_head = NULL;
 		}
 
-		switch (skb->data[0] & 0xf0) {
-		case 0x40:
-			skb->protocol = htons(ETH_P_IP);
-			break;
-		case 0x60:
-			skb->protocol = htons(ETH_P_IPV6);
-			break;
-		default:
-			skb->protocol = htons(ETH_P_MAP);
-			break;
+		if (mhi_netdev->ethernet_if) {
+			skb_copy_to_linear_data(skb, skb->data,
+						mhi_res->bytes_xferd);
+			skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
+		} else {
+			switch (skb->data[0] & 0xf0) {
+			case 0x40:
+				skb->protocol = htons(ETH_P_IP);
+				break;
+			case 0x60:
+				skb->protocol = htons(ETH_P_IPV6);
+				break;
+			default:
+				skb->protocol = htons(ETH_P_MAP);
+				break;
+			}
 		}
 
 		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
@@ -301,11 +344,17 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
 }
 
-static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
+static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
 {
 	struct mhi_net_dev *mhi_netdev;
 	int err;
 
+	if (eth_dev) {
+		eth_hw_addr_random(ndev);
+		if (!is_valid_ether_addr(ndev->dev_addr))
+			return -EADDRNOTAVAIL;
+	}
+
 	mhi_netdev = netdev_priv(ndev);
 
 	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
@@ -313,6 +362,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	mhi_netdev->mdev = mhi_dev;
 	mhi_netdev->skbagg_head = NULL;
 	mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
+	mhi_netdev->ethernet_if = eth_dev;
 
 	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
 	u64_stats_init(&mhi_netdev->stats.rx_syncp);
@@ -365,13 +415,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	}
 
 	ndev = alloc_netdev(sizeof(struct mhi_net_dev), netname,
-			    NET_NAME_PREDICTABLE, mhi_net_setup);
+			    NET_NAME_PREDICTABLE, info->ethernet_if ?
+			    mhi_ethernet_setup : mhi_net_setup);
 	if (!ndev)
 		return -ENOMEM;
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
-	err = mhi_net_newlink(mhi_dev, ndev);
+	err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
 	if (err) {
 		free_netdev(ndev);
 		return err;
@@ -389,10 +440,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
 
 static const struct mhi_device_info mhi_hwip0 = {
 	.netname = "mhi_hwip%d",
+	.ethernet_if = false,
 };
 
 static const struct mhi_device_info mhi_swip0 = {
 	.netname = "mhi_swip%d",
+	.ethernet_if = false,
+};
+
+static const struct mhi_device_info mhi_eth0 = {
+	.netname = "mhi_eth%d",
+	.ethernet_if = true,
 };
 
 static const struct mhi_device_id mhi_net_id_table[] = {

-- 
2.34.1


