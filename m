Return-Path: <linux-arm-msm+bounces-111890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +5zwFHrDJmrEkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C64EF656A32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=E79Fp8Dp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111890-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111890-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F91730475D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE29380FEC;
	Mon,  8 Jun 2026 13:20:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497037BE6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:20:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924853; cv=none; b=A5vRl6Zhadz41rDSvg7T2KLlC8D4ZP96TMR8o799rvvREwgvw3Gw+tpm8cOzQxjnHrGiH1gzwA/NOTtIZSf0anu57h3ok5Lkgu5lxqaXyvIF8HzVV6VNHVtk2StHFPm7dk9LMEjOgRrH4jtf2IUamJSD7o6KLZOFw9SvEQ8AHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924853; c=relaxed/simple;
	bh=4LIlhcSSNJt4ijDmSKJWT+ggM0d+9mvXU1kPx79Vhp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOJI4fj7FdxnmKozja8zBV5kV9rRuY9NS8Jy18/VIqDneOCJ1PrNfrZnFs1x3oKZqm8NogwfZegSbgyqiRVizgdUyY8Xo6/hvSn0K/Npdoix0ynLiunbHIOV5vZ27VVd09e/st2remKagkpjmxTNNhvm9F1Al9UNNiVLX14/E9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E79Fp8Dp; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490a76757e5so27934175e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924850; x=1781529650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=E79Fp8DpkdvHdwbVHCBHfZVbYL4HLqehMaKDjZ3F+J6E3WrHvbLRmBOEHg5TQ54VYB
         mMrxZlxs0mQo4jQvfszsrAI6f91bx+o1PIEPRCr2qPu1YrMtNF9Uz0rczt5SQJaUW8Bj
         Gp2hqr5gCUysEmV8BH8b8WTu/ToAFaVJOkz6SfrKvfotHE4Qk2xmt1k1R6YW72PJKOpi
         nTpjTWumAtGN3LJKUtU2r+AfzIPskvgu0EZPrLgMgKYBdFnnPUPfm0gZLKODJuJmvcAQ
         Uwd4bNYHX/YneOQoWynsxiJQmFwRjGF+jGV1q6AEi07ZnZtE1CakJyswKMpsGq68oP5x
         W7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924850; x=1781529650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=ajMtg61Fo9zfA/wm/txGAp8q8qz4wbWlhFoN9/46J6vaiVqDPkFyXw9FYypUm5lC1d
         lK++3l5ezfLLnWF5Jj3MOrWqxripUxcpaqfeVMnn/pqsa87nw2YW5qGf7xBR6rCfCML5
         HYt1eU3xKAMN/2zmTqiZ3yV7E453OQWRgTfuzsrqIADtzJyjhP6hSunAqic/DbjNA9gk
         mRN1l4sBt08keXxaCxYIMPinB3cvkchwdkXR5mZyIR8tlxAOnsPD6u2GF/NWlROAsQSa
         vxtHAzZsUm0/YnGq8EAoJErhejMEILpm5r1LwKTlZe2QoqSdACYrIOCCRJHnQp0soAP3
         YrXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NTKE+DlbMvGOso/uewojoU05HkQY7UAJHcYYrHeV7VBKYEOUa85bNZlowY65F/4ac7sEU82oMOdma3Rdq@vger.kernel.org
X-Gm-Message-State: AOJu0YxOm2iE1NzaLenLwfIg4Zvb6bZZha2Rgx8neSZXgCJt0B0rQqV1
	b3X32uzrmamgF0VNrR7yjkDMxaTXwcWmulRuwhs9G/+4YEMN2QjtWdyp29Jh0NFmRto=
X-Gm-Gg: Acq92OHh0FyECsjlpFnaFjqeGVFjwVaKbLOQPOUs2TcseS49r4hH0t5wLZLsDD5WbdS
	SWiJey5j5jbLm46La/ukYWZQZfoRi9XNVyWy7GsJt1avXUcVMrgziFE3yU1QGiBIZTLe32qAYun
	w5/gRSoRKsi2B6F6NpHMD1P1egChhbD3aq9TkMAe7FZW1mWHDFXpa0SwFifa42GP713+EsHCNWx
	1K1Xl8viryESnDrR9prN5OSPtFqyk3PldCwZXxVx2pYmv8I5H67FmHidkc+MQM+PUZIVm2/2l7Z
	cIU/gg8s8cg++h0D7aXUzJtnhZpARCQrRqBY5wjbGZJ8mrLz45/UUKSjqu9XrD+Bum6EPF+wAGv
	ApM0p+2VSsezsQlYxJ/c0khR/fx/hg2VPaY1dxwyVOwO5Zu0Yd97kzyg8Xc+n8Knj3WpIKru5KD
	z8P8VUBGBPM4xbBK764cIsnleOURr2vbeb//kiGA8UMP4sHOk=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr237867275e9.14.1780924850120;
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:24 +0200
Subject: [PATCH 3/4] mtd: rawnand: qcom: Make has_onfi_read_op separate
 from qpic_version2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-3-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111890-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C64EF656A32

QPIC v1.5 requires using the OP_PAGE_READ_ONFI_READ command, but is missing
the rest of the hardware changes that are currently covered by the QPIC v2
(qpic_version2) check in the driver. Split that into an extra
has_onfi_read_op feature flag so it can be separately enabled.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 15 ++++++++-------
 include/linux/mtd/nand-qpic-common.h |  2 ++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0251dd591d40..9217e8de5512 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1564,7 +1564,7 @@ static int qcom_op_cmd_mapping(struct nand_chip *chip, u8 opcode,
 		cmd = OP_FETCH_ID;
 		break;
 	case NAND_CMD_PARAM:
-		if (nandc->props->qpic_version2)
+		if (nandc->props->has_onfi_read_op)
 			cmd = OP_PAGE_READ_ONFI_READ;
 		else
 			cmd = OP_PAGE_READ;
@@ -1903,7 +1903,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
 		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
 						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
@@ -1911,7 +1911,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 
 	nandc->regs->exec = cpu_to_le32(1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->orig_cmd1 = cpu_to_le32(nandc->cmd1);
 		nandc->regs->orig_vld = cpu_to_le32(nandc->vld);
 	}
@@ -1925,7 +1925,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	else
 		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
@@ -1939,7 +1939,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 			   nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_cmd1, NAND_DEV_CMD1_RESTORE, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_vld, NAND_DEV_CMD_VLD_RESTORE, 1,
 				   NAND_BAM_NEXT_SGL);
@@ -2041,7 +2041,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	if (!nandc->props->nandc_part_of_qpic)
 		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 
-	if (!nandc->props->qpic_version2)
+	if (!nandc->props->has_onfi_read_op)
 		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 			    NAND_DEV_CMD_VLD_VAL);
 
@@ -2063,7 +2063,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
 		nandc->vld = NAND_DEV_CMD_VLD_VAL;
 	}
@@ -2385,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
 	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
 	.qpic_version2 = true,
 	.dev_cmd_reg_start = 0x7000,
 	.bam_offset = 0x30000,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 006ca8c978a9..437448995187 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @supports_bam - whether NAND controller is using BAM
  * @nandc_part_of_qpic - whether NAND controller is part of qpic IP
+ * @has_onfi_read_op - whether ONFI param page read command is supported
  * @qpic_version2 - flag to indicate QPIC IP version 2
  * @use_codeword_fixup - whether NAND has different layout for boot partitions
  */
@@ -452,6 +453,7 @@ struct qcom_nandc_props {
 	u32 bam_offset;
 	bool supports_bam;
 	bool nandc_part_of_qpic;
+	bool has_onfi_read_op;
 	bool qpic_version2;
 	bool use_codeword_fixup;
 };

-- 
2.54.0


