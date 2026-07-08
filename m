Return-Path: <linux-arm-msm+bounces-117755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xh9QHd1vTmrlMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:42:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE897282DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:42:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gDhSlbSN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117755-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117755-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E21132E0BEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED58340927C;
	Wed,  8 Jul 2026 15:26:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F7D409278;
	Wed,  8 Jul 2026 15:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524368; cv=none; b=rTMPgHrarOQdXy8uglHDL9YVKu9kMSYcAZ+p7AN9AcEDamiFqhLMBqfT+mKlQJEAGwA7WjBpLdK86be785tS//88IJLX6iGCbTH5aka2lBUriaHCBSoB54xwNOLYMrTRVD/R8/WCiesgjvLWFKTi4p2CnFt/Cgw+Q4d4NP4pQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524368; c=relaxed/simple;
	bh=whlFHqnb1XuOYu2Xd8sn/x0N9b/+58vwnkVIRaGYQjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvIh6RO+hpmgBVCIWTDh9D9+gqqXh66+gYjz4bLV4II0bmbWx3vy9ktOMWkEoEL0kah7wdN+FlgV4f9QYnw1E81zyOX2wwTYZAUr+BeGkW0K2Oj1BpDDC6MuZUlfWsAwARNymLotJjNEQCRSW4jae4j+BrZ1x5DyhSUck+hLUV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDhSlbSN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB831F000E9;
	Wed,  8 Jul 2026 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783524367;
	bh=yVimvhatc65Owlde0V/MOtWQPfIwkXZ1GniY6IYK8AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gDhSlbSNBaBZGjTVhSc1SE3KOE3xKeG78VYrDpRrru2etALr/MsRqmirN0OVpkj+B
	 r0jxEk5eOPYRfs7gNNz20QzeEpCMd3qJLCiHIMamEUhAshXSST0xAIm2ulX+kSvuJj
	 z0pGxmnsA4gtthbkijOWfdGOyC+iJO8S/0q2aKZl3OWK1PJ8DYq4vEFr8e2NbpLJvr
	 ZkkZ+/D38zBTHOQlRYJUk4bpYIca2QNQ0dzRlxjeV9/7SboZhKKnpC0G5dwS6+HvQh
	 9PEWb92P9Tdn1mR9Aww2bI7QTMZiDDDjohTYDQbNe8iddTLQLml1O5Z4Z6RdUKl2gJ
	 3qF+zxxgUhNVQ==
Date: Wed, 8 Jul 2026 10:26:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ak5qkRKk2eHHLYmo@baldur>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
 <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117755-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baldur:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAE897282DE

On Wed, Jul 08, 2026 at 03:31:07PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> > > > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > > > are accessible. Without this vote, the SMMU may become unreachable,
> > > > > leading to intermittent probe failures and runtime issues.
> > > > > 
> > > > > Add the required interconnect to ensure reliable register access.
> > > > > 
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > > index 90e50c245c0c..721526f023dd 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > > @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
> > > > >    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > > > >    			dma-coherent;
> > > > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > > > 
> > > > Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
> > > 
> > > Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
> > > preventing gem_noc going to sleep when icc_set_bw is being called.
> > 
> > _why_?
> > 
> 
> Now when i think of where we implemented the hooks, ALWAYS is not needed. We
> should keep it ACTIVE_ONLY since we are already voting it
> back in resume pah. I'll fix it in next revision.
> 

The path is between the SMMU and DDR, so clearly it has to do with the
TCU's ability to fetch things from DDR.

ACTIVE_ONLY states that the vote should only be applied when the
application subsystem (CPUSS) is not in low-power mode (CPU is active).

So, are you saying that in all cases that cpuidle might select such
low-power state the GPU TCU is "stopped", and does not need to perform
any memory transactions?


To me these two are orthogonal and TAG_ALWAYS is logically correct, but
perhaps there's some practical dependency that I'm missing?

Regards,
Bjorn

> > > 
> > > > then drop the extra suspend/resume play?
> > > 
> > > Not sure if I understood it correctly.
> > > Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
> > > or in arm_smmu_device_shutdown() path?
> > 
> > runtime_suspend/resume. I might be incorrect here, but I think it is
> > exactly what you need.
> > 
> 
> Yes, I think we should go with the ACTIVE_ONLY flag and we would need
> this voting in suspend resume path (For the same reason mentioned in commit
> description and cover letter of the series).
> 
> ALWAYS would avoid the need for this handling, it would keep the vote active
> unnecessarily, but still that would have been nondeterministic.
> 
> Thanks & regards,
> Bibek
> 
> > > 
> > > Thanks & regards,
> > > Bibek
> > > 
> > > > 
> > > > >    		};
> > > > >    		gfx_0_tbu: tbu@3dd9000 {
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > 
> > 
> 

