Return-Path: <linux-arm-msm+bounces-100207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOddLppBxmlRIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:36:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3962E3411C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6474300E394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5433D6674;
	Fri, 27 Mar 2026 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGVO9hJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246927510E;
	Fri, 27 Mar 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600398; cv=none; b=qbA46qJWv3GQajdoJM0n8cOKgMWwcW/yaMEco/T/tY3oEtcQvlFeaS5Ivp1eAJAV7/G2vVFpeHAX46Vio7NdoUEAwHJ8zKFYHCIm3uFwL2n2/LcZVF5gDYUFjvhYKfYPa+lwmT3G67UPeNySTFVBR+w1Pmng6Oq0K8Qpt6Eg1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600398; c=relaxed/simple;
	bh=jsxDcV0C2PEIS5JTJhpYYFD6RXEuabaOLhWWItUXK5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BJw4o6LhcjubUbHubxUged3ElsMgRQHMyoGOQeyxqQevzCFxgipVkUxyJisBj9Y1Cmrz84+/SWicagTiIYJlu3epd0JZ0/QNgQIn+KDPM1Kr+G7+VzhIeQFHuKE/iF7taBjyRoe8zLfWlB494QnQGaQkshqYZV9aqYAV5AihzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGVO9hJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3g91860230;
	Fri, 27 Mar 2026 08:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zc3+2imTkru8BoSsYqgw6vL70ObmsrqAYcU
	E6GAPSto=; b=CGVO9hJCwzAJBEbErakheDmK0/Q4q1g/v0H2axCBjPxOn3r+cNo
	wUkFIpGnjqRvcbcO89Fzn0NTHpnCp9o8ySzy3rjuQkuUSVghnUXXWcsvLl1O5L9d
	4rIjgENX3myC7ZuMPcqLKdqI/tKgYJPPg5OrWhmcqnT0cWVt1oTxhTHnm5qzQ62k
	T6xBC2A9zeSILTLGuG504Wucuu53pgo4ih61zmPNP0WfA16akTDkE/2IE2W6YbI8
	/cUqZEE9PxWCEZKTjj8Rteq5ApZzvOglutZcfjWzzk5VjZVFmKAOBiWso+EiGHen
	tukQNKRF9Sycjy+lJ5+rczMrjgn3jEoHBBQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv25sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 08:33:04 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62R8X2l1003162;
	Fri, 27 Mar 2026 08:33:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdn7j82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 08:33:02 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62R8X251003152;
	Fri, 27 Mar 2026 08:33:02 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62R8X1be003138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 08:33:02 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 034545DB; Fri, 27 Mar 2026 16:33:01 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, Shuai Zhang <quic_shuaz@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
Date: Fri, 27 Mar 2026 16:32:58 +0800
Message-Id: <20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c640c0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=eIGlGOcC9ytwnVZZLkwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Wx0PmLehbzD6FHT3BPPp5uHTBoPnbYHs
X-Proofpoint-GUID: Wx0PmLehbzD6FHT3BPPp5uHTBoPnbYHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX4rsjX50o/5QD
 Vs2KCl77DbCg8ue6StnYUR00og2B2ggE9z4FZT5zYSZayS5ppRtZOs94XSVvdZvIS+LY9yhzTp+
 cFy/Nv5cFkreyrx+bG2UpCvuPV45uw7fh+ZJMBNo7MiDUubuOldNhBNlKSnaoomHCIVCjvKvcbM
 FcYNtkvUOpcXLnzKqyXbSGPkvfstd1gR2Bzot0itDiuBJmAK5i9v6xIOxbb5ePZfbqvnnak93Pq
 usMn6WBrvXIY1UuyONjFziArPTOZ3VhaUemdJMXHqZBVPPS4YwvkzxLdihzi1mPZfbOiY+5xgzJ
 KCR/iXyoZ9ai9WqQMl/67lm1ul7hJVKeivRTnqyhgY8ofUQR5PYrCvPhwfe+nK+RmeYBkOqcx3u
 9VQLu6zD4IXuX8jdo4gDTN7nc1ASGnYOR6K38l05NaVSVQ2zY+lHPsUadElrNYBvh/QGKeRsqWA
 6Fb+oPGUktYpIxv5/Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100207-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim,quicinc.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3962E3411C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Shuai Zhang <quic_shuaz@quicinc.com>

When Bluetooth controller encounters a coredump, it triggers
the Subsystem Restart (SSR) mechanism. The controller first
reports the coredump data, and once the data upload is complete,
it sends a hw_error event. The host relies on this event to
proceed with subsequent recovery actions.

If the host has not finished processing the coredump data
when the hw_error event is received,
it sets a timer to wait until either the data processing is complete
or the timeout expires before handling the event.

The current implementation lacks a wakeup trigger. As a result,
even if the coredump data has already been processed, the host
continues to wait until the timer expires, causing unnecessary
delays in handling the hw_error event.

To fix this issue, adds a `wake_up_bit()` call after the host finishes
processing the coredump data. This ensures that the waiting thread is
promptly notified and can proceed to handle the hw_error event without
waiting for the timeout.

Test case:
- Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 26`.
- Use `btmon` to capture HCI logs.
- Observe the time interval between receiving the hw_error event
and the execution of the power-off sequence in the HCI log.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
Link: https://lore.kernel.org/stable/20251107033924.3707495-2-quic_shuaz%40quicinc.com
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes v4:
- add Acked-by signoff
- Link to v3
  https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/

Changes v3:
- add Fixes tag
- Link to v2
  https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/

Changes v2:
- Split timeout conversion into a separate patch.
- Clarified commit messages and added test case description.
- Link to v1
  https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c17a462ae..228a754a9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct work_struct *work)
 				qca->qca_memdump = NULL;
 				qca->memdump_state = QCA_MEMDUMP_COLLECTED;
 				cancel_delayed_work(&qca->ctrl_memdump_timeout);
-				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+				clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 				clear_bit(QCA_IBS_DISABLED, &qca->flags);
 				mutex_unlock(&qca->hci_memdump_lock);
 				return;
@@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
-			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+			clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		}
 
 		mutex_unlock(&qca->hci_memdump_lock);
-- 
2.34.1


