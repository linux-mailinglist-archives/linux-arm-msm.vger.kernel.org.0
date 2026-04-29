Return-Path: <linux-arm-msm+bounces-105200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLcKGqL28WmElwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:16:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9C493F60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E080B3069993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8161E3F7874;
	Wed, 29 Apr 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acifoAKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F43F6616;
	Wed, 29 Apr 2026 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464745; cv=none; b=t4YCSppjmyY4kSzskIEH4vTS6shYL1yeFZYWK0gz3PSAgixFpUJKVRUUNmAwRpZZabC8IuUGy3GKlnnIVZ9Q7P8M3lw+DM4LdBquy0p7fUNXfY24C1m77BOlp37OlcrguhU8rGPtWac+rE74q65wmNUex2ATc/TVSnz4c/BX8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464745; c=relaxed/simple;
	bh=FAAINAQt4cWnjHx1UiDcJRnSBz5fwuoEFDI20p6V/4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aHSko7GfaPT7XNVC8RrWaaOPqirsMZOTKJZKvmZofuPv3nRq0ggG4TD8WyJQHNcutm3xDSHQPZreXEdoaSWDMFiZRHzFeL4OqvKOm8dW7slBDb3wx1FXkuU4uBDv9c99Pg0V5Ht9ywjEY3nh/IjnZDvLJZT3x0SEof8dz7Gg91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acifoAKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qbwh870103;
	Wed, 29 Apr 2026 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cGKWKa6nmrK1hI0hLvuPB405ri69ZyZod+u
	c0Bv+V9I=; b=acifoAKz4m45cP4D8Gh6A7eCsH1XF0Wet1+dU9HSuGCNLa1UyKE
	X/V7l+Y/oYCSS2VLx23usV8Drn9n/RVdVOcN4KFsHHc4k5QnB0KtaFzzYsawhUg+
	BTPXHFXf3bsUNwglAruwRPAXzzKnIhad/XE9rnxzelo6CsbZcqGW70oy1KdK1MLc
	xvugNpYXm7pJcsCyNlZhNDi+5/17ue9YM0l60chnUxgr0NYiu0nVV8qDZzAnJhQJ
	UeMzgDouEVFxGnQAfr/25+wswNNpTY168dPeBs3/QmQY001112p+QURhy7R6xvDX
	SO3/bdDo8FmRMoLlnsltRdWgyEPpQgB6v6A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1uu1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:12:19 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCCHpU017620;
	Wed, 29 Apr 2026 12:12:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds66p1tat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:12:17 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCCHAs017611;
	Wed, 29 Apr 2026 12:12:17 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCCHUX017607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:12:17 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1EB875EE; Wed, 29 Apr 2026 20:12:16 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when version matches
Date: Wed, 29 Apr 2026 20:12:07 +0800
Message-Id: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: YSPLaD2n05KuKbmkbO4UR8ktDyZ0umD-
X-Proofpoint-ORIG-GUID: YSPLaD2n05KuKbmkbO4UR8ktDyZ0umD-
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1f5a4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8BPzjUuknQ10mGxUWxoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyNCBTYWx0ZWRfX3Rxr6bjDf9PZ
 bi/Be4hHyNNPwhPP3yQW4HquDuB48GeYwmnx2PhGVv+TKhNmG9yDzaA/aEdXJ02Ed83yk/odHpA
 CbSt21GFmqawRx74Ta3RUXYH6dibPQ92+2AIjVPwwi7M95pOTd3qRDBRaMXbmdpMeI5utBoWgF2
 Anvd6xt7OCGf7ohqWwVAhKfuVRMqoq9b/SVpZNlKSIBTNw+Hqy6irL4wh5c3DXR1GN1Adype3xh
 f8yFdgVENN9mFdaIWwosu/fka1vka0Y1eWJdkpsi4t9fMg4noG8erZJ5bQNxfIqWed7IT3czOVP
 hveJUPNrmki4JUsCoF4IrxSB2JS+8FZ29uVtjEqDt+7hRAGQg4hN/n4cZuHiGfeTfB6jUXvKHVR
 qDWZFDTVqV8oTekj8P1Ajogf8K32i7sM5YP+tCSRVPzU9eoG/0gsJSIopeiYprDsYwVZqHxJhWV
 /RuHfSEuyHMWWiC1rOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290124
X-Rspamd-Queue-Id: EAE9C493F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-105200-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]

The Bluetooth host decides whether to download firmware by reading the
controller firmware download completion flag and firmware version
information.

If a USB error occurs during the firmware download process (for example
due to a USB disconnect), the download is aborted immediately. An
incomplete firmware transfer does not cause the controller to set the
download completion flag, but the firmware version information may be
updated at an early stage of the download process.

In this case, after USB reconnection, the host attempts to re-download
the firmware because the download completion flag is not set. However,
since the controller reports the same firmware version as the target
firmware, the download is skipped. This ultimately results in the
firmware not being properly updated on the controller.

This change removes the restriction that skips firmware download when
the versions are equal. It covers scenarios where the USB connection
can be disconnected at any time and ensures that firmware download can
be retriggered after USB reconnection, allowing the Bluetooth firmware
to be correctly and completely updated.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v2:
- Update code comments and commit message to reflect the correct logic.
- Align the commit title with upstream conventions.
- Link v1
  https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com/
---
 drivers/bluetooth/btusb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 572091e60..70abbabea 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 		    "firmware rome 0x%x build 0x%x",
 		    rver_rom, rver_patch, ver_rom, ver_patch);
 
-	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
+	/* Allow rampatch when the patch version equals the firmware version.
+	 * A firmware download may be aborted by a transient USB error (e.g.
+	 * disconnect) after the controller updates version info but before
+	 * completion.
+	 * Allowing equal versions enables re-flashing during recovery.
+	 */
+	if (rver_rom != ver_rom || rver_patch < ver_patch) {
 		bt_dev_err(hdev, "rampatch file version did not match with firmware");
 		err = -EINVAL;
 		goto done;
-- 
2.34.1


