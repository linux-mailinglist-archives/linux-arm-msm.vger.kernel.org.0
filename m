Return-Path: <linux-arm-msm+bounces-116783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuzlCTefS2q2XAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98B710828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dK1znk9T;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C01E3001864
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499A5379EFE;
	Mon,  6 Jul 2026 12:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4D1A6823;
	Mon,  6 Jul 2026 12:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340137; cv=none; b=PapeITHXyY5UnNrx13tATsGjxg54WzCvg9tBvwywkkzFMYqvAFcGIgf3PM3O9SrWT7UCNISa3h/01fryy5mcI47psl1ebGH1hmtpEZ9t8Lkm+JWBdpCaXr8uzeNsmjdE89rkvGnMj1P3WrWhLsz2fY0ODWefPGtiJj/2vKmYCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340137; c=relaxed/simple;
	bh=mnwpAUq8Aj7jTOOLTIdTwLxx9OIhnCJQaxo+TPWXVU8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GI/CQH06UeSdjAo8ommM1uwnG/gJvcsy13TBgsicNcVe9xbP3NDaAY7JHGu1a81GU6N+YoXAOWdCuCWBy8D5qRhMMYn8qB1UoOQchIuYMvKEyE4wvKXHXCoJSoIp1aoOXuZ5vz/C22CIcrZzapKmZ/eMtY2Vjy52qo1iS2dQ7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK1znk9T; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVYT219069;
	Mon, 6 Jul 2026 12:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BzgYUPbL756GMEokHL5cYDlE+g5Bh4eSp1X
	cCSLXIuM=; b=dK1znk9T53kxUPYUweXPF0y0IHvgkH/ZFPl3pKqQ0SrwgDLqy5I
	1Q3ByBGxGhMvzTF17pC8mufT7JQbyu3+2KfGgMvWzonjW7w7odNmGcj3g0k7+dFW
	fCI8J0sbnB1Y3wgV2fGsOEUHB+WEFR3a/4BMqTnyro5lfYhYluyDI/trCgSwxyA3
	FMAKVwPWFALKd4rtmwYOjB+lEptd97ueRBQRPqv/27TNb414XVFtoF8C4Qu5frC8
	UjaNd3YiZjBVlaWdcheNkWXMT0jq1DU/WwAI2n0stBalNHYpMG6c72xGbFUCoHQh
	5h7CIA762BKo5HS3WIkodq/tJWQeSG9Z4Pw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8yt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 12:15:32 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 666CFTI2016215;
	Mon, 6 Jul 2026 12:15:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8hn33j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 12:15:29 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 666CFT3A016210;
	Mon, 6 Jul 2026 12:15:29 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 666CFSmc016205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 12:15:29 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id DA852633; Mon,  6 Jul 2026 20:15:27 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: [PATCH v1] Bluetooth: Increase HCI_AUTO_OFF_TIMEOUT to 10 seconds
Date: Mon,  6 Jul 2026 20:15:25 +0800
Message-Id: <20260706121525.2717691-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: SgQmz4Jn4ONACcGYQNjdDTSOgQsy_5R5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfXy4XGfFMhtJid
 hSvQSdPGwI86HEbQTJbAYmPdVt/44omKG1ivo4ot1oMuhGlLf3f9ch0pAMMpLCEb1ty7BOpPtZj
 +Lnz9bYPk08fck/EHENb2YRavm5n5xqqygyczI+y93BYwAnbDt4pg+QgNBvW2Imb5far5JeZuqT
 HnX5sDfGgxmWsd65Dla9iTABd8ocPOdgJvwC5BqHi6tLRQZ4g94rL1TBI2haXwgx4KY9lu8ONS4
 E5LthYLFXu0lNV7PhL+CV+dc0Z0akJWeiVqQbkvpAtPOiY41gHyTsciMkaSAOE9do4TZ1s06hFV
 8nMALvxOcc6JqtoZSxbh3phg7X5Kd0N9Zz6NzWcaKdkPVny9TJsr+yRRQMTDUs/1dWXafdERWfo
 Zl0Bb01j/60UP25ASFhgD+HTNQp9jby4pcbRkJNJo4+KOov7pALG+I1ojwXmBhBD+Hy7cUZqxAk
 JxqNb/MOm9NwzZRhHBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfX/49mqzsNzJeu
 eF9Tyh14oV/WqLBz2OIeYrT4rn8WkcAFdyy5OcVIh//7ytEfsZ+oZCbn3r/W7o5drNrqH6TyuK6
 tiqeuED506LTTam4HmyxPakSpwbrs34=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b9c64 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=u6aVmI0l1iiyjwmgn4gA:9
X-Proofpoint-GUID: SgQmz4Jn4ONACcGYQNjdDTSOgQsy_5R5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116783-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:chejiang@qti.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D98B710828

HCI_AUTO_OFF_TIMEOUT controls how long the kernel waits after an
adapter completes its initial setup before automatically powering
it off, in case userspace (bluetoothd) has not yet issued
MGMT_OP_SET_POWERED. This avoids leaving the controller powered
while unused.

On platforms where other services are ordered ahead of it, the
actual time at which bluetooth.service starts and issues
SET_POWERED can be delayed past this 2 second window. For example,
cloud-init-local.service can perform a network metadata probe
during early boot, delaying bluetooth.service startup by several
seconds:

    $ systemd-analyze critical-chain bluetooth.service
    bluetooth.service +594ms
     `-basic.target @9.342s
        `-sockets.target @9.335s
           `-snapd.socket @9.267s +58ms
              `-sysinit.target @9.025s
                 `-cloud-init.service @8.377s +604ms
                    `-cloud-init-local.service @7.000s +1.340s
                       `-systemd-remount-fs.service @3.257s +44ms
                          `-systemd-fsck-root.service @2.803s +394ms
                             `-systemd-journald.socket @2.223s
                                `-system.slice @1.772s
                                   `--.slice @1.772s

Once the 2 second window is exceeded, HCI_AUTO_OFF fires before
SET_POWERED is received, powering off the controller and losing
its firmware state. The SET_POWERED that bluetoothd eventually
sends then has to reopen the device, triggering an otherwise
avoidable repeat setup and firmware re-download, adding several
more seconds of delay.

Increase the timeout from 2 to 10 seconds to give userspace on
systems with slower service ordering a more realistic window to
take over, avoiding this unnecessary repeat setup, while still
bounding how long an unclaimed controller stays powered on.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 include/net/bluetooth/hci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 50f0eef71..ee3f295f9 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -483,7 +483,7 @@ enum {
 #define HCI_CMD_TIMEOUT		msecs_to_jiffies(2000)	/* 2 seconds */
 #define HCI_NCMD_TIMEOUT	msecs_to_jiffies(4000)	/* 4 seconds */
 #define HCI_ACL_TX_TIMEOUT	msecs_to_jiffies(45000)	/* 45 seconds */
-#define HCI_AUTO_OFF_TIMEOUT	msecs_to_jiffies(2000)	/* 2 seconds */
+#define HCI_AUTO_OFF_TIMEOUT	msecs_to_jiffies(10000)	/* 10 seconds */
 #define HCI_ACL_CONN_TIMEOUT	msecs_to_jiffies(20000)	/* 20 seconds */
 #define HCI_LE_CONN_TIMEOUT	msecs_to_jiffies(20000)	/* 20 seconds */
 #define HCI_ISO_TX_TIMEOUT	usecs_to_jiffies(0x7fffff) /* 8388607 usecs */
-- 
2.34.1


