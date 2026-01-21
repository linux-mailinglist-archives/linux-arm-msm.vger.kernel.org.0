Return-Path: <linux-arm-msm+bounces-89951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGqZH9iHcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:01:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E532B53308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDD6C749B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDDB47799C;
	Wed, 21 Jan 2026 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMhLPQSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D83587C4;
	Wed, 21 Jan 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982395; cv=none; b=PI9Cs67SlY5tMR+ygHD/PRKDU3Z+bjvGyD5hor9YEiyf8rb8f7OXq3W7c0AfGTJa2hnO2jPAHl4cYy7VCRbOcljenXqgZuiXynm0hugNFo+wJdPxTIbdohrlOyg3BAvoVUgFk3nHRTFc1FKE8Gx4JGQMM5tu+0toAjOG5bkdey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982395; c=relaxed/simple;
	bh=io1fuLM2bPpdo2pOtJh3tY79IVh9SYXi8xNbc0XZ0kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEu0mBas1AZrkm39Kl6TZZ1FA9kBke51TCMTC3FcE/MUg0VBlnHK0qvegw8At7GEeuWDgj8XI6DAyS3jhEO32YmMYjgY25UhK7ByaIS9jgApD4MXXFgufJgu0KCmSneT/ZQkn0tEiWizMHbupXYF9whAnnzdauBiv2NvSaySH8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMhLPQSD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C97C116D0;
	Wed, 21 Jan 2026 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982394;
	bh=io1fuLM2bPpdo2pOtJh3tY79IVh9SYXi8xNbc0XZ0kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMhLPQSDomns64O2lPYMFkd75nzhtoAPl5JrY0O5Cuu4G9ZWA6L629DTzfulg1e+9
	 ZbUV+mR7zX7/sF4PQlGl+2shFvoEIRZV6bbIFLy1XRXJhEtjoyofIormF6/jzzAf9h
	 lO38tdbaS4N+L0IB3WmyL5/e1eIiUpepL1d6R5mv2EFC4IykBZ6+Vjg2V/ZVYl4gh8
	 bFEqCVrBPv5eu4f5eWfGHebPBzvvqMEwTnuoWmifo7ofwLu0xyLIH3FmjpEuN0SXhG
	 wI1R/iNA6IizuhZ9JBTtA2EiR3Uf37rrq54pe+x2fXaa0L91TCPGxqFXUNDUp6v/HS
	 cvKPFoiDcVI3Q==
Date: Wed, 21 Jan 2026 13:29:44 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix
 iommus property
Message-ID: <aXCHcCMu47JRHyLt@sumit-xelite>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
 <20260116-transparent-dexterous-nightingale-c029cb@quoll>
 <aWo0t1EoVhStmOj7@sumit-xelite>
 <6020af2a-5baa-4594-8cbc-bf7241f0128e@kernel.org>
 <aW9yCK0rPjRcqplk@sumit-xelite>
 <bdc8011b-6501-43e5-815b-a981df665e03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc8011b-6501-43e5-815b-a981df665e03@kernel.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89951-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E532B53308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 01:30:13PM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2026 13:16, Sumit Garg wrote:
> > 
> >>
> >>>
> >>> There has been ongoing disscusion related to how stream ID associated
> >>> with different translation context can be represented in DT here [1].
> >>> With that only the secure bank stream IDs can be properly represented.
> >>>
> >>> Here I just followed the approach taken by Adreno GPU bindings for the
> >>> iommus property [2].
> >>>
> >>> [2] Documentation/devicetree/bindings/display/msm/gpu.yaml +82
> >>
> >> Such justifications are pointless. What about commit msg which explains
> >> why this was added? What about entire public discussion happening with
> >> this patch? What about all previous revisions of that patch and
> >> discussions leading to this piece of code? So you just found few lines
> >> of code, ignored entire background and any other arguments, and copied
> >> it here.
> > 
> > Looks like you are mixing other patch-set with this one.
> 
> How different? You found some old code and use it as argument that you
> can do the same:
> 
> "Here I just followed the approach taken by Adreno GPU bindings for the"
> 
> so how I am mixing patchsets in my response above?

You are referring to discussions of which I wasn't part of. The reason I
mentioned Adreno GPU binding here is because I had to drop the secure
bank stream ID for Adreno GPU as well here [1]. But it didn't required
any DT bindings change while the venus and display IOMMU property
required this change.

So how do you justify that GPU iommu DT bindings are correct while the
venus and display iommu DT bindings require update.

Is there any documented behaviour for how the minItems/maxItems need to
be used? Or is this just implementation defined based on mailing list
discussions? And for sure all kernel contributors won't be aware about
all those discussions happening.

[1] https://lore.kernel.org/all/20260116062004.237356-4-sumit.garg@kernel.org/

> 
> 
> > 
> >>
> >> That's the approach - I found a piece of some buggy code, so I can do
> >> the same.
> >>
> >> Again, we discussed it 2-3 months ago for the same patch and I gave
> >> exactly same reason why this patch is incomplete.
> > 
> > Sorry you are just mixing different discussions here. I am trying to fix
> 
> How am I mixing? Exactly same approach was posted for other SoC. I gave
> same comments. Same comments apply here.

I still don't know which other SoC discussions you are reffering too.
Care to provide a link?

> 
> > the SMMU stream IDs for Agatti SoC which listed secure bank stream IDs
> > incorrectly.
> 
> You explain what you did, but you did not explain why or how I mixed
> anything.

I tried my best to describe the why part in commit descriptions:

"
Fix IOMMU DT propeties for GPU, display and video peripherals via
dropping SMMU stream IDs which relates to secure context bank.

This problem only surfaced when the Gunyah based firmware stack is
ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
as a fault by Gunyah hypervisor which were previously ignored by QHEE
hypervisor.
"

Let me know if the why part is still unclear.

> 
> > 
> > And this is the first version of this patch only for DT bindings fix for
> > Agatti, there are no prior discussions I had on this aspect upstream.
> 
> I did not say you had discussions before. I said exactly same problems
> were being solved and I give here and there exactly the same feedback.
> 

Care to provide link to earlier discussions?

-Sumit

