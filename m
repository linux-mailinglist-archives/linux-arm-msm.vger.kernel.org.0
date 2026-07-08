Return-Path: <linux-arm-msm+bounces-117560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1PqNEg8bTmqFDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:40:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444B723D5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ggl30tgC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117560-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117560-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2FEF30057B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6854741A77F;
	Wed,  8 Jul 2026 09:38:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1883FCB3A;
	Wed,  8 Jul 2026 09:38:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503518; cv=none; b=AGW7Dg/4AZGDon6+DhJVvhobs53/nVLsnx8cnX5rvT6uRLPoiOzB6Uoj8VkwzgyJbMXQvUgTNgJ0YOZmiyXUglQHrPzLq+5pBldoQilAcs4YAcqn/0MANjSQt8TCKKlKAp9pu44oe5nVarr+n1es9qSRj2H6wMCqBaM0yc2rRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503518; c=relaxed/simple;
	bh=W2X38RxrK6z8gTbPaiYB58uVC1Gbs/0MHxfcy2zYm7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvQbAfHTZRUu1BEsZLYl1Pdiz546BQeYJbojI40BbBMZuORfN4wngy8VW+OyIJGPOwzI5U6GF2CAHTmkq8+amL6UCunnj1EP5ty+kdUk8okvBbkg4/H4FH+X07orSa1VCHKVS/2M2IIcSpUbiNUPgfEqVVCJoK9mmD52MBorroo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggl30tgC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668896qw2258453;
	Wed, 8 Jul 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PSbhnpT2EsgFpellWB8hQNA6bxIqRBh/+FM
	gwdS0y5k=; b=ggl30tgCXb9pPXvrdYfWv4FehJ7CPA2kCINrZAg3dBdKSoku7wl
	yYCyXBWiDWN4qjaEMgQ+pMM5gzl7aYjFRSETLrZ5NgC5YzNXtGNvvLAAMtnQNHMR
	x4YlR4GHesr5UeOlWzBvR3kMHW48p5H5BYU6v8Qyij4WKuLKk/uD+hXLcX1winkY
	TyxOHd5NEzy6lHdJYL/IKGyXAB95UM7eMAIuha1EaTot6Rl9Z7vIKb42vHMts/6L
	/CJf6j8Y9PrZQXHGELLR91MhG/xsZ0HO80tTI7xfW34hUDa6CsCjhdyvgM+gMW/M
	BizoHfU3i7UHryR960RpgYUHUBgkHqyYMvQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9rmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:38:27 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6689cPtu014712;
	Wed, 8 Jul 2026 09:38:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8j5wpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:38:25 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6689cPmm014703;
	Wed, 8 Jul 2026 09:38:25 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6689cP2E014701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:38:25 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id 88A0243A5E; Wed,  8 Jul 2026 17:38:24 +0800 (CST)
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v3] Bluetooth: MGMT: Fix discovery state race against cmd_sync worker
Date: Wed,  8 Jul 2026 17:38:22 +0800
Message-ID: <20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: hZP3d6K1ZQNSAeTcIN_X7QJ5HJJEiBoW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5MyBTYWx0ZWRfXwJHFYliqP2cc
 ogfmLbs4BWHRf74QACI3m151genhJMKr2pBeCcSmc5CnxwTC2DW7GihAjsoyAJWX+6uohqNFsCo
 2F3hH3+xGDMbV3eMGiRIPiU3rynSWMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5MyBTYWx0ZWRfX8MwItlPGnjv/
 akLTe8D4+Jx4V29fMWcL2Xqecc+NI6grnQOvMf9YV6Rrh9GyZTmnVMXbKf1t7LZaDfuuqSCP/7f
 SItsUE69U/Rms+AN0XGv5Mcrg1u9KzGKh6kg79AidA5fIOR9WLpJbLZLleXNarCGLxzjlr7ykrd
 thPyhargODx1F+5zISczm/bYrHGT+nr9FNFeeyLzqHqzFYcbPSkwL7h4PB6inxRv5sNIe+iNlh2
 nF6xH3OcF0bQZ8C3f1cby10lYE+2iPIsIQ28QEz4hfH07pRKpFXIEmwW1p29Z0ZwA1LbOgWl6Jw
 9r8l5NKKCnj/greKqjlClTUc6pisxQHTWInAE0oBoqxQ4kTarsCJBIFlSh9kbXkiMfJka/mXPD0
 rrFwSzrZ7xeNmj/GLsXfIhYWItlvRzL6+pxdqw7iDN1Ww02JARQQdNdrOoFzX8S3i8sVuoM5fmP
 jDrdgQ4UHd5kllYkoCg==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e1a94 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jhnaBEV427HRP_O-JTIA:9
X-Proofpoint-GUID: hZP3d6K1ZQNSAeTcIN_X7QJ5HJJEiBoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117560-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9444B723D5B

start_discovery_internal(), start_service_discovery() and stop_discovery()
queue a cmd_sync work item and only then move the discovery state machine
into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):

  err = hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
  if (err < 0) { ... }
  hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);

The matching completion callbacks run on hdev->req_workqueue serialised
by hci_req_sync_lock, which is independent of hdev->lock. So once the
work has been queued, the worker can be scheduled, run the sync function
and invoke the completion before the caller has executed the trailing
hci_discovery_set_state(). The completion's success path writes the
terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start);
the caller then overwrites it with the transient value, and the state
machine is wedged: every subsequent Start (Service) Discovery is
rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
with no HCI traffic generated, until bluetoothd or the adapter is
restarted.

Fix it in three parts:

  1. In all three call sites move hci_discovery_set_state(STARTING /
     STOPPING) to before hci_cmd_sync_queue(). The transient state is
     therefore always published before any worker can run the
     completion. On queue-submit failure, roll back to
     DISCOVERY_STOPPED.

  2. In start_discovery_complete() and stop_discovery_complete(), wrap
     the terminal hci_discovery_set_state() call with
     hci_dev_lock() / hci_dev_unlock(). These callbacks run without
     hdev->lock; serialising the state write matches the pattern used
     by mgmt_set_powered_complete() and removes any residual ordering
     hazard against a concurrent mgmt path holding hdev->lock.

  3. Generalise the "ignore -ECANCELED" early return in both completion
     callbacks to "on any non-zero err, also reset the transient state
     to STOPPED". With (1) in place the state observed at completion
     time is always known.

     For the stop path this also fixes a pre-existing wedge: when any
     sub-command issued from hci_stop_discovery_sync() returns an
     error, stop_discovery_complete() is invoked with err != 0. The
     existing "if (!err) set_state(STOPPED)" tail then skips the reset
     and the state machine sits in DISCOVERY_STOPPING forever.

Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVERY")
Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
---
Changes in v3:
 - Replace inline patch title with lore.kernel.org URL in v2 link
   reference to fix GitLint B1 line-length check.
 - Link to v2:
   https://lore.kernel.org/all/20260708062009.3047447-1-xiuzhuo.shang@oss.qualcomm.com/

Changes in v2:
 - Fix if (err < 0) to if (err) in both start_discovery_complete() and
   stop_discovery_complete() to also catch positive HCI status codes,
   flagged by Sashiko.
 - Add Fixes: tag for commit abfeea476c68 as requested.
 - Update commit message wording from "err < 0" to "non-zero err" to
   match the code change.
 - Link to v1:
   https://lore.kernel.org/all/20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com/

 net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 733a4b70e10c..81c09c24a14b 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
 
 	bt_dev_dbg(hdev, "err %d", err);
 
-	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
+	if (err) {
+		/* The queued start-discovery work failed before the normal
+		 * completion path could advance the state machine. The
+		 * caller already moved the state to DISCOVERY_STARTING
+		 * (under hdev->lock, before queueing). Reset it here so the
+		 * gate in start_discovery_internal()/start_service_discovery()
+		 * does not wedge in STARTING and reject every future Start
+		 * (Service) Discovery with MGMT_STATUS_BUSY.
+		 */
+		hci_dev_lock(hdev);
+		if (hdev->discovery.state == DISCOVERY_STARTING)
+			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+		hci_dev_unlock(hdev);
+
+		if (err == -ECANCELED)
+			return;
+	}
+
+	if (!mgmt_pending_valid(hdev, cmd))
 		return;
 
 	mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
+	/* Serialise discovery.state writes against any concurrent mgmt path
+	 * holding hdev->lock; this callback runs on req_workqueue without it.
+	 */
+	hci_dev_lock(hdev);
+	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
 				DISCOVERY_FINDING);
+	hci_dev_unlock(hdev);
 }
 
 static int start_discovery_sync(struct hci_dev *hdev, void *data)
@@ -6051,15 +6074,23 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
 		goto failed;
 	}
 
+	/* Publish the transient state BEFORE queueing the work. The
+	 * completion callback runs on hdev->req_workqueue serialised by
+	 * hci_req_sync_lock, which is independent of hdev->lock; setting
+	 * the state after the queue allowed the worker to win the race
+	 * and have its terminal STOPPED/FINDING write overwritten by this
+	 * trailing STARTING write, wedging discovery in STARTING.
+	 */
+	hci_discovery_set_state(hdev, DISCOVERY_STARTING);
+
 	err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
 				 start_discovery_complete);
 	if (err < 0) {
+		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 		mgmt_pending_remove(cmd);
 		goto failed;
 	}
 
-	hci_discovery_set_state(hdev, DISCOVERY_STARTING);
-
 failed:
 	hci_dev_unlock(hdev);
 	return err;
@@ -6178,15 +6209,19 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
 		}
 	}
 
+	/* Publish the transient state BEFORE queueing; see the comment in
+	 * start_discovery_internal() for the race details.
+	 */
+	hci_discovery_set_state(hdev, DISCOVERY_STARTING);
+
 	err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
 				 start_discovery_complete);
 	if (err < 0) {
+		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 		mgmt_pending_remove(cmd);
 		goto failed;
 	}
 
-	hci_discovery_set_state(hdev, DISCOVERY_STARTING);
-
 failed:
 	hci_dev_unlock(hdev);
 	return err;
@@ -6196,17 +6231,40 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 {
 	struct mgmt_pending_cmd *cmd = data;
 
-	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
-		return;
-
 	bt_dev_dbg(hdev, "err %d", err);
 
+	if (err) {
+		/* The queued stop-discovery work failed before the normal
+		 * completion path could advance the state machine. The
+		 * caller already moved the state to DISCOVERY_STOPPING
+		 * (under hdev->lock, before queueing). Reset it here so
+		 * the gate does not wedge in STOPPING.
+		 */
+		hci_dev_lock(hdev);
+		if (hdev->discovery.state == DISCOVERY_STOPPING)
+			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+		hci_dev_unlock(hdev);
+
+		if (err == -ECANCELED)
+			return;
+	}
+
+	if (!mgmt_pending_valid(hdev, cmd))
+		return;
+
 	mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	if (!err)
+	if (!err) {
+		/* Serialise discovery.state writes against any concurrent
+		 * mgmt path holding hdev->lock; this callback runs on
+		 * req_workqueue without it.
+		 */
+		hci_dev_lock(hdev);
 		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+		hci_dev_unlock(hdev);
+	}
 }
 
 static int stop_discovery_sync(struct hci_dev *hdev, void *data)
@@ -6248,15 +6306,19 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto unlock;
 	}
 
+	/* Publish the transient state BEFORE queueing; see the comment in
+	 * start_discovery_internal() for the race details.
+	 */
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
+
 	err = hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
 				 stop_discovery_complete);
 	if (err < 0) {
+		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 		mgmt_pending_remove(cmd);
 		goto unlock;
 	}
 
-	hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
-
 unlock:
 	hci_dev_unlock(hdev);
 	return err;
-- 
2.43.0


