Return-Path: <linux-arm-msm+bounces-97094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA8HK7b5sWl3HgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:24:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D526B5A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96895311CC5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD6D391832;
	Wed, 11 Mar 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVHIAo0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6754377004
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271449; cv=none; b=chAQR2HUl/G8qIMdo8UhshX2IA1la1pLx/RL/uaFnZ2ftCN7Ls/8q6rR8RlR/VFmQPowFI8900wztAjU1SGIU1qkucAKjkI4NPnL7LEP8Vkis80B00ptKban8CCEPzwP4RuJS4Dm854gvbbrPOodmUQHtar7dgrXgWda8lIHtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271449; c=relaxed/simple;
	bh=5x6P8nJwDE2dMBktvCxCL7MxySCiJKpx1mSlB5k2l7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMK7EgFkN8x7bwvRbPyFVdnHDn3Ju3bNVcWaJiGoBlynoaOKqQvUFPvafpX7G1queZCFtGe/qHA42SEgeNhB0R2CpYl8rIhTPOIW7bjefy0Yq2HHcfmMbNuOyONyx1+Lo9fsP4w8iSpiiwWFc4SDF8/g6T4Va4Q85jz4O3A69J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVHIAo0O; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82990763921so387205b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271446; x=1773876246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKV6gzPWKf+kdTy1HFMh1iXAwf/N5tjFhknniuMmlF8=;
        b=FVHIAo0OTs0xVexbwy8CQFqCNz43JIoI8zD5/kMBuvUv/Qtx6KDiuyccMFCsOObpLR
         lOdbab3AV0RzpzOhjtEb3coKW2qnXwLNeGfdfybix5L7itKGndSKgEZVqMLqF3LyhKYr
         2EzPsB9to0k/DRdt9dwYEL1uSRSyLHYJrHpewDJVrfIaVtaMBYQg4yBo9XW8rEgY+Vsp
         EnZV4HYG/O2bTlHbbzeFZa3qK9w6GljdVKpWTe+8UTSJrqm+KlDIftMQeCbFPS57ag3p
         MKEDDP+lS5AM3rUpoY10oLWXLW/tpjK7af5E4Vdsgt7SQIVdpyF466IjaXCRsJaoOjxk
         yV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271446; x=1773876246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKV6gzPWKf+kdTy1HFMh1iXAwf/N5tjFhknniuMmlF8=;
        b=C+3FJQ5tlRL6eNJePrQrHrYlgo2MPFmH+JGe+E9xClEQSSlCxQ9pPB6DF0E5CzWttS
         +865UF91b8tdccJSkfAJc6PwEUwUdxmrWny5W+pDcQjEwcZg7bCfvkop9u7+GuH+zoZQ
         ym+9TiyDFZ5pBEd5C/zzT+bhSivtt59uZ8c1Ul8OVH2exbdb5KaWvgsUAWs5+GPl2cLl
         TRdXgeThzu8fJXlGaAC0lu2nNqgW4bCmgK7MZtqCi4+7dJr7K0YFbtMmDflNanadD+l1
         dYdVnHSiHjONeohOixi8x6Ur/KclpTC9cCjDHRW6qSjwGrmC9idILCIp52zDhqqLaoHh
         HdQA==
X-Forwarded-Encrypted: i=1; AJvYcCWSo40Y78fbkwKr5VpTwVE3NKbXRnCBNBKIlH/tNkHAb/779Ck10uFeJMWpnED9F4yzHjLDdEzF1LqwnR3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvgoczs7SNxnpGvWYcM09+OIbYBQ14yn51nkC5JJVCaA2+QVSN
	SDAf33qJz9mxkBa9rg6XEYLir6me572mezTTS6bCOEw8Vt12jfFgpH/Q
X-Gm-Gg: ATEYQzyixz6DqDSKKNt45Z92+/RAlyVot7caF4tolC7W2SaxysW63040muO7ipkid3v
	LsNaF7KV10BMMAb/vEDqDA1/3+X0s/VXmu74yOE7EBYcUVOYIfTp3k4CycEJm3PDHYscVTHEtOD
	pwH1s5hvFghKdHHBeVQc8HtHuTIC4tXtbFApvua37L2bei5nI66RCvwhl1izNXSt7I/O1YKgmoP
	j7RFGYiU8LpAd5HbbFrDFVUcvHyUKqJeG16koK5k/xBYdyZ6bSbPVU3g7iUuRKUoR12Y2aYUSkC
	8ncFU6FylYv7YEslZIcTZMNEeh+aJBtITfOTzcCocuiMDhOp0Ff3Yf9vNDtmTlHezyZSmBOCFrZ
	l6OJwOgHJj6IY/cI9vptiBcREnoPbrLJuqd2z0nVGHq2HlW3oZGs00wpLw3NVxTBP/rD/6zBFNg
	t/5LbuTDYoZ62HyCW/AOzT0S5Ism7gvSbwzPVuofycugtb03ptmS4QY9CuWDYYP6mA
X-Received: by 2002:a05:6300:6705:b0:398:7667:b2e5 with SMTP id adf61e73a8af0-398c6178160mr3760195637.68.1773271446144;
        Wed, 11 Mar 2026 16:24:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072603c0sm755037b3a.22.2026.03.11.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:24:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM TYPEC PORT MANAGER DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
Date: Wed, 11 Mar 2026 16:23:47 -0700
Message-ID: <20260311232347.18257-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97094-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 581D526B5A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reduce chaanges only to needed ones.
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 23 ++++++++-----------
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 22 ++++++++----------
 2 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index c8b1463e6e8b..a1d9315994de 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -95,13 +95,13 @@ struct pmic_typec_pdphy {
 	struct regmap			*regmap;
 	u32				base;

-	unsigned int			nr_irqs;
-	struct pmic_typec_pdphy_irq_data	*irq_data;
-
 	struct work_struct		reset_work;
 	struct work_struct		receive_work;
 	struct regulator		*vdd_pdphy;
 	spinlock_t			lock;		/* Register atomicity */
+
+	unsigned int			nr_irqs;
+	struct pmic_typec_pdphy_irq_data	irq_data[] __counted_by(nr_irqs);
 };

 static void qcom_pmic_typec_pdphy_reset_on(struct pmic_typec_pdphy *pmic_typec_pdphy)
@@ -560,18 +560,16 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 	struct pmic_typec_pdphy_irq_data *irq_data;
 	int i, ret, irq;

-	pmic_typec_pdphy = devm_kzalloc(dev, sizeof(*pmic_typec_pdphy), GFP_KERNEL);
-	if (!pmic_typec_pdphy)
-		return -ENOMEM;
-
 	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
 		return -EINVAL;

-	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
-				GFP_KERNEL);
-	if (!irq_data)
+	pmic_typec_pdphy = devm_kzalloc(dev,
+			struct_size(pmic_typec_pdphy, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_pdphy)
 		return -ENOMEM;

+	pmic_typec_pdphy->nr_irqs = res->nr_irqs;
+
 	pmic_typec_pdphy->vdd_pdphy = devm_regulator_get(dev, "vdd-pdphy");
 	if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
 		return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
@@ -579,12 +577,11 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 	pmic_typec_pdphy->dev = dev;
 	pmic_typec_pdphy->base = base;
 	pmic_typec_pdphy->regmap = regmap;
-	pmic_typec_pdphy->nr_irqs = res->nr_irqs;
-	pmic_typec_pdphy->irq_data = irq_data;
 	spin_lock_init(&pmic_typec_pdphy->lock);
 	INIT_WORK(&pmic_typec_pdphy->reset_work, qcom_pmic_typec_pdphy_sig_reset_work);

-	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+	for (i = 0; i < res->nr_irqs; i++) {
+		irq_data = &pmic_typec_pdphy->irq_data[i];
 		irq = platform_get_irq_byname(pdev, res->irq_params[i].irq_name);
 		if (irq < 0)
 			return irq;
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..6c6401187f58 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -169,8 +169,6 @@ struct pmic_typec_port {
 	struct tcpm_port		*tcpm_port;
 	struct regmap			*regmap;
 	u32				base;
-	unsigned int			nr_irqs;
-	struct pmic_typec_port_irq_data	*irq_data;

 	struct regulator		*vdd_vbus;
 	bool				vbus_enabled;
@@ -181,6 +179,9 @@ struct pmic_typec_port {
 	struct delayed_work		cc_debounce_dwork;

 	spinlock_t			lock;	/* Register atomicity */
+
+	unsigned int			nr_irqs;
+	struct pmic_typec_port_irq_data	irq_data[] __counted_by(nr_irqs);
 };

 static const char * const typec_cc_status_name[] = {
@@ -706,18 +707,16 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	struct pmic_typec_port *pmic_typec_port;
 	int i, ret, irq;

-	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
-	if (!pmic_typec_port)
-		return -ENOMEM;
-
 	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
 		return -EINVAL;

-	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
-				GFP_KERNEL);
-	if (!irq_data)
+	pmic_typec_port = devm_kzalloc(dev,
+			struct_size(pmic_typec_port, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_port)
 		return -ENOMEM;

+	pmic_typec_port->nr_irqs = res->nr_irqs;
+
 	mutex_init(&pmic_typec_port->vbus_lock);

 	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
@@ -727,8 +726,6 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->dev = dev;
 	pmic_typec_port->base = base;
 	pmic_typec_port->regmap = regmap;
-	pmic_typec_port->nr_irqs = res->nr_irqs;
-	pmic_typec_port->irq_data = irq_data;
 	spin_lock_init(&pmic_typec_port->lock);
 	INIT_DELAYED_WORK(&pmic_typec_port->cc_debounce_dwork,
 			  qcom_pmic_typec_port_cc_debounce);
@@ -737,7 +734,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;

-	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+	for (i = 0; i < res->nr_irqs; i++) {
+		irq_data = &pmic_typec_port->irq_data[i];
 		irq = platform_get_irq_byname(pdev,
 					      res->irq_params[i].irq_name);
 		if (irq < 0)
--
2.53.0


