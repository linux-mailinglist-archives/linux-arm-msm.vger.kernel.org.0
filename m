Return-Path: <linux-arm-msm+bounces-116927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s/p4Gg3IS2qaaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9571280A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:21:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=zlC1x1Fv;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6E0D317BA36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950913A7848;
	Mon,  6 Jul 2026 15:03:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264F39E6FD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350188; cv=none; b=RmWwfQlbUX+pfAD6jXG6DsIrR4n0jgIbUGlWJ2IHerEjaiI1TA3waxmANFYGtRDJGSRxuKbZyz5s3jRHQz8yX+mfo4LbUEvZkPOVjZmEtvGpji7xeV8Fg9NQIYh032vxNEyYdC37l9qATAZeF6PMclGLNf+tN1cOWqDwEFXPaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350188; c=relaxed/simple;
	bh=QlgPztLT0l1AgtAQLK4Gjg/iArBYh5F6QfMuZvh8PRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7XrHQ9gNr+TT7/YsyF7b4LAZNNf15ZavLwmKp6HrDjqKeEEMU1Fkf5+Uo10y4J7oZKN2um0zvE9P3a7B839NV0JDFp9bJINyERrB1FwUvu+fQ1E73M+wUN7YAUJACfDqGwkbnGal0vleGvI2Suf84b3m/s1wKC8Ph2StMxcJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlC1x1Fv; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c59f740cso21968805e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350185; x=1783954985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=zlC1x1Fvz0AFaDyDcUtLFWhq16jn7mqVgHQWt13ZmcuC3eulymkdonDEo2xdTuvYfA
         18RRsmRRBbvPSv71sC947D4eNX9rNt3AyWlwONFUQCKoWJwCD3+K3IWQJBfEyJwPbtlQ
         uhCRFQgPyGAUbHEAs3XI94LjYBv0YsFdrgOLvHyw6iPt8nGTzHsUgUJ5saoD/tUW7q79
         DgNiqsBu1I3Rfv2SjNYJ7lZHjfbCiobat0H2NbhmzIbFu9wWFnxBpxsD+4BTiRYPyAVE
         FOy99PwRJxQByK4sznfDwtJdiPnN0ql0wxdaT2mqCLYz1itxR3P1dihv2tcpWnmcsaIq
         NRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350185; x=1783954985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=ey513dhMghxOzfeRUHWyOZNUuDizWfq7dy3W8Los2jN8TmYK/tim9BV6J5zM2IrLOa
         dtwudhWhQYnH/1qPwaV237xkeRyRZhm8dKlWI8is86yXaAnLTP1KQPH8oPZqse0i8V9R
         FqXmtTD7Ygf3bQkcsRXphZ8p05V1QzGiHZ6f285n7OE5nGVcwr5H/WyIJtLjwug9AHtL
         dmUv9sv0+hJ1HCw8FyYgSWZeuuSSFySx4qSFssHArwo1g8xIDg07JxRhT1aXxoEUy2gy
         grLQDDtB2bNyyenlhXdU8Sbz04DbmtmZfLQ/5QADOYXtPz9HqPpOsybpEMo0T6dj4khQ
         TJdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZk0sKOn36026GwvfsYyBy6ep8XsRA/pTnkO6Ni1TLJfvGuD9q4LYu7MW9rIq/DEvbfpRLmyycQk71aDO2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2TJG6QTPnRGwRXTZ6Yy4uaPyCzFJuj7dkLmuMnWQXIT+Skex
	LqXSL6W9ZDITszt6Bm6ngR0u2xp3H0252EcvWNoixylTvGdEIpS4i3ii1Nbeln2sZoE=
X-Gm-Gg: AfdE7cndZkZ+qPFRJUhyrq7lCRloHEADEPXgBsPEYKNrM7/fYW2UgCkV3biZOwgkZqu
	jB4eoOXbiVgMauudpQ/pMeK5BNHZ6+OUa/+usdNZ2FQbkh6F0Lb5cRX0WK+TfgRJKWFVURSr1uJ
	JzZTWZ96FqGBb5ROMUxNSEsmHF7xoEUnNr158vcugowa0WciTMt4y5kTvq2fTdiopZ6tYbl0X8+
	5Ll9D/iZ0mae6Z4Km64IDzVRoHAZgZdQHQRgsSJcmms3YcAFRqTQB39P953ypl5X2hMMfbCNl5P
	NAuHWGnPIAphS18RtgnP3Am1S4zUWds3uA4LTHILBV7bD47wcJ4gyCEYTJNIniLTHbJ48XtFyrH
	Z7EL5KNPyKrQq096BaaHibXuWuLKG2fkIgS+cqwgCCXx9lVvG/3dzpkUZ3wzS+wzNoywcv7DwT4
	gxKcHqVc9s+tdrhISclHK67mWWsA==
X-Received: by 2002:a05:600c:8219:b0:492:59fe:4a15 with SMTP id 5b1f17b1804b1-493df0a7583mr10518085e9.24.1783350184808;
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:19 +0200
Subject: [PATCH v2 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-12-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-116927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gerhold.net:email,qualcomm.com:email,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9E9571280A

From: Stephan Gerhold <stephan@gerhold.net>

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 4b749c99586b..2e4cdb590623 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1425,16 +1425,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
 static int gcc_mdm9607_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
-	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {

-- 
2.54.0


