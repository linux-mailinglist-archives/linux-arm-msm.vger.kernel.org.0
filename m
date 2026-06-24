Return-Path: <linux-arm-msm+bounces-114425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2RduIG5HPGpjmAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:09:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392896C15AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sm5HRmGO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e/z01eg5";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114425-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114425-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E050A301A427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A3B3E5EC5;
	Wed, 24 Jun 2026 21:08:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5ED3E5A17
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335331; cv=none; b=fuPUKfDci/TgUOvwCxK96VlXgHEMx9bwFm3KaGG19uBCIUCU3rEypd6/ZxHlT8e2aN+QY/fu/XgLuO6Nas9jIWvBbRdA84OQhl9vlg98mW58QHQjt80ac1Yvq6RZbFA1ZXM4m0Lkbc5HT1ZrlsVDgsrkFKvbwjNiIYLE4+2PH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335331; c=relaxed/simple;
	bh=YN71vB5TNvRZHNOUlfHwKLfcZQHkRE2nTU84RRDUJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdO+NctWnDb+tEwe8qwKWUkp12H521BKwn8hfWTezi6mlSz86VsXx3K0y334z8XUeXA13p09BCm5sIqWM++tfH0EpXqCXc7xwTSe0Yy65cfeYijmDoG8HIBnF1Mb0GFM4xbP1LVkMcKB8fc+GGpGr3WhknQ8Uqru5c4sw2mRmcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sm5HRmGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/z01eg5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjYCa184861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmF4GeGvvM9
	dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=; b=Sm5HRmGO3Wd4QvIQg4PnF1BhJX3
	em6knUfynpQpkS2Dxg9GaKZiBzf/2box3qk4/5DnEtE1FwArbitrRfKd+06dy4qG
	Qlen68Z+xDCDFAfp2vt00Mly07VRk2ZyOsAGokkhAtJHsnIPuucKIUGn0plDPKHf
	MSixofy/Ytw0B7vYXCS7SsCKvMUJ4kl46IAovNBPbJS5g3+Iyox/V+BRvYK3gjTM
	IKn2kq3usAzCvNcpbXBHaP01Kxh1tDY4332/jla034uZoIut2iyV33Y8DXgL6w7k
	tRNrvBbnkje7O04zUf4kFJRFQKHzWbSZB1UsWvqpKUlhfCwaToWcwvsCEYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajm927-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91579011fd1so184236285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335326; x=1782940126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=e/z01eg5zc5CeXeuccvQqumZGlb6/ZHUnm7Ua7o4Xx6YqSZG9LLT+07+ZS0jMR4q6w
         IpMcTH6t/eKM1n7g7vqVUmGdB1jQejHHRZLklxYGtJdK1bq34oKTqVRJBO81imVsg3gP
         Dm5oiwXsGG4ag0ajP58iJQP6+MhK2Esx3RyYWjhK6a69J68BLBEDHJawgywKvZ4w33iS
         FEWht4ceM7H+SvYdmt3rIc7M9fFC58xhXcVWqmJows61EMrGVy9z5+Hm9TxqhIIKRDSR
         Ghn07X9y25NhLNv6SYtFUYF9Fmaf65hGGcn5n7TIy+J3Z5bl5TQY/lFHxa/JUenRs24D
         WOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335326; x=1782940126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmF4GeGvvM9dJdB+Z7GNN+bPdXgJkQupqVRBWjz1QFM=;
        b=TY8lV43DVLT0dprKSwqeN636BKWeQ4cLgmt/S7i8e4XjNEwYQPoOdHJe+7KFfTCoSc
         urCeR5frIoshd0oZj0kqqJqLN2gf8TwYB2HQbiupzaUK9a6UAHIVyASxrAz8xZvxwYi4
         sGXrQ3RlaoFlhBHwHTZUrPYPjN5qMimHc5iB6uY3EtQfkwJ7Qkt72pR7ZNDtFJ+p1e7H
         qLRFdeCt/PVxaghi569aQ8blqBARB3BuRYFE5dfnw7S+VOJJiNyAurgubqIhQWfHPlp1
         +rFTCuc2P89UTNNyESdY1Tupl9tkQX0IKLXjx2yMZTYy8wSQRb/W3R2oa3eP9gaEiRkC
         qRbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k4s0ctw49DaYbJnNd3Du4UKQPfNRUW8f0M/vDPngwHm7tVW68hYDB0s6HRnWh+HebbnTqOYue7qGuYt8s@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIRIK8bg6pAmtTc53G9nZC3z0j2BwWzKzt3+J4OLgJdKQELzD
	jskilT11F+KM+/nE62PWJ1+7hI7VFlBKOT5Phel7K95/5cPACsOl1fTq7rpq0gnJ/1tZednymfH
	YeRG+ZJwLzUyydS5Id+G/pDwzbNOyXBL6gznqBmfmHaT4b4xSv0HiAAx2POwijAD5jCbW
X-Gm-Gg: AfdE7cnncFICH4vXXZe2OY+kEOCdqse/rS0LU8yQcwzFq16HhrcZLs2Ib/SgOpXc+M6
	IiOF07pveH4MlC6NVsPDoAAM4t4CkizAf+SdAPMKpw0I2YmDEfy71N+1gEb8iF5ygcfFu59wUKp
	TS7YUzniust3bqFiAg2xeMNX8Zt06gKvMvqAyWeDg36KSgvqlWB3jnVIosc/NlZr5q3AQ2Vlrtu
	gmUMVPHtt+/YJznDf2gZr07sNRzf+u0tRopc0De2+2gmox5aP+SxNgdA0pia9p/rGADCZoRaqK9
	X9pdiQTI1PTJhALvTds0sOgQHrPGPwrCT0on4iOp7iKeBWTNrmbkbkHUzaw5Lrm+v99RKLs3WBn
	dwEOqV3PLCaxfrUOMjEY6ejaGd3ger4N0XnWVl/g9OwDCEg==
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815922485a.10.1782335325668;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:915:9273:9237 with SMTP id af79cd13be357-92781340d3fmr815914585a.10.1782335325054;
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures and fan speed
Date: Wed, 24 Jun 2026 23:08:23 +0200
Message-ID: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX6CGnHNTahKpt
 Ft+aBqp88YfpY2vzjZP29NACs1/XWWGKMhlLJ1/QTjwk7fsx7WFFPB51n2C9O2rLDqr6haI8O/n
 VbFwxpzmHjasvY4JFHL+wCF83Pkf3gs=
X-Proofpoint-GUID: ZBo6g8iMKds2-D6kFtjxMHjeTWvjJ5Tt
X-Proofpoint-ORIG-GUID: ZBo6g8iMKds2-D6kFtjxMHjeTWvjJ5Tt
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c475e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=dabdHXUdFSiLoprLzZ8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXw0EIU62RgeDm
 j1xEGrK5NKintaA2mEPgKlvxSiiN5F8cBBBUxeKz0Gq6a5/oQ7ziuYRQwGQRCf4NG+/1CWwEvxm
 DIT7CxzRTqV4Of7MHi43OaifkyMSM5b8C+rhTS0pYv8lF+PVfPxfgpP/TJ6Mqq1B/AXISAaN8sX
 KYNFwgGDHgCP3z/jN7EjNHqDpgRni9iuMspgSPO3Ok4etURATkbjnco7PpT/jH0LaAju9bMx3VM
 8pDE3jPsDv+QoEe+kfkSLH6aNwaBMTidPSEMpYIks+2tgPHmyU97BC2AB15UmWKzeBVaDH3tSWx
 mZOCyIUQZnTWwCS69cQwxIhSMw7K77+UfXVHJSJgMd8xVjTqLk2Cy7YCC/wcTQPBJFL6Nqes4Zx
 gJt9qiHfQdh9CgjgEF7wzwwouODRJTdryBAkYIpG2C9PgQljowHP5y4bMlPj8WLjHjiZlUX4/Hu
 CaBxxgCAjK7s4ZuQ3RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177
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
	TAGGED_FROM(0.00)[bounces-114425-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 392896C15AE

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

Additionally, expose the system fan speed by reading the fan RPM
registers from the embedded controller.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures and fan speed.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..142464623f0e 100644
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
@@ -67,6 +68,16 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
+#define T14S_EC_FAN_RPM_LSB 0x84
+#define T14S_EC_FAN_RPM_MSB 0x85
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +104,19 @@ struct t14s_ec_led_classdev {
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
@@ -555,6 +576,128 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		return 0444;
+	case hwmon_fan:
+		return 0444;
+	default:
+		return 0;
+	}
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
+
+	case hwmon_fan:
+		if (attr == hwmon_fan_input) {
+			int lsb, msb;
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
+			if (ret)
+				return ret;
+
+			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
+			if (ret)
+				return ret;
+
+			*val = 0;
+			*val = lsb + (msb << 8);
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
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
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
+		{ T14S_EC_SYS_THERM0, "soc" },
+		{ T14S_EC_SYS_THERM1, "keyboard" },
+		{ T14S_EC_SYS_THERM2, "base" },
+		{ T14S_EC_SYS_THERM3, "pmbm" },
+		{ T14S_EC_SYS_THERM6, "qtm" },
+		{ T14S_EC_SYS_THERM7, "ssd" },
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
@@ -590,6 +733,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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


