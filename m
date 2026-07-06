Return-Path: <linux-arm-msm+bounces-116951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EqRwCbzbS2o4bgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:45:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A471377D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:45:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vine5mIy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D7883137C70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368C8390230;
	Mon,  6 Jul 2026 16:00:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7C334C08;
	Mon,  6 Jul 2026 16:00:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353649; cv=none; b=iBKMqDolnr/ecvgeWZ7SP8k8IEjZOal9Hm2Tb+p4cAzUMVH85qzSn4X/AEedoaYGMdG+v82fEFMRzVaoH15+mi8hQtdiI5Zr4/JmAnd4/GdY1JTtKyAQiAh34Pu5MNJ6xnbGBkbzJbI8VWAbkKtA5gIUUrW5BO93C8OZzNa3JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353649; c=relaxed/simple;
	bh=ru9/BVkvLc8kkNDhSrt81cELJIbfxZ4aO7n6MTGARtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guQWzKcbDoUDdo/h5NF42h0AH6DPsNwBwUT1PEw4FxfBF2k26aifKxsG/D5d62HXpG5e2mY01D8AGKuQ94IrYzRHKnxdI5Hpwv2q616W/7gqloUQH9YQPO+esZPLuAfZynPkYCs4U69pmTykGbGfaFeZTv+bAVAaJPzQ6Sg+wrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vine5mIy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611961F000E9;
	Mon,  6 Jul 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353647;
	bh=KvwXXsYdupx6ACDENBnJ1vKCi25iIdxSRW47q8PffTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vine5mIy9BQ8t3HsFhxMZs8TnZvLK+rg9ZFm+TxlFbQ6wT305jT86BP8XoKNtGgOP
	 38XImVrDFwsyhOOtI/Sma06OVT0YTIpnPBzFiFdzTeVYuoNtA2imgOE5u3I/Ww7Fro
	 HlVpS+u1CNttbI+kq18y0KyGwh8HpfZxtr+H+UP4L9HpDkS/lkpMtefWHJp/Vyw2zb
	 YWR+dR1Rl/XhUWjoctM+YjkDcytuY5w4uuPLXVsz/8EgdaRfyIoJ/42fm563JSOB04
	 ljLS8yP6JppBgO9Wf8cv+j3WNU5gbtygRZBIlB2xKNZbh7JQjjxT9Pjl/HUljY+EBm
	 odEljBLLopHAQ==
Date: Mon, 6 Jul 2026 18:00:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <spaihty2s3zfj7jsv63ex7elf3bwz3bbak5ubageusatdgiodd@qh5gfhhh5ppo>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
 <akult0UUSSwKQ8F5@linaro.org>
 <875x2smf39.fsf@bootlin.com>
 <akus-hN7-yf4Y6XU@linaro.org>
 <v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
 <87y0foji2a.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0foji2a.fsf@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116951-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:stephan.gerhold@linaro.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,qh5gfhhh5ppo:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 288A471377D

On Mon, Jul 06, 2026 at 04:42:21PM +0200, Miquel Raynal wrote:
> On 06/07/2026 at 16:19:04 +02, Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > On Mon, Jul 06, 2026 at 03:26:18PM +0200, Stephan Gerhold wrote:
> >> On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
> >> > On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> >> > > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> >> > >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> >> > >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> >> > >> > is missing the rest of the hardware changes in QPIC v2. There is also only
> >> > >> > a single clock that can be controlled using the RPM firmware. Document and
> >> > >> > add the new qcom,mdm9607-nand compatible for this setup.
> >> > >> > 
> >> > >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >> > >> 
> >> > >> You could ammend patch 1's commit message with the information I shared in the
> >> > >> reply. But nevertheless:
> >> > >> 
> >> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> > >> 
> >> > >
> >> > > Do you want me to resend the series with patch 1 commit message
> >> > > adjusted? There were no other changes requested as far as I can tell.
> >> > 
> >> > I was mostly waiting for answers on my questions from the DT binding
> >> > maintainers, but I understand they must be too loaded at the moment.
> >> > 
> >> > > I think the current commit message there is fine, especially if you add
> >> > > the Link: tag during applying. The extra context will be there.
> >> > >
> >> > > If you want me to resend, I would just replace the second paragraph in
> >> > > patch 1 with the following:
> >> > >
> >> > > ---
> >> > > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> >> > > (ahb, core, aon). However, the access to these clocks is restricted to
> >> > > the RPM firmware that controls the shared power resources for the whole
> >> > > SoC. The clocks cannot be controlled separately, there is only a single
> >> > > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> >> > > The only exception to this are some IPQ* SoC that are not using RPM,
> >> > > there the clocks are directly controlled by the kernel via the clock
> >> > > controller (GCC). Require only one clock in the dt-bindings for MDM9607
> >> > > to avoid having to define dummy clock entries.
> >> > 
> >> > I am sorry but this is still incorrect. You don't have to define 2 dummy
> >> > clocks. You would have to define 3 times the same clock (and that's not
> >> > a problem). I have been working on the concept of clock nexus which
> >> > may solve this kind of issue in a rather elegant way but that's not
> >> > ready yet.
> >> > 
> >> > In my opinion the binding that you want to push (a single clock) is
> >> > wrong, but since I've been explaining this for several weeks already,
> >> > please at least fix the commit message and I will take it as you want.
> >> > 
> >> 
> >> Thanks for your feedback!
> >> 
> >> Either way works for me personally, but now we have a conflict between
> >> your requested changes and the feedback from Mani, who maintains this
> >> driver. :-)
> >> 
> >> @Mani: Would you also be fine with defining all 3 clocks in the DT
> >> ("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
> >> them?
> >> 
> >
> > AFAIU, devicetree binding should describe the "OS view of the
> > hardware", not the
> 
> Like Geert pointed out in the below thread, I am equally surprised by
> this shift but I guess SoC complexity requires adaptations.
> 
> > hardware itself. We have many predecents to this rule. One of them is the SCMI
> > based resource control in Qcom Automotive SoCs, where clocks/regulators to
> > individual IPs are controlled by the SCMI server and OS just sees a single SCMI
> > power-domain for the IP. So we only describe the SCMI power-domain in the
> > binding and not the physical clocks/regulators received by the IP in hardware.
> >
> > We had a recent discussion around the same topic and you can see the reply from
> > Krzk here: https://lore.kernel.org/all/c83ca485-1e2e-46ba-bd15-1168aa8955d3@kernel.org
> >
> > So here also, the hardware receives 3 clocks physically, but OS cannot control
> > all 3 of them, but just a single clock from RPMh which controls the 3 real
> > clocks. Moreover, assigning the same clock to 3 different clock sources doesn't
> > accurately describe the hardware either, because those 3 clocks operate on
> > different frequencies
> 
> Ah, this is a point that was missing to my understanding. You actually
> have three *different* clocks, and you control all of them through some
> kind of firmware proxy called RPMh with a single handle. So basically
> the kernel just enables one clock and the firmware enables/configures
> two other clocks differently automatically. Is that it? Feels like you
> almost need a power domain here.
> 

RPMh indeed provides power-domains, but those serve a different purpose than
the clocks provided by it. RPMh power-domains represent an internal block that
aggregates votes from different clients like OS, Co-processor etc... and
controls power to various IPs inside the SoC. Likewise, RPMh also aggregates
clock votes from various clients inside the SoC and controls clock inputs to
various IP blocks.

So both are not the same here.

> > and if the driver queries the frequency of
> > RPM_SMD_QPIC_CLK, it would just return the same frequency. This is where the
> > dummy clock comes handy as it atleast provides a valid clock frequency to the
> > driver. But I'm not advocating for its usage here anymore.
> >
> > Hence IMO, assigning the same RPM_SMD_QPIC_CLK to all 3 clocks is not the right
> > approach and we should be assigning a single RPM_SMD_QPIC_CLK to
> > 'core' clk.
> 
> You said using three times the same clock would be wrong because we
> would get three times the same rate whereas in practice it's wrong. This
> means the OS has access to these clocks somehow,

No, there is no way the OS can access these 3 clocks individually on the RPMh
enabled platforms. But the OS indeed has access to these 3 clocks on non-RPMh
platforms like the older IPQ ones.

> so if we need to
> describe what the OS sees of the hardware, as you say, defining a single
> clock is incomplete.
> 
> Again, I am not totally opposed to the single clock idea if you all feel
> like this is the way forward. Yet, it sounds a bit hackish.
> 

I don't see it as a hackish representation, but rather a proper one because, OS
only sees a single clock for the NAND controller.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

