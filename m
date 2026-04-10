Return-Path: <linux-arm-msm+bounces-102616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDl5J2G62GmmhQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:52:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 090853D454C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78EC130057B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A73F33F585;
	Fri, 10 Apr 2026 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm9txhsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42984039;
	Fri, 10 Apr 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811136; cv=none; b=XSZlaBwtTzI0QMGLkC5W7JhYMC0r5mjO2HCSEifjijIYd1Z5lFZiUvehaY6WtMWCKLKMdYIeX+FnliStHP58GxGpXSeJWi5zLwTr3o9xV0dU4yyYTqy1vskDTkfxMnO9D8Qj5ErUBoMqgNVUhBQORKzMIrlU7GrtClFOll6uKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811136; c=relaxed/simple;
	bh=DhpIs0PB9Voa9UyLspQYs/0NKEH20arRccoqA53fcTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kkWrAWuHHlVeOk7GMQeY5MA37KXZrJUmKsx+9ggySbnx6r6kSYQA6FcFGvPkV9fukYtN/L3fg1ckADMUZe/qDx+f59Fe18Uylrh2Y7QmSsX65L+J+MX4QBp7BhEhg7XL3vML7SrGFC+gDGXjy+17nYUd3xlV/mYnAGRZVhHGTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm9txhsq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7E6RA3934514;
	Fri, 10 Apr 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7jw3qrR/sIdcaJtPernyXO0O0iWWoVaC+xT
	S+JcVS3U=; b=mm9txhsqjqgnkc3rl8AMheGbTGkosGTYA4UNfAFnhtrjFavnx0M
	e1tLdPTzqyyQtNkYPaqy24noEMeNNYs1kSP5IpFF2F1LgZaa/0bBmmA13cta+ZmJ
	sPVc1MYNgbXmC9aF+g+uVuAOmeRILi51UnLjLBPTbbXz1p3hGD1tdiFcDeZt7XKA
	f0hiyHH7IfrhSS6y3xn6tIWCabawWYfh8/WMdfqfcICreGK/y9xfvny16+78kuTA
	+4j3b5JY051OvKxR8+jUIhpmaqNgjmx8jzOFh/Li3I6o8ZyGadCJsxP+NqIVniJ9
	cprHo4aV5jRirEwrD507h4pf5/CQH+v/YmA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbarg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 08:52:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63A8q4UT013028;
	Fri, 10 Apr 2026 08:52:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db3nk5kfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 08:52:04 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63A8q4En013021;
	Fri, 10 Apr 2026 08:52:04 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 63A8q4q0013017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 08:52:04 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 85ED15EB; Fri, 10 Apr 2026 16:52:03 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
Date: Fri, 10 Apr 2026 16:52:02 +0800
Message-Id: <20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ORpZV6SZnpTut2etkczXtm6pltIZHt5a
X-Proofpoint-GUID: ORpZV6SZnpTut2etkczXtm6pltIZHt5a
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8ba38 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=0YDiTXL93RVJ1ZUXNLMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfXz15anWkterDF
 zEsFCOw1FesMSnO3pi8lK3ZZS6McpUFkXf+/XPjMWUoEV7EfnJPboL9/Tpa/qO7vvGzAN4t7iW0
 wj4+vFbnMYh7npUiIq37GNX/MNuW2y0E+FiyFSuXwla1meJu7Rl1dJvlGwfHRLzyMMTq5yuWhwk
 lgygy6E2Z+uF09BBvVdkEtHlHEOJPH9HH+3+Q0K5m/3+65SE52S3jWI+tZ21yxd8agq9SJcqnCw
 YQ8MMV5g++KbDvp3Fab3wOQBhsnC6/5fzIU3JimqwwpebbuTgfqmP44cYm4GTc95OS9dZ1Uc1nf
 u8SsMxMT6PIFOy66QqW5g7E8Syz0vmgPjK2cl80YKB5zWtEgYylQIRTr8+35zVDovjJlGR7opGA
 p3dsQISjXPpRw9BgFBhkaRw0GaefETs0W5rnghps7mNnUGAl5O8CtaZ/AoXB2zfRBzH6gZ8+Izc
 yLU3BKZmrHSvEKGWcuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100081
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102616-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 090853D454C
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v6:
- Replace wake_up_bit with clear_and_wake_up_bit 
- Link to v5
  https://lore.kernel.org/all/20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com/

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


