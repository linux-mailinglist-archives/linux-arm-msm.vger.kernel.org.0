Return-Path: <linux-arm-msm+bounces-114224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cNMAOsCdOmr7BggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE716B8084
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kwa28SvQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PaYpvCYY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114224-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114224-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E927B3001876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF383D1718;
	Tue, 23 Jun 2026 14:52:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36C3D0910
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226357; cv=none; b=G7v+pKN19Uud3sEatwddsK7/ZSStHXJ+vAh1hfZFatfaGf4nd2E2FYDNKhQnCbJBNvs2lwCEglE2SDqkYWgBsBWMRhciRy08KEGhV6Vyth2HdOLKwrmgVMm7hpeAADGHFn5+BxBfWQxLl1/ylzwYgmjo9ELxo3T9NQz9v36MD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226357; c=relaxed/simple;
	bh=zDre3UYfu+bNvtbqlWeBmCxN1oWAuVcva06ty0WiJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBkY/RwR+zgThBjChO1WS00KdoRz+NeiHflVoQQLV/RRJZiMAz6bRKyfoB0BKbH9cp/GGFpZAABs2BmvpjekyvkA6puwNlw0gBX5VddNyaLaS9cew31NZe6422w6Wcsb118pdBToTynqk0dGkjyScsNVDYHtp7RZUsPxzDaaoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwa28SvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaYpvCYY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYkuW113506
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RJVm2brt1ck
	UIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=; b=kwa28SvQrt3egBJ2d+tL9tOcFn5
	sIkZ2yhrfYBfbXSV4hdd9WJ7B6C/1ue1mD7MLD5hxaEolvu2Fg+a8GHgBX3kzRwe
	Hzvq7lNaNWrZjqYeA4LH+HxXrtod0Zl4i4hVlbuRDgTiVVhxy86pc1lhXi2SWmLq
	sYLfn0tgDIFR3URLK4IGxBpAKLNLBnYPEhePIQ5RjnMCZKAsQbKtJ8OhNrH6gt3y
	XjIEAbD2ER6nhyE7L1j3O3v6BSrI72Dq1MgPqz9p1Bf+Jt+7X74om9rY+BFueWPg
	8PJbIsYuuQUQiQJKZatYZ8alYE+Qqm5bzYcc7JdR8mteEzQw+HL5erE61eg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvt387-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-964172af027so6543654241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226354; x=1782831154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJVm2brt1ckUIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=;
        b=PaYpvCYYllwvnLPxaH83pzrNx3mTnqvdkgLMxT+Hi+AGv1jILQVSjeTDjQUtpnw01g
         nasktD+wcb9HZnIro+YwBTXN29TP+0CLBjIgXjh8yc/AkP6tneh3M3uhEDaLFLszPL8A
         bH2jR1gEqmWuNTZ35UC7jhcdAjJEq32Ml4CLvjNcRMBN2cyK9EQMzW0bwoiCkLOO8XzN
         MBDqfEdkBHvHAxzJwlRoGUD8R7pGk7wETFPQh1RWy3aI37o5zIZdPwOYVSpoMl5Socqo
         NHPWC6mlyQpSqrTvvgiW2+YkHlVXUE65U+Pu2jkbKQS/KW0xdHtUZtC7cf+xugdhJTzk
         NYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226354; x=1782831154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJVm2brt1ckUIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=;
        b=IWADWq0ApYapBPEWJ4/GFLA1nixLWJgPLV3YlytmejnRaCAesS4zu7UUDOV/LiPKQG
         0b8tCoirNMjTV/zGxNa/FrsWUS9Hiycbrxag4BhZWhLw5sh5Kx2IG4nSnz3zRA+dN8Gp
         vg0HRfy9PQwFFk27eRs3q/S964HxZXtSBQMlzF7k5pMUlPHJJxdMrWYbiIpBswKKfj3Y
         1vqvlEzG2MQcTGU4+9hNdYT5vzF7sxmqQZPy2O6DeK1qsNG+P2LapPVQNuaTZoT6rD+A
         +scliE0KmZ5sPFUitwpu3+Xav1vk3naXd6mRJTFzvQ5qwe7WSw6xQuPzkR56zO3E9zMz
         PoHA==
X-Forwarded-Encrypted: i=1; AFNElJ9NUXNcKToLR5KC3RKzqFAG9B0pVrZHHNRtjHYrwNv0PiF0h8MruFH1StKovK3sVKtYqpA0KBzyz26Sxszr@vger.kernel.org
X-Gm-Message-State: AOJu0YyYI9UNN9uyeCybsYpFWloCvlqQMoasG4syDCppSy2ozHFBxliw
	QO2h8AF8ifv/slPINNIAjqqdA6ADkeWpZSH2DCTu4iZLcKpEqev1IGn7mcLC0bTIP2488MAU/3W
	K3FkhZX6YTYO+8ynecGonw5va+hCDktNdapJhCiC7Bc0kRBUs/Q8iE9x2Q7JQFjviUlQs
X-Gm-Gg: AfdE7cliUlMJayVv6WsaIVCVgcNcYg3pIKncv5M4FU68hPPb9LB2e2EcVKv2myRx6zL
	QfQCDsTnMNmKu1nEdfjIzpmYtpdTf+EOw7hVdXS9jp5QkdtcH7oWzrbZgKCL+igg8l8dk6UANeS
	BSjCUOsZUsKoVusCUc+BrUx0fHjPtB++boCaGvkjV2CUF0PMAWqA/f6zbcFRNDBMRdELqMv06zQ
	JLYq/9jnehdSUTDkh/olWNQDzZcNA2RGRUX5CWH6fR6Sotef1/HeJv/kXiTRvJMBgfKKyj4NZGG
	Cos+saocuPC3CYhMM2BzfCTJRl80BuVRac0/u6hABGWgA1tJWNUYMYjrsv1wda5L9K1YAGU2yHb
	uu2pfgsoiztzguNlGyog4JDBPf3YsnnpiLG4rf/CF8XkCdn9yUvmxuqNIFVhaNstNB4xas75Ehd
	G/B1VLAgysuUOfx+WVfDLJYyEvMw==
X-Received: by 2002:a05:6102:6a81:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-72fd5ea52b7mr1890215137.12.1782226353675;
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6a81:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-72fd5ea52b7mr1890185137.12.1782226353222;
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:31 -0700 (PDT)
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
Subject: [RFC 03/12] arm64: acpi: add acpi=hybrid support
Date: Tue, 23 Jun 2026 16:52:16 +0200
Message-ID: <20260623145225.143218-4-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9db2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZBzCgZ0olsrJ8aaC5scA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXwIwev3ZPq4Rm
 Uqk9aGzwdPnxHQg2r9qJV+O1zhmmEVoZiU4u0G8DUkgTpqTuC37Q8tkIrYdo5+YFYEN5bwsgQRH
 pHxdt77YqrUvIGtyw3VcsLgrzYTM6Lw=
X-Proofpoint-ORIG-GUID: BjekAmh0-Ytf9odUBl-98m28PM1XQdQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX98U+sfM/WVVj
 PxmioX7aa457yEB1HqXua3Zv9LG6pVg/evzgVf9XLGTxprZ2oI5C4RfY/ctVjk2hmtmqMUB+utJ
 f3YuW5I/YIyEYLPpx9PSh1ZTh5pXxkxOAbi8epsLxh8u16Sd2AMuMOeZt47iJPVldp16Az6NMla
 kTQhNOXWetGmoxJVGgbUG2pT5vZ0UBTtt9H8ZyZqACTsgLkIlyeaZlsM55BAiq4sxETLEpRBVBY
 hLkWqHEhSzMjPrpk05qVATpNmrh+/mjLhFi1WydBD7vtp451YqAlB6YDF81YvKnRGl59ynFiFoF
 2aR7+t3Ahk5Kgu8A1JXRsPW5GSn5aNlpWOz7Yu7PyP1D2TcBGcnRsVFHsC3g4rBO6erP9wK5brM
 zUWpqltk/JXaqAy8cu8P5qPniq+mC4O3lrFs8CEpstnRlNNXWo5oU4hE///CJFsykmuDpzfeGAk
 SowIQcsop1JECrc9wqQ==
X-Proofpoint-GUID: BjekAmh0-Ytf9odUBl-98m28PM1XQdQd
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
	TAGGED_FROM(0.00)[bounces-114224-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEE716B8084

By default when a non stub DT is given to the kernel when booting, ACPI
gets fully disabled.

Add support for selecting a new APCI-DT hybrid mode where the kernel
booting in DT mode still loads and parses the ACPI tables, without taking
any further actions like creating devices.

This will parse ACPI tables and populate /sys/firmware/acpi and
/sys/bus/acpi/devices, which can be useful to e.g. get an acpidump .

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/include/asm/acpi.h |  2 +-
 arch/arm64/kernel/acpi.c      | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 3116bb872f47..8f8a0b9e49c3 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -76,10 +76,10 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HWID
 
 #define acpi_strict 1	/* No out-of-spec workarounds on ARM64 */
-#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on ARM64 */
 extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
+extern int acpi_dt_hybrid;
 
 static inline void disable_acpi(void)
 {
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 06ab3a9da64b..9d2c42375afe 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -43,11 +43,14 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+int acpi_dt_hybrid;		/* disable ACPI-DT hybrid mode */
+
 enum acpi_mode_t {
 	acpi_mode_unset,
 	acpi_mode_off,
 	acpi_mode_on,
 	acpi_mode_force,
+	acpi_mode_hybrid,
 };
 
 static enum acpi_mode_t param_acpi_mode __initdata;
@@ -65,6 +68,8 @@ static int __init parse_acpi(char *arg)
 		param_acpi_mode = acpi_mode_on;
 	else if (strcmp(arg, "force") == 0) /* force ACPI to be enabled */
 		param_acpi_mode = acpi_mode_force;
+	else if (strcmp(arg, "hybrid") == 0) /* ACPI-DT hybrid mode */
+		param_acpi_mode = acpi_mode_hybrid;
 	else if (strcmp(arg, "nospcr") == 0) /* disable SPCR as default console */
 		param_acpi_nospcr = true;
 	else
@@ -203,7 +208,7 @@ static int __init acpi_fadt_sanity_check(void)
 void __init acpi_boot_table_init(void)
 {
 	/*
-	 * When no ACPI mode (acpi=off|on|force) has been specified,
+	 * When no ACPI mode (acpi=off|on|force|hybrid) has been specified,
 	 * enable ACPI if the device tree is empty (it only has a /chosen
 	 * node, and a /hypervisor node when running on Xen).
 	 */
@@ -230,6 +235,9 @@ void __init acpi_boot_table_init(void)
 		pr_err("Failed to init ACPI tables\n");
 		if (param_acpi_mode != acpi_mode_force)
 			disable_acpi();
+	} else if (param_acpi_mode == acpi_mode_hybrid) {
+		acpi_dt_hybrid = 1;
+		disable_acpi();
 	}
 
 done:
@@ -257,10 +265,10 @@ void __init acpi_boot_table_init(void)
 		 */
 		acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-
-		if (IS_ENABLED(CONFIG_ACPI_BGRT))
-			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
 	}
+
+	if ((!acpi_disabled || acpi_dt_hybrid) && IS_ENABLED(CONFIG_ACPI_BGRT))
+		acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
 }
 
 static pgprot_t __acpi_get_writethrough_mem_attribute(void)
-- 
2.54.0


