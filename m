Return-Path: <linux-arm-msm+bounces-31852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C39B97A676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6491C221DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964B8154C14;
	Mon, 16 Sep 2024 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A6qz8Crl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211810A18;
	Mon, 16 Sep 2024 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726506563; cv=none; b=Tnuf1qGIzj2SfuiOQg7IhAaqhBPVQ1qH9fv7K2A3OOUGnLe4wQNYRiQgr9Vi7HacUxH1rVxyesxF3fhwICs/KViASFI74gH0FLRfesEZeeB6lPf+QBpCVaIJsiYp/yFystBgo5ZkDnH4FEehemF2/kBLV41nQkyO9/ZdOQdnUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726506563; c=relaxed/simple;
	bh=vA43DED5cU8XQdbH1GFUNMybzOsZl+S/DID3fl5TiC4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bPCAWNCzTLNctiNqENiWX7cwDH3fx7DmquQVojvnJgwtixDjiJy01atfcMmf5/nMj94HtSjhoDDhev7dARkfvk3Cv5uYb/2Mt8C2oZJuwX5e2NCdhzRpjKaJvh8hQCohOyfrBDUNfo3rmQ+4glQtDL5fZeNhtyz/8X7s6T1knsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A6qz8Crl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GD46x6022323;
	Mon, 16 Sep 2024 17:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SqDB0XqmXcYN/ExgKvK0r4
	lEK60MY86mshX3grJeWWA=; b=A6qz8Crl6dqSe3F0N4B+/z/IyeywvFEqfHgycL
	qXxRYyXvKRsJ6iLyUJw2Z4QYHPKhFVmVACodByS1HMmLXHDa/KWG7SHMpt4NMnxe
	xY5mrVdL9bThy0zMgXyWMTYkiLhkxxfYq0JQzqX/pbVlfugXpCjDIKo10zl/Zdrp
	Pvi70lXQdpXjTnxjM3XX1Paezh1vEXKK//z5iYrHYlwqwfzgHDXDyVn83ggWfgZQ
	LT3d2Aur6QNRmd8g/LJ7pjPK/CKLKN9E8ByKmPNnIygUodC/goitP1dLIVVQNxii
	PBf9JvRatnIJTynA10gFRlzRPmkWybDjl85VgOlrKkApRRjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gcvpyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 17:09:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GH9DVo016157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 17:09:13 GMT
Received: from hu-yabdulra-ams.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Sep 2024 10:09:11 -0700
From: Youssef Samir <quic_yabdulra@quicinc.com>
To: <mani@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>
CC: <quic_jhugo@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carl Vanderlip
	<quic_carlv@quicinc.com>
Subject: [PATCH] net: qrtr: Update packets cloning when broadcasting
Date: Mon, 16 Sep 2024 19:08:58 +0200
Message-ID: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5-PW3FNWiHcp_rwNRxymQJ80IAP1pboP
X-Proofpoint-GUID: 5-PW3FNWiHcp_rwNRxymQJ80IAP1pboP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160114

When broadcasting data to multiple nodes via MHI, using skb_clone()
causes all nodes to receive the same header data. This can result in
packets being discarded by endpoints, leading to lost data.

This issue occurs when a socket is closed, and a QRTR_TYPE_DEL_CLIENT
packet is broadcasted. All nodes receive the same destination node ID,
causing the node connected to the client to discard the packet and
remain unaware of the client's deletion.

Replace skb_clone() with pskb_copy(), to create a separate copy of
the header for each sk_buff.

Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffery Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 net/qrtr/af_qrtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 41ece61eb57a..00c51cf693f3 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -884,7 +884,7 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 
 	mutex_lock(&qrtr_node_lock);
 	list_for_each_entry(node, &qrtr_all_nodes, item) {
-		skbn = skb_clone(skb, GFP_KERNEL);
+		skbn = pskb_copy(skb, GFP_KERNEL);
 		if (!skbn)
 			break;
 		skb_set_owner_w(skbn, skb->sk);
-- 
2.25.1


