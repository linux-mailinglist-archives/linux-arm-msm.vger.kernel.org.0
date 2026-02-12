Return-Path: <linux-arm-msm+bounces-92706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPJrLPzgjWnE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:17:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E212E33E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D015F303B5F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6168B35C1A9;
	Thu, 12 Feb 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb5G/9qQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izD0PlFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A3261573
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905847; cv=none; b=Yi1ZIblUJEU3hEXSstbNcg3xWdP+oNkxDAYh0ZeEcryIVCr4ogThKB3rfcrwDjHeR2vAQGErtdHZQzQZS73wa3klR6tt2Tf5TdZQRCveXsq8zU+fHt11f/ZqD3E+op+FyifqdHMv8f4BIba9Fc5qnRSghP2jDaTn7UK2s+aCY08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905847; c=relaxed/simple;
	bh=t26JZHwkQX3zco9QwTYj7pXuDqQR24HeiJZJGjELDSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nw6T3hykRVqxc9qAVipi0VWXdfDLwaqAhHxNSDeBLhP/78a7iYotLt8fk5MAVjhaDAR3Y8in9eWYjML/XOyRt4pAuRmsqm9SktoovOS2KThFvrFdmzJahnmqSdu1dK5ldaVmINWxADsohKhQf2mr1AZsN7LPi20x+cIMtSE8wCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb5G/9qQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izD0PlFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDReZv421483
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GKeKwZoXUr7FfD5C+hV9Y+ZcIM6xr5NbLls
	xaCvW3U8=; b=fb5G/9qQttMb1RAcPTb7wxmAglrpW7CEz4Hip+KZjg8wHk/aVr3
	SM7YOfLZnvDRbtfSBO8TnfUxTkDQ03NphUr+E+cI72gP4JOeiDyk6LQlEL7t9L58
	QWgrteMfezHbgRBWI4YmslbExaAzFNGD/vMnRoR99Whf+pO+Up/8x1n3a+9gSf23
	oATuc5SzFFgDKerPq1FAcVXGHgKcqpbZYKKW/XaJNVA/L3/XySibvcbgxmsd4LNS
	R8k90/eiR90cxvAOXgc77daSyAMyalfOLDAI+jVFvWY2kZDh9DE/Jjras/9JZZJl
	DuIbVu2nIt+ttF2EOh3xeNOYed4Q3b3bPrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy48pq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89546cbb998so183122106d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770905843; x=1771510643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKeKwZoXUr7FfD5C+hV9Y+ZcIM6xr5NbLlsxaCvW3U8=;
        b=izD0PlFhTEkHXjZFWW6tB+duR5XnoOBxhETu8yqPxJ7rzHE1VLO4Qrk16Xzuqy4CH5
         sVD1q1QXfxlLRBHcPCbhG3bczCnHN7UHQLAcIloCV4TBQ+668Eu4Hd4lNPf//6FS0U21
         4CJpjfNnOs2Uo/O51Y3FoFzcd/666dMQCqwce1hA0w1/lqwyO8kkBaTEUWZHYi+9pqSU
         91RSti+wn77XgUajdKJSp05sysmYubyu5Ah+CDTA4xD0Nc5Pg01cOJnljkaddnKooTa3
         Ac8HQm0RTqus1nmGkTc98oSTQNdyUFjzpoGapFvZX/KtNdAjTW9nIjyayv/dm3c6xL+Z
         bLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905843; x=1771510643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKeKwZoXUr7FfD5C+hV9Y+ZcIM6xr5NbLlsxaCvW3U8=;
        b=fFgP+prRwsreejoB3Q/IdssEfAkKe6hikG8W5XKKzqPpbiqWbOEdMyDWNDfkBKDOIE
         ZziWeyLfj29AuZobpiy1j4Xp2sKRs33NU6oNV2HOKBFCw5TQdDVgj93EtAIiAqX8qaQy
         zaOoHMq9Xa33HipfclMOZKJx1g3e+ucfg2AoNXnrIcubMB4AtcBwIPh3FxbZfDqkXJG0
         HE/q8n4PK6BK92ThQH2TJ9Rv9cJsmb8w7x99qO8cdaFPvyGVBAJnyXHC/8SJNOlvfcRu
         bvLfpL3/EN8djAwHvnOt5DmnzycSs+O2ZzfqU04LoDzd6CKw8CSCq/02siabiPmcuTr/
         ea7g==
X-Forwarded-Encrypted: i=1; AJvYcCVm6H4WYGbAWaTGrPXYBw/3OU0gYpSnAJdZdkkYLwIg6QApLnCADGg1dLCGQYdzl/OagONvU6OjuC6qk5Cp@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGRtKesRBkAx3Gq8iqshx6I/Npiyn5pY1dshiie5/wFyNSBt5
	Hq5/QJi6g4/OdOgaO1E1zhjxgmSe0v3n0u8dpyWKotBmzkocDuSOrGcdzfQaa8trgiRbDyrMT+T
	wraEC1LG7NGtbjmKoMOJPfpHOGbKLheI76sk3cuMOZhokYvaX1qYKhE6Q41FGhOdWn5ne
X-Gm-Gg: AZuq6aLhDcSRidwTLt6osJ84dK2of1vyjAR718KALquubRmlW/PSG5x/KuDF0krbdpF
	hhHvB8ekM0m2b6XeVBXRlkQxBddsPrufToMPCsiGndRMIvvW2z4sazO4eMmg/O79GcPiLRTif66
	lQkpDaVAF7lAyKjkNDu15x3A/abEX51TZJ2Kb1ceuz8ecSywNF6DrMpqWyTbD7ur1MymPUPpu9d
	s9Zu+HIkKlL32qWkdvYdqgqkz1LIjwdh/379CxV0U6Nunv/HhDH9/7jRrXMMOVFklL45y+B5CcU
	7YJHaY3/KAtpn2KMO7OXdXSUcs/fxuK6I655lkd3S9lDH+reBKQuxI/wthx7pbl7WRBcFejbltS
	yb2rixMOzYRpaqEduvvMEyXWmfJgE5iYxTHnWdgHSN9NByOxaTHVNlqStOVMTZAv6YNn9oqHJx/
	1ppqai2Y4bqL1FU4cZ+MszMT6XmLQYpbBDMzr+
X-Received: by 2002:a05:620a:2097:b0:8cb:38f2:6a5f with SMTP id af79cd13be357-8cb38f26c9cmr118757285a.25.1770905843402;
        Thu, 12 Feb 2026 06:17:23 -0800 (PST)
X-Received: by 2002:a05:620a:2097:b0:8cb:38f2:6a5f with SMTP id af79cd13be357-8cb38f26c9cmr118754285a.25.1770905842971;
        Thu, 12 Feb 2026 06:17:22 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm119556166b.19.2026.02.12.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:17:22 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_qca: Fix confusing shutdown() and power_off() naming
Date: Thu, 12 Feb 2026 15:17:20 +0100
Message-ID: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: idWPcj7ldvtKK_HYqmZhDuV-00TsJ6Qz
X-Proofpoint-GUID: idWPcj7ldvtKK_HYqmZhDuV-00TsJ6Qz
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698de0f4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=9clcvE9WzNz3_oQShkEA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwOCBTYWx0ZWRfX60U/gfja/3gn
 A86JLrXPS99hma0uEzPy8Dkfaby4TuXGi4s0hh65xQ7lxxPSxHpI00fk1okRRmUV0ctm4vxGRNp
 vEd3/HApKwxCbJ1V4c8LDydO0t9dgu1QzIPvP3J/86/pQXfsFcr+Rapwl324Gmfpo7B5a7VXRl3
 ms7J65wNOFZOCSK8/QML4YeEWF1rdd4QYLUEW7spef4aTgYwhsI9xST8tFwJhOjchCO0VR9xcD5
 u/bfp26Xw1dNaoOIZ4AB24mqzu4g0TKf9UGYVntk053t0zLLJxVD1n0lTCfr6vvjiepQ2VmuDWb
 wIMxBoo3OtWA8+ar5GiXq4RqDiWuuFxetmp3Hms+C2lonhRVWcLAz2qf6ZyJuXB+9coJaRPCygx
 wz/cOwDIVdYo7XFEf2pC8XsZNvysz5pEE+2nue4o+69rcxGeetKfOKw8orjEdQgVg0Sx0izZOi0
 az1SOfzObVwrcW4Sc2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92706-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D1E212E33E
X-Rspamd-Action: no action

The function called qca_power_off() is actually the hci_dev shutdown
handler, rename it to qca_hci_shutdown() to make this clear.

While the qca_power_shutdown() function is actually the counter-part
of qca_power_on() rename it to qca_power_off() to make this clear.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4d562596ebf9..fa7ab4272771 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -235,8 +235,7 @@ struct qca_serdev {
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
 static void qca_regulator_disable(struct qca_serdev *qcadev);
-static void qca_power_shutdown(struct hci_uart *hu);
-static int qca_power_off(struct hci_dev *hdev);
+static void qca_power_off(struct hci_uart *hu);
 static void qca_controller_memdump(struct work_struct *work);
 static void qca_dmp_hdr(struct hci_dev *hdev, struct sk_buff *skb);
 
@@ -2015,7 +2014,7 @@ static int qca_setup(struct hci_uart *hu)
 out:
 	if (ret && retries < MAX_INIT_RETRIES) {
 		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
-		qca_power_shutdown(hu);
+		qca_power_off(hu);
 		if (hu->serdev) {
 			serdev_device_close(hu->serdev);
 			ret = serdev_device_open(hu->serdev);
@@ -2171,7 +2170,7 @@ static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
 	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
 };
 
-static void qca_power_shutdown(struct hci_uart *hu)
+static void qca_power_off(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
@@ -2232,7 +2231,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	set_bit(QCA_BT_OFF, &qca->flags);
 }
 
-static int qca_power_off(struct hci_dev *hdev)
+static int qca_hci_shutdown(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
@@ -2251,7 +2250,7 @@ static int qca_power_off(struct hci_dev *hdev)
 		usleep_range(8000, 10000);
 	}
 
-	qca_power_shutdown(hu);
+	qca_power_off(hu);
 	return 0;
 }
 
@@ -2498,7 +2497,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	if (power_ctrl_enabled) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
-		hdev->shutdown = qca_power_off;
+		hdev->shutdown = qca_hci_shutdown;
 	}
 
 	if (data) {
@@ -2530,7 +2529,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 		if (power->vregs_on)
-			qca_power_shutdown(&qcadev->serdev_hu);
+			qca_power_off(&qcadev->serdev_hu);
 		break;
 	default:
 		break;
-- 
2.52.0


