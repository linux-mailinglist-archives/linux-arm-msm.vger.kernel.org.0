Return-Path: <linux-arm-msm+bounces-116895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aos6MwPES2qwZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EF712595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:04:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MCCi5Zmt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116895-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116895-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC6FA324F089
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9011A37A487;
	Mon,  6 Jul 2026 14:19:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC1379EF0;
	Mon,  6 Jul 2026 14:19:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347555; cv=none; b=e/1igL3Cbq4Wygd9J/GK3RGnrMSbIX1YFu1/D4ByEGqbDjRtaD6p71xQmZLqeNoaFSckUe4ruNRnb9Hh1g9rpKps0uGkYtBgQScOXNVDYolEpDwywPdmholgvLAUkC6Lx/u9eSgnDyiZMOGSOGKNEWHyFhhMCHVjgjZQqGG89Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347555; c=relaxed/simple;
	bh=FNvBu/SGlgmtBWX+IP3/owcrnZ52tIHgFpnwy+jfLPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUjp/YjdEtl3ky94amnN61JVxvJjixF/CI8rgXWYn0esfGJQK/5SJx6CyoRvI/gTvtoNLNcOLciodtIRBMeCdx7B4MRGahFOvCFVwGtd9FTiuSxLAsPXRU5JIcaSjocOHf98g3PaThZDA1CNqgQeh3ap0/IpFnvbb690xqrKEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCCi5Zmt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE6C1F000E9;
	Mon,  6 Jul 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347553;
	bh=mSQGYf1wIcLWiE+3fh68hTcZOuZaxhAvbB4DHw85q/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCCi5ZmtpWENqe2Y+8JEZ9VZWwNfvJEhHqjk41Yrwk6GAj+rb8HVJoK9PbVDPprZn
	 3qGIpwDZUmAfbvwsKnKTUrEMLBfuQF6p7/wiqOP+ITfygDUnT3wQ0rkGQ2LR+pSRvK
	 Py3aoLrFRJqED06ilkm67BGELccqkx3bYkddzPQeAeEZI+tKOf5GjuQg+7SVgb5bA5
	 IH3c6+/NDc3Mp0+8is7kPjBjLdV+MGmJ4DbVLYfVD4jqbfFjCZiBB1uo7q4q/vuu1b
	 P8zGxPJf5vsdO62PxD/3Sdqw3QtlYBRLWGx/pUrbRLKMCF/vxoGr6imSBc625/zmfg
	 Vlkw2Z8HpwJcQ==
Date: Mon, 6 Jul 2026 16:19:04 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
 <akult0UUSSwKQ8F5@linaro.org>
 <875x2smf39.fsf@bootlin.com>
 <akus-hN7-yf4Y6XU@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akus-hN7-yf4Y6XU@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116895-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kxoqbvi734pp:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E7EF712595

On Mon, Jul 06, 2026 at 03:26:18PM +0200, Stephan Gerhold wrote:
> On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
> > On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> > >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> > >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> > >> > is missing the rest of the hardware changes in QPIC v2. There is also only
> > >> > a single clock that can be controlled using the RPM firmware. Document and
> > >> > add the new qcom,mdm9607-nand compatible for this setup.
> > >> > 
> > >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > >> 
> > >> You could ammend patch 1's commit message with the information I shared in the
> > >> reply. But nevertheless:
> > >> 
> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > >> 
> > >
> > > Do you want me to resend the series with patch 1 commit message
> > > adjusted? There were no other changes requested as far as I can tell.
> > 
> > I was mostly waiting for answers on my questions from the DT binding
> > maintainers, but I understand they must be too loaded at the moment.
> > 
> > > I think the current commit message there is fine, especially if you add
> > > the Link: tag during applying. The extra context will be there.
> > >
> > > If you want me to resend, I would just replace the second paragraph in
> > > patch 1 with the following:
> > >
> > > ---
> > > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> > > (ahb, core, aon). However, the access to these clocks is restricted to
> > > the RPM firmware that controls the shared power resources for the whole
> > > SoC. The clocks cannot be controlled separately, there is only a single
> > > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> > > The only exception to this are some IPQ* SoC that are not using RPM,
> > > there the clocks are directly controlled by the kernel via the clock
> > > controller (GCC). Require only one clock in the dt-bindings for MDM9607
> > > to avoid having to define dummy clock entries.
> > 
> > I am sorry but this is still incorrect. You don't have to define 2 dummy
> > clocks. You would have to define 3 times the same clock (and that's not
> > a problem). I have been working on the concept of clock nexus which
> > may solve this kind of issue in a rather elegant way but that's not
> > ready yet.
> > 
> > In my opinion the binding that you want to push (a single clock) is
> > wrong, but since I've been explaining this for several weeks already,
> > please at least fix the commit message and I will take it as you want.
> > 
> 
> Thanks for your feedback!
> 
> Either way works for me personally, but now we have a conflict between
> your requested changes and the feedback from Mani, who maintains this
> driver. :-)
> 
> @Mani: Would you also be fine with defining all 3 clocks in the DT
> ("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
> them?
> 

AFAIU, devicetree binding should describe the "OS view of the hardware", not the
hardware itself. We have many predecents to this rule. One of them is the SCMI
based resource control in Qcom Automotive SoCs, where clocks/regulators to
individual IPs are controlled by the SCMI server and OS just sees a single SCMI
power-domain for the IP. So we only describe the SCMI power-domain in the
binding and not the physical clocks/regulators received by the IP in hardware.

We had a recent discussion around the same topic and you can see the reply from
Krzk here: https://lore.kernel.org/all/c83ca485-1e2e-46ba-bd15-1168aa8955d3@kernel.org

So here also, the hardware receives 3 clocks physically, but OS cannot control
all 3 of them, but just a single clock from RPMh which controls the 3 real
clocks. Moreover, assigning the same clock to 3 different clock sources doesn't
accurately describe the hardware either, because those 3 clocks operate on
different frequencies and if the driver queries the frequency of
RPM_SMD_QPIC_CLK, it would just return the same frequency. This is where the
dummy clock comes handy as it atleast provides a valid clock frequency to the
driver. But I'm not advocating for its usage here anymore.

Hence IMO, assigning the same RPM_SMD_QPIC_CLK to all 3 clocks is not the right
approach and we should be assigning a single RPM_SMD_QPIC_CLK to 'core' clk.

@krzk: Can you share your opinion?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

