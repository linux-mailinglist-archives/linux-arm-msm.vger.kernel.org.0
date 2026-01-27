Return-Path: <linux-arm-msm+bounces-90704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UARiMFGWeGnmrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE192F67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D19C8302C900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD444342511;
	Tue, 27 Jan 2026 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5MK7sbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlhOmLAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06033342160
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510355; cv=none; b=gKap4Q5IunJmbl4eElMDdpkRxonSNTc5mTMaxs/uFbTNlv6vPy51A/hpgHmMNN0UjnQNibpYim5Cd5KkXxJUHoSU631w614PrGhd65Y3Y141OgMAIxR7TORyQ3+c9WBB1mKIUWD7hU5rlpvPMT1sE/alFll4bURSgEujd6y5DoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510355; c=relaxed/simple;
	bh=Ze8qTVdrVn/GgssXDGcMZxw7mhSi+BcjLGzHI5OsYz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctUUjH06c9fFFW6pBqU5q0oKAQ15+d29Okzipv2p0PdnbCAa6ei6O7h4GTA9p2hEVWnEe66hpV/PFOWqLKdSZuaNP5UtaY7BaT4XPGKPxOLck0+ZqvwPOPU7iMSXVHJN7Zv1Xm/QjKs3Ywl4dCOtB0KCaXg1mL3p/OCoHwt1EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5MK7sbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlhOmLAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAVK6b3714704
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=; b=A5MK7sbE9LKtIGam
	ReJNwtdBg4MgiCEY1c7G5zXKJbD0mnlwt2wxj3zWhIA8JGLjwaz5J543+Iya/xgM
	oO37lcpoc1fdR5Zb39mj4F8jRkhC3Hw5voTcCInfG/foeA4xfnsL2rWsQtJ+AU2k
	DI85c2xHfxUP/n9L+5C+dOC/Ty/tETWRln0VnGlHCjShDOPED1KsM2x+SE1ypvd0
	3xPPExyXUM60sF7hQ+xLQR/epjZkn7pj3wZB0PO01E5gOF8i5CQLul8AdSa/HT8/
	lYxUjAlyWmGjHDJyDeXo+qII35c9MJG1NaHeDu15jkk3n7PIcu8nb/6pDaF3Eu6B
	jHIyDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0ankv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so50603505ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510352; x=1770115152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=;
        b=RlhOmLAeczga2c89RWP2kjmv/oTqjnzjXTk3+h4TS5IRike4/TTtKNbfvPiChYQWb0
         Cskggr/GXwVKgxG6n3NvmSTD+6+MtndLqqlSYPtbE0isSWLjP4a66JXJiVd8ZlrBE/sR
         5oVe97IMRR4a8cSv+q679IJFh/ojxhUzvWIVdU4ywOKwYpqATXOpqfX8gWC2epvaj2JR
         y0WC0P/z+1MhhFAt5Zx6i1raAajLVD0VcYDMA9rGqVAsCL1jdIPzijAeC7ERikUQl9fR
         MomiMw96CMoTzBE9y1W2MPooPHjczZNP4bzWDWOPemmLS619063E/F7ySy8Rx7EXi+f3
         LtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510352; x=1770115152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8diuoQxduqCCkFBhLja6BHg5zYvpNJgmwxTrwxK8e7M=;
        b=RIAr5IFf/RV0KzvA5TC281dfUtN4x3XEyhxbYf7MMwS9PZuogjUEEzhbokoz1OazBJ
         4cwUWLVzFg7eWmPDGjrCwQ+WCmF5VGwKMwGMIPO44CLGSNPDN40Gz/gJAVIPzCFc3T4x
         ueeTSz7sABo1sPtNKgazO64SOhoZLltpdwRTBIPtTXbAwqDemODZsxW8JQ1Ef2QmMm/j
         gB5J3p6eCE1xLnRfQl3T+I2Hvk7Jl1NzvD9PJo8LVJZb/iSPDNIGhQh0dCIt+yu6PvQ9
         CMJmqniftJREhnB+F9wWO7FOZL7K64v/U17U2ULxH2UKiQJcvgA9MhJJLiuYZ/sglzCI
         X8ng==
X-Gm-Message-State: AOJu0Yz/oZ00doNGveM5UvLzuSX1/2abq3gMHrYy1bJ0gDzoRF1menjL
	8gGUVt8lNXNhN1K75WqCbWGuuDJ2PCqhgp2GssjKrhA/KV6Q5nSUBN/4VTABmbQEoyeLlQ/r834
	B4Er01ca/1oht0T7bdghjHD2Eye4Ujt4XILMitUsycTsez809ba230fPOqlITSEq9jZz1
X-Gm-Gg: AZuq6aIvdu3MvioC40F6edyWxPC3qSdBQ/8G9qXTDtW4GQXmlFBwDpMDSaScDj42aoy
	SA7PMq0heqEzt53CA0DYOCfWmcKeXwBkiR0pldYNUgO6x46g5NLIFDP6eysqhbdf5f3esyvSRs0
	FlBRLulBcZq3KCYO2mnQgQH0SdcO6yNVDxak3zo/WfpxOB+DTxC8Z2JCCFrfXtD/rtygjk+kW+x
	IqBrsSZEnz9lEpqGrzpBflQ9KNAqxIk5fLWIqR/7BdHuP0A0F2Uu/DUCKoYpHob15mXjt0k3CLJ
	WYNG8cJ9KNFTM/PH2DcEQ+sTQCI8Y4dIc755pVAV3VDvNxf87xGFQazyLyIq9V6i+5C14AltsAB
	SVbXHP35oznfIy7RBskv4A9br4m6pPBhWZohpj+8=
X-Received: by 2002:a17:902:ccd2:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a870e7206bmr15258195ad.45.1769510351925;
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
X-Received: by 2002:a17:902:ccd2:b0:2a0:8963:c147 with SMTP id d9443c01a7336-2a870e7206bmr15257885ad.45.1769510351376;
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa782sm113957055ad.5.2026.01.27.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:39:11 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:08:45 +0530
Subject: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
In-Reply-To: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769510346; l=3224;
 i=deepak.singh@oss.qualcomm.com; s=20260127; h=from:subject:message-id;
 bh=13RQvVdEs1aG2xZBqFThtiXdBL8dTgVO/i1E/yHiDQw=;
 b=V+UbhjiveXmbsLN5jTG77Ybp/dhsM/WRiOqGV97dPznomIp9JiI787EsyQ//g6VUFv4a75ATH
 au/CO93TTFYAcnsvwt966djJuXyKCnSojgkeXSb4JOfGweTmY0SUzbn
X-Developer-Key: i=deepak.singh@oss.qualcomm.com; a=ed25519;
 pk=fVTLtknRa0voM2B2QT8dD1HmvNdAnw5PY0XmwOE0ldU=
X-Proofpoint-GUID: 7Io7IZHKjh7NyKjn9rBoh1eUQRfHm1Nq
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=697895d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00Z1fs_rM0_F7AXzQWUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7Io7IZHKjh7NyKjn9rBoh1eUQRfHm1Nq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NyBTYWx0ZWRfX4+9gdeNkZJRr
 tcZgBzG4lwMDpiP57BuPG9avz/qDpbXiQa9soiSmJDAWjRXs23Ja10/fBTiatzg+b7LQmyzxrZA
 dm7OkVKjJ+uwHEh/WrplRqugMix5hWBdOM7o1qmwq1TppewF6se523AHy+hXFSg+cWbhYUnkqd9
 j1UIj3oDXtiPg1Jzsw7OW9ncDwJCwnwArJw6KI/2rWP+ettOsxh2ZLAmemH7R16b39bNfT4ilyB
 zrYLhU00aOLHyc7kN0tOETmHarBAxpeF8KdJVG1pNTwipcxLSr2bS30+5bwtZNO/04CCroARbyF
 4aT3DQ0syxLkW8MkFYMkCtuY19TX34XyhnNGTDzHtpIfnHtlRZlNyObfvl09x77Mk9lR+Fy94Uu
 SOHjIZBdI9FGenTLpKopGHDWZkWvJFYv10IERIqoMPGOXA98x58A74QSSLYMm0K0Y3m6DmCVIuN
 oqbPHxkkzzy8621hASQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90704-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepak.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EFE192F67
X-Rspamd-Action: no action

From: Chris Lew <chris.lew@oss.qualcomm.com>

A remoteproc booted during earlier boot stages such as UEFI or the
bootloader, may need to be attached to without restarting the remoteproc
hardware. To do this the remoteproc will need to check the ready and
handover states in smp2p without an interrupt notification. Create
qcom_smp2p_start_in() to initialize the shadow state without notifying
clients because these early events happened in the past.

Add support for the .irq_get_irqchip_state callback so remoteproc can
read the current state of the fatal, ready and handover bits.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..c27ffb44b825 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 	}
 }
 
+static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	char buf[SMP2P_MAX_ENTRY_NAME];
+	struct smp2p_smem_item *in;
+	struct smp2p_entry *entry;
+	size_t size;
+	int i;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return;
+
+	smp2p->in = in;
+
+	/* Check if version is initialized by the remote. */
+	if (in->version == 0)
+		return;
+
+	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+		list_for_each_entry(entry, &smp2p->inbound, node) {
+			memcpy(buf, in->entries[i].name, sizeof(buf));
+			if (!strcmp(buf, entry->name)) {
+				entry->value = &in->entries[i].value;
+				entry->last_value = readl(entry->value);
+				break;
+			}
+		}
+	}
+	smp2p->valid_entries = i;
+}
+
 static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in;
@@ -368,12 +401,31 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
+static int smp2p_irq_get_irqchip_state(struct irq_data *irqd, enum irqchip_irq_state which,
+				       bool *state)
+{
+	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
+	u32 val;
+
+	if (which != IRQCHIP_STATE_LINE_LEVEL)
+		return -EINVAL;
+
+	if (!entry->value)
+		return -ENODEV;
+
+	val = readl(entry->value);
+	*state = !!(val & BIT(irqd_to_hwirq(irqd)));
+
+	return 0;
+}
+
 static struct irq_chip smp2p_irq_chip = {
 	.name           = "smp2p",
 	.irq_mask       = smp2p_mask_irq,
 	.irq_unmask     = smp2p_unmask_irq,
 	.irq_set_type	= smp2p_set_irq_type,
 	.irq_print_chip = smp2p_irq_print_chip,
+	.irq_get_irqchip_state = smp2p_irq_get_irqchip_state,
 };
 
 static int smp2p_irq_map(struct irq_domain *d,
@@ -618,6 +670,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Check inbound entries in the case of early boot processor */
+	qcom_smp2p_start_in(smp2p);
+
 	/* Kick the outgoing edge after allocating entries */
 	qcom_smp2p_kick(smp2p);
 

-- 
2.34.1


