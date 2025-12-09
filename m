Return-Path: <linux-arm-msm+bounces-84769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816ECAFC29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 12:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86F273011794
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7751D320CA7;
	Tue,  9 Dec 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANwSlMUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvRy+nLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B52320A17
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279556; cv=none; b=QUfEvpRV8rZY9o13lTa7zZMTSH6cfRjh8aW8E6LfOfXWdFBceKbfDz6zSbFEFw9xiG27RwSS/pncz0+HePEdwcJIbYi8WJrmvWeHC97n5ppyKT6anGZvAlzVaH8UZ1YBRbEcbrN0h3S3VXGeVENQfFG9djPbOCADbJpIyvWQyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279556; c=relaxed/simple;
	bh=4Xt1IQmjvM1per4xGAI62B4crkvRjHhecHdHzfrfSEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVzK2iWKIwqQrOStifTtk+0UhmaPYUHSQUiX/uUnlemmvjyCJJsojyBJ//aHrDqdYj9dOYNKhx3bOxsrDzxb8r/ONPWwNzgjso8zTKQ2etcQj0wZNHDQAAj9lBLXu44WhA5qJObNq1N5CrHYND8CKRKeskNa1ZsrGH/6BPTvhVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANwSlMUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvRy+nLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9B4wXb3326365
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 11:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzvm6kMjAbwAyGaq4GDz/9JFMnRPWETiid+E++VSmOg=; b=ANwSlMUxEAtZ9DIC
	ydYKJKww+wSw2W7kF2/z/Qq+VjFgZr5KpVNfviD9OCNzMXmqSfe9LHs8ZQUiJ+TJ
	QxM5cHuW3+WONfyXuB+PwRbQ24Unq5JBxosuIwze6ziXLxHRPAnmbxdpfspg6kVx
	tlAaIiGTIBWVM4vQJfoPg3GanT5MBbIDA2MPuKQ6hlebDA4SIjtbngOIdfC/9Lsa
	39zOyYo/SMSGd3lqxGOwItFXCjCr2/oHA3aRCUCNDgkVUDQ0T+yCnwhYMGSmrxo6
	MKNBN5bAxLrap8vVLFrOwcPSBdsbAiR8d68rMonLXdzYe3/2s64rxhOt9TrObI+h
	k0TRAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk50258-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 11:25:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3493fe3185cso6586818a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 03:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765279550; x=1765884350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzvm6kMjAbwAyGaq4GDz/9JFMnRPWETiid+E++VSmOg=;
        b=MvRy+nLIHQ8jzX7aFtytENPVf6C7oO6030GSaQjZq5amHow+uULBtRgxVQkazlMt7J
         +b7vklTFw0GH1O0Z3C1JbmLoSSBQqm6fk3EOGXp7mO7xdG4vEomdVPWK+jEJK+xTGFxb
         stbnqWtd14RRbbY7pQL9+0zPRnXxb9FKQf3UsA2AYT6QYSQkTDniJuGi5/FJsw4NuElI
         Q4ZlXX4uiV42bR89Olehf9rC6nf+jREih98ppMYxLYTKpkNMqJYIrpmAYVB5K+s+8pY5
         m1i6LTq6ZZ2O3/9OlyA8TX8MWIphcJ4SWxonDrYMrBaqGN79QjYYFBJsaFhzmlD0PJBZ
         Pkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765279550; x=1765884350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zzvm6kMjAbwAyGaq4GDz/9JFMnRPWETiid+E++VSmOg=;
        b=Djq9fACG/ea/KwYlowJyvB6k4qLMAM+YXuHzuiXGAk7FPkd+A0czJLRH56KKjexqqb
         60Yk/0OAEyH0X/cKyUE1dYMkXdSDjRRWaxAFkJnDe16g4D6+aOCJlPyX+zwgZZ6t5rrX
         LgVbshAfq6MOWJsoz7SmEc7qirJTEusqV8ipJKs7r9W9GaFdxynYyQR4tFJAITVJXLJ8
         tqlBsndw1+QZ6B746X7FanaOCqnvtqUWZObNyxymLTfMsI/mCAh8Ig1sSYYH/fN8CoZw
         R2vJY6H32cXaAO+b48vREGgaEGC41RYs+0KjEZ4PxbA/usfI36Y6PaRStRHQ7FWJOdE8
         SSsA==
X-Forwarded-Encrypted: i=1; AJvYcCXnvY2kHncA25FEQOOgfg1TJ5U32Wk6FldNQVbJ9DuNHx0j3D9bR3W5YBk7hdHjMtIg4JKARocqpuShG/oo@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaqv2I/whQ/LNOrB68m0cNEvZmvIwbTYR7Ba5utfjcfEk8L39
	Xdf+Zwl9S8JDZtgrK9qssHgwYWYlgL5dfzM+idlzol2cchwDSnaxitCQdmGYJUgpwCJbY4Y4rxd
	sp+LagEJEOtz8HDn9jCOVaXhq4KdqzduLQ0pwMyrq/dtzvWNWiPQZjuYEhR7gh6X+/c0P
X-Gm-Gg: AY/fxX57ZPCSiRpnlnTg67+48kjFaVUo4eP2QgLAHI7TLBE0DThUnKAC9GyL65ZBrsx
	kqBXg1I7kqjM1VGzRJ7LDMJr6YRHqeL+UnBQdEYd+0joei+CX84dmL8mXhHnGYjRcwX/bu5HsXP
	cJB40Wz8l2qGTTRRAqfwh8KIkrx2Wir85Gi6dCNfpTVAlHWnGUTcFLJE8aTjZMmfX0Nfgczw6+p
	kdb5uXez0ILczSuf2gsfxizks1UiPcTecrzfGh3ZbqCQ/zVHeG5Ifhj2wvpQtZrzdbHAv/caSQP
	NDsFunuBgdM8njTYnPRtzRfwsg8LsVSXOB9bFgBXpOBEfQLrJ/MnRvTytmNzzMVwoQEM3TTMaOE
	pJPm0K7qi+eO8ELiBxAcEMH2LiTtSkkIuDJMW
X-Received: by 2002:a17:90b:3c90:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-34a4f89b48amr946337a91.11.1765279549704;
        Tue, 09 Dec 2025 03:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQEq+dHQp2FQjrMyzqkzhLh2wL7hYVs08v/LzvnKvF1wFx0jv/sRAtqEpEOmVocGpk3Yu3/w==
X-Received: by 2002:a17:90b:3c90:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-34a4f89b48amr946328a91.11.1765279549204;
        Tue, 09 Dec 2025 03:25:49 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm2135964a91.12.2025.12.09.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:25:48 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Tue, 09 Dec 2025 16:55:38 +0530
Subject: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765279540; l=6488;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=PyNLCBsIRJYR2Mdyu60wBNZuDnOIiuK8SbOT40fp5gU=;
 b=8CVrovBbbQpgioDY7gBpzhp2cNfu9WAMC1hNXZUXbn1V/2fg+z558pJNrEMaCrnzjSUOgwXBJ
 JSFl/EMI7kZDc1YDj759QCyeoerv1mqmNEJ22e/Tueq2fSNIzJF6In0
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: AYL-eRvWGUtTR6uOak4UWj7bHZb_PkTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4MSBTYWx0ZWRfX3eP71YEFtJhK
 Wb84qkNAGBK9l8wZyckrbyhjj+FQPAPel8JyPWBCTuNHBaDRjQY4W+0nqvugzOpAHrFlNM7zmQP
 26wzqBzK7UwCfHtwPlgPSPzahvnE2M9leSFnpPkIj+bX5loIQHQe/rbilGvNzQJUnOJ2CkBPggK
 uR8h+ZoTG7wKT1piOf6l/H/N4X3F9JLuathi7f5iR//ZKBHoa17ALwHq6CIjNwKwYh1fLXQ9dXV
 hQ2MCNAYNjZ6ClhD3MhWVb6dWdRqHUWNaLWCYJv3wY5rxQqgrORatHLcMABlZ7W10ddxmJzQAhj
 8dpXU0viEv5EXHqMED2/eZowRUppg5YM1sr8+n7J0WFu9Mlv9vKMV9DpPTJ4Ds4cDSqbxVU998h
 oPE09nBIbm1aNq0q8NsXXMC1E/O9vw==
X-Proofpoint-GUID: AYL-eRvWGUtTR6uOak4UWj7bHZb_PkTh
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=69380740 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=B7OUL4BZy9I5PIjrJhgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090081

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add support to configure a new client as Ethernet type over MHI by
setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
interface named eth%d. This complements existing NET driver support.

Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
M-plane, NETCONF, and S-plane components.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN management
between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
models. Provide capability exchange, configuration management,
performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
R004-v18.00.

NETCONF:
Use NETCONF protocol for configuration operations such as fetching,
modifying, and deleting network device configurations.

S-plane:
Support frequency and time synchronization between O-DUs and O-RUs
using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
O-RAN.WG4.CUS.0-R003-v12.00.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 75 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..d0713e1eb7b024667f8f3f00ed3cf38d91a75708 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/etherdevice.h>
 #include <linux/if_arp.h>
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
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
@@ -119,11 +122,29 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
 	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
 }
 
+static int mhi_mac_address(struct net_device *dev, void *p)
+{
+	if (dev->type == ARPHRD_ETHER)
+		return eth_mac_addr(dev, p);
+
+	return 0;
+}
+
+static int mhi_validate_address(struct net_device *dev)
+{
+	if (dev->type == ARPHRD_ETHER)
+		return eth_validate_addr(dev);
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
@@ -140,6 +161,13 @@ static void mhi_net_setup(struct net_device *ndev)
 	ndev->tx_queue_len = 1000;
 }
 
+static void mhi_ethernet_setup(struct net_device *ndev)
+{
+	ndev->netdev_ops = &mhi_netdev_ops;
+	ether_setup(ndev);
+	ndev->max_mtu = ETH_MAX_MTU;
+}
+
 static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
 				       struct sk_buff *skb)
 {
@@ -209,16 +237,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
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
@@ -301,11 +335,14 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
 }
 
-static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
+static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
 {
 	struct mhi_net_dev *mhi_netdev;
 	int err;
 
+	if (eth_dev)
+		eth_hw_addr_random(ndev);
+
 	mhi_netdev = netdev_priv(ndev);
 
 	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
@@ -313,6 +350,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	mhi_netdev->mdev = mhi_dev;
 	mhi_netdev->skbagg_head = NULL;
 	mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
+	mhi_netdev->ethernet_if = eth_dev;
 
 	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
 	u64_stats_init(&mhi_netdev->stats.rx_syncp);
@@ -356,13 +394,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	int err;
 
 	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
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
@@ -380,10 +419,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
 
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
+	.netname = "eth%d",
+	.ethernet_if = true,
 };
 
 static const struct mhi_device_id mhi_net_id_table[] = {
@@ -391,6 +437,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
 	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
 	/* Software data PATH (to modem CPU) */
 	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
+	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
 	{}
 };
 MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);

-- 
2.34.1


