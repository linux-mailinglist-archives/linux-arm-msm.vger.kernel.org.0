Return-Path: <linux-arm-msm+bounces-92707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA0UBP7gjWnE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:17:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C606412E34B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8373F303E74F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F51D5CC6;
	Thu, 12 Feb 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izG1DtTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Hkv6wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1135B655
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905848; cv=none; b=vD9XzgoJeoj2NwNFJ9xcb310OizuRO49iEMdDTzXuWxuFBrMeoj+axtNlz8sqFQbWBL81FdUMUhmOwmbn+bW3pvNOVC8ZqaTuW/NMD6FbJZzv0aTuTXs/3Oj2/eTQThd2Gdby8IOuy9BSN+yR79Jvf0+ZDkwooJ/XHTMLTTPBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905848; c=relaxed/simple;
	bh=Xm/ZAWsF7VzjaO122xKyDfyKXevlw+y0xC3FUx9Pbco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuTazfQWVSjcTV8vmKOBL3woJMzkGwZPW40GB3wk0/4VwPH1h67nSuEHTRQtbUR8tJXG/u9G6WiNd07BKmU/xaM32+Hkf00MkDf+JILawyuvR4kYLH2p24sRnP/jFdrI4oK3sn3Vzoc9LUX0aYebFBFTbke5tGh5C98xsCW7kc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izG1DtTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Hkv6wc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRfJb421495
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v/0U/NR0N5W
	sUfDazGrHqqkBRNkIVVwSQFZnwvJA4Yc=; b=izG1DtTNScK9IYc+VN1g0F5jowh
	CtVzu/zTHwUN/vv5mJeqotUN2BqoL9F6t0ESPoOfwG0D8klIDQfsKTD/bdzNe+lK
	4WQ5D21iaNhxEqnMor9LbIB5AsVMYS4feWC0BtH2s2HSKOUr05cATnzUmO4w3x/w
	yR2lNEjmzdG8W1IHyEsar0AuT9eQvW0MEFbGw/mCfH5kMCmiiK5f7MgCJoAmzrrR
	4RcCTS1GMVbS7opqPHHZakdaKLyyMpt961/J1umiaYnC0gqygD+krY4KFEdFAZxa
	l7tz0jWlVOVHP3jjw0L047K0TMz4UoeFzawLejHlyvs5F69aG6Vi31GJl1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy48pq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:17:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so2243575285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770905845; x=1771510645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/0U/NR0N5WsUfDazGrHqqkBRNkIVVwSQFZnwvJA4Yc=;
        b=L8Hkv6wc3NB3XfolnUv7jtrrJ+qtcjs3wfXH8bm6y5VIgsUL8T7z+eVDS5v27lRsMc
         igt4d72SlcYmzpXAemW4pi8pnsEq8FBtMWiMPp9ssBzuUW+43UwTiRi+9S+8FT1voapS
         +X49lEBo78crLI8gAVcCBiyWm8QUr9rGEWtgIPkUWwptYRv97yx5lTn8gjdDx3azV0jb
         tfM0+hy8Qp70kg4qpBkj+pzeIsxYQLfLdWKHg8yoTpygEARzIwBTNLLlRBv4ZNux3L/6
         yIGBLve/8HgYfc3lOnDoBKAWkBJAak6dr0cEOMtMWqzWIA5qES0WvhPUZA12V8CD3jHG
         d4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905845; x=1771510645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/0U/NR0N5WsUfDazGrHqqkBRNkIVVwSQFZnwvJA4Yc=;
        b=hV8+vDLRWSQaQdzydrKBdNO5pZyr6WATShaYX/5uLSewG7BKSCSNh4O4V9+/GtEluZ
         oJ05tGZrye8jw6KD0QE7Yi0H4kdOrqRT3jrL47JboJKkLNXtOW4y8mpvnh/jEfZC34E2
         1IeMVrSeDLE8qHxuTijseSN6Pd5nLbzlIWGIzzyY60MpiX46MdGr0OCoHz0IlRgqdxZi
         GM+5XO3PzGILtYuSvbLy8sjhw07H13fWgil+D0v5gUbLraQB94TclVSBUe8Gxvf5qwMr
         T/PDDJand3XnDe5maKoPpfBoSwZgF2VYtkX/09lqNoRzh98TBrM0gox+EfhgWWcCXBwU
         uLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOYictU7l5alZ19ohlj19Wfr3CfGwpDS8v3q50PSvDhIgoNeqnnGWvI/R1Mk+YJIsji4yhsB/9V14AZutI@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRPaguzcFYq5lEVk6K74NbbK7GVXmagdE4EoLWDSXmBVdpeiQ
	XujgtW+gSGLcbR7eVmh+4OYybPT0imuxzu2JSC5Kd37tUi1hZBBlEvRHDQP50q1kCfbQT/n3OUc
	y73+b+JCucurzSSIiTpKokZLPyV8r+JYMfN0Sr7mllcl4KIfZLeGlRjvHNQEiWpmiRW+IRzYwTz
	dk
X-Gm-Gg: AZuq6aIe7hhsL5ZKTdS2RDaLNWYr4zdJfaeKg+rUbK+D6OPDOVqoYGnIzfFjHFvWhMh
	C4bVmPlza85s+Do1/vi86x+jMQMPlvZaCcGV4xZwCVrR0aXqa8HCkPXgMUfe6teHv0ibTKLvAuD
	KycuWAtfIQhbSnLl8Pk3azPGJDPiZepsS4e/ZBmI2aJUj0KSHFOsq8b1vgW5capzAf6ANejlLJc
	Jq+5WhIFWHQGyHth+YvnpGzSdC91tOSFWNGibMWQTWl/0ip7d3p3FaZJ0qkdDAwDXrCJU9h6PTe
	OocCUFRxOQrcu4E4ch4tcv8xUdN+JIzNlyM8cZ/nrt1eG3JzOxslzMC2p6FcMPQLW/LCuWU8iw/
	AeXBrZz42w3p2xm3puJjBmlWRiuj6JA2lABFyN+Yx/yaUdFyrBXbJ8bv7XpmsUnM7ncUFb1jkX8
	3PtGTjGlchXAMPRXZt+mc3WFgkRT5naedYuUvu
X-Received: by 2002:a05:620a:3706:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb3314094dmr256440185a.68.1770905845267;
        Thu, 12 Feb 2026 06:17:25 -0800 (PST)
X-Received: by 2002:a05:620a:3706:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb3314094dmr256436685a.68.1770905844640;
        Thu, 12 Feb 2026 06:17:24 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm119556166b.19.2026.02.12.06.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:17:23 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_qca: Fix BT not getting powered-off on rmmod
Date: Thu, 12 Feb 2026 15:17:21 +0100
Message-ID: <20260212141721.69961-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
References: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -g5ryqG7GelOvRBzrkwpdkEABXSskZBt
X-Proofpoint-GUID: -g5ryqG7GelOvRBzrkwpdkEABXSskZBt
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698de0f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=45zLG3vbpgUbxSzxPE8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwOCBTYWx0ZWRfX+/kws1UEBlJ6
 MPrermupHBx345ruR+FlT/BA9ukSId1Xif425jDJElG4v4EnFLwaRRlffA51J6lwi0fK76G4FPm
 B/3HhSkKrd4v3TYuhej3lP6djySxqGRm+1pON2BJ0aq6/Q8Ff7uccmH5kyJSKkomcrBmwAMU1V3
 gXXgFnu+ullX0/yjmlaH8HNwOwsdyn1cRf0BggW0PwVOigfVPyFumyxypCh7PhGs0h4b4CNtaMF
 vtE+CY1humtT1tKip3NoMWsWGkCG+m+sLJMhtFJTKKZcDP7IcOTD2vieozpe6sDkl1JYY26S8kI
 9C8R8jRNPOZNTnS8QVw12hjWwVJBTDkI/tn586XSmonNVroLl5ucwJ8ux1/4REvnN6zixu9cdYg
 rhM9uQD0cMFcuXKucT4/7duQAFFDJMzHIL2rjQpnmoxcDSWCPJWSAi+/ewBzeMpsc0z6uyb1nUE
 BBlL0ryxigUhLeqkYJw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92707-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C606412E34B
X-Rspamd-Action: no action

The BT core skips calling the hci_dev's shutdown method when the HCI
is unregistered. This means that qca_power_off() was not getting called
leaving BT powered on.

This causes regulators / pwrseq providers to not get disabled which also
causes problem when re-loading the module because regulators and pwrseq
providers have an enablecount which now has never dropped to 0, causing
the BT to not get properly reset between rmmod and re-load which causes
initialization failure on the re-load.

Fix this by calling qca_power_off() from qca_close() when BT has not
already been powered off through a qca_hci_shutdown() call.

hci_ldisc.c will call qca_close() after freeing the hdev, so this
means that qca_power_off() can now no longer deref hu->hdev, change
the logging in qca_power_off() to no longer use hu->hdev.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index fa7ab4272771..9993e748b56c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -721,6 +721,10 @@ static int qca_close(struct hci_uart *hu)
 
 	BT_DBG("hu %p qca close", hu);
 
+	/* BT core skips qca_hci_shutdown() which calls qca_power_off() on rmmod */
+	if (!test_bit(QCA_BT_OFF, &qca->flags))
+		qca_power_off(hu);
+
 	serial_clock_vote(HCI_IBS_VOTE_STATS_UPDATE, hu);
 
 	skb_queue_purge(&qca->tx_wait_q);
@@ -2220,7 +2224,7 @@ static void qca_power_off(struct hci_uart *hu)
 		qca_regulator_disable(qcadev);
 		if (qcadev->sw_ctrl) {
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
-			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
+			BT_DBG("SW_CTRL is %d", sw_ctrl_state);
 		}
 		break;
 
-- 
2.52.0


