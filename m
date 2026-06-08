Return-Path: <linux-arm-msm+bounces-111891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bQgoHoLDJmrHkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 281AB656A3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dFYl4LRm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD83C304E653
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704DD38734D;
	Mon,  8 Jun 2026 13:20:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBF37207D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924854; cv=none; b=psxl6YB7vpDqDIqP5G9YS2w9qte/glptC7q/Q2haFY3AdFcvnWymksIPRMvaIpDmZooxvDYMGsH7QncgWLtBsxiw0Q6AFbDDF0SqIvwEgrleJmGyXPeTYzAArBCRjE4R2rRm14ukMCJDotRb2UWirdvicA+4xOQl+7nlkCXVfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924854; c=relaxed/simple;
	bh=uVTUGj4g6+0ok6CGfPnbzagq2Go25500NOlJFDZS3WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBQfsWxyE8ik2DjFKWnqcXb4UF90vUZzn0S2RAckm8zOxMb8d3OoPeWQST0xWjXz271rIAOijVHGEDmwDuFi+Z+kC9KIYfEHN+KkxkJ7sE6thNnykI9pCntG64ppKKU5CSRhKQq99QZOdHGbPh2FUPi7m2Wp014+Unsje4UywLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFYl4LRm; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eeba68948so3036793f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924851; x=1781529651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=dFYl4LRmB1xoMO130DTy2OgjLHhZgBfP6s7G6oSTP6Kou/RlTAGOiBXUfw86m12rOv
         JiDyF0CbnVTFUl9ret51LLuR5YLv9g+nl23ohBXIqIQ230F7fFU9cRIn6h1VNsVavET/
         jb47ggwTygCWYIm/TNHzbmvKx0QBT1apHvk7Dyf9SVINpgr95wPbTNFOa9Ybpc7m3Sxb
         WAlGSyYpk4i1ImkTkPcNgBy89E/VAlK9j82SvDv0rQKBI+7zgphvPnKrmi0AFcooEqvx
         qIvktETCB/cVrP3d8oAubzxBO5gh0dolTP9iglGk+6FkX8g4BkQP9Sow01I5mSvpLwn8
         clOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924851; x=1781529651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=kCX0bH/vNfKQ0muKCUOw8J3za3vMwuE+vtaEkI34xwm6rO3Z9CqLuI3fOrkn993nKF
         DI58q++mZXDC6C4h6/uNdy7J9thrk43WOJehQesk0hV/hTIA63bjOiFjPY3NPEh+CIG0
         2VUn4nOfxLz0280d1h2MlEB/2LnJlg1Qg7zYVMCFEh3FWkER38kyORV/EfyLJqsgheoM
         0aijuvpmSMk49zOcfburf7KBe4Hta/hvgorHsvhOR/+KTgOhS4YpKYBdLzX4o/vI8iJT
         uJ690rBflNQxYa/Pz1wvhQxhMh6Z7YkXm+REIYRyzoSyGNKL8EwD8q5+PZ9XgYFks7cw
         7Y4w==
X-Forwarded-Encrypted: i=1; AFNElJ/NOFnM/quByYLY3XftmdUUDR2aBXmvexWVienqeFwD4npCuDxHYwuRt6FRK1/hYgzVDYnC8TVjiqm3NER9@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxQ0LTM13I+lrLQWV8utP5r2wEsrDMedQxFZWFdRm6vielU1i
	hOdQhHIuJxVu6QhuM2pk5n5s1o05ruuU+cFGH4YXSzGrFrYY2xvezjQnHabWhgw28jI=
X-Gm-Gg: Acq92OGKo4dOB838we22kHOKgnBz1pk+djQjzx0JcR3wislLs0UgkSaMjyClPNEbc82
	B16WHSg8MjI05CWavVRQW5VPM6YHuvo2b40Xe+RELdcA5b/8Rfk1VdObDRSoh/4iCwpFfB7Dze9
	R85JJH8shjNqqzhKrNc7saN6OHV419Zcl2OHWiHUZYih3CgZNpwc49vgzYRzvOA6y2P+LrA34fb
	tYvqEFqOMvRZFN65rXkyVwmcW1WvyrK0XdHGtBX0aIHqW6dxQtdh3GFEyaXFkGEQbLcC27AASG5
	mJ6rw2DXC0aU0Zj5Qk61TKiTaU5lZR00QA+3ioksidymLkaMnONqYhDuv/ng7dLklw0sm5cYT73
	/vtP26vhku/xNS5JwLf26lINMCn8ntBzWesJ2nV9DZUhDfXjYEOiZs71vY2H58qRMMAz68srykp
	BnnWq0PQQu7qUWsXVgM8a8qyCGsL1nhhwQJ0KuvxxCIkxkCoI=
X-Received: by 2002:a05:6000:713:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-460301825femr23864909f8f.0.1780924851118;
        Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:25 +0200
Subject: [PATCH 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-4-4639a0492274@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-111891-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 281AB656A3F

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 9217e8de5512..d7642db2e2df 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2381,6 +2381,15 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.bam_offset = 0x30000,
 };
 
+static const struct qcom_nandc_props mdm9607_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.supports_bam = true,
+	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
+	.dev_cmd_reg_start = 0x7000,
+	.bam_offset = 0x30000,
+};
+
 static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
@@ -2412,6 +2421,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,mdm9607-nand",
+		.data = &mdm9607_nandc_props,
+	},
 	{
 		.compatible = "qcom,sdx55-nand",
 		.data = &sdx55_nandc_props,

-- 
2.54.0


