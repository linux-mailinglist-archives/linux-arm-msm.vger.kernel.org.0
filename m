Return-Path: <linux-arm-msm+bounces-92676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKyWJ+OyjWll6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:00:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F312CC83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38A5C306BF2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000FE32BF42;
	Thu, 12 Feb 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWc2UZUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kx1Gkvf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33E329E5E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894037; cv=none; b=a+AKGytP4ZIpX8jnfCKTMTEixQVB8s3AhZhfMk2w45IR4pPIZPdPxZ3JCA4714MHTwsLX/GehEkqZBct+JFS66b+x44O9U3JT50/pVTMZcxS2xVpTQrbEECPgnynRQ3MJrffKGBe8dZRX43KSa9AMz9oG7F6wgbIjatJXkwadSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894037; c=relaxed/simple;
	bh=Co1ogNbrXYtnG76P1/DduYW9hZG6P1mt8/oVy79f000=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cujpn5n0FYBZXcaEaIWr+21BjrjxccJWXSwt3T1cGsQ/AzRLPKn0KDo2JqBdWPemjRslEgu+YPJ5lwgevqKIGcvJgXMaEFWv6Rz0RT3lbRQrQ9GLF1A1ZtL1b/g6w1EPIlBZbRegUEV3yHE+BD21J9HZHuUR9xsZ6JC9ay2KYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWc2UZUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kx1Gkvf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAcu6v2545029
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JlHNJePS7I7N8MArpoypC6/sjaeOy7o2sv3hro6NbT4=; b=lWc2UZUSVzPaa4Ph
	B1WADDVdkEUBz535uuE4H5tLIbS2LC2VKyr5eWE5QiJcsidmYErb/dwExVnPQJ2E
	+6wJOg0A7aRpk3yGCYG0VwDniqo6EIYARowRaJ/TqpsR3D9Z3cmNas2+ekF+ysLx
	LTxs8AaVThJXeySoekpL1HW9yEImSVrEg7TLGO6AwCqykh7I3TDvQfgV3iUiIhMV
	NRgdli1On0FLuZSZ66aDJdMLx8BMy3irJNg9M0876TR+kDUXFuk3vPPORMSCsows
	xFphGIFH+t+/kx+l4rvBS9PUvi3f2z06s241Sw9FCjIO8i0KrJRSuY9qAQ8RYTDx
	+OBAgQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpk0kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824afcaf003so422531b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770894034; x=1771498834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlHNJePS7I7N8MArpoypC6/sjaeOy7o2sv3hro6NbT4=;
        b=Kx1Gkvf97/t6OhqfZ0Bfs8KYe7dqrRhKp4t8+rJkqKOXy0xcoS1VFs8yJj3OmIDJyr
         OXKYliAWYvxfRUF7mHv8jBjevligcJ+szsCA9BzhSKKxdzVrDoJw1ql0h1Eau+gejfP9
         YfkA5czusEmIGyu/57+Kq9iEv3G/sRWwGX8QBUWeKxDnzyCHlEnNZ2q53IClJs92PRVi
         WMtYGedYguJSEBYsKgjpTVDb0ZB4EvbPKj476RhFmaAO6h8+V//cNZV480GYL1Ip459y
         zy3psapApFJAqSEBqAgvkHsvxx7xANfM+I9mnPQ9lsATkQJGoMcMgGYVoXhCNIgT1kLh
         TF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894034; x=1771498834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JlHNJePS7I7N8MArpoypC6/sjaeOy7o2sv3hro6NbT4=;
        b=Ys0NGdk7GSyGWljHanZCPugD55f90nSIYYJLkHBlouWv9aFY7e8lILHfRiWCUJN+h4
         B9h6fDWR0htPvdXAS782gMFvc0xS/PbUp855Edgcrzq8mTNeN6XaIG7CD+/JGGZK93J9
         sxNiO0qQXRq6c0ClMipPehAI0EQSgyzvOVeKlCJO24GHf+kz2BP4A0Ng7CYFAZ5VS+lU
         jNleY2uG7FjFfNsV0o2wGsRLGuOL1JltJMhRey1UEBx+5uypTqFyrGrrDVuo0S6GAoZL
         cbxvmUk4CS5dW3/Mu80B3uHI61qKuBFKET3HKW/0GYSC8wRj3FzOVd4Z9T7kWqM6cyAG
         7R7g==
X-Forwarded-Encrypted: i=1; AJvYcCV/H6BU70nXJWWs3KUCPy/JUMBFfueFt8zvNMVjLY90YicMYj59DHEWnfbudNj7OPR/xBhlNpGMplvqNYSv@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDlkyq5ucw60MIsnqnZttugyChjGOLvVFN8D4gBLiSbPwMefq
	KhM6EZFCeIR8sKuopjrfzoE7rHbX5K9HQZdbKITowkTRL6vmPu7zw9tnfo/LGhe+uwk17igXFm3
	lNPJtcmZFTB4eYG0qTnt1X6jUiItHU9uHpB1m40C2uoVXDoBVB9vR++BM51PfLKlizOXa
X-Gm-Gg: AZuq6aIsjjBpDdTYSdyolgS+kDs7umIkN9584eInt379OpBSosZrlWVvcw6yo9JPjSz
	tph7RpCUSvcfYs3rleRp1URtGjFXh6SuLXS/JI6Vddey+wvCBtvVqbAsfyLcCGdxsKhzvdJK3uW
	9zKa9olSFoOrlYvTeSSPINECJHhku938IdehBBwQvHHSLWicK2HlqRfB2EvxscUkosnzmeC4Was
	kGoQMk1BvmnVMEQ32fOlNahS60q3sNfFM6rzdwwunjPjksbyQvHYyke1I1+rDFoQDXIY7mPTLgo
	R1ydGaH1PyYSTpAWOySfxLV+sw3pVwQzZTx5KpNGAcd+J5mU6jvTLLZDB+MhQ07LQMUigLACC8k
	nXB/dS539hI0I7xIoxFD5iYTVuKVR6a2foPTnh4fWYtJI08Je
X-Received: by 2002:a05:6a00:1da1:b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-824b03db639mr2377900b3a.3.1770894033658;
        Thu, 12 Feb 2026 03:00:33 -0800 (PST)
X-Received: by 2002:a05:6a00:1da1:b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-824b03db639mr2377852b3a.3.1770894033072;
        Thu, 12 Feb 2026 03:00:33 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd8e6sm4708348b3a.14.2026.02.12.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:00:32 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Date: Thu, 12 Feb 2026 16:30:22 +0530
Subject: [PATCH v8 1/2] net: mhi: Enable Ethernet interface support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-eth_vdev_next-20260211-v8-1-0974b3a8d61b@qti.qualcomm.com>
References: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
In-Reply-To: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770894024; l=5824;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=g0aEVCZ9DgMaz/0aNYMB+qQrxwyAxE9jfedkPvow5Sg=;
 b=jBhp71u3BZsYtWvdL+cV0UV1XZXLIKTq0xSE8JGDrhgX5tApfi59D4vUwrzXKKFD0hr+f0r4E
 obIILcFXnL6CjWp0Ewho+LiYIkY11vv8Bq67Mvg0dGssv5+HiQuy6IP
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698db2d3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Jnl0CxCd8TTYemsjstoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VKavsFdogu_NRqw5BA8Rkz2aMOBpOoyO
X-Proofpoint-ORIG-GUID: VKavsFdogu_NRqw5BA8Rkz2aMOBpOoyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MSBTYWx0ZWRfX4GtscwDf+pL0
 1xOy5CHSanGF7JRWZ50VauxPEurWnYKggRzLpMwV0/qQ4rimtXfiIf+wORmCAAFVijKdhryqOjN
 Ag+3tADfDDN2RPD7z7AgMUIiMeb0GGbRdio9kSbqPkA0rOqUUVX/scueCa55KlZmMo85JHDKngo
 l1ZlgijVM0SMwzp6MkRRfzdoAeheNE16vwAV3L0ZRJi3mGs7jV27IBZKtQIUco/W1zSD4BZjNtj
 F4FhQsPcIdVVJRc3v1MsaWTrRr8MfzpExaquaD3PPaGUMz5GKjZkzUokbbgD/o2pxm12/EmIHbt
 dRrbS27laF+gw7RrQOjLfAIQNdkg15MJNJLnRvP2DJ9xCmpz0FXj+hzG/82WMq1LAtqWTM7MaEi
 dE1rQnnWTU5RFzcVNUVwXQlXOgWLFpzZAuCMBFGfD0Sz5VpgqLawrJ8rOyyiACiJZQfyDmgCT0L
 ZZOpuWQ4XOeJd+H1krA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92676-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[loic.poulain.linaro.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,qti.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D1F312CC83
X-Rspamd-Action: no action

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add support to configure a new client as Ethernet type over MHI by
setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
interface named eth%d. This complements existing NET driver support.

Allocate MHI netdevs using NET_NAME_ENUM to reflect kernel-enumerated
naming. This updates the reported name_assign_type for MHI net
interfaces created by this driver, aligning naming semantics across
existing and new devices. No functional or interface naming changes
are introduced

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
 drivers/net/mhi_net.c | 67 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..aa65b267d5c06c76482eaede097c500edc1cdf7f 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/etherdevice.h>
 #include <linux/if_arp.h>
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
@@ -42,6 +43,7 @@ struct mhi_net_dev {
 
 struct mhi_device_info {
 	const char *netname;
+	bool ethernet_if;
 };
 
 static int mhi_ndo_open(struct net_device *ndev)
@@ -119,11 +121,29 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
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
@@ -140,6 +160,13 @@ static void mhi_net_setup(struct net_device *ndev)
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
@@ -209,16 +236,20 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
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
+		if (!!mhi_netdev->ndev->header_ops) {
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
@@ -306,6 +337,9 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	struct mhi_net_dev *mhi_netdev;
 	int err;
 
+	if (!!ndev->header_ops)
+		eth_hw_addr_random(ndev);
+
 	mhi_netdev = netdev_priv(ndev);
 
 	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
@@ -356,7 +390,8 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	int err;
 
 	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
-			    NET_NAME_PREDICTABLE, mhi_net_setup);
+			    NET_NAME_ENUM, info->ethernet_if ?
+			    mhi_ethernet_setup : mhi_net_setup);
 	if (!ndev)
 		return -ENOMEM;
 
@@ -380,10 +415,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
 
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
@@ -391,6 +433,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
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


