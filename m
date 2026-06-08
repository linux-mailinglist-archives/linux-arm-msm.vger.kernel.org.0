Return-Path: <linux-arm-msm+bounces-111888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VqJwOGnDJmrCkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE4656A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=O50rKS3s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 735C6304359A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8340837F74C;
	Mon,  8 Jun 2026 13:20:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3BB372690
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:20:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924852; cv=none; b=PVa9ejS7dNQ7GLGw0tE/jQ6R020uG2H05FmrJLlEJsReoNcbEcPnvFW0KWgOTw0zWtolAo7tI9q6OCkkfU0qNE76GK9wlBKVsWb0hdaLFzUrB4+ykmNAt/4cJOnzTUGBHmQ5XFoWCPSfLKQBfNPj0yPYZ7gaN9HPEbY5il7S7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924852; c=relaxed/simple;
	bh=0AgIAl17ixhY3CTP9QeRWJkMWUPldlinPLmeQltSSw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwv0R8cLek90i7ZxhkxTJzelC9r3rwEiyIRBkFqjGnNOM3GWPX3fWyI+3kfgstyoeOkO+or0+wF5ca7yiOsS2qgubMoS9Rv4m0Rcml8TzxPNA363oEZhZo3ygTH9CXbhMnk/vt7Iqaekj99yWFxLNgg4eAJ2Ks+sNQ44Oxi6Nig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O50rKS3s; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so34848055e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924849; x=1781529649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=O50rKS3smR/TsZjEXbRbRyG7HC1qBfU/QHvn+Fh/PB5SSIza9FqGHgTU+sCRPXi01i
         C8e1GEkIzrY9uhd04U+jbIspEbbvDkv3TYZQIRtixEdY5w564BRS4jAuZsOtcmpp0KI+
         h1vEJWn17ZC9+/p+3C0K9siyGxk+R48Y0p7vj0xLiEAC+54O0pTtVQmeiTczSCKOqgij
         cQrQSJRAwmdJPOVeI4BLKqHD45ym2f0xbqEkMd6A6fF18S0PRnf2aeiE4a7IKFR6B7ki
         hHBb7gMeRDx7N14g+fJpnzY5Mcni/BTe2JGK3nidzNZaa/K0/gX4AF2JcvGkdiYrQNZB
         NRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924849; x=1781529649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=DDGyx5kVB3s0U6+MkJ+cspCbbyOwLT64DZFG+ES6TK1ksKjeVvomrws4L7WPTaYqso
         dKSncF6YJYhXdNQnAek68WH+u6uQpQckfTUgdks3MjFQo+tG1pb1aWjd2K1qWNb7F+Ul
         yQVq2gy5tEAL5mAgGIc1bmeQfuq78Y0LZceINb60AaB45uuZgQJWZkJNyQJdU7EnL0ul
         KLQ6Gj7ihLK/dpilEsu4vprmJIleMDbWr69zRSIWN8x3UdH0RN8/dQzpyxBGVnpgzJ+l
         urES4cQw/4rg5ar8XRW5NuWdIV5j8Jnq62D22jhIUog/KZPKzzn9tm0JxN0ZvHqClqsK
         qirQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cbeuaDGo/yeQzVzoYWG+vVFwW0N0E1aCurD6GQySz1gsXjPtZL2Cn77vhTHjK1ay9fhgELtJsKVrJivg1@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrJkMlGZyZEWBh068DJn6WqvaldqwDbV2gBTII5r9fgIAMc1L
	oghKDlCCxhQt1alKmqUYdP9PVAxIpmAAmf+RRTGCbf2zGnsvLryeCRVE0AduGMO3c1U=
X-Gm-Gg: Acq92OHbQJyJu6ElTUV5yg5hytjNf7jhTUzsKZ4B6aFd/Pck2tz60zWdyYYNEwUQgVD
	BZlx41WX9h4WAnz/Iixnk8Rerls8fQJDyngOdwn5evo5UQcH0/qNPOrzYerzJp6i4tphnUm36u6
	u/ZWvnlKop0pove23/6tI8J2HAxNIatw4DqGsJsJmFVStMtiIShoSphoAimx0kgsKRfhCwXgJFz
	BxeIlTulMGHczRIv3jnAmMEhVxZ5/gAb3yzKPzItWQSANbLEVDduL5WjiajVfAqfpDYHrD48mfj
	pue6aT34FFqL5N3EclQzzbSno/kXuC1gWM//GBOHdJ6IiGhA7rSVZ00iHG5/4tebsdKY9OqqLgz
	wXNpUVTVG3r+ef1eRaiaQlDkqEiNcVTHrNcJ7XPVTxvtZ+xoOzXpDzazU0k/Q29tF6GPJWBRAi2
	0VYJ5lJJvhLVYg/T6AsEIlBkZpOJ8i0crNFLTdysath/iZTxs=
X-Received: by 2002:a05:600c:34ca:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-490c2592042mr268917625e9.2.1780924849190;
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:23 +0200
Subject: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111888-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 53DE4656A28

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

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


