Return-Path: <linux-arm-msm+bounces-19804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC788C460F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 19:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DDB11C22831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 17:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD71120DCB;
	Mon, 13 May 2024 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fubs1i13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F371C6BD;
	Mon, 13 May 2024 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715621536; cv=none; b=uK55nAmbtiB4t7BxOzzw9fJOfXa3bjOPOCJr47Fna+hJpYF27u8VNRQVlHqcGLRqtWGR//5L0LuaEdgmvLhAS9SYbfPRRqrZFjeirVJFcwkjoH6zo6KoMZF+6V+2sbgVX/SCywdxjzkYjgAWLSMME17AO9POmyz6VgS8Ov1RWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715621536; c=relaxed/simple;
	bh=ZSSEbtbttkwsrPbY8E/NC08o4PHmSyGtjw557q4yApQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ljbykAyC9QYh2xVnVFVAlH86SgJsHh/Yt0w++mP9huIQyA6NM+YPGjTkd8lvZRj0eNv7k5hpXQvJiuAiktYTGCJvOxMuJKGMRSJOsOB2YQUmXqcasbIYsJAhz7NZ+xbXMPFvjzw+KxcTXzrHx3xAbw6dHRZ1zyEJth1jldiKmRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fubs1i13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DBUkUk007047;
	Mon, 13 May 2024 17:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=mFI
	a/q49REPxuxed+XDDq52GL2LF+3opVnI+acndT90=; b=fubs1i13TDg6HLA10s+
	8HMRXRru+ECY7cH91nrIvaAvL93DeO2t9gw2WPNrM51pM8GKy6Jc1eeTHKYqEOgD
	C/YqhgHFi4FD1PrmxfHZnhPvwCTbxNEPhnTlLD6rWzcF1zKdSKz55ioX0QiGwB/x
	zgiFVIsolwPRcWuLU1PvIJddAte6NYvXTvFQs84qKRIyZxREeMu4d6MMB5/+qPTH
	4Tq4Le2Wc6bUwbdN9puSfe8flYirfPC+gDo7fijKtEiCxH4U0Aj87pZC/sHqKcMw
	DHP7l9akaxddtvCnRW2O+mBWXiAleSlEJMly95l8KFjFmjwi7GdB/drHoqzmlLAN
	iyw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28gs2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 17:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DHW2Nj008393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 17:32:02 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 10:32:01 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Mon, 13 May 2024 10:31:46 -0700
Subject: [PATCH] net: qrtr: ns: Fix module refcnt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIFOQmYC/3XMTQ6CMBCG4auQrq3pDwV05T2Mi7aMMguoTLHRE
 O5uYaUxLt/JfM/MIhBCZMdiZgQJI4Yhh9wVzHd2uAHHNjdTQpXCiIZf8clHmohT34eWG1UZB7U
 onW1ZHt0J8scGni+5O4xToNfmJ7le/1JJcsmdcY324Or6oE/jAz0Ofu9Dz1YsqQ9Aih9AZaC0u
 gIlhG7AfwPLsrwBIU6Ryu8AAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson
	<andersson@kernel.org>, Luca Weiss <luca@z3ntu.xyz>
CC: Manivannan Sadhasivam <mani@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>,
        Chris Lew <quic_clew@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715621521; l=3136;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=ZSSEbtbttkwsrPbY8E/NC08o4PHmSyGtjw557q4yApQ=;
 b=WSrEc5tDlS+xFh2IhZFcxLzgjhqbuUg2tpJ1b56Fjth61nCZP0bI/HUFCJkYuDbjSDl7UvFke
 CUY8mR6oUoKApgp+u9f16/OkmSwArJxwfYfgXiZLyZ1Fd+y2ElB1Q0G
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MiskJSnQz4dcZxZ0VqjfaV8bzNvzqU5_
X-Proofpoint-GUID: MiskJSnQz4dcZxZ0VqjfaV8bzNvzqU5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130116

The qrtr protocol core logic and the qrtr nameservice are combined into
a single module. Neither the core logic or nameservice provide much
functionality by themselves; combining the two into a single module also
prevents any possible issues that may stem from client modules loading
inbetween qrtr and the ns.

Creating a socket takes two references to the module that owns the
socket protocol. Since the ns needs to create the control socket, this
creates a scenario where there are always two references to the qrtr
module. This prevents the execution of 'rmmod' for qrtr.

To resolve this, forcefully put the module refcount for the socket
opened by the nameservice.

Fixes: a365023a76f2 ("net: qrtr: combine nameservice into main module")
Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
This patch takes heavy influence from the following TIPC patch.

Link: https://lore.kernel.org/all/1426642379-20503-2-git-send-email-ying.xue@windriver.com/
---
 net/qrtr/ns.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index abb0c70ffc8b..654a3cc0d347 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -725,6 +725,24 @@ int qrtr_ns_init(void)
 	if (ret < 0)
 		goto err_wq;
 
+	/* As the qrtr ns socket owner and creator is the same module, we have
+	 * to decrease the qrtr module reference count to guarantee that it
+	 * remains zero after the ns socket is created, otherwise, executing
+	 * "rmmod" command is unable to make the qrtr module deleted after the
+	 *  qrtr module is inserted successfully.
+	 *
+	 * However, the reference count is increased twice in
+	 * sock_create_kern(): one is to increase the reference count of owner
+	 * of qrtr socket's proto_ops struct; another is to increment the
+	 * reference count of owner of qrtr proto struct. Therefore, we must
+	 * decrement the module reference count twice to ensure that it keeps
+	 * zero after server's listening socket is created. Of course, we
+	 * must bump the module reference count twice as well before the socket
+	 * is closed.
+	 */
+	module_put(qrtr_ns.sock->ops->owner);
+	module_put(qrtr_ns.sock->sk->sk_prot_creator->owner);
+
 	return 0;
 
 err_wq:
@@ -739,6 +757,15 @@ void qrtr_ns_remove(void)
 {
 	cancel_work_sync(&qrtr_ns.work);
 	destroy_workqueue(qrtr_ns.workqueue);
+
+	/* sock_release() expects the two references that were put during
+	 * qrtr_ns_init(). This function is only called during module remove,
+	 * so try_stop_module() has already set the refcnt to 0. Use
+	 * __module_get() instead of try_module_get() to successfully take two
+	 * references.
+	 */
+	__module_get(qrtr_ns.sock->ops->owner);
+	__module_get(qrtr_ns.sock->sk->sk_prot_creator->owner);
 	sock_release(qrtr_ns.sock);
 }
 EXPORT_SYMBOL_GPL(qrtr_ns_remove);

---
base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
change-id: 20240508-fix-qrtr-rmmod-5265be704bad

Best regards,
-- 
Chris Lew <quic_clew@quicinc.com>


