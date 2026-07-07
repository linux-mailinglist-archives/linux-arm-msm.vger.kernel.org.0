Return-Path: <linux-arm-msm+bounces-117304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CLXqHL3qTGo1sAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:02:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D671B2DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:02:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=waVWNUPp;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA6B930F404E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C9E3FB07A;
	Tue,  7 Jul 2026 11:56:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6D3FC5A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425387; cv=none; b=lC4oo0EtFrZJmsG44n1/UFQmaLicTBU9iMabj0lRicXOcmsYBRxhQ8yjCSqQftdlhTCKso03Fr2K+Eini6obCttpVGz6+0EXZHOm21l6R6bE1Fb8yS0NB1p/dc4yrLZ2kFgjv5zi5wgZSQ5beq7E92Ij1e9/r/qXrqlsx22UTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425387; c=relaxed/simple;
	bh=nnvK5OyVStyB68ojaRbHyRT1K6wfBsNB9/88lNM7q3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmbSCc1/KIpcdXbfHg+omO9wKJwOGLRSrc6EDZDHaUEMYUyQ6a4MTP14nqBTbmfxN9831BYjprlTA0LVDSAKmiLad/gWbIUI9WJS3v2h/ZOv1jdrzTuZg55bel+ydiGVJpaNsANo6HxcINeHy+fOGYULp6H+7rLVm2oYMPYPvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waVWNUPp; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1501852f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425384; x=1784030184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=waVWNUPpnFKFd5HsJlat7safSw6ScvxyOW3zlTehKGTkSB6+bZKmH0hE1tFrpSmvOK
         q3EUOYoHlgNFxyQPW6RtfBjmWQHJ09QXL8buaT4+PgfBHJ32nw+SlJKVIUGYM8yhflsn
         jDwPg3JZ3OqkPrtpacUwYkGNBFp95x7yOwUG97fb4Qy0m3ylZ8knW/79eBP/NWpmGu6E
         hoP6CH6Eq49/kUA/SCNXPutGJ47MKWV2R/N6R46ZZIDuepE8cDZOtO0cCvJa7z8fFrDi
         CP+1vSZbkFHQsYUkyVG4PNZCUsZAtNUtabe4XwlKpiCWDRMPh6ZMqmbAWv4lxIoXtiHM
         xtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425384; x=1784030184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=cBFIBI2Dx9NHD7S6BZrv5uX8qwrOKh9Q9m8XmFJjbCBbo6E86S4mhts4EwNhkyj4wJ
         UR+BQWSpCcp6S3ekjQTOw1m11W9uiI6l1b2Sn2CsPdCUu+JdwXCsZHQMi5CuTM8Sl/zG
         dtVLnLqbacGTvgctIRnIcmK+GX4zxBbFufBwt4DbFNRwslo8VDqSUxtzqRbf4V9wJdcE
         G3kiczqHlsY6pcuUSjEHHjBrm14ja+nhYKU3cn1QHBUM9rIRKTN6zpJg+BeEYoqY9Y0V
         sjQnxGPO8pyo633MjTYxRz1gQh4couD7Mt0v4lO7NH0Bx+TWPjqRq3SiQCG3LfiBVQ7j
         2jsA==
X-Forwarded-Encrypted: i=1; AHgh+RpllZjolP4CXS6vDvIXc4ffXVKcUFQwvs8aweMA46wKEHh4sI5QFsxrcnXNuSdbDmCnue/DeeX6Qc6e0cFu@vger.kernel.org
X-Gm-Message-State: AOJu0YyRv0CrNt6EQ91GVT1POLWt96SWcIzrhXOcHXL51zKftPzTIGr6
	FSFjfwIKaAdi28PSvW9vCXMwzhWYdN7UdNZwaB2dItv2NEPD0jxXLi2XFIL/Ko8vRlo=
X-Gm-Gg: AfdE7cn+8SXlLZjJkU35yHzjWcyuQRRYA8rOlGKBo4AvSfW2km+/bOihvfVHtwzlu9o
	dHS5XIjTJCZ6m8l5nJZCCOXYbnkOznDRB6A/eo75P4BOw48emUSL0NEkN5VsWXyGhISJxRJDLw0
	LCq04hU2us/xSr1jK0GMJKYvvecnx0qFr00OpIDkiTxmTOrrMhyEeY3/oH8SKl2J858sWSMvGm3
	qo2mGvSvynMkkr5IavXGCCiylVg1kYj9B7ZW1fMPxzZtrhgI1CdoIuGZhjIDbX19NC41FfESHRa
	S2hdGpP1bZqwpMhckYOo3K4mIj/O98ovfSH2NfnO6nl76XJcZS80pHWvt32/yNj44CFBzDx8Xx/
	fCxExmvd98FlE5rUK9dgKtuEtCRKp9Za05jZ9Qy4/azkq4gR+VzDm47f1p2Ka9zX/NPtPoNJsV9
	LV/6Hso+WF9Vlxxqt5aALWGM1j0Q==
X-Received: by 2002:a05:600c:548d:b0:493:c76a:2363 with SMTP id 5b1f17b1804b1-493df062bbfmr53504795e9.6.1783425383827;
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:02 +0200
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-117304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A9D671B2DC

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree from the OS point of view.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4b80ce084d9a..0251dd591d40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->core_clk))
 		return PTR_ERR(nandc->core_clk);
 
-	nandc->aon_clk = devm_clk_get(dev, "aon");
+	nandc->aon_clk = devm_clk_get_optional(dev, "aon");
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 

-- 
2.54.0


