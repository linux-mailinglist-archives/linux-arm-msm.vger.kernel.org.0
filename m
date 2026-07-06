Return-Path: <linux-arm-msm+bounces-116859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IZDCG2CyS2rJYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:49:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D17427117BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:49:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=hs73lySi;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3951A30FD342
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F693420896;
	Mon,  6 Jul 2026 13:26:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DD33A0B01
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:26:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344389; cv=none; b=W3gB1bXtSkEdF9fBRJTgnzB99H8pAlSG3Qj0hIHnxRkEe+6A09HjQG1mOFxRS7ceWNqkvqDk50QkxYGRPU7j4Jb5RuyRdqa0YX70iOfPLEpie25rXWhvE1koHSttl5MwIZyYRmRE2qMCU9LtiaXVP56ZUQN3n0hx5D2JEXJzZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344389; c=relaxed/simple;
	bh=2X1TGST7uNQ4I4baBGRTZMrzsyrjAmmsqM/GevpKbSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UypH9axmBniKEsPYt/+jhUh4iPvlqGobpg/ucdOn9RvKuP9KbwuoT/1wdzPLycDNfuiDwwSyE9IjfNMK9RcGXWQf5ROkrsH86sdMh6CjVX+uq9P2wChwyp1i+HRkvkKIAbQDKFwjgD/v8cFQnIJOuXpdluQNI0/a/1oOOD65ppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs73lySi; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b779003fso15085665e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783344384; x=1783949184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=hs73lySiIQQG8zGbGy8ac2CZfCccA7sAEDMOwRwP9xHtM6Uj7QnfGnFODkjpfSzz8+
         NvhDdt9FUZlACoI6zT6N6gfvDJ87SZG7UGRXjX6OgsUlQyIQFQ42HyEUjG4eN96tLb0+
         gzqsXo8hI+MLl3zLe44CvGQA4ywU6rC+oPonSg1qWsNBLaSTxB8xZdPyTNfWDmIi9uVZ
         /hCw+kU+dpU9xvkUAl4GqlBq4pEb+AFyn1X+4N9yFsV6ZV1FeMCjYJvGuejOThR7zGr1
         UidPdQiPTDzakebinsBGAvYRI/m7lETQv/177p+wrtEZ6vl9UL446Azaov0yHQ+Cl0Qa
         bj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344384; x=1783949184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=gvQaKr8r32KXIUv6pq1JWZoyG6QL5bFgnVIs1yXou2huHChji2KA+WPcsIyRbRrrTt
         X2PovEDL45QPVb7jhm7SZvFMHSuGJub7Nge6gkihD7/7beL0dF5rkjHx+pZ1+XInzgIN
         Y9yTASqF6dmYcXUkxlUEBWuj30VN1jw/1Kj5XqHnwxTH8Y9SHzbgzGNJoMDzBRVhjWQ0
         OfG+VGwbFAd2KVscBHCWZqZ2eA1f3aklGvpW2BBPuGwnM8vTG+BI5Iz5aNgaEGNNQIUe
         ZM8kIwlpF3tyf0cnEoRDn4NE8V/VDhDmcKPLH0oP5/y4L6Hu3y+Cgx/1GHsytDQ3Ovz5
         SbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgF12THKPvaS53InEuDSnxwCmf1YYECYsPPBExg5FdMKa24NYcUD9A0mSJC5nfVgxJ9n2wuQViTNAQcdU+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8sC8GAkVVorRW8Jx2tJOQXU9jW+KEt3HXyRB5kMFTD9qsk+x4
	xd/uUyj1nvuJb4Cnv5+YrUAObIoheqj8Do8h/ngggGJNyzMcksElQEiL7NPyDj1FvmI=
X-Gm-Gg: AfdE7clmSxKsoHRETYZUtgeZhGPGi8a0aYbYvlk8NQV/l3JJMi9z1GiLeilK6GjuHQH
	SFjveMPQGq70aV0IJgTVE2u6wxRw13g9K6mBkyzQI9mezA69uqZL22uBp1y2E4URbx3+EhOKD3r
	+dYgQ14dNH+WvOMbU3E8iMYJl6dquYL6QSGlz0G3nrPSbrLLHKJXcAI9njsHQGFax0vYQM8LfHj
	C8/QAy4BvkX8qfcIaRgn9V3nAKm5LUEhEZiYVjOmV9k0HBLSK0GYhgPV8EOp/SDWQm3So+a+Kli
	WrGWFrfIDezf9EX06UWzNkNrU3SUMlAeCNKLNkmm97yCu85PooFuokPEO8sWS8NfE6sQjynhReX
	xfpuYKlgyjdWG7ML5WFtbNFb2fU0reaI4wUEglMan5Vme0l6YVeUFtCRCvOzrUutGzOcd9ULJJA
	atn1MAW4+TiXs0n+ckAqaIc9r105hat6vXdDw=
X-Received: by 2002:a05:600c:6a0d:b0:493:bc4a:fb51 with SMTP id 5b1f17b1804b1-493df077ef6mr3952495e9.39.1783344384207;
        Mon, 06 Jul 2026 06:26:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm326732325e9.0.2026.07.06.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:26:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:26:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akus-hN7-yf4Y6XU@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
 <akult0UUSSwKQ8F5@linaro.org>
 <875x2smf39.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x2smf39.fsf@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-116859-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D17427117BF

On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
> On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> >> > is missing the rest of the hardware changes in QPIC v2. There is also only
> >> > a single clock that can be controlled using the RPM firmware. Document and
> >> > add the new qcom,mdm9607-nand compatible for this setup.
> >> > 
> >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >> 
> >> You could ammend patch 1's commit message with the information I shared in the
> >> reply. But nevertheless:
> >> 
> >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> 
> >
> > Do you want me to resend the series with patch 1 commit message
> > adjusted? There were no other changes requested as far as I can tell.
> 
> I was mostly waiting for answers on my questions from the DT binding
> maintainers, but I understand they must be too loaded at the moment.
> 
> > I think the current commit message there is fine, especially if you add
> > the Link: tag during applying. The extra context will be there.
> >
> > If you want me to resend, I would just replace the second paragraph in
> > patch 1 with the following:
> >
> > ---
> > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> > (ahb, core, aon). However, the access to these clocks is restricted to
> > the RPM firmware that controls the shared power resources for the whole
> > SoC. The clocks cannot be controlled separately, there is only a single
> > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> > The only exception to this are some IPQ* SoC that are not using RPM,
> > there the clocks are directly controlled by the kernel via the clock
> > controller (GCC). Require only one clock in the dt-bindings for MDM9607
> > to avoid having to define dummy clock entries.
> 
> I am sorry but this is still incorrect. You don't have to define 2 dummy
> clocks. You would have to define 3 times the same clock (and that's not
> a problem). I have been working on the concept of clock nexus which
> may solve this kind of issue in a rather elegant way but that's not
> ready yet.
> 
> In my opinion the binding that you want to push (a single clock) is
> wrong, but since I've been explaining this for several weeks already,
> please at least fix the commit message and I will take it as you want.
> 

Thanks for your feedback!

Either way works for me personally, but now we have a conflict between
your requested changes and the feedback from Mani, who maintains this
driver. :-)

@Mani: Would you also be fine with defining all 3 clocks in the DT
("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
them?

Thanks,
Stephan

