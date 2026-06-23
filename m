Return-Path: <linux-arm-msm+bounces-114228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTC9M8GdOmr8BggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33C6B8089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:52:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mDG5jzQn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bjgtUzN7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8BCD303D83A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BC13D3D02;
	Tue, 23 Jun 2026 14:52:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD863C9EED
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226366; cv=none; b=Rd0nTaaoiXFH9tQ7uQ0QNlzVKCOcy1mBfL5bpCxSFwoG4InxBdj5ZwmQM5KxrqHpowLtqLKeol31H0Ba9OMryl9QX47g3zegZtH2ZSTOHTEF2ozmSj54B+5IN2FwSI35K9Z7bEdZzjUmy+Fixm5eYUynQNKHQSHWC3gGI3WHIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226366; c=relaxed/simple;
	bh=w1Tg1h1Bgp5ctFJGKs+G8GxFeRFgC+541niNc4ABUxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT7Rr+OTdhKWFVMNABnWLXivAmhBaa1JX8wBaT/Q0EFrxHUK8CnrglobL2GhgmYxL1dUKx9nw1xmfzD4XXgI6rMLvg5ZC++WoLkh4FQXId9OoQeVPN6Agf27J74qCuPPSp1VXVa00lXIqTIpDVl/kfo9OfZgS8XVkYzTQxwFLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDG5jzQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjgtUzN7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZkuv4052866
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dXE06i8HxmQ
	Ol06JW6DpL6opd4+mAGICEb5DJaAD4dg=; b=mDG5jzQnapvPqXFTkgcr6HlUups
	W0uACFOPLpgBanmxEKmsM6mrC3TiW3v0ld1UgzvFr4cbXFQbCW/8+N1vdX77QSNr
	MEUsQ+y5vGawwrVExZ/Cd5uOWxCN+irjUIArWnipkBsp00Pse7GSQxERFeBaBwJh
	en+ikyPDgUgQadE+R9pyNJN37KYBRBQUE4k5dwgltx2KZXeiBqUdVaCQUwNCXJ8f
	ixFIrC5zfd867mE7q6BIQYJ44ILCGZtjTJZ+RUnbsUJ+PtwZTjMY8DQX4VwViHKH
	PAET6Q15VRujH/vWVMeimUeJ+hDfsVc/tWmsNON4DzLGaMuDi5O2dXMYd7g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ys3a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966cf5e2a48so2794427241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226364; x=1782831164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXE06i8HxmQOl06JW6DpL6opd4+mAGICEb5DJaAD4dg=;
        b=bjgtUzN7M2iM7cwjH8snYqBkRhgqJAvMCKVIufWahNCQleBNGwOCDsXMYpKRVp2APv
         QoBdMv5F74BIPBuX3cl/7qYOAE0Pg8mJ6Thlx3T8sAJwoNUsWBZkNV6RpLOykUeVyNeb
         gJPFSbgkmLne8DC4PT/kM1aMOTmb8DL3kK3n0rccmMSXi7lAgRsJBfEKZCSGkN38Xzqd
         hxtGewwBZbqxWvPGM86shN7LzpQAKwY6Velh01cL82j6Ox49hwRuo2jhl+qk/YXhfjfU
         PS9bNcZzeUBAJcDxYOokJYH94W4cjvkUljeGTMCCg/mZ0r5hlF/COqmvU/UUVjgljjIw
         gVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226364; x=1782831164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXE06i8HxmQOl06JW6DpL6opd4+mAGICEb5DJaAD4dg=;
        b=TrY59mTI7Utw9fm+OqqG3x8fS8fVRZdNmoliG9Bqh6Zp9rzBb28J0Azadrlj0QApdA
         5CD9v7D1p/n+ezrCIWk2ZkXp0yim0acEWeG22Cb6sJR6zVOF+wyX+IuRx4SvAN78lElD
         qeVQ7Ecf83Yf3/xOxrMphNnihvt2YBBiB7VQLlN8z4p7DYbHyMPEOj9CCD+2bVsLD3Fz
         8eyxYfEqGAM0Ja4gpA6c7WfjGBB+m9B6PVYfY/uz0NEzV1NT5aDhbI7InRCRSYEF/4lC
         1oZlqcfuyAKTBqyk7PwpjmN6A+ZUQjL7GNE4arHIW71M88bWAkjHX3b5+iFlJY73UaPJ
         7Hzg==
X-Forwarded-Encrypted: i=1; AFNElJ9n9RljfCiG9JURnUfiiZ4fzihP2flgG1i+s5ktH5dHJeWvoGVV/s/XlcUXMcJFsxP2AiXTUdqYErMNJmPX@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoCQFMRGjCkEp8XuviNLextwwNMJhxv7MWWkqiIYDsndwRZor
	bVs1IyHZrNgLAd7Hl5Bt8HFJJafaW95EQuBldlIaxWbgJG4xwoMcgzG5rHKQ73HnI8Y2eVxN/K/
	EYcigbRjZc7us8k8trTx0e4lvuIdfDskj4MOAdjXIvGQq/iCxnfpvjIBlZkRmfQI8Vs7H
X-Gm-Gg: AfdE7cm5YpI1fgwLqQtH8q3Io5bAsWmn2cUROLM/P9V/pWL2Vcaj2CHFKgkf3pB99xh
	ydmXp9+9zrzpE4EV7W8nSVR0AZCXmD2CXrFunkrRyxH6r+RGrhY8MlWaVLMycp0mmCqZ02BMu0y
	xf4jI7fl3rkU7fsDjaiWDR7E+2BTJrGbmCT1o7aDIq6furQe7wIl2raJ+9ok0e8/fdFmCOympj+
	JAvYZY11CrOqEs8II0ZEOkM2UaEX8UzUvtROor83XSZ2ALDXx0jFeCZawYrnjz6+1Y9w81/W+6T
	9RBmSbtgJ+h0WKuTBhAGF6C++C6VrE2MHCPMpMb0xs+NwFwlBVY8WzvO7MMysLP7z6z/DXZ1m4q
	W+5aBEdWNQhjv9VLwb0YPP8AcuL9sBPkDC4C9Kq4KePLm4BP2yhhTdHroRbEUqg93w8ZaC1TmYf
	hMyCiI9lYsEhzHG31u+K5vHDEFNw==
X-Received: by 2002:a05:6102:2928:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-72ff73a4640mr1396815137.29.1782226364136;
        Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-72ff73a4640mr1396795137.29.1782226363700;
        Tue, 23 Jun 2026 07:52:43 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:42 -0700 (PDT)
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
Subject: [RFC 08/12] irqchip/gic-v3: Always call acpi_set_irq_model()
Date: Tue, 23 Jun 2026 16:52:21 +0200
Message-ID: <20260623145225.143218-9-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a9dbc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=L1rKWosBgnsSvNafh98A:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: sSNLXHWPInF4CkQ69E2DZdNnMXQHLMnf
X-Proofpoint-ORIG-GUID: sSNLXHWPInF4CkQ69E2DZdNnMXQHLMnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX0cNDL5Z+HRsX
 i8rZcnZuCtQCImawCvJ+tSftnWqKB1WpGUr+tg5XCXZnphqfXSXh1YUa8amW65wwiGSR2vfJ674
 T+K8VjrLhADIcpb72VMQbPGCrmjL8YmXzn6Q7wLNJ2EmcC3TsCc5pSx3zBWb4lOmNLpKV7+jV/9
 wo0Au+wFuXGruUAr3ACgLS6RGZE4r2f3BB/fFNj/GMsMc8mgih4DihwMay2S5XWnzzRa8dN8sDc
 4X7sgsY+v/kYCcR7YpwF5wU8tu2ZsxYJfs8xQ8ghUFejpDsIu59Sg/yR+Ct3kHxkgrBMbrLZ3ny
 68hcc6XfT7GBdAk8wNWJXrYC/xf26BVqxdMLG6HUgEwKrIwPm3TEcmjBldqY1Ss/eBygdGaU9BA
 X/eXx6ObIVu5MSAJYIF8PeHOPwhF3AtqVSHJakO60o0r5UPCjF7+e/Kh/9uORoYBrz//HMF96v9
 TxAQ1gCCFbSjX+qNt4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX8gOTAV/V/Odx
 7gQZhoxQIpKRlHczn+sp2gy+waT49lpqp9JoIDTX0w8/ElqzLoyaO/6s7qxeAA18NDD5uDgiZ4Z
 FNdRDZPoULnAIxvz8zomswaNil6d2OY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D33C6B8089

The gic-v3 code used to only call acpi_set_irq_model() when the GIC is
enumerated through ACPI.

This causes problems for DT-ACPI hybrid mode, where the GIC might be
described in DT but then a driver using info from the ACPI tables might
call acpi_dev_get_irqresource(), which results in a NULL pointer deref
when acpi_set_irq_model() has not been called.

Always call acpi_set_irq_model() when CONFIG_ACPI is enabled to fix this.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/irqchip/irq-gic-v3.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 99444a1b2ffa..2ccd04689a04 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1974,6 +1974,23 @@ static void gic_enable_nmi_support(void)
 		gic_chip.flags |= IRQCHIP_SUPPORTS_NMI;
 }
 
+#ifdef CONFIG_ACPI
+static struct fwnode_handle *gsi_domain_handle;
+
+static struct fwnode_handle *gic_v3_get_gsi_domain_id(u32 gsi)
+{
+	return gsi_domain_handle;
+}
+
+static void gic_set_acpi_irq_model(struct fwnode_handle *handle)
+{
+	gsi_domain_handle = handle;
+	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, gic_v3_get_gsi_domain_id);
+}
+#else
+static void gic_set_acpi_irq_model(struct fwnode_handle *handle) { }
+#endif
+
 static int __init gic_init_bases(phys_addr_t dist_phys_base,
 				 void __iomem *dist_base,
 				 struct redist_region *rdist_regs,
@@ -2063,6 +2080,9 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 			gicv2m_init(handle, gic_data.domain);
 	}
 
+	/* Also do this when enumerated through DT for DT-ACPI hybrid mode */
+	gic_set_acpi_irq_model(handle);
+
 	return 0;
 
 out_free:
@@ -2534,13 +2554,6 @@ static void __init gic_acpi_setup_kvm_info(void)
 	vgic_set_kvm_info(&gic_v3_kvm_info);
 }
 
-static struct fwnode_handle *gsi_domain_handle;
-
-static struct fwnode_handle *gic_v3_get_gsi_domain_id(u32 gsi)
-{
-	return gsi_domain_handle;
-}
-
 static int __init
 gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 {
@@ -2588,8 +2601,6 @@ gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 	if (err)
 		goto out_fwhandle_free;
 
-	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, gic_v3_get_gsi_domain_id);
-
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_acpi_setup_kvm_info();
 
-- 
2.54.0


