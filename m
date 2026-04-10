Return-Path: <linux-arm-msm+bounces-102716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHFKML5E2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F73DB875
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5562E301A394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5353E3C4A;
	Fri, 10 Apr 2026 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTnrRsmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj3+eO3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D03E4C79
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846534; cv=none; b=t/8qUDW0OOL5kLrBlbA4QI0VRggWSW8LVlUSz+4zV/G1a7yoOcweZvX7lQ77VdHamLTUqfZuVtYkJnerBcm16IIrA4MfV1qEIodIJyw/lJ8w2z80YPMFEA3VGNGlFZoYnP/R/o/R9PqRbZLOdBkUNMHOnwWRCtKNoYiKgrFFkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846534; c=relaxed/simple;
	bh=xyArX76Xqz+izb7H/ueUcrZPNdakdpGh+RzpHhujRNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rb1uC+KETQCt0YQfI6ZrpHUnqxfTSgYzMrLaHF4ndBhI1r8z8iBJkSYkkx4z6P8sA4yS8ZP2uztA7q3Z3gmUSEk78F/OVhTTeT3gL5zZVrX6CxB8XCcAp3t7UlSA0awUsh7tpqEaItLPA7I9B/hfVWJ/Qib8oX1K5jWiKbetUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTnrRsmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj3+eO3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHmYlP017380
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CIW3MZ+AFgJ
	HcOuoXboQfh2mjI50RXd14rVdL1yRUF8=; b=mTnrRsmGSbGM8p8XXXFYeCY6qTH
	hyLYUylXvxRJelPy7rbf6X56N3erWnZF0K2ADRQJ143pp2oLYKLW+vfxq1KeqRKA
	1aniqiZwUZxzf9avEJEL9KWrbZ8lkHv+le/QCknhvti9sqguwXrulaQRxHHg7on3
	fMb29xiaMBbUgNJfnbl3xh9T4TxtOqPS3Vb4UtXYpQky2GUxIGjl/K2DMYvU0e4m
	//qcpABXxT48XZXLVPyAExv/zKZANWjNIUv3lNycBZidMywujvyj6Y3XYCiXKhcd
	4zZQBaoofq+lsSr/M5DdIcM5C9la7ZfPUVuoCsAp+gGyZrgGD3XO41emEag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j1m2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79281bd14cso384655a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846532; x=1776451332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIW3MZ+AFgJHcOuoXboQfh2mjI50RXd14rVdL1yRUF8=;
        b=Qj3+eO3aIGxzCAStMtYgmh87Sm20JtJVGAFeaCIuSlQobNc3DImoX+qv9+n2cvqiUK
         9q/6qDMMKvS0wMA+ckBsmuaLkKOw/kQare1FmRVl1FuXD3IEwb/67DcWKMUft1z1rNbA
         +FlBZY77dmKikuryEN2Bo/Hy4Uen0H5ZubC+Yq53Ev/VKWNXpaTF/XZfUHqcW4mN/4D4
         qozAcYYnR67ZXAR4bWSR8b69T4bAg/FfkH+H2d6Zybi4Poy3ukDTeDtXkrd0TSG2L1ZO
         ebjKQzgzQr9m+jjOcr9hHw76irUf3F5b3chDyMR8GnbbKFUmec9JrRywgRXmI+lgeccL
         90qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846532; x=1776451332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIW3MZ+AFgJHcOuoXboQfh2mjI50RXd14rVdL1yRUF8=;
        b=oDUlqd4CURXFoxgVsqzrpbDwPQ3RaI6G39CwbNkovhXiRiw+laelp5OVFWpYCp4AmW
         HqZDabgJASuCh9E3tMtcg8e0zJQYAX2G6KAZFLRhPvOE8JvErqmf5vY+lUzsH2Je+5en
         ftNjB0bGf+yHbQqHUNSiCHNdW1bjC1sP72DE1RGgnDdhui6CROFXnSjsXEO/pkUaqONS
         2IZm24fS9ApMx+vRZDgoq9f4dbdjvOSHk0S76RlPRoSkDiM8WVs1rtsUxNNQNNyL9hZl
         rtNafTppV/3k1d8y9Iasv+DD4rqS09Za76Xg7t/fyibg+du5bYNqTuIJXMVlgY86uSBf
         jDMw==
X-Forwarded-Encrypted: i=1; AJvYcCXKtlMx2Cv0FmUDFPROi0Sc/RORYRrR7NXON4houyLZaWpExfptgFDWMSTCzi8p0Fnj2eiypWuR0cVTrLA1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPsp0l6+W9s8t7J6IBC1m94KS6ltPRoEdRPYRrvwbybNVLy9f
	Zi/fsFeuAk7OwGMqx1YFkWpFMCZXDcMErd2jF5gneJ/KxhHRyQgNNek4T0WacbedgjeviyPLBxh
	AoIxUcLkKMyQm6SXDl+Z0APel33ySoZdIhjLr5C4uw+IOpaCtGlOlTwGhieB7zsHsAp2u
X-Gm-Gg: AeBDiesjtCKmEpGeB25BMS5fSNHfggbjVShpvyDK7MG5tpCCkirqVN6oxjL1TBP3+4e
	y268ReCMKpcDN2wYYc7I/obFV8gi8D+jYgdejCQibXP1aOvd/4Xy6TYj0yXFUxPYBIVkNmpAoka
	OP+zghFo+S773bWiTRRRKDIOfWAZh63xkKXhNe23Qsr2w873o18cCVBiIqPaYx1bCz8dir6qdQP
	7duSFJ1PC8n5SsHDhlmtCErew/u+R0EPoaBB1Jzabkyr07oU6piR1BRVBJyX95BwcRrwXmikK2N
	VCB9+MR5rZzJChKEEmY6LxLJVzBEnCQ99d9yrGKaesOnOYZDKC8bYw4s6qItr+xk2SOAtnPBpBF
	NLmJCzG5mHVLmUxUkoiSou7pw8fzHSILglLybk5vciBTYMMZV
X-Received: by 2002:a05:6a00:6c88:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-82f0c24e1b4mr4025951b3a.36.1775846531520;
        Fri, 10 Apr 2026 11:42:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c88:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-82f0c24e1b4mr4025916b3a.36.1775846530818;
        Fri, 10 Apr 2026 11:42:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
Date: Sat, 11 Apr 2026 00:10:39 +0530
Message-ID: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vswB9KGfFIbQaqC2ei1pOBKBo8q8pJML
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d94484 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eikPim43zSuFQStimlMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: vswB9KGfFIbQaqC2ei1pOBKBo8q8pJML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX7TClxuZBWygl
 BfjonqEBfmMKSyOrpvTLIu6Se8VcEUttDujUpDmHc09cODbbqZ0hyri4mKawIrUAcy2TdWkL53U
 jpNa3c4zHdwWpphTQ2KHhM33sK2rBFQIXNngByrZjFBRRY+Oi0YwGzJEqz1+O4EXnA9w9TTKi5Z
 B5TmKimFyyDFDudKtQO3E+wkMReiJIQ4vS2vCBjGKkvQh6fimmgQi1vxl7qEAOOhh19TouQJfNp
 O4OfRXkNYAH+n9g5amF8ix28/pfX57OfWrftrLAdb+GbV2z565nWvYI2Q8xT/rCOU7kGF4pmy/W
 RmJz88pQTztYsxMWG0w6HDaHojO3rxFhk1NhZKBvCdHegjwEq6TTLAtt/+5V9xQy2t2lk/vt32p
 qWZFr22ohbwfNIXSki3LZVQKyqoLATCb42O6uO1s7KI3QZSVfcG75GVBzGcmgPO/iZqIRDbGFWD
 w8yFtd4BaM4poixnh8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 592F73DB875
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The __pdc_enable_intr() function contains a version branch that selects
between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
HW >= 3.2. These two paths share no code and serve different hardware.

Split them into two focused static functions: pdc_enable_intr_bank()
for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
change.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32b77fa93f73..a72e32896e64 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -97,28 +97,38 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
+static void pdc_enable_intr_bank(int pin_out, bool on)
 {
 	unsigned long enable;
+	u32 index, mask;
 
-	if (pdc_version < PDC_VERSION_3_2) {
-		u32 index, mask;
+	index = pin_out / 32;
+	mask = pin_out % 32;
 
-		index = pin_out / 32;
-		mask = pin_out % 32;
+	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
+	__assign_bit(mask, &enable, on);
 
-		enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
-		__assign_bit(mask, &enable, on);
+	if (pdc_x1e_quirk)
+		pdc_x1e_irq_enable_write(index, enable);
+	else
+		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+}
 
-		if (pdc_x1e_quirk)
-			pdc_x1e_irq_enable_write(index, enable);
-		else
-			pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
-	} else {
-		enable = pdc_reg_read(IRQ_i_CFG, pin_out);
-		__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
-		pdc_reg_write(IRQ_i_CFG, pin_out, enable);
-	}
+static void pdc_enable_intr_cfg(int pin_out, bool on)
+{
+	unsigned long enable;
+
+	enable = pdc_reg_read(IRQ_i_CFG, pin_out);
+	__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
+	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
+}
+
+static void __pdc_enable_intr(int pin_out, bool on)
+{
+	if (pdc_version < PDC_VERSION_3_2)
+		pdc_enable_intr_bank(pin_out, on);
+	else
+		pdc_enable_intr_cfg(pin_out, on);
 }
 
 static void pdc_enable_intr(struct irq_data *d, bool on)
-- 
2.53.0


