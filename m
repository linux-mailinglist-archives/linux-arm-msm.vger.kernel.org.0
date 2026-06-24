Return-Path: <linux-arm-msm+bounces-114426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GnU6AGxHPGpgmAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:09:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C88806C15A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:08:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UR7rsXj2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=isUcarZP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114426-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114426-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 756B93006827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3A63E5EC0;
	Wed, 24 Jun 2026 21:08:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05B3E559A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335331; cv=none; b=CgPpK3es+86VUhw/SP6i/rGND0W0CpTy7xhliU74uHX5V2X4tjH0JdCZpLMh57TMroaoW7TYIQiBhMrQgReuXH5GtzT3ftDH+vV379AkXG9fyfSKMKojy/PDegDJ8th+ntEhKpGRUBrMgxUKeCHrI2LOERTe6IRp/+gEx67+OBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335331; c=relaxed/simple;
	bh=KubqS9d0YGkacDuDdgigJavlflu99724o5AA5cuLn4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePKZn/9uJYxra86SF4Cn/Tyt9B7etsc/zIb0GZVsg0nfsrglF+ICRmlI+RtSvT4lIPCjsHwFTNzNIXb6YrSqf0zMaM0+m7Um9TQvNg59W+yh9crXV1+ydY478B7WpiJ7wTqjIZ8aDQTS069pV8Fc+0sTaUycss+IKcHrR1/boVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR7rsXj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isUcarZP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJj6r64119035
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lXty0c8dvBU
	OMaVjegXOvn9okysmin+BPLP3AA3xoXg=; b=UR7rsXj2+H705/dAX4KecZIPdgd
	Nt3Xr8JRjg8RmxDc0l3pMaCPV/mdMGjAOF0+W/+RpzUGRmdSuafCec8JGH1hvYyU
	6eyvondGiqNmOpT+X9EuPlwtWXgZZL9+jKy+R1MW6SoTeooqBdM8h1p6WWtr+zSM
	+Jnw/GXLTLsHLE8abckErPD0sHwNUbWygaBS1rOO50xG9jO/atn84BiQIxTpu3c4
	BLwt3fUuGMEvJR3MqIHrIF9CZBYeAOBleC1OvP2JoRBiRHZHcNV9ZdTEZwhjWnyR
	7KMzZyH607pDKiPpDjd1I/IjT08LXv6Lrxn+0DO1D8JBgPWBzmCi8YuGZ4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq36v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso240905085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335327; x=1782940127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=isUcarZP9gN7zFWeGzfQQI0qfGKsX9X1HzjmSjZ5mjtZtGvdT65WmmcMmZN/wyD/5T
         M3EvPWFJcj694HKVIRjjP3nBtP9G+ay60AhI8sQqd+GIUphaFpzNFKZQZ+fNcXLOOXoX
         d8lyj5otw0IDFKrDiOX8+lB1dkjcJGewABCohnSJefzrjnOY0WnA8az+FZDNJ38d5J2z
         rBwiFs+m8QQdjiqBm0AH6mEAJfYjeOrgWoOFLnJkfqxAp6rWGa8GU69XNV1twQneukr2
         HzAEVsOtT5BpqEaU7E7vfHKyidvRqkrvLj2ckK+KsWeEzM6CHYjHMWZkbibW8z+3ih8O
         GgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335327; x=1782940127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=WAH3JrVdUcZiAiqHvvisH6+LhgTWlolEEWhybLolJ464z3X0rRP2w6QYZZ8o2CCved
         QNqZQOG6O3ayQZ7J1s2Q66pljaHOSq/PeS3G/O00pPtGZKbSK2td6MMD5OZfDHFRpHf0
         32xnB5SG6FriA0M57iJpV1/4gjsjvemg/CYdJjl8RwWV250PbtXnY0/pbz9eZn0/qzWU
         qgnWg1iN3JtgXP3Eb8ijQuoP7SPbYtmE/b1kdRij5FCFczn6zEkWv0uZp2jpUJ1j1a9r
         mEA943P2IJlbz/UYPTDY/jojCvjsi2bKwXRMeT55V4LQOOz9zM5Z+reWx3jwlO2gIuVu
         3qXA==
X-Forwarded-Encrypted: i=1; AFNElJ+at7Lt7SLnK99BAbMNrabLK7H64cg0EUdzc6HZ0pOrDj74HTnK0KHrx3Xadun9NQtrbuDUPiY2NWLEmZYb@vger.kernel.org
X-Gm-Message-State: AOJu0YztIBMFKWHeXB5Fu73TIV0MPGFhgTlRI65iYZYsMx6QOf7HfNUI
	iFI2mkkEKxBuJWR2Dx1wmQ7mswRb4M++WtgNvL91prp09xAKKoKR8q+idUFPL50/91+tlnO+vEi
	/8y3AeETgvOBeEmTje8tHoWRQTXHuiPT8NzSxXhxQ3cbXgThyDKJQhvbxjI/JjIyt8X1J
X-Gm-Gg: AfdE7clUE+UFYewBRMQiXUrRaXSyWZ9Ew+t/zfMPX7m60+HPBISQstmZlsZctI4wUVD
	U4NkW/iviZ9XSQ02pG6vkCWIIILANM+23FG1kdNqXuF7l6UNhKbt3RXJu9QRxss1PB3PIaX8rcS
	Bu5sKCCUyadhFubJfQCammmKPb7AbefkdymyMbKiYTyQjlNZKjxShgkoH3CaHCZk/DsnBKYkYKu
	QS1pfV/43u9zoar59tpTDQz3u/FM/BedEq1FElkmSwFRRk/D3QlKJ46QxYYmTNLwnQpfrpoTxvf
	SMTtlrcTF2KoYEindo/bvLoy3FM5NhL+Z7GSNZn9khjvXq8FoPpYKmlxRelYGK8z9PmTOQqdsr8
	GI7CZNiqWi7rJ98/WEr/pYf/V7iVAKMVERQLMastdl1kjiA==
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823243685a.55.1782335327092;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823235585a.55.1782335326522;
        Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
Date: Wed, 24 Jun 2026 23:08:24 +0200
Message-ID: <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX+tfdfsIxHzNw
 hnhrtrL+wG7hCyupl9PjU1IvjKbEZPLDjg2KfscaRS1gg38aIVudyUoLF87UF+mvZZGPbPh7vju
 ZPEOUk19S8HWqhjiOE89GwzP69Kw/s4=
X-Proofpoint-GUID: iHXzvfHuTk-KW4RUHLbWOlpMBkHccPxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXzv95SLN72sGW
 AQUVMJSsKuumDO4joz2K2Vt/MGzeYmx1xVdmmNy+GprMayAB9iwlY0QiC26jQIOh3QRwsQfuDIR
 3Q1TlS01SzL2hNUDEHTAadWqwXcVsApEAPX6JFbQPg1tEwI16CDFXdWiRdPIYNp5XfyKx+GrOSP
 bopYEHFcBfViiPjIUI3PkAcyFjGgO4IlbtFo/vjpcgICQDQ/xQjXdFiK5WdAzCcLoWW2xAL2Grl
 RZKC67Fs3zgNTXiW5cgve8Ye3AmW4I5l2yMYhU0h6/kk6A4HtqZfAylYsXSiBqGk+yxoUlVxe/4
 fQp/6QwBxoiAVmthum4A/XZ83C8iMu5Jlb+NywiVZAiINeUMnELR3wkhReDBddnrQAc/zzeMvJR
 /J0xmD194pz6pRSj1/CdK+81Hoc/cw==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c475f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ImW1d6Yn9UAQwwTZzW4A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iHXzvfHuTk-KW4RUHLbWOlpMBkHccPxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114426-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C88806C15A1

The EC generates thermal zone status change notifications for a subset
of the exposed temperature sensors. Wire these EC events to the hwmon
notification framework so userspace can be informed when a thermal alarm
state changes.

Associate each hwmon temperature channel with its corresponding EC
thermal event and emit hwmon_temp_alarm notifications through
hwmon_notify_event() when the EC reports a thermal zone status change.

Also register thermal zones in the hwmon chip capabilities and keep a
reference to the hwmon device to allow event propagation from the IRQ
handler.

This allows userspace monitoring tools to receive thermal alarm
updates without polling the sensors and gives the opportuniy to the
kernel to cool them down.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 66 ++++++++++++++-----
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 142464623f0e..276bb51da33a 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -107,10 +107,13 @@ struct t14s_ec_led_classdev {
 struct t14s_ec_hwmon_sys_thermx {
 	const char *label;
 	int reg;
+	u8 event;
 };
 
 struct t14s_ec_hwmon {
+	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+	size_t num_sys_thermx;
 };
 
 struct t14s_ec {
@@ -493,6 +496,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
+{
+	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
+		if (ec->ec_hwmon.sys_thermx[i].event != event)
+			continue;
+
+		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
+				   hwmon_temp_alarm, i);
+
+		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
+			ec->ec_hwmon.sys_thermx[i].label);
+	}
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -542,13 +559,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		dev_dbg(ec->dev, "LID closed\n");
 		break;
 	case T14S_EC_EVT_THERMAL_TZ40:
-		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ42:
-		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ39:
-		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		t14s_ec_hwmon_notify_event(ec, val);
 		break;
 	case T14S_EC_EVT_KEY_FN_G:
 		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
@@ -658,6 +671,7 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
@@ -676,14 +690,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ T14S_EC_SYS_THERM0, "soc" },
-		{ T14S_EC_SYS_THERM1, "keyboard" },
-		{ T14S_EC_SYS_THERM2, "base" },
-		{ T14S_EC_SYS_THERM3, "pmbm" },
-		{ T14S_EC_SYS_THERM6, "qtm" },
-		{ T14S_EC_SYS_THERM7, "ssd" },
+		{
+			.label = "soc",
+			.reg = T14S_EC_SYS_THERM0,
+			.event = T14S_EC_EVT_THERMAL_TZ39
+		},
+		{
+			.label = "keyboard",
+			.reg = T14S_EC_SYS_THERM1,
+			.event = T14S_EC_EVT_THERMAL_TZ40
+		},
+		{
+			.label = "base",
+			.reg = T14S_EC_SYS_THERM2,
+		},
+		{
+			.label = "pmbm",
+			.reg = T14S_EC_SYS_THERM3,
+			.event = T14S_EC_EVT_THERMAL_TZ42
+		},
+		{
+			.label = "qtm",
+			.reg = T14S_EC_SYS_THERM6
+		},
+		{
+			.label = "ssd",
+			.reg = T14S_EC_SYS_THERM7
+		},
 	};
 
 	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
@@ -692,10 +726,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 	if (!ec->ec_hwmon.sys_thermx)
 		return -ENOMEM;
 
-	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
-						   &t14s_ec_chip_info, NULL);
+	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);
+
+	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+								&t14s_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(dev);
+	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
 }
 
 static int t14s_ec_probe(struct i2c_client *client)
-- 
2.53.0


