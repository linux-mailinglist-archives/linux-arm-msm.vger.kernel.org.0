Return-Path: <linux-arm-msm+bounces-102474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KUINEKM12k3PggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:23:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAF3C99E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58824301F1B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2813C13E6;
	Thu,  9 Apr 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n22FO75F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D13C0623;
	Thu,  9 Apr 2026 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733778; cv=none; b=fsn9aNkPamlNawjSO5v58nlYe1ncAokvEXrpR6Ea4cJ7yagfFeFq5HrEZoZCHFov3i06XLRhjJTUQxJbf+Gcae/PulJdxB3F1EnJOXkdTTXjrYrYO8ZrMZ1vPI+sA6jvE5XmLsyAHZerUl8yQSYWVV7tQ0HQBqQXWgN+97jlcO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733778; c=relaxed/simple;
	bh=ZvlZi5CbcmEV2go9cPuXnCEvtdxTh5fXCo77fhyumnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B6/4oiU4SlDDos7/wGPH9EPv1P6XcCoIQV+aKvZeB+LPyWCyLU3+YpmnLemyvtl2OMPmhwybGOvO1ajg0S7LkkwRSbrfm170xMUkc3LmDHaDAJfKmg5XHG4wrjC9AIXICePh/oRXPdM/EQ4izLk/go9V3eC5j2k3gjCaqzki87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n22FO75F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395OQjY254218;
	Thu, 9 Apr 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AqYhFyIAhfp1LHLHWC/4w1Zv1bTldniczyh
	en2AZVyk=; b=n22FO75FzU1iMDS+e4cTXxdmIFU/0SnzSSXdihDlLPr3fE6IEQT
	BBOyZ3wNrtyvBcgaSWdjZxbHfvh3hVs21FOI9ln8nWHw0BKIXQhWr7h66l9b7II8
	E4hO9FTvrx/DiM2leZJedRQejDjjGLH9n+hUOy9+wimlVLMEXf6DdZ/196hyl/46
	RShYAVR7lyAAhHuDwb1Hrha5KJxZx+NQYfO8QWLJQH6wiic3HH/ybTP/UxZ9koSH
	rt+0P1yR5aE2FKVoRdAwElIAVZD1Oy0hsiS83NcDjbi1c/y2C504FSwclNiO6w9l
	Y/8JkaXzCl+BW2BvD/dr0Yd5aonvkMZicVg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6ybrm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:22:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639BMm2Q014226;
	Thu, 9 Apr 2026 11:22:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db3njwav0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:22:48 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 639BMmmk014220;
	Thu, 9 Apr 2026 11:22:48 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 639BMmpU014219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:22:48 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 664D25EC; Thu,  9 Apr 2026 19:22:47 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v5] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
Date: Thu,  9 Apr 2026 19:22:33 +0800
Message-Id: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: b-yzOyLQwaO0LPtmqZEzyguG6kzwUAKc
X-Proofpoint-GUID: b-yzOyLQwaO0LPtmqZEzyguG6kzwUAKc
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d78c0a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=eIGlGOcC9ytwnVZZLkwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwMiBTYWx0ZWRfXw7JtpsCQovmr
 vXm8yrWoqvrvBpYer1mPIllSWC34k83mCjFu4p+4TZSv/huwyhoVdBVeJboad+cCABryK1J1262
 mwJobFxu6J7P2VdrImIJJ25apOyiu8/t4brfbCIr87IW5i5geU9NP+giMuk5RIT9gWJUBKGKxiZ
 8Pj4b0LdNmGgM7k5D9yJFnoMhqDQzgFXE2g3z1D61kXsehG5xA3jqPCNZ6CZ9SXkQbkDxBJ7AAV
 3aq3GWXEr4ajDlsMyS9FveMkURFEfBkqVd7CLyueJkuQhVGWy8HYvYveimuUZt0ZmOGGQOQp6i+
 vw4FdkP6Qe5PsO6c1sVDGgpYckmSXI1vG4C1OB0aDwT6zL9myDc1vOMkAaIrAlmOgmlcL+go/2a
 SHQnYrDHsjANii0R0cTZcQfSF9LA6QOm/PPKQOtDZ9koxQe/XC7Zzzha5hgfmNfBXwemcJGrL6C
 gPSWDi69oZkU1J7kQKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090102
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102474-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 53EAF3C99E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v5:
- Replace clear_and_wake_up_bit with wake_up_bit
- Link to v4
  https://lore.kernel.org/all/20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com/

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
index c17a462ae..9fffe665b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct work_struct *work)
 				qca->qca_memdump = NULL;
 				qca->memdump_state = QCA_MEMDUMP_COLLECTED;
 				cancel_delayed_work(&qca->ctrl_memdump_timeout);
-				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+				wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
 				clear_bit(QCA_IBS_DISABLED, &qca->flags);
 				mutex_unlock(&qca->hci_memdump_lock);
 				return;
@@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
-			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+			wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
 		}
 
 		mutex_unlock(&qca->hci_memdump_lock);
-- 
2.34.1


