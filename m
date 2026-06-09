Return-Path: <linux-arm-msm+bounces-112203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PmoDNDYiKGoo+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D9660FC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=W3e5TYgn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112203-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112203-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B36A3109E92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6254435B12B;
	Tue,  9 Jun 2026 14:15:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE235DA42
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014533; cv=none; b=lOqwY85MwtCHCPpEXn23ZATqpGQFKl/oB33QhvUhwJRt1Mj51HCCRe5FyihY9eOyvNBwloXVkF3RBMl08sAjZt+OlXuW/L2AHMriTtjndbhZzq8npBt7KeBPAuRlW7jY25f8pmpiJF1dOXRkOUi5W+WVweXQz5kz6I/DIKg/320=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014533; c=relaxed/simple;
	bh=yZxjV6+ULEzVXfFwKMM55TezT0YyFiY3vaA58wvIX6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFOYosdRN9Hq56CbiDmYtUHqmL042MHot+F50Zd1uGRZAM7lY1LLT9qtlSVj1tBJVwS18Fwg5qAweLvyAOdl1G1cSzk4ik5Xcoai8NS2sz+GigYcypx/k1EbCNOD5+lqUZO2FV5CgEDSKHqtyP+u9kLN3Q0uQ6JVZ0peVNdlrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3e5TYgn; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b12270b3so33658395e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014530; x=1781619330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=W3e5TYgnDzWSb13WdRcRy/ukRz9YwTOI4o/cND2v97mOYMioXPryrud4xPd8sFYoqd
         5uT2aqTXtUtUNjvsY0Tm90Pq3OeY77UXPe/F5hQbSBKjfCLdr0sBvmbpz8dreHpjv93G
         GMgvkQbicTlY/mg36CZszqTg7/g4wjIorupVebFC3pr3yVDzdB1ZECSTQHC2/FUOzX7m
         PdnhhAW4quxsRn81YbsXvwD2aTRr/+FVZvtbWVAtvztdCpQ4fVvCPH91vkV2M3TMfHjt
         Zq5eEkn6kiR26ETINxGz6h0ylEoxfeLmKg11JMiYtK68lKoS0z52Fgju/z5BL4Smgeml
         APSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014530; x=1781619330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=UC+3MdTZvsOxIY/LfU/xt3yXXM4uKGvE5OB8onhgMzf9jO1yfEocow/dQX2fZDq/Zt
         ysa1K64NESXCAR7C3/g59b/6QQpjDDgsyHwUXBOP6hkQ343iDImmYpLmg5Y3hnaHDRKq
         k6CPeWhoyD0wdZJxNtCl4G2oiFjEfXUsAerQ05105FrqlF6X/wZMj2yXsYb9H3cOpadI
         /y5T2WvTPfNnL86ydl7TNn/qHGQwOnLvmyJuPev6hxAclaRzsMMUxSUSi4FyCjZ+/sAx
         eIo8en9XORZS2GGgy4Sg0lUyf1Lpli8tJKVBOAMWI4VUo3rw0IePziLX1YSxLtytCuZp
         2wag==
X-Forwarded-Encrypted: i=1; AFNElJ/+f0ZQITY/KySxtHcA86vdGHow1pAUgdLj6kTlz6ozwICQgekM7GnbF1Ekj+5IN9x1upVLhkdj7zO+aQ+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4B40Jb5wQEh3Rdqo1V0flVaz7XNjAI9p1F6IVeO3z+QgegRg
	Sa2LmmpLU9kGsdWArnwBsz0YahA4nf5C1aW5RxvoBBPbTdajZByVDvvlmmnHo1YnPd8=
X-Gm-Gg: Acq92OGD/wBwlAlpV7mrUWKAJ1WDQhBqzE60RvuBIWFfCZSP7o8lVVpp6NMsEPKg1nG
	rKEvoT0lfd5ilzVAItQDcMUCwwXdF0+mRgYjdDRLUakXGbpEatJ39kD0x2youWLNHLPKjxVwksx
	Ind0vECosJdGEl97lOTQTJuU24A5ufYhfVYQ7keYHdtZ9k7yE8Gg+llORHyfxTdniT32iukuLNE
	tbua1HeEXCdSqUl+4w96uEBPZeVWhD/pcAS0r5Rdraev7JL6fu+mZO1PoKM7XCHtuRE5dHGm/rp
	VwmZ50Z8HbAAEZ8sQlhVft6fGfvqFKqCcw0O750zIupMDQygQldEWb7xSwijrTwzZDiRt58IJG3
	8JJVHEtUGyCmYRUuJeLXxSRFW5Uya3JEYjjETjDbRC1tC7i98jC8iuaSK5lK/eK1lj0XZox+zLY
	43YfoM9DZvNBH+jHI21csNDcbWmp2RZjP9DqBkI9JaNcFZksIZa4oyojINEA==
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr328323305e9.2.1781014530409;
        Tue, 09 Jun 2026 07:15:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:48 +0200
Subject: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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
 devicetree@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-112203-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gerhold.net:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632D9660FC0

From: Stephan Gerhold <stephan@gerhold.net>

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 0bd4c12483cd..ce78ebc8ffec 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
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


