Return-Path: <linux-arm-msm+bounces-117754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Va7xMUJwTmr9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:44:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF190728312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:44:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OuWS6g2R;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117754-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117754-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 069EF30151F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EE63B71B6;
	Wed,  8 Jul 2026 15:18:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AFE34D3B9;
	Wed,  8 Jul 2026 15:18:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523897; cv=none; b=s1y2tot8i2WrU2/WKJcBBv7ipef+rJ6ypT4r5QyaVaxkDzmL1dFBV/6WIvus1ab5glba265i+ZS4Yx9e77grTqdmTqbSEGSwDqqPo96mHLMFXS2z7i2+Etgt3NvAhI6r7+w8Ar7qIGZZ+zpBI8s8tsGWN1VhwlmSEcScOtwWCk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523897; c=relaxed/simple;
	bh=+sQepOX72FHIzxlHgVnlsfWaCrzOAAD7272q+UU9PR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubV2Cv4BjRj9Bva2FEvVFEcje6wmT74uPdk5BeJgaKYOnfzVkBNGStYXnRewiyNOeWfTV92PkE+6HIHn0QPt35xsEDJNwLWhHYg/0vwc7zgOkkKJOm23W/ucngwVCwO1bIa0AAQ/7CwJbhgPxX6XvFGjWvQpPupXrh2xJDCANWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuWS6g2R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276FB1F000E9;
	Wed,  8 Jul 2026 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523896;
	bh=NeJgD5RqeYSgUCKAd7pwkGxapxLIfd4GsKatP9ijw/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuWS6g2RA5H6l2xX1Q+gKsHNxQTM4CZM4PoD8otYQrcx4Q5MCIvq965nn35X7Gqsx
	 7FjnAWSIlEo97mgYC7B4Wp9x5Q92hwXxodYTsFBYCSf75MOGA6nzsOUtzGOom71jP0
	 Pc92yl33S5mF/k1dfXOtkyxkx16NwI5rArIHy6Qs/Dd46FUqhdVZc3b7GFP+XYD2NR
	 83QD64q1k2koBpNUK2Wkf4mfX9xER5kD45ukfujjWWApvvAWi0aBUne+1wov6iChCT
	 oSfSX0DVj7gMYf9Owf+WbvNEtvcVxw7e04enxB4t1DJJMHUvSB0uEf3UNH8M0+bGP1
	 T/1kUnecBZskQ==
Date: Wed, 8 Jul 2026 10:18:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <ak5pC_meP8KRc3wJ@baldur>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117754-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF190728312

On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > path before the SMMU register space is accessible. Add the optional
> > > > 
> > > > Why is it limited only to those SoCs? Is it also applicable to other
> > > > Qualcomm SoCs?
> > > > 
> > > 
> > > I was hoping to keep this series focused on the core infrastructure
> > > changes: the bindings, base ICC bandwidth-voting support, and DT
> > > interconnect properties for the platforms currently supported on
> > > Qualcomm Linux and have been validated so far.
> > > 
> > > The additional targets have not been tested yet, so I'd prefer
> > > to add their support in a separate follow-up series once validation
> > > is complete, rather than growing this series further. WDYT?
> > 
> > Then it should be a part of the commit message. All SoCs since SDM12345
> > need to vote on the interconnect (and then, in the cover letter mention
> > that you convert only a few of the SoCs). We possibly can help with
> > testing on other platforms.
> > 
> 
> Ack, sounds reasonable.
> I'll add the first platform onwards which interconnect voting is required in
> commit description.

But to what degree is this related to a specific set of platforms? If we
look ahead, aren't we expecting the list to grow to include all
platforms in the end - resulting in a lot of noise and churn.

Can you give an example of a platform where there is no interconnect
path to vote for here or where it would be harmful to do so?

> And update the cover letter to clarify that this series adds
> support for the Qualcomm Linux-supported targets available today, and
> the list will be expanded in follow-up series as additional platforms
> are enabled.
> 

The binding should not reflect what has been implemented and verified in
Linux, it defines the contract between DeviceTree and the OS.

Regards,
Bjorn

> Thanks & regards,
> Bibek
> 
> > > > > 'interconnects' property to the binding to allow platform DT nodes
> > > > > to describe this path.
> > > > > 
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > > > >    1 file changed, 27 insertions(+)
> > > > > 
> > 
> 

