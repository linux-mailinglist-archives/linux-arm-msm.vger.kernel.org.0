Return-Path: <linux-arm-msm+bounces-113692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id POY8EoaHM2qrDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:52:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D923A69DBDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Wy/gbv6T";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 527183014769
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 05:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0596E312834;
	Thu, 18 Jun 2026 05:52:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3C35975;
	Thu, 18 Jun 2026 05:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781761921; cv=none; b=XGq/CiP7Urta4wtJMmCfpwS9Es57h62h31WO6cPy/qZkAGAQhhweqOo3CqvZTpvgh11QT+95TSW6Yb1OGKvZw10JYpGTzj25Wcco6k7J/dhfwuvrn2lkt/t6qr+bg/ZMadH8PwUCEqYal+0hyGHF8nyiT/ouc8okEozofWL3lZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781761921; c=relaxed/simple;
	bh=CJm+5iHv36S+mcIGPUqOydt+593cTsJxADcTFuAuWGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuHuluX8zl5N9opQ78IMZh5T91Chtz3Sa/EX9Ao+F7rYI4yk5wIaJG/CGEQTDK+a/Umja/jw+qK4a29E9V3lvx9lKPgR5wJi6SHsN/pR0kUZazwElrCpH+m5JSdB/+SKP+5weg150DG8ngo4t6mmKcr3oH7yb3vmnG8utB8y5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy/gbv6T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460581F000E9;
	Thu, 18 Jun 2026 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781761920;
	bh=axBHEvNSq/rktJn+LqcAOdD67WjmrQ2QKEpOJgYtd18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wy/gbv6TAnZPwMNly24Fpjt1uSwDTRjUoEHcaOw58Q8iGvN18eFRIhzAbGPjGKIaI
	 /lLWdJsVlXy52u4cD85TBd2MW4ZNkU7PD7/3wdGGbu6V9TQsi/9Vqt+FtjMfdPP5Cv
	 r8MHhrelhi5mG64JR9HyDmfIoR8C1U0VpdJHq2fjc/59KxqGgka7EYqWgcACBno4Sv
	 f8Tn3A241PPfqYZq5eRUIn+weuRJaxpX6h7TTUHPSy1Ae0tv04+ghK81lFZ/zRksaJ
	 BfK1N0UTM7v+TueSliizPPVB6S9RfL6PVTKrFGugdKjlC8unCii+C61IUC5yV5DFyj
	 hwMuZQZsJvXIg==
Date: Thu, 18 Jun 2026 07:51:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Matthew Leung <matthew.leung@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <wgecmjy7fxwvbuzfj25gv5azwky44zyhuu6nsfecg33jfogsml@5bjh6wp7e2rv>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
 <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
 <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:matthew.leung@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113692-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,5bjh6wp7e2rv:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D923A69DBDE

On Fri, Jun 12, 2026 at 09:22:10AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 06:17:57PM -0700, Matthew Leung wrote:
> > On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > > > Add a dedicated schema for the PCIe controllers found on the Hawi
> > > > platform.
> > > > 
> > > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > > ---
> > > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> > > >  1 file changed, 204 insertions(+)
> > > > 
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > > > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> > > 
> > > Stop referencing clocks and interconnect header files. Replace used nocs
> > > with ephemeral values.
> > > 
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > 
> > > Not looking around should be a sin. Take a look at other Qualcomm PCIe
> > > bindings. Compare them to yours. Then fix yours to follow.
> > > 
> > > Hint: the extra soc node is useless. This is just an example, so use the
> > > default, 1 cells for address and size.
> > 
> > Thank you for the feedback. This new binding follows the examples set in
> > the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
> > node and header references).
> 
> Hmm, interesting. Then I'm a sinner :-)
> 
> I looked at msm8996, but I didn't notice that the rest of the files use
> the soc node (and match what you've sent). Please excuse me.
> 

Stop looking at MSM8996 and have some compassion for newer SoCs ;)

> > 
> > I understand the example can be simplified with your suggestions but
> > want additional confirmation that these will be the convention for new
> > bindings going forward.
> 
> At least, let's keep it for now. The other comment stands. To remove
> dependencies please use ephemeral nodes instead of depending on DT
> bindings from other subsystems.
> 

Agree. Since this series missed 7.2 merge window, the dependency won't matter
now. But for the sake of correctness, we should use ephemeral nodes going
forward.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

