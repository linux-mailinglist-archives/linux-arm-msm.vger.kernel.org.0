Return-Path: <linux-arm-msm+bounces-22376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D57904BB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DB001C222D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A5216939E;
	Wed, 12 Jun 2024 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cA48Z/87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A24F1E2;
	Wed, 12 Jun 2024 06:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173948; cv=none; b=LsCMY42xUyeWQexAevjb2ogX4S23c+xQMr3BdGT9zqBZfhDxNTVhG1iyL1sUnrN9dPj6v0uXeFnzL6RjsDxuUDC08uoxEF4QdxJ0FJPRlNbmN0cijSIGnncr/hDDVIwIunv6WiB+ZAMqG8ldeOPeFlkoBXETBJ2SbAQJHIW+3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173948; c=relaxed/simple;
	bh=4dHdii8akR9lrOzn8jGfbgMZstQ2GSwLDFVNPrcaCDg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I0g6rNoHDuGpsWnAWjEiz8Md/eYIPYvRbuESGIA4y5HH/Qh652hj7dUSixgi9rxH6fKUOEAlf15MaM2O3ryA60a8uLaGRxXMtgjeZP3dwkdMy8lnrB8Q6TZb+BjEMUX47VIVqyGnPeBqIC0t4UXCDVVGtVWSy1gJcSXuHsuORQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cA48Z/87; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C4ZRa0018918;
	Wed, 12 Jun 2024 06:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Eu/NjVNDUuNgiyJfnDnh4
	fuQyxxYidx16la+oXTQLE=; b=cA48Z/87XPehjLgN6OjkjwfK7NcBKrUMNOzCPB
	MyhUTziVvF56aDMbk57oli7XgZiKq+vYq8FA82e+Oxs+ROwwSwlsfLnutExIx9Ao
	DLirI/bs+Qi5zatUqunv0NzO87c6dGM6budwexTPvDWJygIj/qrP8iJbJ/uTYzPU
	cC8aTGu2TfxdOrekvC/knzb8U7AONGiKamAQeSj18YCVsOKnhky+0WIzr2Rhifc6
	dtvYplH0c1Qr9cboyyoQw8yDx3D2k9zRGmsanpLC+4OPNhAtG/jIO9dVM1zF+RIJ
	flYWcJywb1OPnt1wlCPGD+2e40AYA5Y6+ELmddfVOFDgyzeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8g782-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:32:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C6WJUS004791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:32:19 GMT
Received: from hu-sarannya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 23:32:14 -0700
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
Date: Wed, 12 Jun 2024 12:01:56 +0530
Message-ID: <20240612063156.1377210-1-quic_sarannya@quicinc.com>
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
X-Proofpoint-GUID: zECIYlj_08IzxJvPe3yczXMuPV2bwC8h
X-Proofpoint-ORIG-GUID: zECIYlj_08IzxJvPe3yczXMuPV2bwC8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=787 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120044

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
Fixed alignment issues.

 net/qrtr/ns.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 654a3cc0d347..3de9350cbf30 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -132,8 +132,8 @@ static int service_announce_new(struct sockaddr_qrtr *dest,
 	return kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 }
 
-static int service_announce_del(struct sockaddr_qrtr *dest,
-				struct qrtr_server *srv)
+static void service_announce_del(struct sockaddr_qrtr *dest,
+				 struct qrtr_server *srv)
 {
 	struct qrtr_ctrl_pkt pkt;
 	struct msghdr msg = { };
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


