Return-Path: <linux-arm-msm+bounces-102492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AqtLBOq12kMRQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:30:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 723DE3CB3AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A3563127754
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 13:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69192C3244;
	Thu,  9 Apr 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7k2trJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2F282F3B;
	Thu,  9 Apr 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740786; cv=none; b=US/i6E1zGKfrEWttBLMNdvxvm+8WnEQ3sOZx3fbf+ZQYqMjHm7bctWCrOZt1m6LmpMGJAGRjWCe6j8SzJuxDVJjtatCxpHlpF2SSX0oeg1Krxg5RWdiSzyrG2znhEn2xC55b6vN6GnBYHKN7RqmmOx4M0cW2yuBd0cn05gmspKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740786; c=relaxed/simple;
	bh=rKdLwvFDH2Z+iQDKRBba6IcKoLCahcyIw66U+XrMJLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7m7fcEM7uYIvT5y08JJSMyXEfu4i1eytXZdwyWt8qNyfH9BnrCa+MAkyYQviqFcOokFCdKMYfc+cUj63I4DKFe891z0mzxatMOHowB+iGWPvYP3ZXPxzFMWuXqbJW5Y+VWBuENI/X5Gk99ZJWZuGT392Hs60nt8HV6ZtfiC3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7k2trJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15876C4CEF7;
	Thu,  9 Apr 2026 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740786;
	bh=rKdLwvFDH2Z+iQDKRBba6IcKoLCahcyIw66U+XrMJLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7k2trJ0Q9dAhUvjjBVrj/6ZmM/leBFyOT/aEmXRz7/H5LmzK3jGJlFZ3Kh58t++N
	 NO3e4yfONZlPkR87OaWzTuhYE7yQQmMcT24RaLn+HJtYFOc3iDoFRphfn8GMtDf9tx
	 Z6d9k45avKPNbwfFduMvuCrNiXv0TCyH6VQQOwqPDISPDgb3e6wC0qIAB/9WzzJeds
	 9rZmavNsfNjgAWFD5Yn6jO7cpYoVhxchASjN0DQLirWX6uwTqHFte9ArOaDSxswpao
	 OszKsu3EXtDDBBpJ2zefR4jUEfNiVQsgn+OFJZqOaT56ZOtIddNWfKUJRgGFtDJ5u5
	 yqrT+LJHzV6XQ==
Date: Thu, 9 Apr 2026 08:19:41 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <adem2WKh2B-Leivq@baldur>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102492-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 723DE3CB3AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> > On 4/1/2026 12:05 PM, Qiang Yu wrote:
> > > diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
[..]
> > > +static const char * const tcsr_pcie_4_regulators[] = {
> > > +	"vdda-refgen-0p9",
> > > +	"vdda-refgen-1p2",
> > > +	"vdda-qreftx1-0p9",
> > > +	"vdda-qrefrpt0-0p9",
> > > +	"vdda-qrefrpt1-0p9",
> > > +	"vdda-qrefrpt2-0p9",
> > > +	"vdda-qrefrx2-0p9",
> > > +};
> > > +
> > 
> > TCSR clock refs are just not for PCIe alone, they would have supplies
> > for all the ref clocks. These supplies can also be shared across other
> > clock refs. I think it is not the correct way to handle the supplies, as
> > TCSR does not have the complete supplies map.
> >
> We have complete supplies map. You can get it on ipcatlog. Here is example
> for other instances eg USB and EDP:
> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
> 
> I only add supplies for PCIe in this series because USB and EDP vote these
> LDO in their PHY driver. They can remove them in PHY dts node and add same
> regulator list here.
> 

The regulators are reference counted. Can't we add the USB and eDP
handling here as well now, and then after they are voted here we remove
them from the PHY?

Regards,
Bjorn

> - Qiang Yu
> > 
> > > +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> > > +	[TCSR_EDP_CLKREF_EN] = {
> > > +		.name = "tcsr_edp_clkref_en",
> > > +		.offset = 0x60,
> > >  	},
> > > -};
> > >
> > 
> > 
> > -- 
> > Thanks,
> > Taniya Das
> > 

