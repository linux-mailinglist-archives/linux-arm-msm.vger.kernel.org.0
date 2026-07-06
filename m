Return-Path: <linux-arm-msm+bounces-117011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yohDJK4JTGrAfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:01:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCE7153BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iIyO2zBs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UmrBZyAt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BFB4325FF96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4983AEF46;
	Mon,  6 Jul 2026 18:47:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151F38886B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:47:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363642; cv=none; b=tHllMGIUnEdvaSXL9Q0qhKuD2Ja0bKpt9s7GStQqfyE1ux90e7CXPrx2LWnLTUgP70TWY2UNAXa71fygEu1K9wbDF7JqcdcGWBqJPdyORh8W6YZvBCs0/4nrcLMUK/cKIc2KdtPSXsww2Ojg/hCY5WL+SMLnazk1Aw5oDP7dXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363642; c=relaxed/simple;
	bh=XuDp4kjrw2H2fUuAHg/ju4C6RQwwi7eFtM44uQ+mQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5AT8glUzYZD2XIv1bhOzlbg/UqzvKQp2Tfj0cUhRe9JSiiZKrR/q7U5EPcqZjWh0sS1AcJ9UXXX2XZM3+uiYNPN1n8jEbFcZ53/fQzzoPuUfC8aMVSyZ1/BqE2hNdwE2yTgJ9MyT4OzxoTXF2b+GpdfuW4/QjBX/mIBxNisrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIyO2zBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmrBZyAt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHbK972549
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=; b=iIyO2zBsGUILNrc8
	U+zsszSvlCo2x43np3cPiD29bktjqmzhwbaOcuZusb8KrqWo2bjvSotaVMYBtfoc
	bMynGcj3dh/AX0oVLkVt/fo08EKj66f80xrqqvghTBFsLAQv6jdQ9evCnxJ+tazz
	syrYTk6AnePC+gViZgVX30TH+T8cHCjs03yFyqbtFqBqvkTHfQU4M2Tgv8hnwTHE
	ptyjqkXQBtYQHLPcfLLujqARo8+bUoapr9OIF76vvAsrqcUQ+0/KFqNkrx7iPReC
	IAsRuPcP0JUkT2MPuIT9RhbN4TyFihIV2MizeruoRFrkk97PtrEhfDEdzHNEXC4c
	hpGyPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2c3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:47:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso266145485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363635; x=1783968435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=;
        b=UmrBZyAtG+E8EF8tCYu5gHKhtyL/enipx7q3iGhkp9OSU8zL7tdxOwfA9cUzm2Bp2x
         v9KW/s9QtHSGMGFusvCbjGLtbg1qY6sfUhOW+YQvWDibVW6n54K+quRBhaTJDMwzb4vk
         alPnprIdRj/DjecZzy9MaLxgP9oPkh6WPQTUTz9ffCbPnIh2mdFk6BgyZGdR4PBwHNrE
         Vu1K7WHyeTWoHGkpjEoBU5h4fCoaCWrJqZ4jc/pjY2icU2U5OPC6KXqsjv3sNl/ytbVD
         1LCypyqBUwHSBl1MoDhFPCXmRWyoWVRuxiWFHOpkyDAklMcXRk500Gczr23enFufiyjd
         DVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363635; x=1783968435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=;
        b=BwSIJ9Iiojx9m7PYk7gyNWCKA0JLzvaItetUNITk2aMgGZfuPGXadNdKxvXJaAA7hI
         wspVdHUzeiZCx/JLGNdXaGN0Kqdg19yO6b3VD8d8P3j3ALd+L6aFw3+9EmJtm2jdHHV+
         oavJ3MTsGS0yHvNlx3CS0XrSXJ+vfTx1ICcnk7AvmPRDyrF1RWtmJPos6a1H+7k6jM/N
         tCWeK2pmJS48ZwP4h3K7TY8qu51hjhFRB838SXH0VGmKCFsGe4pXeXOVl+xLVp8mHaGR
         G/mHXhFvDMQH8LpOF2uKajp22qaZq3H6rcmN7lrfvzbWARRPH2K4NqeEdR2pQFYtY/yz
         sxgg==
X-Forwarded-Encrypted: i=1; AHgh+RrXXSfQ3RuNOi9YX1ZUvcT0ZYhrT0fkSjEGweq5lGHffODRCBXqDp8g7wXqN9/TmtM1vdSZ0ZH9sqdQxY3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWjkrUm9w+ogBMXKd/4P90G8hnD6xXt4kAifDnmq+TPVG9QHL
	KJWQTUPppZs6YikfviAYlt0ZMooJyj0yTfVkddLOAB0MEj3DdpV9qDSzFCd8DcuAAkpeIDux02w
	jwh1u2mvfRpm70j2M75c0nZ06ljZ4eH6kJD/tex8jRclC5zi0754ynGyuolOyPa6ozZ7x
X-Gm-Gg: AfdE7clEv/VJ0L75XPTr8BcVPWqhqD0Sjn6jN4H3sm8LZiZ5vhYRbT07+IHx5MQaXE4
	yAFZk0ZIndzGx2cVCXn6ixN8kglIzznLTPiQGiJzsOhpM5vK3tIPjV0v2DyhfBEDaUezP3FzEvj
	SI/fTgjRo5z8okdEiEkqLF9mVWrWh6OBWLKbPPf2tBuYbVrt7XJi9RtdK/yD+w6gKoOS5Awe1Ut
	N/AP5/Jz0l7SobJnIw35cXEyRvsh/ZrlFDttR3ig8z7FBn0RvzY19/mtoC4OxDbcsb9t6sW8zI+
	lhddgZrN78J4fwhzKqvFPQIVUpSZ9DvOj+FOiv/hNwLJMdA99Epix7MNTTk4NRbD+HEvXTGC2I+
	Bmprz15vBtDC0ilua4j7UnQ315bEVejeOfyvrzjeMJjNKIQ==
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr250100285a.18.1783363635380;
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr250094885a.18.1783363634763;
        Mon, 06 Jul 2026 11:47:14 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:13 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Mon,  6 Jul 2026 20:46:47 +0200
Message-ID: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX1IBZyxW5LfTD
 mT4U9gRKQDqhdgQl2D4K0KydbYgdjq6I2y1Qg+MpRsl8abX+0drY9XO1oRkCf5e0YQcZKL2ImKJ
 wi4Xf33EDxJhCJb/6sq7ZEETaHMDCm8O9ju1VZfJxZ88ONSqPJE8lpi3Y1g3D9sxx3VtKA4ouFl
 G829HjUVkNDyewdV8JPvEd3/DrZopl6ODLzmbFVG98Puesv8SWGWhnKBJYVql2HYzug763LTXGK
 NZzeRsHcIZr/Am76oqTC8i/i5U3gTjB4AUwMQFGrBpjvvwf8JP+YLhgExsJ+Lzgz94NSu+caPln
 PPXD1WC6lowiibQm3RBfCmVpjobvsnSuD3HUKbScgLKnoBhwv/PJMM5PmuR/JAecCH4JNdqA83n
 35lGKQMNcRe9n6zuUiz3gx71FqXe2cotXnZzDCrAk83VsjsNE3FhL+7RdZkDQpB9T+TTjpur3Ai
 iHrelAFQWNipjJQCM5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX1dFylrDiQUHl
 mFNaFUZCnLu4snjci8B7UPff8qtTNsx+KgHhSHPQcCV0Q8vet8DWzaznlQ5Sa4rM9FP+GdsNd0T
 3MHD3mRctxlACXVvwUC/YnLfgzqBvz4=
X-Proofpoint-GUID: pn1WRDovU74CfG_yB_O5rK_6QVG5ni09
X-Proofpoint-ORIG-GUID: pn1WRDovU74CfG_yB_O5rK_6QVG5ni09
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bf833 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9Fj74KSAFJAma6AI3IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117011-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,intel.com:email,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DDCE7153BF

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..121043348740 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on INPUT
+	depends on HWMON
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..fc480f093238 100644
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
@@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
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
@@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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


