Return-Path: <linux-arm-msm+bounces-117233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QPmIH77ITGrspgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:37:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 20049719DF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XZ94XUk/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117233-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117233-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0572302B383
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D77A3AB289;
	Tue,  7 Jul 2026 09:34:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDF39D6CA;
	Tue,  7 Jul 2026 09:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416882; cv=none; b=Brg9JC28xRmrr7IEnnIt3/9qOGfxsUNQpU1WVqaUnQOG0i+l4zqxSU9W+UL4kKewdAe4vn81bxtVDGp8LRRS/nJ5r4hN5jK3rZxQxNq2j1kMz+nr7uregZy0t+28+1k6OCjEDwL9j8QtitZR33HD4bpKIozWOTgK1tfRvAi5mPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416882; c=relaxed/simple;
	bh=MU6vw7YxGM3R5/BVZRGm3KuBiOt5glYeEwBtGY8Z3qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4cDRptfT9SyPD1yUXtmpvlDabzKHWgLbZ1giVcs8hBaUJ7ccYH3vf6mdhpUpDBmV4lhfOijxYpRwf412noiTIaX04KHO0W4Q1nOiyNT3KYazJTArdeHHJqb/CIG5moE9uTme7x5Ter5yLZ9YxmyRPjyRhexqN7IR3+qrsW9rRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ94XUk/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E45F3004568;
	Tue, 7 Jul 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CDgEbiPkfna9pvlkIa5vAI4OdeJEp+fR2XH
	K6qLaumM=; b=XZ94XUk/KTZp2se4irS0pw6ZqbEgYE4IJJKJkRWTR/Hp0TPZs+J
	d4HJpOVpWvbgkeKWA2Gyz11iuqKqJ5Ld8k6tpvHtuI1Qn2p3kSM8K0t32uE/tnGO
	ZbdzpOrYv/kQ46iYsFmf4Q5JLjU8y1o17HXLISrFZuiptONFPnezjGY6JfcfZBHd
	YsN/UmT/chkOoWmvyFeqtB2pJ9t0g1hQCGe6V79RAO9vcxS9rrz+GMuElqoEobRk
	hpLbSs+iOIDPYvR6xg5oC6nbK3D2Zlb+Ka+gdmITJ+7lwTlrsIuI0NLIq7NFaQCS
	ojkjUekfZNJktI8AKCoYXiyQYNUSBalU+sQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su718r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 09:34:33 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6679YUWc000556;
	Tue, 7 Jul 2026 09:34:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8j4yrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 09:34:30 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6679YU8v000550;
	Tue, 7 Jul 2026 09:34:30 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6679YU9k000548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 09:34:30 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id 5A1564397C; Tue,  7 Jul 2026 17:34:29 +0800 (CST)
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v1] Bluetooth: MGMT: Fix discovery state race against cmd_sync worker
Date: Tue,  7 Jul 2026 17:34:26 +0800
Message-ID: <20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MiBTYWx0ZWRfX0PcRnED/Boq9
 nVYk5DZrhu55u/7OeML/VAUFgqq/rlwZmlXdjScpNfRgOKeuoIRYMNapRyhMqdDcWG4KlD3dC7V
 WjWPVFhdoNI8ojUG5Hb6kiqptQxhmGG09FBpg75h12dw65tb13q+vbsXA8sbq4mWCWDB7lKxdYF
 +pTpQW71ihOeMif3TYO7GTSnSxPWcTysDv55hQD3f4LZ/ipYMlUPetRd8ie51E9yh+ArS2e30vW
 ACI+2ROCaJIeGk4L1P5DBejoPpdbLAu7f2W7uHboIMD7gsFUteU8kyroDxgShkwrijOiaYYSEiT
 fPn9g17UuRlHtukB0EklXqaDHm7sOtnPX5sno9oWyhGM5HXS7+1tScGeF1eOKoUuD6FoR4oQFju
 XsLlXz+p+c1viEbAG/+ESoj3ORU7Uwp3LaVI9q37VJjY4z5gHVVqHxm9pqw9Z3ssyKiSUuyG7eg
 H7dfIZQl84+gJN2oWyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MiBTYWx0ZWRfX+jNlQTw+KZQK
 nhSMPpYXRlHOtWqm3PRRvYwyQKNT6czNkG1r8uaRnCVTB1eVr1//3/U9olKuEjoWA2ZkV3lqNmW
 pVaERs22Cl4VzPpl3ZzvfN7yeG2XnOM=
X-Proofpoint-GUID: 8sjUFFv9tUCUUdUao3qIfoig5et3bWGV
X-Proofpoint-ORIG-GUID: 8sjUFFv9tUCUUdUao3qIfoig5et3bWGV
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cc829 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=2V2Hb5s1ROrn81cx0hoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117233-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20049719DF4

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
     callbacks to "on any err < 0, also reset the transient state to
     STOPPED". With (1) in place the state observed at completion time
     is always known.
     For the stop path this also fixes a pre-existing wedge: when any
     sub-command issued from hci_stop_discovery_sync() returns an
     error, stop_discovery_complete() is invoked with err < 0. The
     existing "if (!err) set_state(STOPPED)" tail then skips the reset
     and the state machine sits in DISCOVERY_STOPPING forever.
Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
---
 net/bluetooth/mgmt.c | 86 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 733a4b70e10c..25ad9c10740d 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
 
 	bt_dev_dbg(hdev, "err %d", err);
 
-	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
+	if (err < 0) {
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
 
+	if (err < 0) {
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


