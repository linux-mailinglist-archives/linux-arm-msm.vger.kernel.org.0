Return-Path: <linux-arm-msm+bounces-115197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p9peLiuXQmoN+QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:02:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF936DD131
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:02:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WDwlNTr7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115197-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115197-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90AD331D9808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295B244A710;
	Mon, 29 Jun 2026 15:45:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD144D01C;
	Mon, 29 Jun 2026 15:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747924; cv=none; b=rNqXOGFyZyd65KQ3PhoO86q8E7RaVv9JwKhQ3h2w+keqXBrx9KZ9dpXEwIeWjvHJQUVO8GirfW7kerV34lHklFWUN+GwlS6hMWenusroKHhSZweVyJC/5LxKol8ex9OXUZONF+rmPzR/I+S4lHX9viQ6+QqKwe6zGyOWwdIildg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747924; c=relaxed/simple;
	bh=0DbOgJsXYAGRVC3mn/A68lkjtUJnJtXymQE1nYCoTwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsbPMEKwQslw84XDrTRvOdThXXae06WlvuN33ZZni0weRoNIPr1/I9IB9+ZCjA32aC7ggPpuhuHM9LpjyxRovDYuh9OAzWIu8TQXVARpyzMGpCWweAJ6kDfpcQDno0esFBhGywpEA5pK3+v7noUhQ+afjYYbgt+nNmvog9gBPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDwlNTr7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BFC1F000E9;
	Mon, 29 Jun 2026 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747921;
	bh=vUIFi6oudLCwT4rsTkfdI/glAxPAzH10yX5pTbq+zV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WDwlNTr7dZjZgkqL2S0xDaDpkCEENvmi0mYeO5SfxCJ7ufeO3XRdoDE12NgSd3qTs
	 NC0eLVPWhnj90ach2EZxNnEDPds34qoYr31GZPco5ba46j9w1gi+DpKB4oQZ73eF9S
	 C8zXEa77iCERl/frZZvmzD/cKG27XZ8rX3HufwU5ZI91LyQPgf5SKx1o3uJ/vbVLZ0
	 amwbnu/dI4hDSjhzQut6meiCM449sL5KQCl970ml7G0MQ3oLygUwSloQmOVeCjnATB
	 CqHkgxDc1wv4h+OC6x4tO/WCJ4/ANIHjCUXw21Nu51tAwFLTXPtA6UT3AltlyIyUMB
	 o4WQweggBJmuQ==
Date: Mon, 29 Jun 2026 17:45:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <qkvokgxb425epxujnp3v7sha3ibxqpj6wnzvr32t4t24x6mzv5@zxje3qu4w64z>
References: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org>
 <87o6hk9i29.fsf@bootlin.com>
 <aifktn_s2qmg7MzI@linaro.org>
 <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:miquel.raynal@bootlin.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:quic_kathirav@quicinc.com,m:krzk@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115197-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,zxje3qu4w64z:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BF936DD131

On Wed, Jun 17, 2026 at 01:42:44PM +0200, Konrad Dybcio wrote:
> On 6/9/26 12:02 PM, Stephan Gerhold wrote:
> > On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
> >> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> >>
> >>> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> >>>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> >>>>> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >>>>>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >>>>>>>>> On MDM9607, there is only a single controllable clock for the NAND
> >>>>>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >>>>>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >>>>>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >>>>>>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >>>>>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >>>>>>>>> clock entry in the dt-bindings.
> >>>>>>>>
> >>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> What is the problem in giving twice the same clock? If this is what is
> >>>>>>> done in the hardware routing, I do not see the reason for more
> >>>>>>> complexity in the binding?
> >>>>>>>
> >>>>>>
> >>>>>> I had that in my first draft for this series, but this would be wrong
> >>>>>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >>>>>> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >>>>>> someone from Qualcomm can confirm), but a similar platform I was looking
> >>>>>> into at some point actually had *3* separate clocks for QPIC in the
> >>>>>> hardware and none of them were called "aon" ...
> >>>>>
> >>>>> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> >>>>> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> >>>>> from GPLLs)
> >>>>> gcc_qpic_system_clk (32 KHz)
> >>>>>
> >>>>> No clock containing the substring 'aon' in its name on this platform
> >>>>
> >>>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> >>>> The NAND documentation says
> >>>>
> >>>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> >>>>
> >>>
> >>> Thanks for looking this up.
> >>>
> >>> IMO, if we want to describe the actual hardware routing, we should
> >>> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> >>> MDM9607).
> >>
> >> Sounds more accurate to me.
> >>
> >>> The resulting diff would be basically the same as this patch just
> >>> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
> >>
> >> Diff would not be simpler but more accurate. So if we go for a
> >> modification of the bindings, I would prefer that path.
> >>
> > 
> > IMO the result wouldn't be much more accurate from the perspective of
> > the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
> > effectively saying "there is a single clock with a single rate that is
> > sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
> > 3 separate clock domains with separate rates, as shown by Konrad above.
> > 
> > We could try defining dummy clocks like the &nand_clk_dummy in
> > qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
> > these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
> > clock for 'ahb', then enabling that clock without also enabling the
> > non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.
> 
> I can't find a good answer for what RPM_SMD_QPIC_CLK controls, maybe
> +Mani or +Kathiravan know where to look
> 

QPIC hardware in recent SoCs requires 3 clocks as Konrad described. But older
SoCs like IPQ8064 require only 2 clocks:

1. QPIC_AHB_CLOCK
2. QPIC_CLOCK - Core clock
3. QPIC_SYSTEM_CLOCK - AON clock

These 3 clocks are supplied by the Global Clock Controller (GCC), but the access
is restricted to RPMh (the entity that controls the power to the whole SoC) on
SoCs where RPMh is available. On non-RPMh SoCs like IPQ8064, these clocks are
directly controlled by the kernel via GCC. But on RPMh SoCs, kernel cannot
control these clocks independently and it can only vote for RPM_SMD_QPIC_CLK,
which implicitly controls these 3 clocks.

So from kernel PoV, there is only one clock. I think we can just call it 'Core
Clock' as per the current binding and drop the AON clock for SoCs supporting
RPMh.

So this series is good as-is IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

