Return-Path: <linux-arm-msm+bounces-118159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTClAFSBUGoR0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 505277374D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:21:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qa5JbdRs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118159-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118159-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B874300BC91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 05:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00606332916;
	Fri, 10 Jul 2026 05:20:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3E1A6831;
	Fri, 10 Jul 2026 05:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660840; cv=none; b=gACYliNnGKBtG26LowHzh9xltBezQJ0Euisl7EWLHWhoECKTSvJaN1rvogwevdEK4RiEn/e57Qd3qKRUgbXYS0wtSbLBlqQ5RgHv7FCqFfh5WKpE3ozdz3kSD6BxXVzsSc5ll15t6OE0/juFnlQLsIr3i1ZQBgRd7oYIZkiFGM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660840; c=relaxed/simple;
	bh=X06be8K14fS2iYWGmL47KS8e6UcDD/6sAcOPl3pToCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OEknsE+jAZMdyEQZjT+IHWWnjQCP8wE6Fl+v30Y0t1CoWqTB73LhgvnMcBiRZl1HiBt0OzAh18EezGulhBH6xij6RsJTh2IzopHzmvNpht+qJsp9AgwZIqh+S0gYo5RK4sZ7b1S5euHC+ZfIV6AB0gWI+1M8l4YJzrnv3TWdIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qa5JbdRs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n3Hv3802185;
	Fri, 10 Jul 2026 05:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DiDcWbCJEyLDZIzNfdjEV6
	Kae0+VjhzNFhDn9FG56y8=; b=Qa5JbdRsNk3hW/9I7B3jJXgcLE87ENu5sh2L6L
	U0zabmvoRceRv3KKXUgBlj9H3JyX33AjFgfMM8jJSrzeVvJWwwI1An56RFFUZQri
	d57unsXFH85an4g+HcDvZkZ7lD+fcenAyc7Wluunqp3nZivnaWnrqWwg+TQTDl1x
	aCqIqHMNlRcFi7q3XKUZdEzAmZKxIQOsqwS5Z46dBOx2QHkABx35AvlHw4XjECGb
	X9MMrtNkNxUpXMux0dm/uHo1wd65ixnb5DyJ1rK2ROZH3IHBUl0xcC4LI98TZjJc
	FAzrcNaVwi+oK7qis0WvP/jN4NliHmsme+/bHZf/lI/apykw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpkd5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 05:20:17 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A5KE0G000382;
	Fri, 10 Jul 2026 05:20:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8jp3df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 05:20:14 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66A5KDow000375;
	Fri, 10 Jul 2026 05:20:14 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 66A5KDSn000370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 05:20:13 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id B990443841; Fri, 10 Jul 2026 13:20:12 +0800 (CST)
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
Subject: [PATCH v4] Bluetooth: MGMT: Fix discovery state race against cmd_sync worker
Date: Fri, 10 Jul 2026 13:19:57 +0800
Message-ID: <20260710052009.728899-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA0NyBTYWx0ZWRfX9DVH/2o8HZQ5
 U0LVKnhBYv9XaNkHCVAArPESWoYsg1CT2MMovjw2CXMcIHUqvBByZfo5v6gygBKRKcU6OrFrI8F
 8UeC4TpB4uudrRgUTcMYZTwdACgd8b5/l54ciVjvHTY1AP1gESS9RJwHmXCDDleA3GvGdIWZGL8
 oeaSIbnjS5YhliLwEgGRc+SIwiTzOCmi6zy5qRqRQoYDOAZUKHnsWz6U2+R6cTLrWWj4/8bmyjh
 PfaYbj6uTNBIhNXsVP4hj74IJsPcl2LLzIwsvLo6I6qilIW5arlM1DGcQ8feW0CVpNJI1uM0AWR
 MWMs7Uzp2iWsA311bR0MTTIedB+pWd+bs98v2YkGyV0bgFoG1MtIDbTnQjJr2/50gOxYeI5Cor9
 y1zJ2k5eXWuNa6mNm7/UiM9WOs8RkeeJ7cdLVixcYo4oIdF46gy0d2Ao1AEUpztIY2rpMyIHus6
 Kodj0SxbF1+9+fgaS7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA0NyBTYWx0ZWRfXxaUYyNjclNBM
 i2V+lEga91+PrqUk8Yp3HCR8CV8/m4MHt0E5mVnNt8dSW/v+c8Fe4D4WwhJzTE0o0dPCn/kyNkE
 lCs0WXy2LlrgKepZzsG8e8cp0LGReGs=
X-Proofpoint-GUID: nB2SfWwSU-opGlzPqZ9aUOZlxbSXQhL8
X-Proofpoint-ORIG-GUID: nB2SfWwSU-opGlzPqZ9aUOZlxbSXQhL8
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a508112 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=qf4gfuq51q0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3JPR9GYJdaIQrRVmcmYA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 505277374D9

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

Fix it in two parts:

  1. In start_discovery_complete() and stop_discovery_complete(), wrap
     the terminal hci_discovery_set_state() call with
     hci_dev_lock() / hci_dev_unlock(). These callbacks run without
     hdev->lock; the caller holds hdev->lock across hci_cmd_sync_queue()
     and the trailing set_state(STARTING / STOPPING), so the callback's
     hci_dev_lock() blocks until the caller has published the transient
     state and released the lock. This serialises the state writes and
     closes the race window without needing to reorder the set_state
     call relative to hci_cmd_sync_queue().

  2. Generalise the "ignore -ECANCELED" early return in both completion
     callbacks to "on any non-zero err, also reset the transient state
     to STOPPED".

     For the stop path this also fixes a pre-existing wedge: when any
     sub-command issued from hci_stop_discovery_sync() returns an
     error, stop_discovery_complete() is invoked with err != 0. The
     existing "if (!err) set_state(STOPPED)" tail then skips the reset
     and the state machine sits in DISCOVERY_STOPPING forever.

Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVERY")
Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
---
Changes in v4:
 - Drop the "move set_state before hci_cmd_sync_queue" change (Part 1
   in v1-v3): now that the completion callbacks acquire hci_dev_lock,
   they block until the caller releases hdev->lock — which happens only
   after set_state(STARTING/STOPPING) has been written. The lock
   acquisition therefore serialises the state writes without reordering
   the set_state call.
 - Update commit message from "Fix it in three parts" to "two parts"
   and revise Part 1 description to explain the locking argument.
 - Link to v3:
   https://lore.kernel.org/all/20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com/

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

 net/bluetooth/mgmt.c | 58 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 733a4b70e10c..2295042234f8 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
 
 	bt_dev_dbg(hdev, "err %d", err);
 
-	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
+	if (err) {
+		/* The queued start-discovery work failed before the normal
+		 * completion path could advance the state machine. The
+		 * caller already moved the state to DISCOVERY_STARTING
+		 * (under hdev->lock; the callback's hci_dev_lock() blocked
+		 * until the caller wrote the transient state and released
+		 * the lock). Reset it here so the gate in
+		 * start_discovery_internal()/start_service_discovery()
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
@@ -6196,17 +6219,40 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
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
+		 * (under hdev->lock; the callback's hci_dev_lock() blocked
+		 * until the caller wrote the transient state and released
+		 * the lock). Reset it here so the gate does not wedge in
+		 * STOPPING.
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
-- 
2.43.0


