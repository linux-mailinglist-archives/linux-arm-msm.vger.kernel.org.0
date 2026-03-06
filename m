Return-Path: <linux-arm-msm+bounces-95924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI2iCalTq2n3cAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:22:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA62284CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A989303299A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 22:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58DA3502A6;
	Fri,  6 Mar 2026 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy2HvC5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB7034FF40
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772835728; cv=none; b=hvjX6otWwY+x1blsb3XHvCmQP4oYqifIIRJIlBmFQO1wLT0yHbUXRpZEIW7AFi5A+09DSBkx3W1UVJ9G4dXwqxLVRuH14921EwIXeGvMR4Eask4TlStm7sPRU4SCIKNIq9i8iZFTK3Ha+bC00HRgCYksBMYyHYwqWuDGd+TGVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772835728; c=relaxed/simple;
	bh=DmIoKkR8KqK2qQF1bZkGkUZ6ggJ0MpC5LuN1Et+ZHLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iqc/tBLI9ZS5RDLE1argZG0Eskq+Po7fZ9V9YZSzMTRRCcbWiulaf890YWgUTMjVwgW+DScHJks5wN1pFofkqR4Q0vS9eaZSRKrD0Pis1TG3POznUsvi9RfSwV7ucOp0aScqHN7YM/iA+K62IdB7nXzpKIYCuKvd7ec3pN4TPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy2HvC5W; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3598c1ad542so3779827a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772835727; x=1773440527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4FMmOPA74qb/sr9utsKChtIdTy4B4gMndDtghHY5lQ=;
        b=cy2HvC5WTAgC+9fGtFjirUOOKH3aoUoHj4p2nUHBiiq9L08SGtyJN5ZBIn0qUunIR1
         BlhS10tpovGsvbiKB0F+0CLzTt52OBRYpPau9nGAFZw214BlwHljyMsyMqlKDbpEnxiF
         Obq/hxs4Epmty1XxuLMOq3Zn9KCU6Qu2vsZU6xs8CrOBm0rOYNVMltYP8oeI7avZW/Ir
         +Vj1cpv0iFZbW/I4zI9R4ilCEHP6u39tTq2QV0FbRB7Hs2vQRvKy5AavkUeZ4XsTxpQA
         rRqR8CeVx+kJsJT9Ys+gKtE4SdK5meBUD5NICAHnvXi/CblGPf0zGETwsKXh5PkHNLaU
         3+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835727; x=1773440527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4FMmOPA74qb/sr9utsKChtIdTy4B4gMndDtghHY5lQ=;
        b=PaVFjgr7PO0Szgxd3pz+twOuybULx6nbh9DPhC1Aa6uLgIao9bF70zVFkHBJh+UL9Q
         KgPhoN2tyuUQDzlfQQBLZpZT0AFiDVWY5JUsSfSBR3mKMsxW2ObanP1MFBjDsB8P3jK+
         cCz5nr4ywnuxXguuDOTJ0F9nQilgIV4Zwo9z/i0qw8X5GXrV3F7pkvTfbTlw7ksH3r6q
         EguG2X9iURrB06oJf+8PtLhFkR5/9dqaZrt2J2yxk1Ma4ApqQOore2r2qLKa71yBRRxf
         gfZmgMh01v89IWn4dq3KipRPGer7DfvfuSzTpk0vVlkb8BXF7dEDP3wpDl+0DkpPK0QJ
         VF8w==
X-Forwarded-Encrypted: i=1; AJvYcCXf51R1o2QIRlZIJjJqYk23bEmLMmEpSR5O3Q52y09WpnptKJans4gLbvOpQfZG+S6jmFzubzUYYnjJvfg4@vger.kernel.org
X-Gm-Message-State: AOJu0Yww4xm3tz4nOIYPV5iSpN+H2kCDutb4W3b5HLIIkxvkNic3iOsZ
	mnAvnbeEShdWXrSgUMrGFBE6WZD9g0FHUL3jRR1Uf7TPBskY9BlR9mQe6S3quzS8dDI=
X-Gm-Gg: ATEYQzykwWM0qQucQSGmWkKQWQF+DdutXrX9cP9GPaG02Ox9DqsVH7wG0TPnVj8YyG2
	00zJJ2gV1Dx8YfOsQBRZCwyYPRJCQ2t8U5vGr2Q5ADJdORGrnajY5Ka/CTRM3Gq328LYB5Z90JU
	O+TTa4plsUcfoFIfo949kSw17uyQtilug9g66ln/U4riRUpczJU5jXl31UKEXyK4lXAoe8CVfvq
	5+7kHkA/0G61Xd9uu04fs2Rv++ty+gcbOCqRfYqIBVO5B4EJGpOWha1c2kWCou4BX1n9265ydly
	dzGxHI3T4cyATLYXYVKZgGTlxbpvKzmOmVZAVnov/91xDzQSagr7Or4Qx4tLUBmYuzszPxAv6Ow
	UQCpVVEQEcCydd0wvqopQXV9hRPN62eijF74QoZIl5bEBY7wcYR34hhLD/iVqTtSTZq9gcW5yxm
	Soy++rnPeWBkAZV6SNHiBvZSjqozX4CG1Bm95Q77EQUcXk5SQQoGbey5g=
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-359be344cbamr3132368a91.20.1772835726741;
        Fri, 06 Mar 2026 14:22:06 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e224sm4136310a91.7.2026.03.06.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 14:22:06 -0800 (PST)
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
Subject: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
Date: Fri,  6 Mar 2026 14:21:48 -0800
Message-ID: <20260306222148.8200-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DBA62284CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95924-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.956];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Shuffle some code in probe to provide a clearer picture.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 27 ++++++++-----------
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 26 ++++++++----------
 2 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index c8b1463e6e8b..4b3915c6894a 100644
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
@@ -560,31 +560,26 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
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
+	pmic_typec_pdphy = devm_kzalloc(dev, struct_size(pmic_typec_pdphy, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_pdphy)
 		return -ENOMEM;
 
+	pmic_typec_pdphy->nr_irqs = res->nr_irqs;
+	pmic_typec_pdphy->dev = dev;
+	pmic_typec_pdphy->base = base;
+	pmic_typec_pdphy->regmap = regmap;
 	pmic_typec_pdphy->vdd_pdphy = devm_regulator_get(dev, "vdd-pdphy");
 	if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
 		return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
 
-	pmic_typec_pdphy->dev = dev;
-	pmic_typec_pdphy->base = base;
-	pmic_typec_pdphy->regmap = regmap;
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
index 8051eaa46991..7c5cf8061f04 100644
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
@@ -706,29 +707,23 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
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
+	pmic_typec_port = devm_kzalloc(dev, struct_size(pmic_typec_port, irq_data, res->nr_irqs), GFP_KERNEL);
+	if (!pmic_typec_port)
 		return -ENOMEM;
 
 	mutex_init(&pmic_typec_port->vbus_lock);
 
+	pmic_typec_port->nr_irqs = res->nr_irqs;
+	pmic_typec_port->dev = dev;
+	pmic_typec_port->base = base;
+	pmic_typec_port->regmap = regmap;
 	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
 
-	pmic_typec_port->dev = dev;
-	pmic_typec_port->base = base;
-	pmic_typec_port->regmap = regmap;
-	pmic_typec_port->nr_irqs = res->nr_irqs;
-	pmic_typec_port->irq_data = irq_data;
 	spin_lock_init(&pmic_typec_port->lock);
 	INIT_DELAYED_WORK(&pmic_typec_port->cc_debounce_dwork,
 			  qcom_pmic_typec_port_cc_debounce);
@@ -737,7 +732,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
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


