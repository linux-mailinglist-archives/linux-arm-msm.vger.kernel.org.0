Return-Path: <linux-arm-msm+bounces-115647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZtmD/XtRGqS3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E416EC387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:37:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ef73pj4S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IxvbajwV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B6263030241
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0456426691;
	Wed,  1 Jul 2026 10:37:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D2423A97
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902246; cv=none; b=QCeHVlfQFN3ZWWxc1eAKIeTeVxn2SyW2aqv6nC/JtGB4D1V0tDHDVFtXcRo+1ZBh4la95WtfbVrHciJmH6CmJqwnvylP310SIK56Ti9FWHUH5oaViWjX+BZjMT0FoszC3/YU1ng7KUWo8qRwU1+Y6nf/oCJntcaLrjc9Of+P1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902246; c=relaxed/simple;
	bh=GY8/lSLJrWV6vudjyzgth2Koav1F2hxuL2KYZuGjkcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l73ZIxn7eFwReTbsEJwV730ZxveQLCCoLqC3wI7fYdF1vmhihf9Zc8yBR/KqL8Xh2com77NSKekcW4Zy+MEIfLMq+n285QDCYniDUu8Ln3SaG9UFtf1f92jlawCqknRoKICmnDINxh0AfGuS3QRGBp9uTuvGo1HF6sOpnNPPO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef73pj4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxvbajwV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hC8721644
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x9XckNnjIaL
	LOOJegY3jwlZqepfLceFjKldmtuVP3wU=; b=ef73pj4SxFBWEfZ0LhLT4rAk3L/
	ciunFVqHbGEy/o8VxdR42IILpPUoxZR7hn2IfQN+y0E7NIFk0T6bs83dI1ZISfLL
	86AamNxLZf08jtIiBzXRKgaIMQzwM2z49ilRjdiFQ25juTaWJm4ycbWaNA+88n58
	Tpe2KQL9Aflz+0MwIHULOYG1fz8cqpP0rfdwxqzGQ/iOv82ocYBkSRJh2l7aXyrf
	OXIBp8rk8N6pEyVOzorKZ79AuXfe2IuGbEN0D+KC9fXRnWS2tmJ0IKDUzSOvfmGp
	aC8myIiakey9sYQbyEBzSTcqaIvhqNysXRpg1NhNh/pXO40iNxXCS1eAnPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbjsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so49986585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902239; x=1783507039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=IxvbajwVsC6ZQA0c2IS9gwFLBoZGLCeZeNK98J9cpvh2F1vlCauwOfwY15MMtlMOZd
         W6TdC4+6iUCcMLvXNK2jjGaWlzyWpL6q9Da1FfS22OYgKhTOCxSCRrOlhIXOPRfn/taP
         qycj2R9SeUvI9XSveuTj7HM0MjcQR7OCxM+fMMb0k7S4MV2cZLhxUFkvGkZK4T9oZ036
         SCLOKMkB5sQz0/DHMJS9oZUdpOzbIo9tw+ClH7rhsEbadHF8dxQNIQPVT0Hn+kkEF/Td
         coQFe9EVXP+1/W67AtOTbwOXEY7tJHkPN3LdBjlbjcDLF4xWUyFrkYad9YXUegl0eC9D
         iNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902239; x=1783507039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9XckNnjIaLLOOJegY3jwlZqepfLceFjKldmtuVP3wU=;
        b=BM1t2dXAca3NgxOLnHGSI6seumP2q1qzxjceLH/ksIk47QeR7Nr8YBa3cUGYgdJCeS
         AZpxmJOQFoYuoOoV9FE9ascmcmCWre5a1f/+tuPOZs6QQ27KAbG2iEYcQbJK3A2rUYCA
         gjc5QnBVe9FX3OOCxJAiw6PWJi3tSd+ScrvjlVVRTtXmBLO0RHG+4dCmpfhO5bmI1uss
         k/B8iPJq28W+ZBqB+Frkpd+4XqyyszCDdWO/j3ladRqvEr0dAp61mcuVN7RnOpht3aNV
         kKnNWHidRiOE+8WjVPtrLlm22e5SGI8SQinlM8tAxU0KDnT0XtKfR7RS68oKuWZUGEAn
         FPvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g9yD84z4HXTlIAomMx8k/Dmcj4EEhBLiV5y4HeaToygXp3XmdOBphogvBfMlcEqfOh4uX8oRC6rpB127V@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhAZTxfg7iZVIdaxp1gPjNEqOndxw24AXVcRNiodv6tmiWo9/
	gJpin89lfX293QBWY1q7Pj6V9TlrJEa8WNtWTATjK7VFnd2a+qlEIzD1yUIpGdc3tD5L3vs2Oas
	FcaUDJNzYb7hvplRXlTLieRhVIcv4bYMf6DErr+Fj0clWFeyZsZjXY40COPw6oq+KfzQg
X-Gm-Gg: AfdE7clrWstQSeY8vcXx70Ara1jdH3LOlaQRe8ryGPHy/hsyo3rV8W3LflIEy8rdZfx
	WtZfml/BxpTWjlEfRkks2HFH+CVR7L7uGGrhGDTy+N4CUv5Na5l9p0lfg6+xWI4ksIqNmchgBx8
	5lcSVDyvlOixbhMOzfGA2ijEFhu5pKQqfn1vdfzZ9+DKr6/SMpOBmsC3LN2yMVF8skXjQvdDxAi
	AuUydzK+bIX7xg24G8M3I01Zgd0bEYYmuzqBYjT21Lti4Y73mrzf32MefedrIy7RXlGptywIjBH
	WpeV8K2rT+QsWyTHKqjoc4LqMel3uiCTS0hd5rgWBnv2OV6gcyl/pusdHgiXJh/dQZv3JfQWtTN
	pCIGjZSFCSdjmpks17qGAgnJvToDci7KV0Vl4kzswigQ=
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132129985a.46.1782902239187;
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:92c:44c3:34d0 with SMTP id af79cd13be357-92e784cdcb4mr132127085a.46.1782902238806;
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Wed,  1 Jul 2026 12:37:10 +0200
Message-ID: <20260701103714.22583-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: th1sDTLCSIiHp3gJv-y7tKWc-yGfPdgU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXxBXK8zaohXK3
 myK7JJa+RDjrwuPbbdWmvBLXbu2kfYqKIKLNk1L7PUxRg25By93oTzkq/bfTIBbMJrZKmZNMb3c
 DMOdGOuKxCxjbSwo3779FOZS/MH32as=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44eddf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=O3gN3AO8kzc7p6n7zlUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: th1sDTLCSIiHp3gJv-y7tKWc-yGfPdgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX0gT/44Uco1Py
 baMdd5G5cnGNq+n4iCE1bXxXU7S71YEIqHseLLryxI/nGM42qwUz/3a2X05OOkzoq6USHMx0M2z
 l+X0FyZuLDGRqeCzzEF91hzl399ivgKTDkTOGMb57m43L5PTCVXaPKSgc6q8Fn4Gova1QiXGzjP
 Hwc9D0bJl882Ykn3kmrBtlMu28O/fXC9W11oz/lfLIcOIi9gysNfwirtxGBeieLJdfx/OaO0Mwa
 RdkSQYwni+Grr2EflRCLgIOdT1GHOD6/Q7PknZgLaPCsM4gCMjYE4cNkBCYAPt8AWzd/+XQ9atI
 91Jr23KWEP6N/XitKWpSIIUj5lzB91cV3cM/Um/GwGGnmNe8Wsj086aKKdmptA6XekuILgCFb5L
 1s26jlavvjyPBimcfykSpVn+krrQg5+KhA1tT960E59gcPR+TVSd80vKaeWA7A8f5E2tTAl/iGN
 WSzhZYIhGQ7ufcQwpBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115647-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9E416EC387

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..c9917a1d2bd7 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -21,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/units.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
@@ -67,6 +69,13 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_hwmon_sys_thermx {
+	const char *label;
+	int reg;
+};
+
+struct t14s_ec_hwmon {
+	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_hwmon ec_hwmon;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -555,6 +574,113 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input ||
+		    attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = ec->ec_hwmon.sys_thermx[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
+			if (ret)
+				return ret;
+			*val = value * MILLIDEGREE_PER_DEGREE;
+
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops t14s_ec_hwmon_ops = {
+	.is_visible = t14s_ec_hwmon_is_visible,
+	.read = t14s_ec_hwmon_read,
+	.read_string = t14s_ec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info t14s_ec_chip_info = {
+	.ops = &t14s_ec_hwmon_ops,
+	.info = t14s_ec_hwmon_info,
+};
+
+static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
+{
+	struct device *dev;
+	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
+		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
+		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
+		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
+		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
+		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
+		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+	};
+
+	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
+						     ARRAY_SIZE(sys_thermx),
+						     sizeof(sys_thermx[0]), GFP_KERNEL);
+	if (!ec->ec_hwmon.sys_thermx)
+		return -ENOMEM;
+
+	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+						   &t14s_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
 static int t14s_ec_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -590,6 +716,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_ec_hwmon_probe(ec);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0


