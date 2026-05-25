Return-Path: <linux-arm-msm+bounces-109567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sInpBJLyE2puHwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:56:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF75C6CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B08A304A8CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41533AB5B7;
	Mon, 25 May 2026 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqTAEtnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD53998BE;
	Mon, 25 May 2026 06:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691966; cv=none; b=axMjv4nMT9xXxFVAOWIK9QkmotsFbN181bshgQ2PD5BAI5pgXXrnqT44znQELSlnTDt0v3J3FS92qd7dxrYWUjvF99CxbHk4wZN6cW8Qczkva/wRXl1mUPlXDcPAbnsjbO28rtf7GzZRPz0bEqbGkL/sT7d0kGhwbpBHcRbKHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691966; c=relaxed/simple;
	bh=BCAd6SIKtLH72gXkui+X+RaA2de7qHKeNa1vkNx200g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vufd2mHDDJykLTgtU2sRE1iavdgJp18Ne6GkzbqmPfONIKyWR/9gtcR9QuNIGqqgEj2XSLEEx/kW6SNS2NQgfML0dXmDTpUcBF+vMHNkFRCqlwljl8B9FMsze6LrH664l/BOhk6YJ+BMtjZuKBtDw7guuyz7qErw9aWUVvuoxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqTAEtnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OLrLZP563404;
	Mon, 25 May 2026 06:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JsfVkv5u6Uad3Xrl69S04uJkWdM1DP6FpNo
	nePd+enQ=; b=nqTAEtnFwaAiKUNIXuBa2N5SVBtUHl71FvvElc6dJSJQNB8i2Lm
	4C6spSO52pQ/4Zu4R25GEM+zMKGI1Lf3rCwRn+QyKui3D9NbF3GgwiksYD1qY+U8
	FAC/eJRSg5yOPAlgLPJVySS8BHw2Lq1VFS4kLvLincHYA2O2AXeQP/HWlm7jHlw6
	qowfC1gmEvGlQJPVDn1g3r66fBQKCWGzknvO/z1VDBoHXAJA8ZjI82OHOPVl5JE/
	1SoteRZ08a3mmuruBc7ZbdY3xpu1AqbCojOJiSHkDTO/kO3Ps1jrJwE91oYsVN63
	le8gdGkhVe6m7sdxCxmVIY/38efDZDKeAyg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9n8qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 06:52:33 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64P6qU1J016985;
	Mon, 25 May 2026 06:52:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahkc9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 06:52:30 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64P6qUtO016978;
	Mon, 25 May 2026 06:52:30 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 64P6qULS016976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 06:52:30 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 12CE0614; Mon, 25 May 2026 14:52:29 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] Bluetooth: hci_qca: Use 100 ms SSR delay for rampatch and NVM loading
Date: Mon, 25 May 2026 14:51:56 +0800
Message-Id: <20260525065156.2213123-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RwCll7GNb845jlhHI7lM6pNurBSCrPFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2NyBTYWx0ZWRfXxMA/gJMnoM8v
 ZL0KF9eJrTFMwQTIrDQc7BgdP3/CmZjdZYiZheZehLYreR+LnuACqoGw2ZFIl3Z9Ib6Gf1WNeCE
 Zb3GBSymzlNwFEeXV4QagDOJa9bwxctB+JazvgqsmipPtf99OOGG2rB7MYeeOaYkqLXqEyEBo5y
 3ImB/YiajI//C1b4tEf8cK73oRtWcipAMCsjw9f3fKhwG2zt/a1Va7LG7vWQ72dlSCS11fsguRR
 +d7hHIfmPCd+xhk+yhKOA9cAMn5JsOAvmke1DoMFmfHIi8z7aRRmGbJlAC2dCz5umF5WOKLlLsL
 pGVB/GELsK1eCOARq0A/c7HAvwZASoLnO84v3clpWOl8i5+Rz05SQ17/HC76XWigs52/bigDqn5
 1Gce6h96xljMUXGZ8MJHfEkqstz85xG1i6kCcXS1EvXEpUY3iuOjbH9+SzLwB56t3xMbiaiTuh5
 0laZKlAwUoPJYH6OSDg==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13f1b1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fLsEai5F-5_WtRB3AzMA:9
X-Proofpoint-GUID: RwCll7GNb845jlhHI7lM6pNurBSCrPFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250067
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
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109567-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 78CF75C6CE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When bt_en is pulled high by hardware, the host does not re-download
the firmware after SSR. The controller loads the rampatch and NVM
internally.

On HMT chip, the rampatch is ~264 KB and the NVM is ~9.4 KB. The
loading process takes approximately 70 ms. The previous 50 ms delay is
too short, causing the controller to not respond to the reset command
sent by the host, which leads to BT initialization failure:

 Bluetooth: hci0: QCA memdump Done, received 458752, total 458752
 Bluetooth: hci0: mem_dump_status: 2
 Bluetooth: hci0: Opcode 0x0c03 failed: -110

Increase the delay to 100 ms, which was confirmed as a safe value by
the controller, to ensure the controller has finished loading the
firmware before the host sends commands.

Steps to reproduce:
1. Trigger SSR and wait for SSR to complete:
   hcitool cmd 0x3f 0c 26
2. Run "bluetoothctl power on" and observe that BT fails to start.

Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes in v2:
- Updated subject to mention 100 ms delay value
- Added firmware sizes (~264 KB rampatch, ~9.4 KB NVM)
- Added failure log excerpt
- Explained why 100 ms: confirmed as a safe value by the controller team
- Fixed missing space in comment ('NVM. */')
- Link v1
  https://lore.kernel.org/linux-bluetooth/20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com/
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ed280399b..34500137d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1680,8 +1680,8 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		mod_timer(&qca->tx_idle_timer, jiffies +
 				  msecs_to_jiffies(qca->tx_idle_delay));
 
-		/* Controller reset completion time is 50ms */
-		msleep(50);
+		/* Wait for the controller to load the rampatch and NVM. */
+		msleep(100);
 
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
-- 
2.34.1


