Return-Path: <linux-arm-msm+bounces-21087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9A8D49C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31A71F23D0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F39D176ADD;
	Thu, 30 May 2024 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X91e4lnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F3176AD8;
	Thu, 30 May 2024 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717065409; cv=none; b=JC9mFG0SSJFSZx1BvwMdUHP4DVAsq2oTWm3/zvQX9AQ5Bk7nytjOg0usXdxZ28FXqViuhjTzFOW9f7lJOr7wMZKpBy/Q3P4CaTI6o0sHPB6at89nvVMrb0SSoQrSh85GFrxwR43c231Dsan0pgtoybSoD+7aKzqCdsTl/g7gyrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717065409; c=relaxed/simple;
	bh=HtQkjd8HbGFPhLH8WRqqtICqoILT+VZVoC0M3XmXh5I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1aDbA55DYAx169XdaYgKicOlWbDJtJw/iTpkt9waYDm9SfxE/rXnM8BFqM1rUBiQ+h3j53PZ7k3IzrJrsukapCVznA5iannQ56oJez2hY/ZAlOMEkf272yUyswk3PCRZLfyMxmD6VId96Q8mPGAWZBj8Ij74625cDIFoMxOgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X91e4lnQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U7EYDx021301;
	Thu, 30 May 2024 10:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gzOfkFz9gtephlRxc0+JcL
	G5OjU7gABvXKX433mLQGU=; b=X91e4lnQEJISNSIKvjbX8cP0oxcm10MUW3xuwf
	CuA3XTW1uwbMID8M094kzSq+pk/A9zk7BkaxlIDBI3ukPOyEYk25BY96MR+gF2G1
	D1EcP4D97Im/cpPKkN5q++N7zzcMaJ8xaxeA4gvP6o8qBBpbjUBSlC+zzZuUGomk
	3eky9zdyAmMPw7Rp3fWuBgF4AXnCE9ex9vk7NHrQ73clLd46nBQeXXtduI7wwkTU
	zuKSIAStluvtwg12eHvzfaG+KFyhk/VP/oavQ28Arbzqj2eB34sF2p/8XKWwcCSD
	GFwkAlNMeYtiU+/FmlmNdxoJMS9H+btUscnRsX7KgkmEqpNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0gbve2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:36:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAabsG030467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:36:37 GMT
Received: from hu-sarannya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:36:32 -0700
From: Sarannya S <quic_sarannya@quicinc.com>
To: <quic_bjorande@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        Sarannya Sasikumar <quic_sarannya@quicinc.com>,
        Simon Horman
	<horms@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "open
 list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Subject: [PATCH V2] net: qrtr: ns: Ignore ENODEV failures in ns
Date: Thu, 30 May 2024 16:06:17 +0530
Message-ID: <20240530103617.3536374-1-quic_sarannya@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1dcE_oZy_82EA_e_phq5Cs11fPc76zGN
X-Proofpoint-ORIG-GUID: 1dcE_oZy_82EA_e_phq5Cs11fPc76zGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=700 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300080

From: Chris Lew <quic_clew@quicinc.com>

Ignore the ENODEV failures returned by kernel_sendmsg(). These errors
indicate that either the local port has been closed or the remote has
gone down. Neither of these scenarios are fatal and will eventually be
handled through packets that are later queued on the control port.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Signed-off-by: Sarannya Sasikumar <quic_sarannya@quicinc.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---

Changes from previous revision:
Changed return type of service_announce_del from int to void.

 net/qrtr/ns.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 654a3cc0d347..e821101e7a4b 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -132,7 +132,7 @@ static int service_announce_new(struct sockaddr_qrtr *dest,
 	return kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 }
 
-static int service_announce_del(struct sockaddr_qrtr *dest,
+static void service_announce_del(struct sockaddr_qrtr *dest,
 				struct qrtr_server *srv)
 {
 	struct qrtr_ctrl_pkt pkt;
@@ -157,10 +157,10 @@ static int service_announce_del(struct sockaddr_qrtr *dest,
 	msg.msg_namelen = sizeof(*dest);
 
 	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-	if (ret < 0)
+	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to announce del service\n");
 
-	return ret;
+	return;
 }
 
 static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
@@ -188,7 +188,7 @@ static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
 	msg.msg_namelen = sizeof(*to);
 
 	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-	if (ret < 0)
+	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to send lookup notification\n");
 }
 
@@ -207,6 +207,9 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 	xa_for_each(&node->servers, index, srv) {
 		ret = service_announce_new(sq, srv);
 		if (ret < 0) {
+			if (ret == -ENODEV)
+				continue;
+
 			pr_err("failed to announce new service\n");
 			return ret;
 		}
@@ -369,7 +372,7 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 		msg.msg_namelen = sizeof(sq);
 
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0) {
+		if (ret < 0 && ret != -ENODEV) {
 			pr_err("failed to send bye cmd\n");
 			return ret;
 		}
@@ -443,7 +446,7 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 		msg.msg_namelen = sizeof(sq);
 
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0) {
+		if (ret < 0 && ret != -ENODEV) {
 			pr_err("failed to send del client cmd\n");
 			return ret;
 		}
-- 
2.25.1


