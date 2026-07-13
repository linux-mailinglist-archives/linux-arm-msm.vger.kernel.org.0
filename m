Return-Path: <linux-arm-msm+bounces-118818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xyzPL1P/VGqRigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70474CCF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:08:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/CknA1O";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ji8rIqni;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118818-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118818-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7DA30B874E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7A13546C0;
	Mon, 13 Jul 2026 14:59:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCA34EEEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:59:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954746; cv=none; b=DPogzkYgCMJCx2kP26UQ1YZJf6YDu9ExWdaGniEh6qjW4cGh+F0mf4UiTtTUaiUZi2LnFuw8/+uwVJXW7VOSgLeamfWV3Ik6l+58gBm8J7kcyVKZYVvYA36HH+APNjhf2x5zvVz4mzND7ET7AhKETpehe9+i466Rs9Dysq7WGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954746; c=relaxed/simple;
	bh=lkIgxWjwf/sFNbQZls9lXBmTHyrWhCv7iqGMHOrl1TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTOs4w/3+g/RFGHaja4tf8Y/BdhHYl+Uaxcuu8YkpnJxbsxQfDHavyu4/SRBz2DWNajEZIcqINCVmiAkN5/dWVv9aiIZCJAzCohdcis6iA2dbfv8SB/37vYjZDVBouXXtK3C3b1f4zW6yxSemIkPtLQb57ZvMSs0lQBnjrqZw28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/CknA1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ji8rIqni; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDlYa1453502
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y0B/Toi++qviIsvH3wfVq2MiAIIVK6Q0fCt
	d190RJhY=; b=k/CknA1OSczHCEG6uycRAnm5Hcq3NAN0oR7cqwGm83rbmAswce/
	8AraklXfNNdy72spR/hK6WQEBiKhdazNMtH/2/V+gmRGIhQB/oFPPOTZM2j6ovu2
	CEn/fwL/nXuwLHjxxjrtWLmd55Ehx9CAuJA/s7qyfuctis+vVJNgMEsft4Walnjq
	quM/uMR4AL+6OO1DJsLDzAwEnea/uuMoNbInqeXwH+cvOU9Odo1KVFP9YACD2Ty9
	2cwnKPC6RpLsacAutAr1kX9jVYK9GkBBNfPiRsvaKNMs2x92TaXHM9lDoA7Vlg5q
	LpK3JTWDkz8wMvyvaE21qELMurRTFqeOyKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01txk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:59:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso43726316d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954744; x=1784559544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0B/Toi++qviIsvH3wfVq2MiAIIVK6Q0fCtd190RJhY=;
        b=ji8rIqnitntbUCXjzM9Hb7NVgX54bLQIOeWSTsd76iXiE5fSfEagIu0WrVfqYD5qjF
         80cBUIVXTTN70CYuJzycO+f45GRuptEBBy5tV8iMRia13510+qFMgc6XqpAKSwPJDSrJ
         sA8ZzPyMw3UKpoJVriZsvj2MypQ6w+MYNomwkHQyzjeyt6ISUDVhQ08pZPBLCdGBTI8A
         /7o1r4G1qPCmv/bbBigogNwrM9120wmbDbE775I8Q5ePBzeSWuJ/V6VCcjw1m7O56rIS
         jWZqkLwCMIacd/cnlYfpmsGO3AG11mZM8JSdFdkeQgGS3Z3NsaBjP2fx6C2P9DMuWf6L
         USRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954744; x=1784559544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0B/Toi++qviIsvH3wfVq2MiAIIVK6Q0fCtd190RJhY=;
        b=pBc+XTABoZnw3yZE4Tsh2VmmzsG3u3qY1yRTiqE7FXStLNU8KFg4klW2sKFw97zKrX
         ojGfcmwyLc06bhVkqqwg6fdLadBKlgSTk49hvk9CJJgAhMX09iy8b+U39rPBZ8W1S3y6
         B4IAlNtyFKjzBUHoyr4Vy8Hux6qmzE7Sg+mQExPC7bqN9TWmW02ybio3hrcyQVir/ea3
         AQ4A7GYmfz1MDV5wge6v8Z05Iajdg2XQlx+6ZMx8Xw11b3OAiuF73J5IF0cO/rRiFtZa
         8bzLYLxJxe4Ll68IimJhUP12dFLTaCOgoHX43CtESCD7IBcUu4VmLHENwAsMsOKggZBo
         QtAA==
X-Forwarded-Encrypted: i=1; AHgh+RqWezKVkuVAIda523i3uapzi+YUXL+fcNrfaApFe/FqEF6H9Ffgy7sg4BM6AZn5sJgIYfUy843cYOBCanWo@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZXHtloHcnZgmA4udx5z+a1yStfSWXmbiKyx0+9/TNKMS7aG+
	e3qsTGWW0o9NaWqNkZ/b7MM8ur/3jQzYaU9HtOs/yp9yzbtwHHFUYghdfVSFxESofSMv4eNI/eG
	D5H7+QtilxNmqhN+YaMfJFfNN0fXKNcu/q56QxvGYWEcXmksgPIpEHBOIWp08rhZYDPq6
X-Gm-Gg: AfdE7cmgJ2XHw8GZy82cdznQ0Nat81Fh613Abo9VUWbEp3iA7OBS/ZOvmbvLXBAtbBj
	fLRXC7Rpk+T+/DOrp/pf6D7/K9Ta765SiOz64CXGZub+BAEaVRcOnWt7u+iiYc/wjjj5gti65gJ
	LuQa1TAxBvEnvw3nms631H5ymuttXAscfS4CzuRDugGQPUTUGfshu4whM3P2lEfyMlf6XOpW5CM
	WihYMTxKyh5yjyfPG9+/WszoSwHCZt9FLj5EQLfuYTBYyj2RT5+ezuhkqVdRqnaHh/MYkmx4Kb/
	Ies9f0rGxrXpq3PTYyE5iz5BINaBHXafzoyq0ekHhc16bM6JpAGFmXrlv8NiRM9kRiqz5DAVGFx
	NsvF8dyXM9u12KRAAbTmYM5aDuuTKc+i/0ijc8Oqfilf3wRtutoc=
X-Received: by 2002:a05:622a:1b8f:b0:51b:fddc:1de8 with SMTP id d75a77b69052e-51cbf30423amr92118281cf.65.1783954743662;
        Mon, 13 Jul 2026 07:59:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:51b:fddc:1de8 with SMTP id d75a77b69052e-51cbf30423amr92118091cf.65.1783954743140;
        Mon, 13 Jul 2026 07:59:03 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15fc29937esm542450066b.22.2026.07.13.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:59:02 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: mani@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org
Cc: jeff.hugo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] net: qrtr: ns: Raise node count limit to 512
Date: Mon, 13 Jul 2026 16:59:01 +0200
Message-ID: <20260713145901.212396-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NiBTYWx0ZWRfX6LbSkNw5f0Rm
 yk6mjjzbfdQf6322cOk+qoG8iULuHUok3HWraPGVqD5tJdW/7EEU4MGvmxkummwRNBZXPkGKYGp
 JK3QwARjSvawV7mOYBHRNEAtPkfkd/c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NiBTYWx0ZWRfXyQ+ZaPnRATwn
 64BbntpY0jlRKmbbRww8n8CDJzeBa74ZqNMRSECa/GCO33LdRpUDOIEvM8i20sryQvM7hjJqWUu
 Tg7QVjvntTPUSpyUYtcKNTu38IZKUITarqxcLyAmespcjen2iTOnlnRxXN+A2XR5A5BypcrEMsc
 RSfe4VyD6CAD1P8zcmNYC7iOrDqYUIPZjXRv3U/7HKMYF3h7CZFng8K2/LsK4Ml/ch4pTBng2Zr
 QWpcr/W89RJFgm6EChDJUAUei7HPxd37Qfb610065WMwmGLB7k4F2ClHNXVNsMMkXdht4v0e3w7
 SzrWb3kCPeb+9fQ/seW3Mcf2QyKvsigyfoDBErVqoQrHY2j8QCUDIQdg6ujkcnQCa3TBHRTx2FM
 HDQTMAiF2IyrSP6bFhbQ9gEC8X7IkOvYBXY6E5cCymbN6Mtn7FEloYMVKcspeQqcPmqrhKMc2l/
 WYaRrntArTbJmGhMvsg==
X-Proofpoint-ORIG-GUID: GSfVmLg-QibnrIBuN7_BcqQKndGuoyPe
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54fd38 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BAFur2-UtLnwWEDNYK0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GSfVmLg-QibnrIBuN7_BcqQKndGuoyPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118818-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A70474CCF7

The current node limit of 64 breaks the functionality for a number of AI200
deployments that have up to 384 nodes. Raise the limit to 512.

Fixes: 27d5e84e810b ("net: qrtr: ns: Limit the total number of nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 net/qrtr/ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index b3f9bbcf9ab9..e5b2adb161d9 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -76,11 +76,11 @@ struct qrtr_node {
  * requirements. If the requirement changes in the future, these values can be
  * increased.
  */
-#define QRTR_NS_MAX_NODES   64
+#define QRTR_NS_MAX_NODES   512
 #define QRTR_NS_MAX_SERVERS 256
 #define QRTR_NS_MAX_LOOKUPS 64
 
-static u8 node_count;
+static u16 node_count;
 
 static struct qrtr_node *node_get(unsigned int node_id)
 {
-- 
2.43.0


