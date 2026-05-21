Return-Path: <linux-arm-msm+bounces-108913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qjFcNXWXDmorAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:26:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338E59F093
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8644B304D917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F7531E859;
	Thu, 21 May 2026 05:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFlw+ubX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7397318B9C;
	Thu, 21 May 2026 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341170; cv=none; b=HhSoBKzH9mxrH8ksBkh6AVlnQAyW7wMPgj6MFv6m6Gwel6eJETpRMvUI/setwTrD2vdqNUzyuTokzDC0Zso0fjL/z12IBsQK7Cq+ocpvIp3hWeAiRl+lR35FGaMroIpEipo/TK7xhHgxYzmQB5CHnzr/B3sG09ftFeIcUijLl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341170; c=relaxed/simple;
	bh=e/4MsCDQRselIYvZ3uaUq+llmN01dyasIeL3er1gv74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNIMccQLU2BY7VitpzpvxcMeDeAa9/lCnKePX9/U3IAuyrDUEB+oQG8wK0RWiD8jG2ihMsJFIqp6pTDb4BJYH7BZgU2cu3qZW/gz4vTSxUzs2Rt8YKuunnjwMpe5ymFyHzcHYiisUY22UedoBil29tKJ0u6wrp87IjYjsu43vvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFlw+ubX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2mOxM446688;
	Thu, 21 May 2026 05:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wjuCR4CwmsQ+B9oSh0hO7FF06UDUgaiGPs5
	HL06tM68=; b=pFlw+ubXRMFZHFGxx6lx0i6iGyMGRSAsOyJQfPiKkPSfCtmvlOy
	U6/koccsrswmx8lNiOTxKTxz9rwbkzD361wK+xrLOSMO99UJkWJXxFTXJSqIykPH
	w7/zQqoWen/Dzwv/1emBCP6XuSrZrf00QUU7yCk/Ok2mu2DbkC4LvCufTyuH1HJC
	nH0FTtYVpeRRMp7muvgTXzg6ihojlwCYdkwCxaepHFvakHpugSBuhO8cURAg68Xf
	XyXjDjqmKtPe38aavVTlcu9UJvc+eC6sPtd1CZK+26Wuuzq+ZKA/QGI9LPpRK5fJ
	r7HVMUQEaVvrf09K79wVyiG7CjF5HC3rfWA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrm5ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 05:26:05 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L5Q2AA001795;
	Thu, 21 May 2026 05:26:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e713jev5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 05:26:02 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64L5Q2nU001786;
	Thu, 21 May 2026 05:26:02 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 64L5Q2UU001776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 05:26:02 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id D74044C4; Thu, 21 May 2026 13:26:01 +0800 (CST)
From: Shuai Zhang <shuaz@qti.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v3] Bluetooth: btusb: Allow firmware re-download when version matches
Date: Thu, 21 May 2026 13:25:47 +0800
Message-Id: <20260521052547.2862803-1-shuaz@qti.qualcomm.com>
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
X-Proofpoint-GUID: JLPL_EvC0htQoetiVAo_KNKvD8qRoKla
X-Proofpoint-ORIG-GUID: JLPL_EvC0htQoetiVAo_KNKvD8qRoKla
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0e976d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8BPzjUuknQ10mGxUWxoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA0OSBTYWx0ZWRfX3aLwJzDKH1mQ
 t4x99ed8VnROtYa0V9xb7f/a2edeyKusVM7eyzVjXImhsEi7BLJPYZ+gjo/3dwADhwcMPcaaUKf
 C3yIb+7lEQ2mmgkgFKSNxHarLce1YmVRatOl/4cf5NCPouKecn/wpcQXmc696lX88Kd/ozhk15i
 sEDELAst1+jV7xqxd6fWc+72H/d6Ez6u4OJgNtP570Ia2sEeF/2Lp7uf/HBwkRMVh63Cvn4YihD
 QYQr9xAeeDZJ7KrXecTruVGwuGd4FpR9SlFnAFfefRtlvkt65rUEsAvG4Tw4EhaHdIq7zjJV3oG
 3NrC7STf412Its050vraQtHVau80NNOMkf/guko24ou1OqFNSuGig5fvHJGzFV9xZ1DLuBSfzVG
 Hg0ibVULR7PDp3ixL1lHwyHX6niTs7KWqo69Ud+3Kw8MZhNsWoWM0CM2ingoaBdxJrIUaMOvQKO
 6hScgofU+eGFVm3FdhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210049
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108913-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuaz@qti.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qti.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3338E59F093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

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

Fixes: 3267c884cefa ("Bluetooth: btusb: Add support for QCA ROME chipset family")
Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes v3:
- Add Fixes tag pointing to the commit that introduced the version
  comparison.
- Link v2
  https://lore.kernel.org/all/20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com/

Changes v2:
- Update code comments and commit message to reflect the correct logic.
- Align the commit title with upstream conventions.
- Link v1
  https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com/

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


