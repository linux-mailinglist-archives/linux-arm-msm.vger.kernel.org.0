Return-Path: <linux-arm-msm+bounces-109265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJDiG2k5EGoaVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC25B2BEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C1363001FCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F073168E6;
	Fri, 22 May 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cz1ikoaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0D3CFF5D;
	Fri, 22 May 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448139; cv=none; b=TBrd0qM9oeVC2AI38/PgoAAccl8SyV6uICS8i2IcyeOIjrhM+C6ctAOjz7h10GyM40cbfhRQYO5x5rf41U/XE5zw1AexY6bLbIkmvCuV2u+1cGj+Pok8ou16rEWtC2j8llMUMb3aJzKAL2pooJ0AAvbh2rBVYiNOh495qKXDpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448139; c=relaxed/simple;
	bh=i1OgZQEXIpJ4gFsrJh9ccSR2bnQ4kvlChGJ1Nq/eXwU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQAvm+wZsrX7XMzy8EjTpbYmemelqpBA0UoHqxRYr7UVkc1dyZKya6xNsQAGfh94MP0QweAdRcqjtr6uE7bE5FWDM6hmI9wTt+jaRXFteeSJpRjpFFRA4CX4e1Zd7oBpNF+bt7TmeFwmcTu8SMdViMr5mZIOgUAmdftDaaJVvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cz1ikoaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M98iBb1816103;
	Fri, 22 May 2026 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WlFlTevV7pugW98Ow0Dv1MNdLVqFSLaps+d
	D8LEsf98=; b=cz1ikoaQCVb/bWs4HCdqQchl4rHhScTN97+PrdI2gBAQ6ojTf+j
	MmWu5p5eV1ayfOKJ9UYGLe9Pg49XlwTPrq6Rh9jtzN/0sUztxZFxoP1yh/xVQUhq
	XciFWSyCeN+CDTmk8RgN8SQyI6UDXXFxKpOdjdl991N+cXOILKTQ/AYwE768Lqq2
	Julb4emA1nSv5YuutPStpz1RXZbUvUwRlSv0MOnem5iZKXqTuyeBGDrBZTCubO0P
	m/xKVP4PF1nb2acpxGf96xNyG0cVKR1EFY4E/TaJuEE9QjmEAW5kCM2HCOJ5otSa
	kLUD3zBZC4suDWSiQ+0GxMHosXbTeknWm0w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 11:08:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64MB8nut010787;
	Fri, 22 May 2026 11:08:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e716s25dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 11:08:49 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64MB8n6Q010780;
	Fri, 22 May 2026 11:08:49 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 64MB8mP8010777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 11:08:49 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 172306ED; Fri, 22 May 2026 19:08:48 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v1] Bluetooth: hci_qca: Increase SSR delay for rampatch and NVM loading
Date: Fri, 22 May 2026 19:08:38 +0800
Message-Id: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: oM22Sdkr8Q30GZP6zG0DdFL0KQ2T5aDt
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a103944 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SK-ELO-gduZh6qpZz3UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfXwZcazCe8Abjm
 waarRxJEsWjKvz0qUGWgaAQR3fgy2CAUgLwN7kNbEyAsFhVphqXoP11BHN4C2972eilfoCZekbA
 z6jGzlK+wCPGKPIyU/FTPP9VOVrN4lpQTnhYqaOKg7Kc8hTN7+hnBlKb025jh5MeEfCA4xkHiSs
 IgLTKa8bCOwfROOD+etQiHSUZFqBkVf4y4JZBNmVw/ofA1HICQ8hfM/NyCMqBaKFCz3RItmPQgs
 7hYdxy+kCeJ8Wm7swe/1CGZaM2GtSirUQdSsjDIURkpPzAJZXNeMx1loL1LVGveKGNFEvV57gZ/
 AYJBSL+4XAyOpv3u1GnjuvPdhprBrRGREbFInD+KuhoknHboK5hGJdosHEIdOxEmVNqQfMUG1h9
 J+5ZWkHqxSprjtbwPwabfOKr/x+6urDrXCN0xRfCOHcdBEJ6sKqMxc7WPt8W5aj+ofaH7meJZj0
 QJpHl6CUm1cbzq7g/Jw==
X-Proofpoint-GUID: oM22Sdkr8Q30GZP6zG0DdFL0KQ2T5aDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109265-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AAC25B2BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When bt_en is pulled high by hardware, the host does not re-download
the firmware after SSR. The controller loads the rampatch and NVM
internally.

On HMT chip, due to the large firmware file size, the
loading process takes approximately 70ms. The previous 50ms delay is
too short, causing the controller to not respond to the reset command
sent by the host, which leads to BT initialization failure.

Increase the delay to 100ms to ensure the controller has finished
loading the firmware before the host sends commands.

Steps to reproduce:
1. Trigger SSR and wait for SSR to complete:
   hcitool cmd 0x3f 0c 26
2. Run "bluetoothctl power on" and observe that BT fails to start.

Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw")
Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ed280399b..184f52f9c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1680,8 +1680,8 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		mod_timer(&qca->tx_idle_timer, jiffies +
 				  msecs_to_jiffies(qca->tx_idle_delay));
 
-		/* Controller reset completion time is 50ms */
-		msleep(50);
+		/* Wait for the controller to load the rampatch and NVM.*/
+		msleep(100);
 
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
-- 
2.34.1


