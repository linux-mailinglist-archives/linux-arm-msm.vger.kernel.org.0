Return-Path: <linux-arm-msm+bounces-114223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Od56K7+dOmr6BggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58A6B8081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AldcuCTO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gvQbqpiy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114223-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114223-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07101302107C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8E63D4119;
	Tue, 23 Jun 2026 14:52:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9087F3D45C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226355; cv=none; b=L2no+ZnurUZ8jUlT0W7bn8SF2UfLr0UabG6Oqi7Do17awCisnNHe2v24fXFTJvHnrJW2LFluZZ49HvaLeMzGhnJmwoBvhhpRVZXfT4VJ8rx8RRdkfHiic5CjYFh1zy1ekdqSI79qZm80xc7GW5tO0Pu8r9tCHj3Lfq3tZvZkTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226355; c=relaxed/simple;
	bh=h7T7xhP7YLAGw7hzAM+n2xON3UAZSlyQMOe106aKDIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv9WKwidROZu252FAGqUHpGGmxJuHNRpHY2PEvbKhU80IDIpSlauORk2lGxCWHLIldEtT+pSiwF0+yy8q0dwikq/9sHeCbxW7nlvj3ADdVQOnEXFuu8hDehYp95Ek91e//NbZbsefNxds94FtNM/YPKoFikI/by/k8m8a1iiTD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AldcuCTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvQbqpiy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYh1V113460
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PNzW3v/qAEl
	CEj/K9kV1a7nB67SEvzFBq019ospcWl0=; b=AldcuCTOeBTXq/xBZoxqlo6XkTZ
	/lJ0hnLBj7GmoYVKTkt0dvNqLDTImW81YFe8fLR5rRFdrXNc2PIx+bQ47uhaAEKF
	fJm/h5OULBfFVK9VRMKIP7kbDsxbYG5xO2pRVqKmx+4BEyrABJyAJXLtX8feMncv
	Qx3KAE4AUN/TOLVh2CyRiirhgXYb0kJoJ1MUxeTe1WKm4M6WTpSy0euo6OUkVFbW
	PNcr1oqEHcVUbYFA2LM5Zy6OgUspE1N1f+AbzE3SJXz2L6CZfiJoO3Ff/sS0Ys4I
	pI7/bXPEF5wRgKiBNl53POWVFnDqrh9WOMUwLBsXQfXtXdBCBF9RUcyOHfQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvt382-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751c50552dso3469243137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226352; x=1782831152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNzW3v/qAElCEj/K9kV1a7nB67SEvzFBq019ospcWl0=;
        b=gvQbqpiyTUpRgBAeJGPHRlqf32DWW/FW67EjFhgDi4lrhyr8krn41B2rdCMfQ3w6LL
         KY7TNq2qIvw/ZbuIOSrR+ZWH154JPXK3Url55YFjqehWvDCcHypplDOxyTu51IW8vjAv
         TDHQ9gVUJeRK4w/EP5tsPSgTr1Ns7PTSfPJcAEfmhk8Ru+JqUlg//jKxsXFD/MLmvCmx
         OR8n+n6+1rJ/zJjekg4KzOuX1FWo7Q+/yXqDmfRtk2RyqvBLGKmkwXCpwsukfCC/rylo
         h7kq3zLq5nFN0XjwzElldfEo+mPiuIQqmZRRXL3f/u3thGDSxnzB7jV6nAnKB9cRg3CK
         PUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226352; x=1782831152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNzW3v/qAElCEj/K9kV1a7nB67SEvzFBq019ospcWl0=;
        b=nvPrLrQ8o7pN2SzXXrt4QdC16dswZZII36O+5jVHGtDb/3Om76neWfH9mGGtq1fiWo
         JGTUYmxQZqQDG9vdX1nMdBy4c7RkxPhMJJpQI7RMXzglRcTAYYmPdCLikhU0SYRl31PF
         qyT2kOqPwpDzjhz1lm8Vpf2BoppDrMUoJiSr2dpO99l1Tqmrkb3yu5pVn5QNays6RUji
         4maVymHmpSRVBLaTzj8yTjEC8e750lfHim0Mygq+8uh94qg3ocv6Hh8wB8CNNgmprVz2
         cBIR9KdnaXl3Yikmcs/o0yEaVTYVQzATfEFt4ptOQ1Tg09/8t1UeUpsr5KxRBSAsz8Bu
         GZEg==
X-Forwarded-Encrypted: i=1; AFNElJ/Rm4njcCSHJItN7FczuvbKaxAd16NMKEEDZ4WyIaaly7b7gyom66hgxVPR0n63tz+s0Z+tuAMEGIEfl+5n@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6G3guaLX0fKOsy8owLhmh2p6oV0Iz3trdaEK7fzpU9odXzvB
	zoykqTTNzwzRZM1d4Q/6/5tE9zGOKku4GHA0RnFS/pXHVh11BL1JvM9qy8pL8A4+lygznptyA6X
	v1fIYGn7SnKEV4+SIXgJAa4b9tnFXcjY/FE6p66Qz/hSkQoqSaeYEjumKPiCU8JJ4pZ3k
X-Gm-Gg: AfdE7ckM05UCNSf9lMt78cz0hF8WqamkfYNHHeb+ZHkAAfpnLQo6QnhqI4TKNqqiMPq
	tR3u6Q/BUGJFmoVvPUW47sCxPymXVzUxKm10VTV+AaLl/uVM+BsUE4ZXDlKkXTUWhewifPn3H3F
	6MiDjIRFC2alQRz+58AE5uxy1eEaxVUbF/bhyxtst00IEsPDSuHg6d3vADCmXRJDIAq8FOsQhI2
	wAsERl8CKq1kClSXoZelxCiWYY/mc6BgVssb5gdz2yuq5pySuzkBim+Um4LrMNpM6KZa0sVTzj5
	Br/1geeHHvJ4j0ClCqazjz4bCsME/wBRQiv6LSb2MGeKcI3OWQDWae1gnZ3sd6cgpyIfeHJj/ze
	HCw6oO1C4lRR970d/siii1NNHxO2Nf2FZvB8L7B8aF/sHAmfazorff9ZvlIz6RX2X7HLZ/ti1ha
	FIz4v8nVbzu86CDSd2JOV/fFCtbg==
X-Received: by 2002:a05:6102:54a6:b0:71e:1c56:e78e with SMTP id ada2fe7eead31-72b669d49d3mr7811743137.17.1782226351885;
        Tue, 23 Jun 2026 07:52:31 -0700 (PDT)
X-Received: by 2002:a05:6102:54a6:b0:71e:1c56:e78e with SMTP id ada2fe7eead31-72b669d49d3mr7811711137.17.1782226351375;
        Tue, 23 Jun 2026 07:52:31 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:30 -0700 (PDT)
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
Subject: [RFC 02/12] arm64: acpi: Cleanup acpi=[on|off|force] handling
Date: Tue, 23 Jun 2026 16:52:15 +0200
Message-ID: <20260623145225.143218-3-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9db0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=1Ljy8mEZPninxW07_PMA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXzjXHvm7XgPjk
 xYIQv4NEE2Tz2HwWL6cUJr/ZRv0UB6XDf9q/FzCZxxsTMdeKrFjiRN2fHoEBJioymDDODZA5XTF
 RB2hgXX5z2GCbwRMfk7i18e1mJTF4f4=
X-Proofpoint-ORIG-GUID: s2NiQVVITU-5lhcQhYpzr6E8fq4TCO_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX6kygvh0M9uxQ
 ASQw2xJ4Kb20LbrUO9sYTFHpXyppcJYohbtmtuRAWhV1QRcyr8FwDFceVkRl+q5pSBAmjse1Ioe
 ye7FkXTjZ4X/SH/Zllu7OOLqkjkNk7yBubLvTEZoO256NkHduWwPgz4x+3TtM3Yw/GIdwNh/eQT
 KJlSh/r0tKqgivjal9qFgFPVP5c5GbsxSSZTKjK45n/f+YXoen2liCNPqqWalbaS9hHPGLEemyx
 nQBImUbTc325YN3kGVh41sZ5/EToRSvWoH06crYncquhT31YnK2mIiXQTGp+X4txevJj0rqvawA
 7iEconcn8T3gZHqho0Sw342f+/kSJHEgcSW9JN2EagdtEwJcN2PjE1sGdtPBnm2YyyZRZ23F5ui
 u7Z3e5vSB3JRHuPhWkNCBGiUD1yiQrThzq/Nt8e21uWFYjSEx67SiIELf/lL2pb9Nqi7uxLsD6p
 3MROEBBzvk+0JZRdQMA==
X-Proofpoint-GUID: s2NiQVVITU-5lhcQhYpzr6E8fq4TCO_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A58A6B8081

acpi=[on|off|force] are 3 values of a single "should ACPI be enabled"
setting. Instead of storing these in 3 separate booleans, introduce a new
acpi_mode_t enum for this and store these in a single param varialable.

This is a preparation patch for adding acpi=hybrid support to enable the
new DT-ACPI hybrid mode, which makes the kernel booting in DT mode still
load and parse the ACPI tables, without taking any further actions.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/kernel/acpi.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 5891f92c2035..06ab3a9da64b 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -43,9 +43,14 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
-static bool param_acpi_off __initdata;
-static bool param_acpi_on __initdata;
-static bool param_acpi_force __initdata;
+enum acpi_mode_t {
+	acpi_mode_unset,
+	acpi_mode_off,
+	acpi_mode_on,
+	acpi_mode_force,
+};
+
+static enum acpi_mode_t param_acpi_mode __initdata;
 static bool param_acpi_nospcr __initdata;
 
 static int __init parse_acpi(char *arg)
@@ -55,11 +60,11 @@ static int __init parse_acpi(char *arg)
 
 	/* "acpi=off" disables both ACPI table parsing and interpreter */
 	if (strcmp(arg, "off") == 0)
-		param_acpi_off = true;
+		param_acpi_mode = acpi_mode_off;
 	else if (strcmp(arg, "on") == 0) /* prefer ACPI over DT */
-		param_acpi_on = true;
+		param_acpi_mode = acpi_mode_on;
 	else if (strcmp(arg, "force") == 0) /* force ACPI to be enabled */
-		param_acpi_force = true;
+		param_acpi_mode = acpi_mode_force;
 	else if (strcmp(arg, "nospcr") == 0) /* disable SPCR as default console */
 		param_acpi_nospcr = true;
 	else
@@ -198,14 +203,14 @@ static int __init acpi_fadt_sanity_check(void)
 void __init acpi_boot_table_init(void)
 {
 	/*
-	 * Enable ACPI instead of device tree unless
-	 * - ACPI has been disabled explicitly (acpi=off), or
-	 * - the device tree is not empty (it has more than just a /chosen node,
-	 *   and a /hypervisor node when running on Xen)
-	 *   and ACPI has not been [force] enabled (acpi=on|force)
+	 * When no ACPI mode (acpi=off|on|force) has been specified,
+	 * enable ACPI if the device tree is empty (it only has a /chosen
+	 * node, and a /hypervisor node when running on Xen).
 	 */
-	if (param_acpi_off ||
-	    (!param_acpi_on && !param_acpi_force && !dt_is_stub()))
+	if (!param_acpi_mode)
+		param_acpi_mode = dt_is_stub() ? acpi_mode_on : acpi_mode_off;
+
+	if (param_acpi_mode == acpi_mode_off)
 		goto done;
 
 	/*
@@ -223,7 +228,7 @@ void __init acpi_boot_table_init(void)
 	 */
 	if (acpi_table_init() || acpi_fadt_sanity_check()) {
 		pr_err("Failed to init ACPI tables\n");
-		if (!param_acpi_force)
+		if (param_acpi_mode != acpi_mode_force)
 			disable_acpi();
 	}
 
-- 
2.54.0


