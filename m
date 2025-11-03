Return-Path: <linux-arm-msm+bounces-80140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15FC2D048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 17:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D91463534
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9214A31A54C;
	Mon,  3 Nov 2025 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm7iVkNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDiZ+t/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E7319862
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183795; cv=none; b=msMBsjG7bTXFyLKVzrEXlqKq4cBetkKGlRNo0hX3EEk8iRF4E8j8PvzGxDo2oyy3NlvgTIfSBuBbKgdAN/4Sodl0nav7c+mWZlCMFl5AWD4Abv2HecB7dCpFzdbrPQvxne1EuUUeILtkuumnjAo0DTlDehPYU94SB4Bzk2oP4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183795; c=relaxed/simple;
	bh=dBArJw8BtQbb+GbIeTd+sj4QHw9R7vxcd2HVbGXyZ8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RRMKz945pUP9MehcOL/lxNtwnDFze9LCO31HCDI9sioih7sPjqVjOZ/4PjpUZcUr2X1+oVezbhjKpIAT8usc0kp1GyMm+CcDQQpG8rUiWdYwvHiTY4tjQ+L4bl3AMzxxG24bCjzHDtYLj3SXSOdoa6HPOBjyh1eHbhIAogOGByc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm7iVkNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDiZ+t/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3CgDn62267840
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5RoU67xWc+
	/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=; b=hm7iVkNlXLmuTNV25NbfYm+bPFZ
	Pp+4Hdg4U6Ejt303H1ZP3RtEljLlZcF2a2sSHgyXYIKEY0piA2Rvx6H5aGifeyUc
	2/6G9ga3b3rr6ELRXFPaBD1GYmZsm4+SZtv1+xEagy0p6nd2otjKMHABvw/biuer
	jtkp5u9JuxmT2wT3YiQqR2siZPXFPLXmhggPsBYI533oCFwJvCHBygZVUmC2K+7f
	P+0Cu29rVLlBRhL8Tji4tWzwiBibQ8LzciYTKAOp88tCzUkWl/uVLL4/flHoNSsa
	DZNhAGIzEyRon2s95OMJgUNEdEAMp9EVj3iwj7AMBexqah7h/QzYhFxvSzw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwahjya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 15:29:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2954d676f9dso17231225ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183792; x=1762788592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5RoU67xWc+/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=;
        b=TDiZ+t/d58R09rgflDHlUPVh9y+tWDbvKnLaXyx+BRDuLSGc96/emOdY5jPexKFIUg
         BdhcrMbSYsCrjsrcWYVFlG5dljzs0cbPXuHdBfg/NvCAKr1HjeqIwU6LYGFYVz71TDUN
         KOljy6w5Ia1pz6l4f6tro1npdgVi6Ljz4UhfRE0VZYZsbBCYHgBEx3haIHBxHO2w2SIE
         GIZYKYPedWEQ23qwQMVOqF4I0dTyMbmIZCySNXTnMiJ4MpZhX4dN57u9gk2umULB0+Li
         mfo9UBBdaABHfvBPyyi5GQAv0iTveSj6WWg1U8WEjQ9HI4QUl8hwCEyIjoatr4/VvpmG
         8JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183792; x=1762788592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5RoU67xWc+/hX5e4Ph3gnRFs2xHxrz6wCE2cVAYy5I=;
        b=UjSVg7HV2R+5AtsnpZXuGyzB+TIZZ53G9c1Jf1UOfLCUdZystYi340sTsgN5vtknTT
         bk8bffClBZ087cyrP1IE7+txjU7+96eXY1zsrTHJM1KCBnNeN+BKuaY/8821Q7RzbZf8
         5V9Q6BMVORld0g9nyLLv9HD7ypDUSWaqAVX/K5N8QfwoEbMs7PfL97YANAadi5sycr3D
         uU1llCrifDX6XB5LvQwtCGb2tiOWyZy1f/4ECbtvvWMd5fZjM46s4dTcFolIkVmvVvXH
         dhudi07Ow9HQ2KY0l5HcO3UtVPXQF6HrJrsRFSahMoLDCJty3EumvdcN7s2aDFWrWz7m
         tuCw==
X-Forwarded-Encrypted: i=1; AJvYcCW2owSWQhj82Mw0EyqE00fgLtlRpZrAPERxtLYZxj/8RlvVDpZF5lmTtu8iBVL89Z2OUnzUuqkB9h5POzte@vger.kernel.org
X-Gm-Message-State: AOJu0YytTQ0RBWypOE3xVx/4NL2wgVnnWVznGxdWr/CRcwBJAqMRrJbw
	4N8ayJblAitNQR4xTJhvexrAgY3bh5mc0CE+Xbf4BW+KtptZ9XxJEZpydEwlA0pvotlcOFqgQKH
	hd2g+rdo/1F8Ff0UGEWg14XlDPIN5oy3A2LS1Y90+30drGTitm7+IfTtCZ1RU56/IrIRL
X-Gm-Gg: ASbGncvr0+7e7EazJ/uaxg5mhw8riTA2tqrvYTLECC33Ncj2VEFrsZ6766XuDJj9o5n
	6leNQS1+DsZMNMcyBYmBAXNTeicjK307k6RkRPnNQEN4XXRfFJ7ig9CIGmWzNZa7xA4iqFHX3VQ
	D/cFAm4GF4jVw+tJjDkQPpj1K7i4XNF20M9gujWgn5kEdcQuzSnh7NWx+b2i9sVvwpAk+PmkWjH
	LNDCfPmOpHW9QxwdHSlWevJKndkPGG8hcUbCeCIpTybhaPh2oOqwl9QKf8GIcMAFgS3JdiEaMr4
	Cldow2ZE1sthbQBp6U/M66IhEDijnc+RAxz0KNeOG96QKl0q+lgzx/27mwD1k7AjuhMZv3YLXiA
	3gMrPLhXztN4v/WV6ZCZv5wZkBAl+
X-Received: by 2002:a17:902:e5cd:b0:295:59ef:df96 with SMTP id d9443c01a7336-29559efe23amr109155585ad.13.1762183791801;
        Mon, 03 Nov 2025 07:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHTGFTcSyqO40WoFf96Tzk+1rxW6bfMikFwy8bey6bnkI+yt5C/QmsCzPuTxQ6g51HNPuH7w==
X-Received: by 2002:a17:902:e5cd:b0:295:59ef:df96 with SMTP id d9443c01a7336-29559efe23amr109155245ad.13.1762183791133;
        Mon, 03 Nov 2025 07:29:51 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:50 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 1/2] soc: qcom: smp2p: Add irqchip state support
Date: Mon,  3 Nov 2025 20:59:28 +0530
Message-Id: <20251103152929.2434911-2-deepak.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=6908ca70 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ht6YvOiLTg5Y4LB-hcAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: RQd_bM3Y5mTz3NRVf-OgtaIEQnMP_Gno
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfX7dN45GVL8Nmo
 vfq1aox3ujOin52ff3xFpd77siYfzsg5uYBXseN47kV4MXbTsSr8X43KUxP2pCw8RU35OQZ+bIg
 z80mgzXwmQxjuDjODBrQJ8Jn50hWqXveGZUcbAZV+Or969i4aJg5K7Akx21e3ME2G/lOu1y+gFf
 bXtIK/bqShFQigPp9hwQHOpWfeHfj7vS0pKNt5XabjJAQLBoOutmHAhv8TMpDNV0cGzX22nA5yh
 WJd16+Af9G0oTOvAYWVfKWSJ2b9TD8S3QGg2RDSBV0Imd06nvzuZBIQU6k5HHn808iCZlPUM+He
 GZCe+ZXinsdv8d4BO1slOw7jS7FSt32ENVJ0GqjtcPrGw02ouVyn4XK66dS8Y2jvIkl0z1YPkpk
 6xXMkhVLf7TL2qAeYTY9slGhQw2S3g==
X-Proofpoint-GUID: RQd_bM3Y5mTz3NRVf-OgtaIEQnMP_Gno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139

From: Chris Lew <chris.lew@oss.qualcomm.com>

A remoteproc booted during earlier boot stages such as UEFI or the
bootloader, may need to be attached to without restarting the remoteproc
hardware. To do this the remoteproc will need to check the ready and
handover states in smp2p without an interrupt notification.

Add support for the .irq_get_irqchip_state callback so remoteproc can
read the current state of the fatal, ready and handover bits.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..39628df36745 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -48,6 +48,9 @@
 #define SMP2P_MAGIC 0x504d5324
 #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
 
+#define ONE 1
+#define TWO 2
+
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
@@ -222,6 +225,42 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
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
+	/* Check if version is initialized and set to v2.
+	 * Early enumeration of inbound entries is required only
+	 * for early boot processors which have smp2p version 2.
+	 */
+	if (in->version != TWO)
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
@@ -368,12 +407,31 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
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
@@ -618,6 +676,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Check inbound entries in the case of early boot processor */
+	qcom_smp2p_start_in(smp2p);
+
 	/* Kick the outgoing edge after allocating entries */
 	qcom_smp2p_kick(smp2p);
 
-- 
2.34.1


