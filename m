Return-Path: <linux-arm-msm+bounces-92615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLCtIZ3WjGm+tgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:21:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28A127215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3A4D300463F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BDC1A0B15;
	Wed, 11 Feb 2026 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XA4qx6kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3527FB0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770837649; cv=none; b=SfhQJCGZqwgOUoO3sfYbouD2n9ObEETVJkPmCy5OoJNKD0mWV7ofDd3bY9A2fkzqMWyUIH2Mb+n14WWuqZ4Y4nQ3gtP3LPHAWf6s5e64NvszJgPuXWJ+jkBbBw3me9VQ2flFpKw9CM1z7k63OOWvnhTQTzRh2ZeStvH736cSKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770837649; c=relaxed/simple;
	bh=N7jtro5oSJN1JKozY7l0/NLT0gx83PLmC0myZcZeqW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYNbfDMZCUJR7x5B/xKzubv2EM0iR0DG1jEj7F99jWNSY0heq7vPsHz2swLO2OWGKTSqHcq55qwaGXlUt1/7O6uqUB0Tmcj7IUCLMAhTVhGvxn3XKDNHieDT4E4tNAurJ/FKNLm5XdSCQZbmBIAtkCyVR6DbdTpXmlWrf0MrWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XA4qx6kd; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c59bce68a1so167580185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 11:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770837646; x=1771442446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hnjm98atgKsIzfRxPyb/8amThvi/ub+kK9XVY2KgknI=;
        b=XA4qx6kdzGxpYbNm808+tcFQvxoWXgCxbzFAmbhfsLXxu4IoLCVkXR0HA3EzqeSc6Z
         YbGV1AGtjiIB3xoJUxWhbsveNcpHRHhzQRQdjBwBEobTxueMPwujR5+F9xfOkaQ7xrcr
         koLV5cf38Rk49Bl9VzI5xu2RJsMRqIenjVBaZyRR22WZdkh1Djrfw8tq8sqOTfpkxUgJ
         zOUUCwxWMlDP1P8fbooRXk/4BFpEGdpo7OpNZ3yV0PvfpNJ2uHV8Oy8+X7hGBhTSYzxH
         Shc3LBXFgkhICyoHP7afbQF6yV61g8piw1eSFgNSLMEHJBfeqIS9J8dLmNJyTCSdGPFS
         9e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770837646; x=1771442446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hnjm98atgKsIzfRxPyb/8amThvi/ub+kK9XVY2KgknI=;
        b=pdmT6Hu0kdL0DuismvEQBJxAt0AP4mto7o80he8C4xD5RQSUH6RV3LoGH6z3WMaMmD
         HQ5hBW/Zqf+QtuDAFLPPQeFm9AjwhihFBfGgQbC7bDAwCb0CEuBDx2VXUvy5iFI16roA
         /C38B9RYXmfWcghwilit/7HZySUv0rAEFUezfjFI6thpDZDe1I+/b/XC/mTRN2jwS55A
         tnY1uMyFn1Yc4Dk5bBrMoqtPnucwYJLzdbAAziTNn7kxeT8yuYdfrKGcrPimt8PNSbYL
         Am7Dh6S7p39TbZ3+RD1Oy9LEsvKBnxA6LIbYT/d3Tzzyx+l0JwZkawQj5GIa+07ljEfV
         JjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCdRUSaGXncKUyG58k3mrAmZIa/emgR1G38a3ooYJDanVN7Y3cJIr7mwjQMnX/ByHjQvSQdgUGAS0+enrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7C0cfu/w0eCKH45COLQqtcFGlxiTBjoy4RF/M5PRh23mnNw4E
	IY9oUaLuFaRoS6eN2oWzPzrKESTOpKRkGwbTefVWlUmbNzRi7aXd7yUz
X-Gm-Gg: AZuq6aJR4uiKhtpOg4J8sDASrohk5KaQ/c7rCh8Dm1WfLMerGGOm08U5QJ+kqzdDG9R
	GOlTXLtqj/au1HvA7dvZ3Fbr55wXvsmade/L3j0AOz5eSPf2wPSxmi/rzbjfIEJ6jLAmPoSe7rt
	nFCEsxW40SLbhgRyTWpCIZr1TVnUjjhJVjmwrXe18FDnL3McsvJF/Ox2o8nN2Yx0YzZUenfI80S
	Jeztq03PplPLBwU3RP5s50roBxo1ovj88He+/JlcMsSPwL4Ka34WlcLqRazJgqSCXY+BnzLNjRg
	wyqV/mD+qS00Z1aAxmiLW4Fh3pnmN7JgxBbp2/zGtqJuRLKF10PKqHbn7wmrVHOhitRaS26WXlb
	07Hh9rtQdilNybIsyD52a9DtTLKzqj0rZO+iTdjGknclwO/AoHHUmrNyXl9FbVQ8y3cR72kb8SM
	AQMLJLVm9SkzQSCBdoJ//bvFukS+mR7yX5tlbY
X-Received: by 2002:a05:620a:4892:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8cb3308ed3bmr48912085a.29.1770837645889;
        Wed, 11 Feb 2026 11:20:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1f8185sm180521985a.36.2026.02.11.11.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:20:45 -0800 (PST)
Date: Wed, 11 Feb 2026 14:21:12 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: llcc: Add configuration data for SDM670
Message-ID: <aYzWqFybymwd17Dx@rdacayan>
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-3-mailingradian@gmail.com>
 <026ce34c-c880-4832-a791-656fb245a495@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <026ce34c-c880-4832-a791-656fb245a495@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92615-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C28A127215
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:27:40AM +0100, Konrad Dybcio wrote:
> On 2/10/26 3:19 AM, Richard Acayan wrote:
> > Add system cache table and configs for the SDM670 SoC.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> I have a clone of some msm-4.9 on my ssd and it roughly matches this
> patch
> 
> However
> 
> In docs, I see a version with only CPU_SS, MODEM and MMUHWT left
> (your settings here seem to match), dated later than the last commit
> to llcc-sdm670.c in that downstream kernel clone..
> 
> Because this SoC seems to only have 512KiB of LLC in total, it may
> be that it was found in testing for that configuration to have a
> better perf profile
> 
> Could you please give it a shot and check if you see any immediate
> gains/losses?

I don't notice a difference outside the margin of error. The Unixbench
workload reported 4550.4 with all configs, and 4550.9 with only
LLCC_CPUSS, LLCC_MDM, and LLCC_MMUHWT. My 15-second workload on
Hexagon/CDSP was half a second faster when commenting out the cache use
cases.

I don't see better startup times either.

