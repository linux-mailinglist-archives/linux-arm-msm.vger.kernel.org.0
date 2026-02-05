Return-Path: <linux-arm-msm+bounces-91863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJllGjRThGkx2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:22:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB4EFD34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF35A30104A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD89362123;
	Thu,  5 Feb 2026 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUohQ3tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSvfKGnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF328361DC5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279721; cv=none; b=NL16td2/cgs/3AT47trSQdzm8hzmfXBzGYy/aDqMqyFvxEVPyHLF1oN+YJEBQqrZ2ifYc8VDdaI8Mp69GUgNZGWla8DnR5ZMWRMX8ZqaFio4McLXeLb8I3MH9bKrRfuVZkSv1qrKDwSPvcLy78T42yRBrmdo7xDVmnB4dNPS7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279721; c=relaxed/simple;
	bh=jiW3ZXnEOZX76PllSYO8HYRBw83unl7LOEgietEhHhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F9zXa4Ndnq8jV5scCincKKFT3ENlmEXpxOPaHmMSZmCRwAagG7+0O4lLRyshy7K+LLkMgEUJJokcVLRizVw0+NfmdQg8BbJTQuUjlz0siGiwUu+Kq0hJU3/8rOjlCZ7abwLT/qkryIXClp/mlV9zJC7ybCoFMYkVHYzTDyljR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUohQ3tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSvfKGnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153djiv3237307
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y9i4TwIvWEN8PiR9U1wcY1
	KcMyRCSyGRU8II9XqOB7U=; b=IUohQ3tT/WPmwGy2mHsGCxvfHFBO8M0cSGetZ6
	4WkMPvr99rYnkDz8WxIf2if4ts4phyMgGuimDxhaN0rqOcdkZ417ebQL6ZhpdI2Z
	VLoxGrtfNSyKoCQhWUGc3orPMESmuMS42lGhhDxyH3yYPKw8ZifrMVNf3fR0DRlf
	DNEOEXanyVjuFMY4v1XIuzjKycBH/VU7VxCWWVA51nvtb2OOg86bNpyf8y+VAD2a
	mD9UIW02JflKpOTGr2sLDshb1iM4rRTvHZfkJQ3lHdWvZBRNIZ/Tp5YuDZ4ydg9B
	ddWFknO155mK0m2EU79g+eEnd5vdFeVCgAGBpwRHL2zhAqgg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51tfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:22:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so641060b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770279719; x=1770884519; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9i4TwIvWEN8PiR9U1wcY1KcMyRCSyGRU8II9XqOB7U=;
        b=MSvfKGnO8R2T4tI48Oj5rDMQYSZwtoy6EddpixK803FzA87hidRBQbCcxmIdqWS/eW
         PHBJSrqrOATzIU5uZyz9g0MJrveAbJoltLYejbDLjSSDwLngnxgRAAAu7YrPT5QGVaVU
         Qyg+IquHzpqy9i7VbCKnKrMUuPGhE/NRY5/ifstEx3t4Dz0+H8gHODFkoeC3dHyYCXFj
         NdWGtYRW29Pc3Rui8M8RDJPAikNOjZEhBhehZnV6x9cV1CBOAdg7GDshWwcIWgcfbxYy
         LZWo/xveV2z+77t1JQ0FMrE2leNnRjWxRyZMoP7O6DfY5+b7A0Z0iT7I5d/vBGoW8PcS
         xqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279719; x=1770884519;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9i4TwIvWEN8PiR9U1wcY1KcMyRCSyGRU8II9XqOB7U=;
        b=CMYZK9lxjjEqB4Bj3ThM5C6Z1gtRFQKgCzRKzPhgINHkg5kx9Xbtw9zHd8ly7uVJ2u
         Mcf/PgHVm+OWNxzYIqrUcSkvXUWtt4sdeXIcPE6DsOmW7g36KCq5SqFkR1MPQHqE+Krp
         Vuf30/fdEkTuTby+I4etaQT1T5AD45j7rgsxMrS+UZTZPz4yvGdqDXS35LOWTQBrV6a2
         bC7x18SJhcIEYCeRUDwetksumby0JmrSe5MLfJBNT8AQT0NASqFiR8Fvn6xEruuUThDC
         6U9jyhyWNyP+oHyJQ5fNdCAkAJAO4iW29F96UNAjCnk0FebPuuGbnmfwLRi7N2iQsmBp
         swdg==
X-Gm-Message-State: AOJu0Yw8nr5epf5Yg8CqGozppQRw0IxX8GtmssTZpPwfNYSa3hj3kf6Y
	4OgzAaZafm7ASejTc+ylRPk9FQIxNCA2nJwv1hLP2HY8RfZngz7eMKuLUhoYOEO0gPUF93ixY9b
	Pbs/0QZ8AtsmUM3wD6GzJ7+VHdLbwzxhc68Kn2rtBivx2fup53mVd/AXavo2l4scAcKfi
X-Gm-Gg: AZuq6aILN9bW54oidC6Ow/yG3smA6tSBVyyCNJNJMuKcDEaHrWuTs3IYXLdD65Of4H4
	u5+dTiWEp2fVV6Tp0R2jRIZuPrhAezUJsYV1YCxvPgGxkGssKpMVRs0jqT+MfAEHOgtbxJrRkrM
	0zqWfaN55jU/9gjFsGHaQXTrAlKwLsJDkEIdMs1j0Y76cFSG5XZgR4ZMoIKu25eN3X0Zdp+/fHs
	0mCtq4n7y/HFM0Su2XfUNhhh6HtE8K0JQVCM67ZpDddTJUeNXwoGe/EC6lYvSDndEfc0aqoO3dl
	62H4QnxB5dTO6/OzF29X7Dp6hwQM6AhcvUboVXhmafrHHhBNLDWulVq6/bWsYYzndFDqBaUi8ha
	8qBipt6dlQ7tflVJQ59JNpCh4uiad+mSuzfiU0e45NjQXsg==
X-Received: by 2002:a05:6a00:66c4:b0:824:374a:1425 with SMTP id d2e1a72fcca58-824374a1791mr406225b3a.53.1770279719515;
        Thu, 05 Feb 2026 00:21:59 -0800 (PST)
X-Received: by 2002:a05:6a00:66c4:b0:824:374a:1425 with SMTP id d2e1a72fcca58-824374a1791mr406207b3a.53.1770279719018;
        Thu, 05 Feb 2026 00:21:59 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d49e0e4sm5251224b3a.61.2026.02.05.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:21:58 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 13:51:31 +0530
Subject: [PATCH] net: qrtr: Expand control port access to root
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAApThGkC/x2NQQqDMBAAvyJ77kIMKqZfKT3EdNUFTdLdIAXx7
 017nMPMnKAkTAr35gShg5VTrNDeGgirjwshvyqDNXYw1vT4liIYUiySNsxJCvoQSBUzyc7683G
 aybfOuc73I9RSFpr58788ntf1Beq1Umd1AAAA
X-Change-ID: 20260205-qrtr-control-port-access-permission-bfea19994a58
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770279714; l=2228;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=jiW3ZXnEOZX76PllSYO8HYRBw83unl7LOEgietEhHhA=;
 b=5BVvID3XLuTRLyEgXb+XszDuvwbNTM3oC1gXx8dhkJlTlJm0kwqDY/ibd4sRk7S3g+Kw96bV+
 EdvKsYi+vGiCdiz8t/S/2rbbW2R5XvSv1cbc1J6thwJRqb5OPgN9Jwv
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69845328 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1Fy8072LN9Nq9XkES_AA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: sQwR2lkeFN4iQhxdLMjyxU7fHfahTz2q
X-Proofpoint-GUID: sQwR2lkeFN4iQhxdLMjyxU7fHfahTz2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA1OSBTYWx0ZWRfX0s93pNMRK3xz
 28hQlJtovfzOpkN+gF0Wf0Me3nYKHmmWUwpa9yx6de3AjMJyohih0RfAHqdfYY70xIEv1/2bIEu
 2zqfehr74P9YmW53/9mUY9E69zJM0LU7oVYql2v0+Vcj4OFFDZygeWoeImpNT9TMeiRteDmwc+k
 cDcaAtdFlcZ560leTphn3atEv1pqpm+wJy49rmqSNQjbseFWvqapASsIvNG/F9WLVCHulb/2CZY
 2SbporjRlepL5BnBtxS4i4qfbYJI/Cs8AIQOAXIp4TITMFecMLJlpT4fH5k6HBhI2bZaa5PEX1I
 NXc1pL8ej1+MzKbZYfvkbfPh7kAAe40SHQ5ht9ajJnGqlt49MhvZIW7gV7Vf81wcEpyOQZmxdIh
 VPWaTPKgcpWwWKWka0rsGmxldiHCmzyR8Syp/Q/HxBLartULE11AYB1xnXOirnkIPaG+3tM/WWO
 DUX29cdjt9+E/4/Phqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91863-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0FB4EFD34
X-Rspamd-Action: no action

When qrtr is loaded as module, qrtr-ns runs from SELinux kmod_t
domain. On targets using upstream SELinux policies, this domain
does not receive CAP_NET_ADMIN, which prevents it from binding
control port even though qrtr-ns is a trusted system component.

Granting kmod_t the CAP_NET_ADMIN capability in policy is possible,
but not desirable, as kmod_t is not expected to perform networking
operations and widening its capability set is discouraged.

To address this in a contained way within qrtr, extend the control
port permission check to allow binding when either:

  - the process has CAP_NET_ADMIN, or
  - the process belongs to GLOBAL_ROOT_GID (root-equivalent tasks)

This permits qrtr-ns to successfully bind its control port in
kmod_t restricted environments without broadening SELinux capability
assignments.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index dab839f61ee93b876021d904ae6b8dca8ed43745..b0e252c16f156c05973988fbdf317a149ad9840d 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -8,6 +8,7 @@
 #include <linux/qrtr.h>
 #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
 #include <linux/spinlock.h>
+#include <linux/uidgid.h>
 #include <linux/wait.h>
 
 #include <net/sock.h>
@@ -738,7 +739,8 @@ static int qrtr_port_assign(struct qrtr_sock *ipc, int *port)
 	if (!*port) {
 		rc = xa_alloc(&qrtr_ports, port, ipc, QRTR_EPH_PORT_RANGE,
 				GFP_KERNEL);
-	} else if (*port < QRTR_MIN_EPH_SOCKET && !capable(CAP_NET_ADMIN)) {
+	} else if (*port < QRTR_MIN_EPH_SOCKET && !(capable(CAP_NET_ADMIN) ||
+						   in_egroup_p(GLOBAL_ROOT_GID))) {
 		rc = -EACCES;
 	} else if (*port == QRTR_PORT_CTRL) {
 		rc = xa_insert(&qrtr_ports, 0, ipc, GFP_KERNEL);

---
base-commit: f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
change-id: 20260205-qrtr-control-port-access-permission-bfea19994a58

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


