Return-Path: <linux-arm-msm+bounces-117305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HtiQAd/qTGo7sAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:02:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BA71B2EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HEo7nSqP;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117305-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117305-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516273110A60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F84F3FE374;
	Tue,  7 Jul 2026 11:56:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5593FB7DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425389; cv=none; b=aEnTdx3+qMxaAMShiMA6Q6Kmg98LKIPkzOV6E4w/laGy4n3rfLEbZjNWmtjkA31Emz/6n6j35SFStvh9eFAUUZo/371+ZU5FiufvNJh12mBhZUyGT0Bjs7bAUo2yrVBVbJbRi6/rAFGUqOOSwYlqXhtEcNVNyqca1HeLU9oN0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425389; c=relaxed/simple;
	bh=hWj31lhwWSMl4fvrQtR4dMPh5W5sOHQNKqKaZhYIY9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAcc15JwKnW8yoJTo1VM9tzH4Qppa7HUwLfi+wIadR5cdqDO/vJBLhJFBJPBXRPuhvAn5cN614PNdlPZ9v+VlP9TG+Ns6Wqm6tCQTN8ENhV61SerVD+U4DGKwYTaUEmgmas028zxSqujOjX1VFtuC36nDZfNTFzWudQMp96etfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEo7nSqP; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2053481f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425386; x=1784030186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=HEo7nSqPK2HL1hAvc9Y73q0/umGhdtz9GPRgv1NzLQ055jlBjTyr/vXDZzUhbG4VZV
         xP5N+95CUcXo+HHsMnIITB1/LxSNy+aEBxLKMwxU7++RZW2O+Z/QnkJxBY+yIc3Tp5IL
         CxA9I1vfcdNpMogEhrOhJrHVBi8o4L1yT37jqab0s/vFe+My4wUZnIU4ToQyITWN5ghu
         eFQSkzpzyqUhZ4rRsEn57a4Jj6C2OaYKMUOMgGiWOikSt+BN4stNIPTQYa0++T1pWi1x
         pftHzVVE3tkem9oHJlVPVow8OXO3O1SxykDPR5jb5UUIGTO08pWTqiYScYlQ3+OUYmu7
         V40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425386; x=1784030186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=TjwQxnhJPuY6ew7mfWcoGt13pvLhsg94HvGRKrz3c+Q945vCvatR/nhch/jaUsKdCB
         4PFPPfNWDGZhsoUbbNB77Rcj2QXUPDZtHcv5+iu4XmufSitEy2S6hgC/vxzPUjCyYGOK
         1cJgTzqP5h8YHgaGQZ0aWC9B31jN25zArYUyeUocEn4IQG45xYChaEBKBhFD3xbmpb2w
         7t79LaQk8EVBvUGkyvQyyZ6ZUPqCmYv0xhl8snHraRxaWM74GJt+WeRMq/NSjDMi5QKi
         8hfGjJ6juBKU+nPNtT1bpWgJSu/DRHCmRUGO7n/DaodqcueIOwwbD4kmCXT/4HEQGntD
         5lRA==
X-Forwarded-Encrypted: i=1; AHgh+RqBKfd6NZm9s5plysk1HEg3eMYI7/jT2ZRYXyYNSYZsK+Rxxef4YVpxHU4CALU6iqVdXFMFlUn1mN79nUzU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61YetZcZDtD3DTX+3afY2VUbAsWEc9V2I+Q4Kvu0qxQ7woZRM
	HI5DM+1xLM+6BtqLVyft7sKHGVq7BqCmvipWkPvIYvjMxOr0L+fJvlhBxjMs3N7Dex8=
X-Gm-Gg: AfdE7clJ2M3kqwoVz72JosNUbqU7V9PZSJPM2B44cLULlH9lO+TNsTN22ZcfM1I14Ct
	YajxZPC7fPyIDF1sh/ZDej89f5M9PTiIB4esCuiOGJdYnpNzLHHW25AEJeK+rguOrAowoQ/1E9R
	DhYfRvFlMb5GDqG5NJZYm8gHG8ur1xKnmv9F05SedpGcmJz/v1c+AdMXAXJfm5TQuTCde2PKfw4
	moTvnrOcCmFHz/0F05LdUCvRGTm5GHqyrXtMtrLuXPH3pVsA7xe4ZFFP/dntWflWpR5wSTeEr32
	YI1aIcVtGINPNxX8EXoCLmss3uO/VZa56BIM5tSB4K9I4pD3GDkmJG0d9Ja+y5N3MvN7mYReDp8
	3/8F23h/KLzd7S+SwknRd0eOIaHZ0c8ZhPJZR1cIGY2x7bBhARHiMj+Dr/igk+1NGCftE49bC60
	kDOFqFEnrADKA6TVTC9TUSO0QqtQ==
X-Received: by 2002:a05:600c:82c3:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493df1c9602mr49298465e9.1.1783425385675;
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:04 +0200
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-4-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B4BA71B2EB

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
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


