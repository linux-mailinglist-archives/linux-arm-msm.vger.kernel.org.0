Return-Path: <linux-arm-msm+bounces-114227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +W0dDbudOmr5BggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5156B807C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HLwOCHlm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aCkni6Wo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34CDE30406B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41CB3D34B5;
	Tue, 23 Jun 2026 14:52:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863A53CC32B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226361; cv=none; b=uY1gN5mGJymDt0MAmiSczfTwuzCAeGzkn9RmtGTsCaOCrTyOD7Nhh2YChBVoGtfXl4h0n6OIVvOv/DOmbZMAllTDRXEpzjyk8oOasTOKcA/Ny4hfq+NTcgGAqenWzYAVYDUZNVjSs/y9HMoHvKXp34XDzlChLLwahHDFoyFKKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226361; c=relaxed/simple;
	bh=CADuPPHBFTGamZXiLDVwfcLPxeezA49Zbw+re0HVbOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RS1Hj6WUSfALxPZEKVUQ8V6ek3hpeLBNbRhKh9SCJC7k+FB8aVJ7NJiH5kGZLa/3ojz9DQ0TXghyTuterPTlnA+6GQTrIQRXx2Qhm00s0iUM/JUZiJLaewmWt5eflz12+lAZ5Jsg9ubtUhze2Y3znYI2aH9lI/3m07MNJP/gIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLwOCHlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCkni6Wo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZj4K134367
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B0ZrDubUMv3
	UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=; b=HLwOCHlmT0pbctt3AL2B4KECHEQ
	z96FH19Yupn/8HcDB6GeB3eXnyFaMGwi6N8bB5k6xClW5CECYyF/NQMH3JIkVlR1
	gzfkY9lCq7iv6eAQx9hlCNbJCoh/guJmGx64+vcKzJAch5gd/htA0lGUhbz63F4S
	ZO6BOPNCU+9/e5COQ0IiG7f53GfeVmwvB0Nfx1jRxDMOBQeLw32KZD6br02NS168
	0dqWIIMC1kD/YC148Oaagg/wO0Cc/3rokwys9bXWAHhh7RB2UwodpiPskui3dcG9
	lnfZNV0SlH3tF8NZAt9ghefIOvEJRHBoTxbqFT0H8piATX1wvn/SLH1yNDA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3214xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4335eef08so6442320137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226359; x=1782831159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0ZrDubUMv3UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=;
        b=aCkni6Wowpnyv70PEFDJ0DioLdG/4w5YDT1kGSYVPqtocTORXrfN785nwRVlTxEvGv
         jXCuSRlPCeLPOhfJNYPIdvOowa/rvcyGwNKIm093qh7b2pV+0eozVIMoXX4oBFFv7qi5
         bcU+zO4yFWI3v6fzPRlrsdagx0fL5LR+nyCM5IqJKBM7VAum+un9BeXBeXyHfJyBHRyJ
         RSPOxj1rjR6355DKkV4WYCb/4JwcDnwtVIaOTXcVyTb3D7COsCg54WKQiSlztMKZlKmh
         974WalAUSgvZBK60xl8B5YOmn8ZwAifv4NqxoL+F2NAqvR15usvCR65q26YSiUjA98gm
         cBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226359; x=1782831159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0ZrDubUMv3UsfDfx0OoaWw1HQVC6S6Wq7xyx/eBxqU=;
        b=pQUcoyo2/Xaw3s50pZcJhuvip6Lqy2StMpUtyxXxzStxAYkGoNg8v0vH5joCkTknfO
         nvqEWOkPwP9vYauDQkRrV1uKzj7vjxupkbiQ4jNM6O/odQGQGMx7mw5u6sNgrWhyIrk/
         DXK1FfJPi0QM83uFPPSGcONhgbiRQMG/hCzZlxZo7KCnjK1rouD4xDGP3zAIYIxfH7/n
         tL2YofEiVC+cHSuUdarkfVOa0HQe7AOwRd1B/yNyIijAu/JHla6qCjJPZdNu7M4nQQvh
         5/nglOJh4QZyCY2CFDMJxPZOVrAz2LszRmhbd6oeurD0O2ZuIJhgxUXgMEztDS2FoaR2
         W2VA==
X-Forwarded-Encrypted: i=1; AFNElJ8kxl7VZq0Ly3GsCxXhyL3zSRoLTStbWGkojsL/1OFOLRA2eNq44ZOS16BYwPpLn4n3d8gpCc5pFb3GDfWl@vger.kernel.org
X-Gm-Message-State: AOJu0YywBD6J5Dmc5WuopD289W2ZmuCaW7R6tbrIr0kZVnAjjIpXwJcK
	X36TgYUEehK64Jwgv4e/SRGRqMxAVafiEy7EPmVUTJBeI2VNGOgt8Vq/IGIAp+4x7cuqn4N6idL
	kWreDwfQlqdKUptu7Rh6bzigADV/o5liynp/jlAQbPpQIbKMDZzDN33o65eyIjeF2zmPS
X-Gm-Gg: AfdE7cmGe896UWscvmd8AIYBaRXNIQDAggcTn6T+WDpy43oP37NamVp1M8+s+K0ATOX
	XQY3Q2+eM4+kAInjzIl5OkNnZXYeXW+desJ/CU1qyhBYrMX0kKVueHz4WjF14Dk/trD+B8EZgnK
	heHvTm4U91SQwoya5TMS9ss3FYBleKiRl78uVQ9teFWOt28NEzuNzbpd9xsSHD6hIR73JKqrDq6
	oM8hcj4rS5Ileqfe0ZbP3WPaeab4HQG1ja5/Y9qe/YepHK7aX5upfkwoXm4EC56/iYci5G/KQrF
	x+Ra6hIXQYohK5hZqdTUF1DNUbNkf6hvNO8fzZsfm6mNKoe29n6dEtppNfnocTWg2uS36Hr7/e+
	i55gRulnwO/qKXahE9UUkkg28mrJS194tRB2JzxVTkPqzDWYYPk9jhKn9rsuNkin3B+tJm1KeiB
	KHyBvC8oiLI76Io6cDCOb0KUIygg==
X-Received: by 2002:a05:6102:685d:b0:72b:a25a:60bb with SMTP id ada2fe7eead31-72ba25a669fmr6040804137.10.1782226358877;
        Tue, 23 Jun 2026 07:52:38 -0700 (PDT)
X-Received: by 2002:a05:6102:685d:b0:72b:a25a:60bb with SMTP id ada2fe7eead31-72ba25a669fmr6040778137.10.1782226358197;
        Tue, 23 Jun 2026 07:52:38 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 06/12] ACPI: scan: Retry acpi_device_notify() in DT-ACPI hybrid mode
Date: Tue, 23 Jun 2026 16:52:19 +0200
Message-ID: <20260623145225.143218-7-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX2+lsDUQEyou5
 szXYeypYc9QUtd40HeiSBfmokshD8IQnNcSDBM5v6ew2quE54uvobQHgqQd4G/QWOZmnV0w7xKl
 cbAYbAod9ds9QF20HF15F1pa2gMcv6o=
X-Proofpoint-ORIG-GUID: LscezaSHjCpEK_EwgcLClJaX-foRBysm
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a9db7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=wPdX0GlK9JqYqbOWQHgA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX/OD5A9/Prs93
 YoBl6zLII1bqEmfAovs/6D63nbx0d9zRHasZLhz1l6s8qzC3np9+V815R28sxBDz5kzSHKRlOk2
 XLZSsVf5ipn4wJtF+vO0IeBoxdaSExMa+4IFfMLL9YudqCwtc9vH6vrOKZVXHw3EVq0D6X9Auzm
 4wgXk8zsx/+3aJgzINxvEtICKameFZOQiZnAIBtMIdR0okaG9URRCh6MiX5PaTvvSq8ukC9fNvl
 MBYayMypuotjZRkh71qcJLtmYcqNgJqe9Fkb9d4VtvSrWAa5Qkp1wn32qiCAGbUYQ9G9VkQe1Tf
 GRIhsOD3syWScvE9zy8etNiN6+ZgHHVE6FiaxnLQ0rHgXRVcD/8FmRonMlTyJoy6EttL+CCaH4I
 34JPyJ+buzRoDNcn1EWrbcj2GTla/oDZKm5iX/PLyjfxeNiA5WaoGNF655wPmCZRroa/d4IHEeE
 AM2IB3LPctrgbfUkHUw==
X-Proofpoint-GUID: LscezaSHjCpEK_EwgcLClJaX-foRBysm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114227-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD5156B807C

of_platform_default_populate_init creates DT platform devices from
an arch_initcall(), so before acpi_scan_init() runs this causing
acpi_device_notify() to be unable to honor "acpi-path" properties
in DT-ACPI hybrid mode.

Re-call acpi_device_notify() at the end of scanning ACPI devices to
fix this up.

Note this relies on the driver which may use the bound ACPI fwnode
to only register after subsys_initcall(acpi_init) has run.

TODO: It is probably better to add an acpi_platform_device_pre_probe()
function and call that from drivers/base/platform.c:platform_probe() and
dot the setting of the secondary fwnode for platform-devices with
an "acpi-path" property there. Basically moving the "if (acpi_dt_hybrid)"
block in acpi_device_notify() to a new acpi_platform_device_pre_probe().

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/acpi/scan.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 4836286968e8..b305c03e8504 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -21,6 +21,7 @@
 #include <linux/dmi.h>
 #include <linux/dma-map-ops.h>
 #include <linux/platform_data/x86/apple.h>
+#include <linux/platform_device.h>
 #include <linux/pgtable.h>
 #include <linux/crc32.h>
 #include <linux/dma-direct.h>
@@ -2818,6 +2819,22 @@ static void __init acpi_get_spcr_uart_addr(void)
 	acpi_put_table((struct acpi_table_header *)spcr_ptr);
 }
 
+static int acpi_scan_retry_of_acpi_binding(struct device *dev, void *data)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	const char *acpi_path;
+
+	/* Check primary fwnode is OF and secondary fwnode is not yet ACPI */
+	if (!is_of_node(fwnode) || is_acpi_device_node(fwnode->secondary))
+		return 0;
+
+	/* If there is an "acpi-path" property retry binding ACPI fwnode */
+	if (of_property_read_string(dev->of_node, "acpi-path", &acpi_path) == 0)
+		acpi_device_notify(dev);
+
+	return 0;
+}
+
 static bool acpi_scan_initialized;
 
 void __init acpi_scan_init(void)
@@ -2881,6 +2898,18 @@ void __init acpi_scan_init(void)
 	if (!acpi_gbl_reduced_hardware)
 		acpi_bus_scan_fixed();
 
+	/*
+	 * of_platform_default_populate_init creates DT platform devices from
+	 * an arch_initcall(), so before acpi_scan_init() runs this causing
+	 * acpi_device_notify() to be unable to honor "acpi-path" properties
+	 * in DT-ACPI hybrid mode. Re-call acpi_device_notify() to fix this up.
+	 * Note this relies on the driver which may use the bound ACPI fwnode
+	 * to only register after subsys_initcall(acpi_init) has run.
+	 */
+	if (acpi_dt_hybrid)
+		bus_for_each_dev(&platform_bus_type, NULL, NULL,
+				 acpi_scan_retry_of_acpi_binding);
+
 	acpi_turn_off_unused_power_resources();
 
 	acpi_scan_initialized = true;
-- 
2.54.0


