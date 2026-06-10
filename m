Return-Path: <linux-arm-msm+bounces-112538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmCqD9WmKWrBbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D011766C24E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:03:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xbwuKLYP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112538-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112538-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 526633037B63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F000355F3A;
	Wed, 10 Jun 2026 18:02:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438E3546DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:02:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114545; cv=none; b=ib8BEZ6nmHRh3jIvQh+FCl0rs7y0GYHA6oB5PxSZDD3QYh2ltrZ3Orcjql6mOxbEBqgfWtFyk0FvET0cMUyceBFNpnIpSZQF6ApRnDnHAn3p68U8hjWLRXvIGJvWXVCZNuHNwSGm2tTzLQopyUBOX6Xo70vnHjUxL8PzXEYdrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114545; c=relaxed/simple;
	bh=Vz+Qc59Rtxnn7Ch0IoKjnR0GEZtH0evFqmN691McLno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frlN2SlwR6jvzQTwrMwYmU2HnMWlyZmiNWcHhiJUgU1NMCZrpkUMNiCKf1WCrTE/QVBcAVSlMP8MAqigqkNPAhY9sqlqvPwty27AlBpi8+4dzbjPE4wuBD0SeYjDIIAepGsTnz76kHDdp5JBcQ/xI8Av3WEyLbeESeus9I1CGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbwuKLYP; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490af320e2aso77881565e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114542; x=1781719342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=xbwuKLYP301fprJi9BymQ7ox3HmMp/A1JXUqS1pPoLxjVDvgYEVuqU2hwUfcykg7m+
         kNjY0JwszPjwtuLg//eINEX5XZuso4w+rcqJvxOpujcoJQxuAVtKvpiM2obqiU3qAMBH
         JGvlKmNdesGgjZ8D4rQjnQPd7jvPWYKD0jN30TS/32QULrC6KUgw46u+62tdM/7PK0sf
         ZaycmsWL0TYbxjyypyrOtdkRSCjIZBRjQGRq3u9fjGQnHXE1UswwgK8uvo02CB8aBZuB
         xg7ALIg8gCMmni83CcMs7jaPyNtnNZwY7afoM+hgmpjOaLeGKy5aXsVOLKWbFonsnYxN
         qotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114542; x=1781719342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=RgxySfPeErbgZzCxjnpd4cwcqzt5UBDtnZj3YNJb7sGdKtYxBkhOgdv4tMxUOtUmID
         85vln+z15CUUkHjW8XFSwh9CYseQYHPGqc7GtElP+P9o6GC+lTvVa5gGM2Ym8HUlByJV
         ayoCFnK+F6TxZL87y/woRlyn2mObVJf7H88YjGD/WPWTXabMdIDM+HmxzBkOlcNbQgZT
         t4Eo9uekE+0ZyBMFWR/cpFL+7/q2ff/F+N5k1whJCZSq1PctZXSCAXj1IAOBsXGTqazM
         bbEaM0sCYJZN0CknJk0hUm7bpn1VDda3wW6kpBEbn/J20AHqTUx22fxQbw9xG+VLRicO
         FQYA==
X-Forwarded-Encrypted: i=1; AFNElJ+uCkikQnvbfxP7TteT455r89MxgCTABrR49K2GNCYPz8JiGY61L77NxCXuqslTOBAHrg9RubSZ+NlPLlWC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx362TB193e5AaDbgOfL2c2MnSNIDjsFC3QkrJHVBh+kKi3UVfl
	QP18sM4tXZqCL+T8ODP+uxWc5eJOwVQGJiPLitq/zKI3bNEOR0voj7CHybwGEbu0A38=
X-Gm-Gg: Acq92OHkwFUueGigmoFcPEBkYjrMTrRWdU9OkVqmmQLPIWNmpjlX5HXCwKI2i5QxUqt
	Oh1Tic5hj8V43vUFv2Ih4ZcX6oA6kuo31xEITebF4Ys6wwXnDGxrogzlVCP4EcLNFoU7ICAlAEh
	QtOpFU49ZY4c3nS86TkYD4If3AUq0q1/4uOSU/RJlVXDBMN8Lor3guSHgR6xXhFovNp5oMn3wLK
	SGSJT2Rzn2MHsWCmFghQJrdbDWvMYR1t6PjHjPEbx69qSPLOfoWy/d5nEK91f/9g8oa1HTrZxy2
	/hAPAhCZEHDp+v3C7MDpLT4oUlaDHjo95QUW6RD8exd450BY5D2daEy1l26fOMvXa97OP5W6LN6
	hwUWfFjWVIJhNlosIzACgS18IPBcjIHpXNd1SashZbFSD3uJVS/FL94FuXiWrzy/nGheFjtjoJt
	yiW4eSWHiuwAaUssTnAZYU0Cy4uK+++PqhyLFXlNbCxmNP
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr235234135e9.3.1781114542530;
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c0d360sm3170715e9.0.2026.06.10.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 20:02:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Message-ID: <aimmrJn3c0cJaYc9@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
 <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112538-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D011766C24E

On Wed, Jun 10, 2026 at 11:01:34PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> > since it's used by the CPU and also various other components such as UART.
> > We also vote for this bit in the actual GPLL0 definition, which will be set
> > as soon as any driver in the kernel requires using the GPLL0 clock.
> > 
> > All in all, this makes separately voting for GPLL0 during probe redundant,
> > especially because the "acpuclock" in the comment is a downstream construct
> > that does not exist in upstream.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
> > index 0bd4c12483cd..ce78ebc8ffec 100644
> > --- a/drivers/clk/qcom/gcc-mdm9607.c
> > +++ b/drivers/clk/qcom/gcc-mdm9607.c
> > @@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
> >  
> >  static int gcc_mdm9607_probe(struct platform_device *pdev)
> >  {
> > -	struct regmap *regmap;
> > -
> > -	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
> > -	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > -
> > -	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
> > -	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
> 
> This was to ensure that the (APCS_GPLL_ENA_VOTE) vote indeed has a vote
> from CPU. AFAIR, the boot up was not using this particular PLL vote
> register and no piggy backing for the GPLL vote.
> 

Hm, I'm not sure when this would be the case. The original LK bootloader
source code also sets this bit when enabling GPLL-related clocks, so I'm
not sure when/why this bit would be missing.

Either way, I don't think it will make a difference in practice, since
it's pretty much guaranteed that one of the later clock enable sequences
(UART, USB, ...) is going to vote for GPLL0 as well.

Thanks,
Stephan

