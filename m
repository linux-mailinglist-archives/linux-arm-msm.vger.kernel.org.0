Return-Path: <linux-arm-msm+bounces-91860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOQgJ8FBhGng1wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 08:07:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BFCEF46F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 08:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6673A3003734
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 07:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E04354AFB;
	Thu,  5 Feb 2026 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sgh37Aov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO8s249f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5C334C14
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770275224; cv=none; b=Dts3tWpd5uQJdg+As2gjhggqmBTWhShI+zqSiM9nnjW8CvGCQRL2DXdu75esA4qMj9foJXOjV3kuKh2F51FQT6ZS4HdkHJW5eEY16rLTcpfm2s0fe7/X1SBxmnO3KAgJUvh99rmkgHP0KzwxHkDgUkuy3vHTHelw9iw7ilxtg50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770275224; c=relaxed/simple;
	bh=fq2wpiZ773IOFc7fxWAh/SMh/YI/JwX8itDPQ/RWkNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZtM5JL47kUFwmPK/ImgmX+Jj/AQPEPQpMUSznX6DShkOAggrYVgc8p4Cwmk7Cs86IS+E0I/a4r6L8ELglbVrMkdwduGN8C9tuC1+8XejaaaaWTT+95UHwd4HazzMjKui4i2JzEfICaGgwv4y9y/vh6Q9aJjTvDOhlFDn2cJ1d+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sgh37Aov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO8s249f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dlod3031034
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 07:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5FKJB2P6HDciMpPvjhiKmPzzy+VBOE2ZMev
	xnuattbg=; b=Sgh37Aov/IsnLYfc1fPG866Dvpk3PX36Dp8qrHTqkRoGnICBn/I
	BR+wbCoBEJdh0yNTc77RYwN20ZM8cZuCVqKWVNwB/AaTmuRW9T1s4LV4SK12qahD
	s6/8LPZ+vqxbcgMAjecSOKB8Tb3SN7qL4Ql0iGHsvuGsTGVDmhnK4RnEIsE9RNDX
	l3flv9L3CIpn9Xj7RfpqGgAt90w2Z4shXqsSpANNJzgcmBlxkjzqnFMCgAFkxsvM
	WWI9XWf6udCRWGs8Skb7DLJhagANI44AivQ+r3IQ8oef3CA7qqIsBjuj/QVVxOz0
	P8zCHBWqIbK/ogVd5DRogc/XR0/413rLoKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tj6eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 07:07:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a8c465c1so13282855ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770275223; x=1770880023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FKJB2P6HDciMpPvjhiKmPzzy+VBOE2ZMevxnuattbg=;
        b=FO8s249ftZFb61jMvfZhSQg6Xlfrfw4Qxt2icGrr1rcODNLWTQnDSx5HxYZAbQV6aN
         jRXNa7OrjON54i4NzU5j2ozPVZEAFgmt4/JkHPWtBKXBGP9zRYQ5cad708IYPkRfdH4e
         LHksNkJn0CT2E911K54UDAlpFU2tYc2FtCHog5aEAHZk2yQ4sssuUZuwlKU+qYm6UHlz
         DZi2mfKHb1kJLdd29E7TdCn5kCJ20lXIoB7a8fCVjmnhE53OaRee/2on7sZWBivJxB0Q
         KG5oIx/xmIGB57f7tBJFkVrCNeYZZfYfZeVfmkoFCA2ycf0T2WPYedLkktg5g279/7og
         /h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770275223; x=1770880023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FKJB2P6HDciMpPvjhiKmPzzy+VBOE2ZMevxnuattbg=;
        b=mlZQxv1Dd00JYUtxtCpZH/aXzeErZd/DoH0xgGElUBNgzHR8DBocPjZ6qVBUeh+7aw
         yCpVQeR3qIlsjL3YD2e9XER2V0ALPeJQ4twvL4qEKbcrTH+GOlhjjlaatZqlmk98BYhi
         WPVXnCtB0rMhep7nbZYUaqgnGAjkrvy89xPk0Tnhdw551INVcTHrYrQrc80ezxMBj1bm
         W6rg2k83AvBY/ayZ4kWm8JOP/jIADHrGzPaXMSZVkwppw8mQERzKMQFQfgw/dU68lo5s
         xjqK961j/8vDm6vzy8AzQcM02dJCb3EK2heU3roo3aoxTDFj15Hev+wY4IlpZiiEWIh4
         cOWA==
X-Forwarded-Encrypted: i=1; AJvYcCXFtbfIG2mBORGV7wykjq0vzIGgrmq9+QyYS+CDJ71oPd+nPiMIr9n8XGa4WLZsoniDOOac96DT7aakImtV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt/x1uUWd4dbe2G0NB14x7WLk6OqeCuR6E+2QqIX/LNWGIpOZU
	FUO1JYxynXole6WCKIGQd8dgoTFBeNjQl4i17w0zTJLAvifoUuhgJu9hNWmOUgfdQ7bG7x6mnxD
	LkaVlv5stdoXKrlUMAZFBXKFl1J6Er7utpUuFip2vH/WQojxP+NjWRBpR74B51txqwmmU
X-Gm-Gg: AZuq6aLr9Bjc7jgDAue9mWMlEGw3P+tw1yb8ZBxQyoZNbanbS7CZTPCaHJTxpf1kJF2
	4fTXSy8UteJx2d6susVLooqga048XRZDqAPQ4BpvQxWF00bnOKiEhG73LKBoROewh2KKweJQ0bk
	3j95Sn+j/7ySiKNXCvyt6xxs4LkNxRxNt3a1idjZiM8IspgZySgmP2blXnX6D+oB3W4KBcL/yxI
	HBKaxTAwsBXmIqjko9GXr43/i+9AOfsBmmIOSiqysdP4Wq2adtCs/l9hjFxdEAQEoRQocQSeIw0
	n79B1XZgnOGjfOeKYWh1h+NkWgGh8MknCP5V/Ed9y0zde3asKAtBzNU92gGW9cD+G9U1z4jiK9M
	jS6TioTKoncEOemA2xGWA9JiI+fx+IJzfeuw=
X-Received: by 2002:a17:902:cf08:b0:299:daf0:e044 with SMTP id d9443c01a7336-2a9417aaef0mr22899455ad.18.1770275222924;
        Wed, 04 Feb 2026 23:07:02 -0800 (PST)
X-Received: by 2002:a17:902:cf08:b0:299:daf0:e044 with SMTP id d9443c01a7336-2a9417aaef0mr22899065ad.18.1770275222352;
        Wed, 04 Feb 2026 23:07:02 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a143:fe87:de49:8a5d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8553e888sm3819165a12.31.2026.02.04.23.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:07:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: robh@kernel.org, saravanak@kernel.org
Cc: andersson@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        qiang.yu@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] of: property: Create devlink between PCI Host bridge and Root Port suppliers
Date: Thu,  5 Feb 2026 12:36:40 +0530
Message-ID: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vvoxh7-XPLckfyAl7vIG38GXfBzQGazu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA0OSBTYWx0ZWRfXyX8aCVADEsAE
 rmQaspjAKLpaCqx08b0YE/zWNWFiyndioz1zScFn7LRI6ByVRd1CSqHeKA4aNvVoOZBrxNSq1TV
 3oYwoHoT49K5VOngOkn0pIvWd789vu07ZyVzFopMp+5pzfqZUEiKtt7GVuPOUX84rvid63hqvAO
 5EUKp28pvRbxZNpCYlZ3pUMvjVxNupcQ283PnTx/ioD43y/IRL86EEobTK1iFs8ORmeq4OAzddt
 8JlsQfNFsnTvRIeJkC1jUiLwONf/hHLhc85V88aemGygzMMQwHrBWh1E47Sn+a26DWmEH5s1Stq
 mdcuRk/tLq5wzLCzRcIoPYgmlFf1ahKUg7Iimvfik1+hNYM/A2ELJwlCUHzmE6reDoF9Xhajuyl
 BVOkD40BSUG75jlWkhqp1N59ee6C6YGo6EENENd4M+geqw1tyTP7Umj9wg/uSbCg/LD4Zfi30yS
 bpeMhW3GIXALHqiqdjA==
X-Proofpoint-GUID: vvoxh7-XPLckfyAl7vIG38GXfBzQGazu
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=69844197 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=n9glyVbX8GFbeWSgBHEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3BFCEF46F
X-Rspamd-Action: no action

In the recent times, devicetree started to represent the PCI Host bridge
supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4207
("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
the Host bridge drivers still need to control these supplies as a part of
their controller initialization/deinitialization sequence.

So the Host bridge drivers end up parsing the Root Port supplies in their
probe() and controlled them. A downside to this approach is that the
devlink dependency between the suppliers and Host bridge is completely
broken. Due to this, the driver core probes the Host bridge drivers even if
the suppliers are not ready, causing probe deferrals and setup teardowns in
probe().

These probe deferrals sometime happen over 1000 times (as reported in Qcom
Glymur platform) leading to a waste of CPU resources and increase in boot
time. So to fix these unnecessary deferrals, create devlink between the
Host bridge and Root Port suppliers in of_fwnode_add_links(). This will
allow the driver core to probe the Host bridge drivers only when all Root
Port suppliers are available.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/of/property.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 50d95d512bf5..10d041ea61f7 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1561,6 +1561,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 /**
  * of_link_property - Create device links to suppliers listed in a property
  * @con_np: The consumer device tree node which contains the property
+ * @parent_np: Optional parent device tree node requiring child's supplies
  * @prop_name: Name of property to be parsed
  *
  * This function checks if the property @prop_name that is present in the
@@ -1577,7 +1578,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
  * device tree nodes even when attempts to create a link to one or more
  * suppliers fail.
  */
-static int of_link_property(struct device_node *con_np, const char *prop_name)
+static int of_link_property(struct device_node *con_np, struct device_node *parent_np,
+			    const char *prop_name)
 {
 	struct device_node *phandle;
 	const struct supplier_bindings *s = of_supplier_bindings;
@@ -1598,6 +1600,10 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 			matched = true;
 			i++;
 			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+
+			/* Link the child's supplies to parent if needed */
+			if (parent_np)
+				of_link_to_phandle(parent_np, phandle, s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;
@@ -1632,7 +1638,21 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 		return -EINVAL;
 
 	for_each_property_of_node(con_np, p)
-		of_link_property(con_np, p->name);
+		of_link_property(con_np, NULL, p->name);
+
+	/*
+	 * Supplies for the PCI host bridges are typically present in the Root
+	 * Port nodes. So parse the Root Port supplies and link them to Host
+	 * bridges (identified by the presence of "linux,pci-domain" property).
+	 */
+	if (of_property_present(con_np, "linux,pci-domain")) {
+		for_each_available_child_of_node_scoped(con_np, child) {
+			if (of_node_is_type(child, "pci")) {
+				for_each_property_of_node(child, p)
+					of_link_property(child, con_np, p->name);
+			}
+		}
+	}
 
 	return 0;
 }
-- 
2.51.0


