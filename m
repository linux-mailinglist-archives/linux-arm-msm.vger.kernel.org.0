Return-Path: <linux-arm-msm+bounces-91968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOsaDY0IhWmj7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956DF7853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5325E3039EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 21:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAF833066B;
	Thu,  5 Feb 2026 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfe/LBma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1E7sxEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9F33030C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326108; cv=none; b=rmsQt2mDwUdXnIguDeOnhbtt1pu5IhMD8DhuBhLMQu/3y1OEB4eUJseRTd/6oOfZ66X6keqa7AZfpX71DTUFsxGIv6YPUP0pnmem07op06Z+D5sXwm9D2sNNCYbREpOS388HvDscUZO9BTrzfLTMRpgKOzWjusG3KyXdGSPf5e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326108; c=relaxed/simple;
	bh=zP1b3A7r8K4fjd9QZoy8Gj4YDIq0hNJ5epT2edh3adU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cac/Unx1k8PFbBTFu7rTaL7cbPOK2K98c0fFzGGRzVehWixy6PuOSjtvKqFwfR17GcnWwNOOvntP9PRjRdVM72WGGDVPYzG9nkJFCXLx9k+MZ6KPNYSfM4qYYyfThPomn1Cgsle/82VjVSudZdBs0Dy+LySLCUtMXIXHMmz8wSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfe/LBma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1E7sxEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615IEU6L571651
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 21:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v+a0W2W1SfoOLvFfy/b4oUPilp7WeUSZR2M4u93u1A=; b=Xfe/LBmaDpDC1X5E
	g3HdSxWmgcz/cv/d9UoSrHTRaribwJ56g9sPkUhKKRPjClfxqoXeTt0DJbk9/Gh8
	t/9eUntKrtl/OIwJ6AbQomI6JPSlM8C1UsX/W7Xb/Po3lmHOmhB4L50ndMaSpSib
	W8cHkmoXrlrPzM9yWmWPdFDnc7dOGaGb8asA1W5QZmhTGMRT/IhIUH5iTM2XjHSQ
	WkZGHLmQbmhC6d0QOPsRSdbSAOw9MxtJK1gbICKdT/7YI4D3gorHr4aFrnDuFl4+
	0nEFo7AuQW3yvIvkVEhlKqkVLKv5FHA+W6Tu8SkhPIl+By1SVXy0XXgoZb+C3xeV
	cl57Zw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a98hsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 21:15:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352e214cce9so1018028a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326106; x=1770930906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v+a0W2W1SfoOLvFfy/b4oUPilp7WeUSZR2M4u93u1A=;
        b=J1E7sxEc63Qejrcfy0AZu/A9S9Pc181/1TE1MT7AkJkpr/TQu2LZOcnHOwwoBVz4+k
         YIUXIsNPFcB1uSrxVHMr31YUHcGMy6A9NKJrZwwHD6uCvYa4qixXlDgvwJspNYEQaGve
         5xNuOC4ynP6cU4AtPNBUQUDKcLzL+ZR4QrF35m5g5DHdn6FdYi1C7puFTWd8ncbDu03P
         0GnkbSz3awg1HXapngPJDa98RmM/x+LEfPB9jErbXoY/bLyeut5V51mF6IsTL0HcSnGv
         FTA0iSoZT2UK7N3AMpRYKZhjRDnA1MrYiDe75Cf+cULtoVQlFp3FXGsbUKP5tKsf5Whm
         6tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326106; x=1770930906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+v+a0W2W1SfoOLvFfy/b4oUPilp7WeUSZR2M4u93u1A=;
        b=ZTf4XtsKVzuYG/twBF27HPqmUFPnZ/6zjfaWINamLF71xbU7OU/N9zDwH75Ucp5bGJ
         z7Q+Q2rq2pqbSazsVfsT4sin5mSsChI5rgA5iPhHjC1orronH2exrh57V4Y4XJztwc+U
         AIX4NHGs1An1rBf8pvOURPgtp4MoaN9Aa2Ih9GLet/8TnOUdKFKu16JIzp6T9mOYfKkR
         a6bZ7zc6WIyT4IgITJ0s0LfdZN599FtAlyIN20YSAmMz06YC3jYjMOcW5pChpU6z1FUn
         rDTAJoSW2w/WgOs7eMPZhWHIFXgiOyMVsHSyY5HtY0lIoGAAncaGCIqpD0R1s7lOcrbQ
         +rIw==
X-Forwarded-Encrypted: i=1; AJvYcCVLl+FlJoPtdiLZivvje5bDBAV+nEL95JEUq1+LlWuyU1FM+HFkS/zrf3+BIIzWRnDeq20G8jEsnIBeEuZn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6ZCeGCmlf33SwQT76k8kRCwgFcsFj5RmKsA8TNtwKF/cxEkh
	aEJgHWJk5JOzEXyLHYB5N4os3fu7PwvApVD6x+IVSkOFqYgqn4dsCguPcSxwrnU3da5qMuc6+t1
	4aJwfVTZUAsjfLGsFf75QLbwg50FYzdjY1bl9Y6A6SIyj0lMGYzhlHV3d/okzO19s+JMPSeRNiW
	gC
X-Gm-Gg: AZuq6aKRpKC+Qx4GFBBHyRJdiuMqR0WIqCHStEA1kup8o+FLuZOctu8pGeOZ64xes2/
	/02ijLl3HD1bqlIvRYvQtP/hD6FrphVzZvVhwTAaCrrGnwQXt+J0lgvMUK3GSL7fs+kMltX8gqx
	D9Sc37hW02MB2Ey/2fS2jXPepAAt1EoeKY9l+hr7q3s5Amg1TUCTtTnRTtnoz5exb5zuR94HdGR
	7FyltLpl2LtJL/t9I2WcQllBvlStCwHpuadlAy6pzJ2mKXgRYudCdPvKe3xwt6svOAxHBKaUkR6
	I02BvRKBuNmvMnSFPbOkCSwHNLKAzt/Kv/u6YfaDRzshM4UUuwMlu5o+kdjdbSqV3JrVXUj4Q5G
	AXvwxcwNTA5MdRZQqogntfBLa4/qggULCnpg0B+AU+W85
X-Received: by 2002:a17:90b:292:b0:354:83c1:9efc with SMTP id 98e67ed59e1d1-354b3e2f179mr213570a91.19.1770326105090;
        Thu, 05 Feb 2026 13:15:05 -0800 (PST)
X-Received: by 2002:a17:90b:292:b0:354:83c1:9efc with SMTP id 98e67ed59e1d1-354b3e2f179mr213546a91.19.1770326104338;
        Thu, 05 Feb 2026 13:15:04 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:15:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:06 +0530
Subject: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=39457;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zP1b3A7r8K4fjd9QZoy8Gj4YDIq0hNJ5epT2edh3adU=;
 b=16hEbLrY7nlsmhA5GwOK/Ow8/5qMjKTGGri2gxRabMv+jjRWeVbS/bxJQ7n4Lw53eYAGvcKi7
 KBmcleMydghBQsrREU+a330fHT/8RJXAg6lCeJEIM0NkFhKjIi+v47J
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 0eiinU1ejvuStH-Xw9fe3Ht2iq3jMO6k
X-Proofpoint-ORIG-GUID: 0eiinU1ejvuStH-Xw9fe3Ht2iq3jMO6k
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=6985085b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=D3hYFxzgWABL_SxJEScA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX+X9QRtTqfWYP
 3dNiQEErmweKpmqiYz7twh4m87/ulkDX4UWy2Njs6IZOp32QlYVqoUT5WNeiJf8WtmqRfQ39vi/
 aS6lxKw6JS0EMQlQwPOWbz2lsYiyvQBjHFet2ibAAbVOgRMk10X7jeh248F3mVeksA9t1n0xrv1
 HM2/z/7OFt4f7vHrt+4/gMNr2hhCAk6GKkQuxKBQc4BJm98Lhpp4L7LsCujowoiwRKGUky93XV+
 FOBeRUdBlMKAXeqD/zQFg9i6tckS9c8lP+pS6L+THpd7y+bcDV9HXWrT9tgspFO+qHgvvYhyeb5
 4vpPQQX6t7QVC1CySHke98BvVUpXI/LgXIrkM9mGJX1o9KBG0v4qHzkM/SSLAvS4TWRQ4m2mMje
 BdycViDOXLXLnwTtFIvCNNZXv76Qx7F+RvDp9qyore0p/uHjLAEUtPICXV017WIYPYYUz0hsnCR
 gLnOvugeYKzw+m4FCFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91968-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,alarm_poll_work.work:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9956DF7853
X-Rspamd-Action: no action

Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
monitor driver. The BCL peripheral is present in Qualcomm PMICs and
provides real-time monitoring and protection against battery
overcurrent and under voltage conditions.

The driver monitors:
- Battery voltage with configurable low voltage thresholds
- Battery current with configurable high current thresholds
- Two limit alarm interrupts (max/min, critical)

The driver integrates with the Linux hwmon subsystem and provides
standard hwmon attributes for monitoring battery conditions.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 MAINTAINERS                    |   9 +
 drivers/hwmon/Kconfig          |   9 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/qcom-bcl-hwmon.c | 982 +++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/qcom-bcl-hwmon.h | 311 +++++++++++++
 5 files changed, 1312 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b979cfc04c1e..16452a53ac46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21597,6 +21597,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
+F:	drivers/hwmon/qcom-bcl-hwmon.c
+F:	drivers/hwmon/qcom-bcl-hwmon.h
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..6dd7125559be 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1905,6 +1905,15 @@ config SENSORS_PWM_FAN
 	  This driver can also be built as a module. If so, the module
 	  will be called pwm-fan.
 
+config SENSORS_QCOM_BCL
+	tristate "Qualcomm BCL hardware monitoring"
+	help
+	  Say yes here to enable support for Qualcomm battery over current
+	  and under voltage alarms monitor.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called qcom-bcl-hwmon.
+
 config SENSORS_QNAP_MCU_HWMON
 	tristate "QNAP MCU hardware monitoring"
 	depends on MFD_QNAP_MCU
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..1b03eecd761d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -197,6 +197,7 @@ obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
+obj-$(CONFIG_SENSORS_QCOM_BCL)	+= qcom-bcl-hwmon.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
new file mode 100644
index 000000000000..a7e3b865de5c
--- /dev/null
+++ b/drivers/hwmon/qcom-bcl-hwmon.c
@@ -0,0 +1,982 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm pmic BCL hardware driver for battery overcurrent and
+ * battery or system under voltage monitor
+ *
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/workqueue.h>
+
+#include "qcom-bcl-hwmon.h"
+
+ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
+ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
+
+/* Interrupt names for each alarm level */
+static const char * const bcl_int_names[ALARM_MAX] = {
+	[LVL0] = "bcl-max-min",
+	[LVL1] = "bcl-critical",
+};
+
+static const char * const bcl_channel_label[CHANNEL_MAX] = {
+	"BCL Voltage",
+	"BCL Current",
+};
+
+/* Common Reg Fields */
+static const struct reg_field common_reg_fields[COMMON_FIELD_MAX] = {
+	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
+	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
+	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
+	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
+	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
+};
+
+/* BCL Version/Modes specific fields */
+static const struct reg_field bcl_v1_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(MODE_CTL1, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
+	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
+};
+
+static const struct reg_field bcl_v2_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 1),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
+	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
+};
+
+static const struct reg_field bcl_v3_bmx_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
+};
+
+static const struct reg_field bcl_v3_wb_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 3),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
+};
+
+static const struct reg_field bcl_v3_core_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 5),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+};
+
+static const struct reg_field bcl_v4_bmx_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 15),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 15),
+};
+
+static const struct reg_field bcl_v4_wb_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 6),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 15),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
+	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 4),
+	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 15),
+};
+
+static const struct reg_field bcl_v4_core_reg_fields[] = {
+	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 2),
+	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 6),
+	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 6),
+	[F_IN_INPUT_EN]	= REG_FIELD(PARAM_1, 0, 0),
+	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 15),
+	[F_CURR_MON_EN]	= REG_FIELD(PARAM_1, 1, 1),
+};
+
+/* V1 BMX and core */
+static const struct bcl_desc pm7250b_data = {
+	.reg_fields = bcl_v1_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 8,
+	.thresh_field_bits_size = 7,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.max = 10000,
+		.default_scale_nu = 305180,
+		.thresh_type = {ADC, ADC},
+	},
+};
+
+/* V2 BMX and core */
+static const struct bcl_desc pm8350_data = {
+	.reg_fields = bcl_v2_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 8,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.max = 10000,
+		.default_scale_nu = 305180,
+		.thresh_type = {ADC, ADC},
+	},
+};
+
+/* V3 BMX  */
+static const struct bcl_desc pm8550b_data = {
+	.reg_fields = bcl_v3_bmx_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 8,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.max = 12000,
+		.default_scale_nu = 366220,
+		.thresh_type = {ADC, ADC},
+	},
+};
+
+/* V3 WB  */
+static const struct bcl_desc pmw5100_data = {
+	.reg_fields = bcl_v3_wb_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 8,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.base = 800,
+		.max = 2000,
+		.step = 100,
+		.default_scale_nu = 61035,
+		.thresh_type = {ADC, INDEX},
+	},
+};
+
+/* V3 CORE  */
+static const struct bcl_desc pm8550_data = {
+	.reg_fields = bcl_v3_core_reg_fields,
+	.num_reg_fields = F_CURR_MON_EN + 1,
+	.data_field_bits_size = 8,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.thresh_type = {INDEX, INDEX},
+	},
+};
+
+/* V4 BMX  */
+static const struct bcl_desc pmih010_data = {
+	.reg_fields = bcl_v4_bmx_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 16,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.max = 20000,
+		.default_scale_nu = 610370,
+		.thresh_type = {ADC, ADC},
+	},
+};
+
+/* V4 WB  */
+static const struct bcl_desc pmw6100_data = {
+	.reg_fields = bcl_v4_wb_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 16,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 1500,
+		.max = 4000,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.base = 900,
+		.max = 3300,
+		.step = 150,
+		.default_scale_nu = 152586,
+		.thresh_type = {ADC, INDEX},
+	},
+};
+
+/* V4 CORE */
+static const struct bcl_desc pmh010_data = {
+	.reg_fields = bcl_v4_core_reg_fields,
+	.num_reg_fields = F_CURR_MON_EN + 1,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 1500,
+		.max = 4000,
+		.step = 25,
+		.thresh_type = {INDEX, INDEX},
+	},
+};
+
+/* V4 BMX with different scale */
+static const struct bcl_desc pmv010_data = {
+	.reg_fields = bcl_v4_bmx_reg_fields,
+	.num_reg_fields = F_MAX_FIELDS,
+	.data_field_bits_size = 16,
+	.thresh_field_bits_size = 8,
+	.channel[IN] = {
+		.base = 2250,
+		.max = 3600,
+		.step = 25,
+		.default_scale_nu = 194637,
+		.thresh_type = {ADC, INDEX},
+	},
+	.channel[CURR] = {
+		.max = 12000,
+		.default_scale_nu = 366220,
+		.thresh_type = {ADC, ADC},
+	},
+};
+
+/**
+ * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
+ * @desc: BCL device descriptor
+ * @raw_val: Raw ADC value from hardware
+ * @type: type of the channel, in or curr
+ * @field_width: bits size for data or threshold field
+ *
+ * Return: value in milli unit
+ */
+static unsigned int bcl_convert_raw_to_milliunit(const struct bcl_desc *desc, int raw_val,
+					enum bcl_channel_type type, u8 field_width)
+{
+	u32 def_scale = desc->channel[type].default_scale_nu;
+	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
+	u32 scaling_factor = def_scale * lsb_weight;
+
+	return div_s64((s64)raw_val * scaling_factor, 1000000);
+}
+
+/**
+ * bcl_convert_milliunit_to_raw - Convert milli unit to raw value
+ * @desc: BCL device descriptor
+ * @ma_val: threshold value in milli unit
+ * @type: type of the channel, in or curr
+ * @field_width: bits size for data or threshold field
+ *
+ * Return: Raw ADC value for hardware
+ */
+static unsigned int bcl_convert_milliunit_to_raw(const struct bcl_desc *desc, int mval,
+					enum bcl_channel_type type, u8 field_width)
+{
+	u32 def_scale = desc->channel[type].default_scale_nu;
+	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
+	u32 scaling_factor = def_scale * lsb_weight;
+
+	return div_s64((s64)mval * 1000000, scaling_factor);
+}
+
+/**
+ * bcl_convert_milliunit_to_index - Convert milliunit to in or curr index
+ * @desc: BCL device descriptor
+ * @val: in or curr value in milli unit
+ * @type: type of the channel, in or curr
+ *
+ * Converts a value in milli unit to an index for BCL that use indexed thresholds.
+ *
+ * Return: Voltage index value
+ */
+static unsigned int bcl_convert_milliunit_to_index(const struct bcl_desc *desc, int val,
+					  enum bcl_channel_type type)
+{
+	return div_s64((s64)val - desc->channel[type].base, desc->channel[type].step);
+}
+
+/**
+ * bcl_convert_index_to_milliunit - Convert in or curr index to milli unit
+ * @desc: BCL device descriptor
+ * @val: index value
+ * @type: type of the channel, in or curr
+ *
+ * Converts an index value to milli unit for BCL that use indexed thresholds.
+ *
+ * Return: Voltage value in millivolts
+ */
+static unsigned int bcl_convert_index_to_milliunit(const struct bcl_desc *desc, int val,
+					 enum bcl_channel_type type)
+{
+	return desc->channel[type].base + val * desc->channel[type].step;
+}
+
+static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
+{
+	const struct bcl_desc *desc = bcl->desc;
+	u32 raw_val;
+
+	int thresh = clamp_val(value, desc->channel[IN].base, desc->channel[IN].max);
+
+	if (desc->channel[IN].thresh_type[lvl] == ADC)
+		raw_val = bcl_convert_milliunit_to_raw(desc, thresh, IN,
+						       desc->thresh_field_bits_size);
+	else
+		raw_val = bcl_convert_milliunit_to_index(desc, thresh, IN);
+
+	return regmap_field_write(bcl->fields[F_IN_L0_THR + lvl], raw_val);
+}
+
+static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
+{
+	const struct bcl_desc *desc = bcl->desc;
+	u32 raw_val;
+
+	/* Clamp only to curr max */
+	int thresh = clamp_val(value, value, desc->channel[CURR].max);
+
+	if (desc->channel[CURR].thresh_type[lvl] == ADC)
+		raw_val = bcl_convert_milliunit_to_raw(desc, thresh, CURR,
+						       desc->thresh_field_bits_size);
+	else
+		raw_val = bcl_convert_milliunit_to_index(desc, thresh, CURR);
+
+	return regmap_field_write(bcl->fields[F_CURR_H0_THR + lvl], raw_val);
+}
+
+static int bcl_in_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
+{
+	int ret, thresh;
+	u32 raw_val = 0;
+	const struct bcl_desc *desc = bcl->desc;
+
+	ret = bcl_read_field_value(bcl, F_IN_L0_THR + lvl, &raw_val);
+	if (ret)
+		return ret;
+
+	if (desc->channel[IN].thresh_type[lvl] == ADC)
+		thresh = bcl_convert_raw_to_milliunit(desc, raw_val, IN,
+						      desc->thresh_field_bits_size);
+	else
+		thresh = bcl_convert_index_to_milliunit(desc, raw_val, IN);
+
+	*out = thresh;
+
+	return 0;
+}
+
+static int bcl_curr_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
+{
+	int ret, thresh;
+	u32 raw_val = 0;
+	const struct bcl_desc *desc = bcl->desc;
+
+	ret = bcl_read_field_value(bcl, F_CURR_H0_THR + lvl, &raw_val);
+	if (ret)
+		return ret;
+
+	if (desc->channel[CURR].thresh_type[lvl] == ADC)
+		thresh = bcl_convert_raw_to_milliunit(desc, raw_val, CURR,
+						      desc->thresh_field_bits_size);
+	else
+		thresh = bcl_convert_index_to_milliunit(desc, raw_val, CURR);
+
+	*out = thresh;
+
+	return 0;
+}
+
+static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
+{
+	int ret;
+	u32 raw_val = 0;
+	const struct bcl_desc *desc = bcl->desc;
+
+	ret = bcl_read_field_value(bcl, F_CURR_INPUT, &raw_val);
+	if (ret)
+		return ret;
+
+	/*
+	 * The sensor sometime can read a value 0 if there are
+	 * consecutive reads
+	 */
+	if (raw_val != 0)
+		bcl->last_curr_input =
+			bcl_convert_raw_to_milliunit(desc, raw_val, CURR,
+						     desc->data_field_bits_size);
+
+	*out = bcl->last_curr_input;
+
+	return 0;
+}
+
+static int bcl_in_input_read(struct bcl_device *bcl, long *out)
+{
+	int ret;
+	u32 raw_val = 0;
+	const struct bcl_desc *desc = bcl->desc;
+
+	ret = bcl_read_field_value(bcl, F_IN_INPUT, &raw_val);
+	if (ret)
+		return ret;
+
+	if (raw_val < GENMASK(desc->data_field_bits_size - 1, 0))
+		bcl->last_in_input =
+			bcl_convert_raw_to_milliunit(desc, raw_val, IN,
+						     desc->data_field_bits_size);
+
+	*out = bcl->last_in_input;
+
+	return 0;
+}
+
+static int bcl_read_alarm_status(struct bcl_device *bcl,
+				 enum bcl_limit_alarm lvl, long *status)
+{
+	int ret;
+	u32 raw_val = 0;
+
+	ret = bcl_read_field_value(bcl, F_LVL0_ALARM + lvl, &raw_val);
+	if (ret)
+		return ret;
+
+	*status = raw_val;
+
+	return 0;
+}
+
+static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
+{
+	u32 raw_val = 0;
+
+	bcl_read_field_value(bcl, F_V_MAJOR, &raw_val);
+
+	return raw_val;
+}
+
+static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
+{
+	u32 raw_val = 0;
+
+	bcl_read_field_value(bcl, F_V_MINOR, &raw_val);
+
+	return raw_val;
+}
+
+static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
+{
+	if (bcl->in_mon_enabled)
+		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
+				in_lvl_to_attr_map[alarm], 0);
+	if (bcl->curr_mon_enabled)
+		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
+				curr_lvl_to_attr_map[alarm], 0);
+}
+
+static void bcl_alarm_enable_poll(struct work_struct *work)
+{
+	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
+							 alarm_poll_work.work);
+	struct bcl_device *bcl = alarm->device;
+	long status;
+
+	guard(mutex)(&bcl->lock);
+
+	if (bcl_read_alarm_status(bcl, alarm->type, &status))
+		goto re_schedule;
+
+	if (!status & !alarm->irq_enabled) {
+		bcl_enable_irq(alarm);
+		bcl_hwmon_notify_event(bcl, alarm->type);
+		return;
+	}
+
+re_schedule:
+	schedule_delayed_work(&alarm->alarm_poll_work,
+				msecs_to_jiffies(BCL_ALARM_POLLING_MS));
+}
+
+static irqreturn_t bcl_handle_alarm(int irq, void *data)
+{
+	struct bcl_alarm_data *alarm = data;
+	struct bcl_device *bcl = alarm->device;
+	long status;
+
+	guard(mutex)(&bcl->lock);
+
+	if (bcl_read_alarm_status(bcl, alarm->type, &status) || !status)
+		return IRQ_HANDLED;
+
+	if (!bcl->hwmon_dev)
+		return IRQ_HANDLED;
+
+	bcl_hwmon_notify_event(bcl, alarm->type);
+
+	bcl_disable_irq(alarm);
+	schedule_delayed_work(&alarm->alarm_poll_work,
+			msecs_to_jiffies(BCL_ALARM_POLLING_MS));
+
+	dev_dbg(bcl->dev, "Irq:%d triggered for bcl type:%d\n",
+			 irq, alarm->type);
+
+	return IRQ_HANDLED;
+}
+
+static umode_t bcl_hwmon_is_visible(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	const struct bcl_device *bcl = data;
+
+	switch (type) {
+	case hwmon_in:
+		if (!bcl->in_mon_enabled)
+			return 0;
+		switch (attr) {
+		case hwmon_in_input:
+			return bcl->in_input_enabled ? 0444 : 0;
+		case hwmon_in_label:
+		case hwmon_in_min_alarm:
+		case hwmon_in_lcrit_alarm:
+			return 0444;
+		case hwmon_in_min:
+		case hwmon_in_lcrit:
+			return 0644;
+		default:
+			return 0;
+		}
+	case hwmon_curr:
+		if (!bcl->curr_mon_enabled)
+			return 0;
+		switch (attr) {
+		case hwmon_curr_input:
+		case hwmon_curr_label:
+		case hwmon_curr_max_alarm:
+		case hwmon_curr_crit_alarm:
+			return 0444;
+		case hwmon_curr_max:
+		case hwmon_curr_crit:
+			return 0644;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+
+static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long val)
+{
+	struct bcl_device *bcl = dev_get_drvdata(dev);
+	int ret = -EOPNOTSUPP;
+
+	guard(mutex)(&bcl->lock);
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_min:
+		case hwmon_in_lcrit:
+			ret = bcl_in_thresh_write(bcl, val, in_attr_to_lvl_map[attr]);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_max:
+		case hwmon_curr_crit:
+			ret = bcl_curr_thresh_write(bcl, val, curr_attr_to_lvl_map[attr]);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int bcl_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *value)
+{
+	struct bcl_device *bcl = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&bcl->lock);
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			ret = bcl_in_input_read(bcl, value);
+			break;
+		case hwmon_in_min:
+		case hwmon_in_lcrit:
+			ret = bcl_in_thresh_read(bcl, in_attr_to_lvl_map[attr], value);
+			break;
+		case hwmon_in_min_alarm:
+		case hwmon_in_lcrit_alarm:
+			ret = bcl_read_alarm_status(bcl, in_attr_to_lvl_map[attr], value);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			ret = bcl_curr_input_read(bcl, value);
+			break;
+		case hwmon_curr_max:
+		case hwmon_curr_crit:
+			ret = bcl_curr_thresh_read(bcl, curr_attr_to_lvl_map[attr], value);
+			break;
+		case hwmon_curr_max_alarm:
+		case hwmon_curr_crit_alarm:
+			ret = bcl_read_alarm_status(bcl, curr_attr_to_lvl_map[attr], value);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static int bcl_hwmon_read_string(struct device *dev,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_in:
+		if (attr != hwmon_in_label)
+			break;
+		*str = bcl_channel_label[IN];
+		return 0;
+	case hwmon_curr:
+		if (attr != hwmon_curr_label)
+			break;
+		*str = bcl_channel_label[CURR];
+		return 0;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops bcl_hwmon_ops = {
+	.is_visible	= bcl_hwmon_is_visible,
+	.read		= bcl_hwmon_read,
+	.read_string	= bcl_hwmon_read_string,
+	.write		= bcl_hwmon_write,
+};
+
+static const struct hwmon_channel_info *bcl_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_MIN |
+			   HWMON_I_LCRIT | HWMON_I_MIN_ALARM |
+			   HWMON_I_LCRIT_ALARM),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL | HWMON_C_MAX |
+			   HWMON_C_CRIT | HWMON_C_MAX_ALARM |
+			   HWMON_C_CRIT_ALARM),
+	NULL,
+};
+
+static const struct hwmon_chip_info bcl_hwmon_chip_info = {
+	.ops	= &bcl_hwmon_ops,
+	.info	= bcl_hwmon_info,
+};
+
+static int bcl_curr_thresh_update(struct bcl_device *bcl)
+{
+	int ret, i;
+
+	if (!bcl->curr_thresholds[0])
+		return 0;
+
+	for (i = 0; i < ALARM_MAX; i++) {
+		ret = bcl_curr_thresh_write(bcl, bcl->curr_thresholds[i], i);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void bcl_hw_channel_mon_init(struct bcl_device *bcl)
+{
+	bcl->in_mon_enabled = bcl_in_monitor_enabled(bcl);
+	bcl->in_input_enabled = bcl_in_input_enabled(bcl);
+	bcl->curr_mon_enabled = bcl_curr_monitor_enabled(bcl);
+}
+
+static int bcl_alarm_irq_init(struct platform_device *pdev,
+			      struct bcl_device *bcl)
+{
+	int ret = 0, irq_num = 0, i = 0;
+	struct bcl_alarm_data *alarm;
+
+	for (i = LVL0; i < ALARM_MAX; i++) {
+		alarm = &bcl->bcl_alarms[i];
+		alarm->type = i;
+		alarm->device = bcl;
+
+		ret = devm_delayed_work_autocancel(bcl->dev, &alarm->alarm_poll_work,
+					   bcl_alarm_enable_poll);
+		if (ret)
+			return ret;
+
+		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
+		if (irq_num <= 0)
+			continue;
+
+		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
+						bcl_handle_alarm, IRQF_ONESHOT,
+						bcl_int_names[i], alarm);
+		if (ret) {
+			dev_err(&pdev->dev, "Error requesting irq(%s).err:%d\n",
+				bcl_int_names[i], ret);
+			return ret;
+		}
+		enable_irq_wake(alarm->irq);
+		alarm->irq_enabled = true;
+		alarm->irq = irq_num;
+	}
+
+	return 0;
+}
+
+static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
+				 const struct bcl_desc *data)
+{
+	int i;
+	struct reg_field fields[F_MAX_FIELDS];
+
+	BUILD_BUG_ON(ARRAY_SIZE(common_reg_fields) != COMMON_FIELD_MAX);
+
+	for (i = 0; i < data->num_reg_fields; i++) {
+		if (i < COMMON_FIELD_MAX)
+			fields[i] = common_reg_fields[i];
+		else
+			fields[i] = data->reg_fields[i];
+
+		/* Need to adjust BCL base from regmap dynamically */
+		fields[i].reg += bcl->base;
+	}
+
+	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
+					   fields, data->num_reg_fields);
+}
+
+static int bcl_get_device_property_data(struct platform_device *pdev,
+				   struct bcl_device *bcl)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+	u32 reg;
+
+	ret = device_property_read_u32(dev, "reg", &reg);
+	if (ret < 0)
+		return ret;
+
+	bcl->base = reg;
+
+	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
+				       bcl->curr_thresholds, 2);
+	return 0;
+}
+
+static int bcl_probe(struct platform_device *pdev)
+{
+	struct bcl_device *bcl;
+	int ret;
+
+	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
+	if (!bcl)
+		return -ENOMEM;
+
+	bcl->dev = &pdev->dev;
+	bcl->desc = device_get_match_data(&pdev->dev);
+	if (!bcl->desc)
+		return -EINVAL;
+
+	ret = devm_mutex_init(bcl->dev, &bcl->lock);
+	if (ret)
+		return ret;
+
+	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bcl->regmap) {
+		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
+		return -EINVAL;
+	}
+
+	ret = bcl_get_device_property_data(pdev, bcl);
+	if (ret < 0)
+		return ret;
+
+	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to allocate regmap fields, err:%d\n", ret);
+		return ret;
+	}
+
+	if (!bcl_hw_is_enabled(bcl))
+		return -ENODEV;
+
+	ret = bcl_curr_thresh_update(bcl);
+	if (ret < 0)
+		return ret;
+
+	ret = bcl_alarm_irq_init(pdev, bcl);
+	if (ret < 0)
+		return ret;
+
+	bcl_hw_channel_mon_init(bcl);
+
+	dev_set_drvdata(&pdev->dev, bcl);
+
+	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
+						   dev_name(bcl->dev));
+	if (IS_ERR(bcl->hwmon_name)) {
+		dev_err(&pdev->dev, "Failed to sanitize hwmon name\n");
+		return PTR_ERR(bcl->hwmon_name);
+	}
+
+	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							      bcl->hwmon_name,
+							      bcl,
+							      &bcl_hwmon_chip_info,
+							      NULL);
+	if (IS_ERR(bcl->hwmon_dev)) {
+		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
+			PTR_ERR(bcl->hwmon_dev));
+		return PTR_ERR(bcl->hwmon_dev);
+	}
+
+	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
+		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
+
+	return 0;
+}
+
+static const struct of_device_id bcl_match[] = {
+	{
+		.compatible = "qcom,bcl-v1",
+		.data = &pm7250b_data,
+	}, {
+		.compatible = "qcom,bcl-v2",
+		.data = &pm8350_data,
+	}, {
+		.compatible = "qcom,bcl-v3-bmx",
+		.data = &pm8550b_data,
+	}, {
+		.compatible = "qcom,bcl-v3-wb",
+		.data = &pmw5100_data,
+	}, {
+		.compatible = "qcom,bcl-v3-core",
+		.data = &pm8550_data,
+	}, {
+		.compatible = "qcom,bcl-v4-bmx",
+		.data = &pmih010_data,
+	}, {
+		.compatible = "qcom,bcl-v4-wb",
+		.data = &pmw6100_data,
+	}, {
+		.compatible = "qcom,bcl-v4-core",
+		.data = &pmh010_data,
+	}, {
+		.compatible = "qcom,bcl-v4-pmv010",
+		.data = &pmv010_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bcl_match);
+
+static struct platform_driver bcl_driver = {
+	.probe	= bcl_probe,
+	.driver	= {
+		.name		= BCL_DRIVER_NAME,
+		.of_match_table	= bcl_match,
+	},
+};
+
+MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QCOM BCL HWMON driver");
+module_platform_driver(bcl_driver);
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/qcom-bcl-hwmon.h b/drivers/hwmon/qcom-bcl-hwmon.h
new file mode 100644
index 000000000000..28a7154d9486
--- /dev/null
+++ b/drivers/hwmon/qcom-bcl-hwmon.h
@@ -0,0 +1,311 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QCOM_BCL_HWMON_H__
+#define __QCOM_BCL_HWMON_H__
+
+#define BCL_DRIVER_NAME			"qcom-bcl-hwmon"
+
+/* BCL common regmap offset */
+#define REVISION1			0x0
+#define REVISION2			0x1
+#define STATUS				0x8
+#define INT_RT_STS			0x10
+#define EN_CTL1				0x46
+
+/* BCL GEN1 regmap offsets */
+#define MODE_CTL1			0x41
+#define VADC_L0_THR			0x48
+#define VCMP_L1_THR			0x49
+#define IADC_H0_THR			0x4b
+#define IADC_H1_THR			0x4c
+#define VADC_CONV_REQ			0x72
+#define IADC_CONV_REQ			0x82
+#define VADC_DATA1			0x76
+#define IADC_DATA1			0x86
+
+/* BCL GEN3 regmap offsets */
+#define VCMP_CTL			0x44
+#define VCMP_L0_THR			0x47
+#define PARAM_1				0x0e
+#define IADC_H1_THR_GEN3		0x4d
+
+#define BCL_IN_INC_MV			25
+#define BCL_ALARM_POLLING_MS		50
+
+/**
+ * enum bcl_limit_alarm - BCL alarm threshold levels
+ * @LVL0: Level 0 alarm threshold (mapped to in_min_alarm or curr_max_alarm)
+ * @LVL1: Level 1 alarm threshold (mapped to in_lcrit_alarm or curr_crit_alarm)
+ * @ALARM_MAX: sentinel value
+ *
+ * Defines the three threshold levels for BCL monitoring. Each level corresponds
+ * to different severity of in or curr conditions.
+ */
+enum bcl_limit_alarm {
+	LVL0,
+	LVL1,
+
+	ALARM_MAX,
+};
+
+/**
+ * enum bcl_channel_type - BCL supported sensor channel type
+ * @IN: in (voltage) channel
+ * @CURR: curr (current) channel
+ * @CHANNEL_MAX: sentinel value
+ *
+ * Defines the supported channel types for bcl.
+ */
+enum bcl_channel_type {
+	IN,
+	CURR,
+
+	CHANNEL_MAX,
+};
+
+/**
+ * enum bcl_thresh_type - voltage or current threshold representation type
+ * @ADC: Raw ADC value representation
+ * @INDEX: Index-based voltage or current representation
+ *
+ * Specifies how voltage or current thresholds are stored and interpreted in
+ * registers. Some PMICs use raw ADC values while others use indexed values.
+ */
+enum bcl_thresh_type {
+	ADC,
+	INDEX,
+};
+
+/**
+ * enum bcl_fields - BCL register field identifiers
+ * @F_V_MAJOR: Major revision info field
+ * @F_V_MINOR: Minor revision info field
+ * @F_CTL_EN: Monitor enable control field
+ * @F_LVL0_ALARM: Level 0 alarm status field
+ * @F_LVL1_ALARM: Level 1 alarm status field
+ * @COMMON_FIELD_MAX: sentinel value for common fields
+ * @F_IN_MON_EN: voltage monitor enable control field
+ * @F_IN_L0_THR: voltage level 0 threshold field
+ * @F_IN_L1_THR: voltage level 1 threshold field
+ * @F_IN_INPUT_EN: voltage input enable control field
+ * @F_IN_INPUT: voltage input data field
+ * @F_CURR_MON_EN: current monitor enable control field
+ * @F_CURR_H0_THR: current level 0 threshold field
+ * @F_CURR_H1_THR: current level 1 threshold field
+ * @F_CURR_INPUT: current input data field
+ * @F_MAX_FIELDS: sentinel value
+ *
+ * Enumeration of all register fields used by the BCL driver for accessing
+ * registers through regmap fields.
+ */
+enum bcl_fields {
+	F_V_MAJOR,
+	F_V_MINOR,
+
+	F_CTL_EN,
+
+	/* common alarm for in and curr channel */
+	F_LVL0_ALARM,
+	F_LVL1_ALARM,
+
+	COMMON_FIELD_MAX,
+
+	F_IN_MON_EN = COMMON_FIELD_MAX,
+	F_IN_L0_THR,
+	F_IN_L1_THR,
+
+	F_IN_INPUT_EN,
+	F_IN_INPUT,
+
+	F_CURR_MON_EN,
+	F_CURR_H0_THR,
+	F_CURR_H1_THR,
+
+	F_CURR_INPUT,
+
+	F_MAX_FIELDS
+};
+
+#define ADD_BCL_HWMON_ALARM_MAPS(_type, lvl0_attr, lvl1_attr)	\
+								\
+static const u8 _type##_attr_to_lvl_map[] = {			\
+	[hwmon_##_type##_##lvl0_attr] = LVL0,			\
+	[hwmon_##_type##_##lvl1_attr] = LVL1,			\
+	[hwmon_##_type##_##lvl0_attr##_alarm] = LVL0,		\
+	[hwmon_##_type##_##lvl1_attr##_alarm] = LVL1,		\
+};								\
+								\
+static const u8 _type##_lvl_to_attr_map[ALARM_MAX] = {		\
+	[LVL0] = hwmon_##_type##_##lvl0_attr##_alarm,		\
+	[LVL1] = hwmon_##_type##_##lvl1_attr##_alarm,		\
+}
+
+/**
+ * struct bcl_channel_cfg - BCL channel related configuration
+ * @default_scale_nu:  Default scaling factor in nano unit
+ * @base: Base threshold value in milli unit
+ * @max: Maximum threshold value in milli unit
+ * @step: step increment value between two indexed threshold value
+ * @thresh_type: Array specifying threshold representation type for each alarm level
+ *
+ * Contains hardware-specific configuration and scaling parameters for different
+ * channel(voltage and current)..
+ */
+
+struct bcl_channel_cfg {
+	u32 default_scale_nu;
+	u32 base;
+	u32 max;
+	u32 step;
+	u8 thresh_type[ALARM_MAX];
+};
+
+/**
+ * struct bcl_desc - BCL device descriptor
+ * @reg_fields: Array of register field definitions for this device variant
+ * @channel: Each channel specific(voltage or current) configuration
+ * @num_reg_fields: Number of register field definitions for this device variant
+ * @data_field_bits_size: data read register bit size
+ * @thresh_field_bits_size: lsb bit size those are not included in threshold register
+ *
+ * Contains hardware-specific configuration and scaling parameters for different
+ * BCL variants. Each PMIC model may have different register layouts and
+ * conversion factors.
+ */
+
+struct bcl_desc {
+	const struct reg_field *reg_fields;
+	struct bcl_channel_cfg channel[CHANNEL_MAX];
+	u8 num_reg_fields;
+	u8 data_field_bits_size;
+	u8 thresh_field_bits_size;
+};
+
+struct bcl_device;
+
+/**
+ * struct bcl_alarm_data - BCL alarm interrupt data
+ * @irq: IRQ number assigned to this alarm
+ * @irq_enabled: Flag indicating if IRQ is enabled
+ * @type: Alarm level type (LVL0, or LVL1)
+ * @device: Pointer to parent BCL device structure
+ * @alarm_poll_work: delayed_work to poll alarm status
+ *
+ * Stores interrupt-related information for each alarm threshold level.
+ * Used by the IRQ handler to identify which alarm triggered.
+ */
+struct bcl_alarm_data {
+	int			irq;
+	bool			irq_enabled;
+	enum bcl_limit_alarm	type;
+	struct bcl_device	*device;
+	struct delayed_work	alarm_poll_work;
+};
+
+/**
+ * struct bcl_device - Main BCL device structure
+ * @dev: Pointer to device structure
+ * @regmap: Regmap for accessing PMIC registers
+ * @fields: Array of regmap fields for register access
+ * @bcl_alarms: Array of alarm data structures for each threshold level
+ * @lock: Mutex for protecting concurrent hardware access
+ * @in_mon_enabled: Flag indicating if voltage monitoring is enabled
+ * @curr_mon_enabled: Flag indicating if current monitoring is enabled
+ * @curr_thresholds: Current threshold values in milliamps from dt-binding(LVL0 and LVL1)
+ * @base: the BCL regbase offset from regmap
+ * @in_input_enabled: Flag indicating if voltage input reading is enabled
+ * @last_in_input: Last valid voltage input reading in millivolts
+ * @last_curr_input: Last valid current input reading in milliamps
+ * @desc: Pointer to device descriptor with hardware-specific parameters
+ * @hwmon_dev: Pointer to registered hwmon device
+ * @hwmon_name: Sanitized name for hwmon device
+ *
+ * Main driver structure containing all state and configuration for a BCL
+ * monitoring instance. Manages voltage and current monitoring, thresholds,
+ * and alarm handling.
+ */
+struct bcl_device {
+	struct device		*dev;
+	struct regmap		*regmap;
+	u16			base;
+	struct regmap_field	*fields[F_MAX_FIELDS];
+	struct bcl_alarm_data	bcl_alarms[ALARM_MAX];
+	struct mutex		lock;
+	u32			curr_thresholds[ALARM_MAX];
+	u32			last_in_input;
+	u32			last_curr_input;
+	bool			in_mon_enabled;
+	bool			curr_mon_enabled;
+	bool			in_input_enabled;
+	const struct bcl_desc	*desc;
+	struct device		*hwmon_dev;
+	char			*hwmon_name;
+};
+
+/**
+ * bcl_read_field_value - Read alarm status for a given level
+ * @bcl: BCL device structure
+ * @id: Index in bcl->fields[]
+ * @val: Pointer to store val
+ *
+ * Return: 0 on success or regmap error code
+ */
+static inline int bcl_read_field_value(const struct bcl_device *bcl, enum bcl_fields id, u32 *val)
+{
+	return regmap_field_read(bcl->fields[id], val);
+}
+
+/**
+ * bcl_field_enabled - Generic helper to check if a regmap field is enabled
+ * @bcl: BCL device structure
+ * @field: Index in bcl->fields[]
+ *
+ * Return: true if field is non-zero, false otherwise
+ */
+static inline bool bcl_field_enabled(const struct bcl_device *bcl, enum bcl_fields id)
+{
+	int ret;
+	u32 val = 0;
+
+	ret = regmap_field_read(bcl->fields[id], &val);
+	if (ret)
+		return false;
+
+	return !!val;
+}
+
+#define bcl_in_input_enabled(bcl)	bcl_field_enabled(bcl, F_IN_INPUT_EN)
+#define bcl_curr_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_CURR_MON_EN)
+#define bcl_in_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_IN_MON_EN)
+#define bcl_hw_is_enabled(bcl)		bcl_field_enabled(bcl, F_CTL_EN)
+
+/**
+ * bcl_enable_irq - Generic helper to enable alarm irq
+ * @alarm: BCL level alarm data
+ */
+static inline void bcl_enable_irq(struct bcl_alarm_data *alarm)
+{
+	if (alarm->irq_enabled)
+		return;
+	alarm->irq_enabled = true;
+	enable_irq(alarm->irq);
+	enable_irq_wake(alarm->irq);
+}
+
+/**
+ * bcl_disable_irq - Generic helper to disable alarm irq
+ * @alarm: BCL level alarm data
+ */
+static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
+{
+	if (!alarm->irq_enabled)
+		return;
+	alarm->irq_enabled = false;
+	disable_irq_nosync(alarm->irq);
+	disable_irq_wake(alarm->irq);
+}
+
+#endif /* __QCOM_BCL_HWMON_H__ */

-- 
2.43.0


