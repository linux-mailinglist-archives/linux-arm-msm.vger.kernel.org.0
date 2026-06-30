Return-Path: <linux-arm-msm+bounces-115477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BEjNF3XYQ2o3kAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:53:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 171186E5985
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AUjjhW19;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I5XMOr6s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2164B304D9E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4433243D4FB;
	Tue, 30 Jun 2026 14:53:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711E43D4EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831214; cv=none; b=BacNQUS1HhLg0uQDvYAQpA8Z9Ku4mTP0WGfx+6hS13BclmP35Yvus/4zMsCrFSIXeJVQiGTnFWaOtFFu9SOKzOn+HBJmeFlSCQApgyChxwr5cGqsOM9oedT12vAefMW4NAp44GNRcA2TcdWMzCq/zRtKWdAF7m4mRofJziliIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831214; c=relaxed/simple;
	bh=NAFP7AGI0HJJDLXIlHQALnKegJJVET1BmZIEvZTydms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPnCtiOqRblfBidcUOq2u9pF5ydFpdjeZe9aFv/eJOGRbYN/7kQDCVCnRnBxR908KetI7GKB58FmY9ZVLPWhiFnZMEAGKW8GhPDFIvf55adYTaWjKw5HyywFB/5+NdW8ct/10qRVBubwlm1DlYVIbyu8XYEaXRa3bLs+6wxG47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUjjhW19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5XMOr6s; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDMvY2214631
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=32HxaGZspUT
	u+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=; b=AUjjhW19bZghgO4GnBES1GVqT3l
	voMANGu3RlNZlu4TQsD3R7KgKYQ0rAQH6cZWs+CpFtBgeUf/j3QApxm9+ow1m7BZ
	AWPwBhkcSxhNSqRBz4pBQnW/pOfEDlqM/PalIML98773F8+k3aEN7H76m5Ggac1Z
	FteVLXtj1lke2YVB4tt51OrUcFnFFwQmNf+UqBvOCtKuzlPIfkEg+ZX5iQtqaoQn
	IQ8dQm2QppW+CsUJ6TnE+28yYY6yhgWSGTAmYSLPl0CGmJY1zdf9QERfobVtLH4z
	XexXcnsfmW7OJH19oa98YD5VdorD+Nhfwi60Lmya3AhD9+S5XIFIvQoHXrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5txtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so559730385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831209; x=1783436009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32HxaGZspUTu+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=;
        b=I5XMOr6saB9Wc8EVzK4IBuPl/vQ0c5IXe6xd4bzNuw1vrKy56O/qHgvt64HCysXB6w
         mt+Un92vwJygOnWP0Nbl7DGFKGn4DuFqWRZNPXD09MBbrmqU96NGHbZ/J3f63p2SKuFC
         EvUFKKHuhsl+HrRBblxdgOZj0xpBuhjecpqLPqsIBX1Q2O6LQwRMgVhpm2NF1Fhg10x5
         grIBTTCvUCRl2YPkGcBq00KDuMJFTyELsmlb04+d2b3ATGfzOgFT1zfwbmp5ZDwwDGlf
         GoYgUJzsDwqL/L2DEnooYHCV3qWSD9TYv5n5HEKbhtXxnBDdoeS79APcUNYTB5QTxmPe
         Yqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831209; x=1783436009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32HxaGZspUTu+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=;
        b=H9ku1LvNuPLvDK6Z3/qTgDpSjxFcuTVQl4nNRX0UuprWh8CuV5mcsGjNBEbeOHmXTP
         uxokQ4c2r6wn24j9RrZg0KOnXo9BwYcvFBI+34CY9xK5NH07Dfif9Jpd+i9Wu0l+o1F5
         OYs7OPnAtGAGjAg7Wy3804wMqt06+gFvVUZN3iGlTuNPOqzWJ3tIq7QACFCIY5R2oUkZ
         eDY6E1yJ+wBmHdjPxc9qVvAYdGk/kvNY7qUchcO35/m2vbSKbgT3nfWCu7KPJEMihr+Q
         Rpbbz3H2InOTZv2qgKKp57HNR2+yxzjeXBxBd7IEzwVmv3Sf07+WcAzUti0WmDSD7PuN
         xVTw==
X-Forwarded-Encrypted: i=1; AFNElJ98T9ZgVvPs0SRgeyt6+a/tBtChPrRoRsTH+eAQ7ZyFK9Yc7jkXLwHxkHVXdyLY8XspUENA9HHJfmUhQBIN@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2LUZnZYj1d9HCZGYCHHhKBZSnGLmUi34W0xcVpTwML+snK7F
	2BPE0OxdYrSYAAGQJhKhTFblAo9wJVOZ5GWL2g2y+G42cqyvWLgebXOkXUiWWs0l/odTvXqjXtr
	9mIFdD8PTRZMBL0K5VNK+wjuyGe1w9kSfCchartAMp2WOosg7gV0GbgTd2im5/TWID0i1bExuPX
	Log0c=
X-Gm-Gg: AfdE7cm1mv316F8zHr2IH1ekxBEnsqq2E1/uMOGiRg2UggDXWO0M/CHWySAc9IipsWp
	IQ9fU0s6k7ri9WMLS3vSu3R9D+Bi3x0n51roP1hMCY3beJHJFWwk9cbve+NaSbLajPCncDaxrO6
	wa2BZzQByDA3Mnwro/TrMfaTORnAGJZBNvJw43vHDt4hvRNbpoS6eeMnqlbgksgfpD89RIiSM20
	VLPZmVmTvM2Ra0aHgJzk6h+GfSv0tHGYI+hy8s/ZucMHzwL5LFcTVlQSGer95TzTc3cH7+YIy0z
	DhZpSbSetr/FC3ZG2RMDa0K8Dfnhd/O3JUSjXNIFjK5o6IVrtPJ1wewZTqhuW8idJWUAzfoRZjI
	U0PAaZnO7haxojEchgGWkAvv/fhDhBihn6keulhQmmMdg7g==
X-Received: by 2002:a05:620a:2a05:b0:92b:6805:91b9 with SMTP id af79cd13be357-92e6d8c33bcmr163008085a.65.1782831208771;
        Tue, 30 Jun 2026 07:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:92b:6805:91b9 with SMTP id af79cd13be357-92e6d8c33bcmr163003085a.65.1782831208124;
        Tue, 30 Jun 2026 07:53:28 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] platform: arm64:: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Tue, 30 Jun 2026 16:53:05 +0200
Message-ID: <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43d869 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=dabdHXUdFSiLoprLzZ8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MSeSAlrzOvGlMPXGdDr8GvegbbaCjHCx
X-Proofpoint-ORIG-GUID: MSeSAlrzOvGlMPXGdDr8GvegbbaCjHCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX3euw/jXiUxQs
 l0Eszz4Mi+ykrNx7dUhc6oYa0NvvIVg/xvOz83kU0U9eaD7w0z6yB7gigiZZvBpLsL3tTqw4644
 OXpmE5JbJTF2CaOFBSVAys6leUAQY3h7R/FGVGBv448L20U7GBtZkn1gQ8bAu8IPkgajoehPlAe
 7g3g3DfzLN0pWXn0wFa8cvkh43vAOLjaUI6CbjG49/irhTLwbn77HfStyv4VqJcCZeYgi0iPGIU
 SgHH05bW4JXA9vhjNgTogI2afhALf0lUA9yBF0EeYfKqjYB3x2uTPjjHQIpTvqoJWc0yoVzrau8
 X+cWppNMEzSs13wCJ/rNqZQ3mXZQ96fR3lQ7S36y9t6/quTcdsgOrFS8FoEjMwrYSYV5pg+rfFG
 fAPw1jNNT1HVpzdnvyrRiMGhdGxKltarguqD8pT2x5NOoIu5gJbf/ebQl3YQp1BFjkiiIZ/R9Qw
 cqzkoYNH6If0V7XkNmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+Uotz+fASHXq
 cwn+U7Kn66WWc0ZfMA93yCfQknPJ3Y2fTiKk2Pvt7o5kU79UvnqJkBL/O3OmfTzDCAasBClj//6
 w6c43NQiOqqydcdGNgt4Nac3AeLPt8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115477-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 171186E5985

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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..35a6f8b0cb6b 100644
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
@@ -67,6 +68,13 @@
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
 
@@ -93,9 +101,19 @@ struct t14s_ec_led_classdev {
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
@@ -555,6 +573,112 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
+			*val = value * 1000;
+
+			return 0;
+		}
+		break;
+	default:
+		break;
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
@@ -590,6 +714,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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


