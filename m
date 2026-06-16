Return-Path: <linux-arm-msm+bounces-113346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /BALB8gXMWoRbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:30:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126068D8D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:30:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OLbs50JT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LYBVEFTN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDBEB318105B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C853D4219F2;
	Tue, 16 Jun 2026 09:26:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D152DD5E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601982; cv=none; b=eC45iwSVkSCPTiGiLwhqpifFJ1p5q6bPvAKgIEWk/Tq1kE1iI9KZApVC8HLrJBeC+//CXN3AzokgioAAfK/FHloUQiIyKTwU5mEx8ZKLgQASQWYZA0cVxmtuwoqQPwIQf3hoQprwxLttKKFuETz0KYVXrrS3C/TGVOoUR7mFt1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601982; c=relaxed/simple;
	bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvmcKHAHSZAGwbp0JE5vmvdjhSXthEzT+/Ocny4brsAcETUQrWWduqzltXqqgL/+lqwzaFrKFMWrqBIQ5oNErsa9Xbo7bqu1lj0tV95RjwODkUdqNKshjNHYEm5VGPE2m66ID145gBQNEznWUa31p4fZxHdtdMCjgiAXDlETXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLbs50JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYBVEFTN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6PUXh2402223
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=; b=OLbs50JT3ko6lv0G
	cNWDEl/ewwvkTEts+t8LFu4H4SQKNckloOWZ2Ggw6rvXqPAXZWRmIlDaKVm+iwNE
	wi//gTfufWY/GfHGKreKaBiS3FJuGaZkutalFw362DFL1Ock8kZRJnxgV2yICd2s
	U0bOpM3+cnf+DUZq1hHv9cbvBw+bRSJ7pP2PO4Fmap7H4maY7gxZo5Zr3gfrbnDn
	PuzGslEgAgWhJ2uf6kBTvsnMaie16JPBFdz+noPx8Nyb//l+W3OpqpY9bGtczhtd
	6iebrH5vL2gpdS/BWMfmUP4YhRruDsmWRDyXsiSL0Q/fEEcuGKLR9Z0PwOH0jdh3
	UTGIbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1760re7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c10cd7df22so66738855ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601978; x=1782206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=LYBVEFTNokK3dKXl8gb0eF+tvFj7HmjVT3hQo7JgS/F31eUrSPwxZVQ4hVooN1QkhS
         i254t4vCPgUEq4sjeGiiqKnklWsd9Lh/ZJBiCfWgvsyz/Rgih4TBrFBHMuhOTS/TmP8P
         m9NLyYq0x7MEPze8tRv21yldFX0awqT6sjKN2wGsCXc6sRFUqh7FxOas8OBv5YgSVLjb
         afH7uuCbnjDId7Ls2whwy7l53/Eajl4lRQVya74fpzGC1szhwuUpRoycnGSs4+KrHpMu
         U3MGkkSe6UvcyEFtsXfcUcU19qFJUzMDf3lWoz9gTetnuARMfhnx+auEhw5k6JWMwHa8
         MIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601978; x=1782206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=OdbTtiN9yi1JCy+WNUjTRIdnZqCJ6/KdhJA282OFs5Ug5aHrhvTWQJwN7IC4U/ZQmV
         pVU1Bs22loZ1iu/TE+oBXZqU7/HFsVLBu+ARoVKnSoYRss+SrxTkRXDs1HHDNviI6PGW
         ZfpYNfGb19/QC1ESfPNZU9lX8M/Ec46PtAxffubPj6gMizVTcJNpnkqdplBXFyZpnCs0
         tdxsKj1yKVfGS8YtAsIzI7+x5LwFOqJhVURPST1Zj2mEFZlPB0ZNXAYx6gGvx8drqCaF
         bsKSVBZYMvqXUp6j0WIovKYIzTmTu4C2D7rIkEG8H7ES0+jNjpmJ3CbwKc7eGNhUrm16
         4KgQ==
X-Gm-Message-State: AOJu0YyScLPlRXcPr2IsGBJsEgkRWAZxDbgR+SJUcgQejWiB/6EqMLn7
	TEctWeK95BHAgcb4iXM9H397WVtQzw3J4MssTd3SO9U9MCVwWnCLhI0NSF2z0vILLxAxRjpQu71
	aJ/nx4xIrH3cpLHMY8MMLaLzAkTUvKtpN+KgLqpwv2CctQ0PSNIOhMJtumSB0xpLyY+XR
X-Gm-Gg: Acq92OEhaNTAhmGWsDUdE20wB9221jDqMXQopGy4O5FIZd8bcG5O6FBrvrdG37efmWd
	4whuE4I/B3dsIzC5Nam+WKFQufRX8QCygou5JGpAjui9LDLGFyrQxfCwXBqqL5SBiGGJAvS6vis
	hM2MttoQZFXkNRBZ1bfzuEQ03Dg8ogPHmOLoove6Q72f53jnfwJ9KKR0o6h307xZ6/+oH4kyvHO
	CZZw/iIUBPAg3P01RqzmpLsMReVEMBxGdxr0OS8HsjXuNKwTTeSlaWAv0AldsB5sE6I3B1WLyHn
	9SDcnEX6DTGKzgEXh67AXKXTdej3nPjHdRJbboT58IwQYSB74RUxuybB0sWKm+W1fedXX9eGQWy
	HrUnb0wGCoIDjaTbMVlRdnDJeNxX3wbwOW/X9G15Oya8kBvnrsQ==
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910355ad.34.1781601978183;
        Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910045ad.34.1781601977753;
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:53 +0530
Subject: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1793;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
 b=cbX7XyT/u8DvjLrvqyg2PFWay5po2rFtAxTJAE4ImX9XjlYmS/pMdjkJGSYdIFFDkJZ4Wu9YD
 uq1tZIvOopCBnZQU8wPq/tuEBMFk3+ZhorAC7VmLEDFwGAkcuJFRUwh
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: mLM6M5hhb-HVTOnpmpyBhjQk630KQ24o
X-Proofpoint-ORIG-GUID: mLM6M5hhb-HVTOnpmpyBhjQk630KQ24o
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a3116ba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=X0Te3_zP_kP_59l6vBQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXyJYoPkIOb7Jp
 zgnJkKuh8vq7iEVCs7zq4AEwX2MQaVcVMi/vEZAzN5p+CwGv/BfYnIsteeLFAs3wmO4p817ER5x
 mOsD6eAEIktzjbULlccafag5xAJ+OGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXyokmOU/G77Ci
 pqc4F+GBYJp43aM8WzFx6gAfrytc0uxNVssaVFeFBPMhETvGXO9zNfuhiSDN5kaqqyjoeP+3hrn
 8CWAdRWHKtJk8QZ13Rnq6jP800RfAVPhmX59GvURc5MYmNP4LXyLhLzdfbZuLzBjWv36nCj5mKY
 is8agk1AR63aisTeah9foI41BJn1DSxi0acVz/1t8I4bnDB+o3B6JwX+bkumk7rapZI4YXphLO/
 s3cPOuoiG5HvayQ2lUCmAtUdoo00RLQwH8XLuLd/v9e1jcp7bV9/fJ1gXfvJTM9P4ezm2XrXCRN
 3iHTRayp9CvZyMRsu/OpCvyGC7N61OgJ1r68WQypbwYW0dGDz9jLUyRjUxy2KxjJn2Z1SReGB/u
 +TfuVbiPSTdxwxHsVmf+UBhnX88UGMvln0xfreuAWC5MpcutWWcRvieAaC5aNIxeHKJ9YZ3z4hW
 qyG5VumYchHpP1MIejw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113346-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8126068D8D1

pdc->enable_intr() function already points to respective version
specific enable function. pdc_enable_intr() now only kept as wrapper.
Remove the wrapper and invoke pdc->enable_intr() from caller.

Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
however its only required for pdc_enable_intr_bank() which uses
a shared bank across all interrupts. pdc_enable_intr_cfg() do not
required locking as IRQ_CFG registers are one per interrupt. Move
locking accordingly.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index b9acb0f25c9c..6c556464d37c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -206,6 +206,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
 	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
+	guard(raw_spinlock)(&pdc->lock);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
@@ -223,22 +225,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	guard(raw_spinlock)(&pdc->lock);
-
-	pdc->enable_intr(d->hwirq, on);
-}
-
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	pdc_enable_intr(d, false);
+	pdc->enable_intr(d->hwirq, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
+	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 

-- 
2.43.0


