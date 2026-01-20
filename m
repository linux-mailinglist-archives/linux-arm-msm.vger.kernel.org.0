Return-Path: <linux-arm-msm+bounces-89825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEhjMLPNb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:47:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6C49C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A525B805BEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717294219E0;
	Tue, 20 Jan 2026 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHXepppr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C28413238;
	Tue, 20 Jan 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911379; cv=none; b=MGnWoYLwS9CpTeVqhiX5eQoerGbx9qSdmb5Ga4ALruiLWh6dZb+uUp+o4LJIZCrQQAqCeilCkfZ4MQJAASeL2Clt8d6QXQODPXp5W1I1kTcmKJgSlI7d8bnBnwVb/ITz9FfrvNxkQOxtvBe32vN+1mdW4Mn7gr5P14rFN/4A3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911379; c=relaxed/simple;
	bh=cNyXP78+8Y7zCYZgFwWzYLzq2q5zJjdWzQFvTztl1mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHL/q21w2devptmDK79OVALi6B+x2P4zJs9QTeiGRqXbO2ANLhi2EY888NBM72ROayw9GTGsMNHiOTF8GnEsowkmXdazzDkXUE/2jHvwOTdBh29K06fjRcASiXHdTha6rQpQLo7o58FKJDmaKNoJDvz958kexJKwINSmgslUTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHXepppr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A168AC19422;
	Tue, 20 Jan 2026 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911378;
	bh=cNyXP78+8Y7zCYZgFwWzYLzq2q5zJjdWzQFvTztl1mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHXeppprizloiV52cPXwiPogpdyFps4FuThsQXVRXbKyYkAKbppDWVTYAMJmQFuwr
	 e36JT1j8Hy59tOHgkjMxSNbck5/2Jc0udc+jsp96AaGSmrIUAnwv6uizQcDhL4UkiG
	 D1MernXJEBBmO9nfJWsHY0wREbix+XkfOuo+ie3zr91lP1DAgwDEBnCkqxnXbEnbwJ
	 QUVSGvkGJTRyTf8Fd7pzckXTocClnZAnI+y+EMRue5AbmqkNWoMxTGhYeZpBvApnwv
	 j4hCMYQbwZusqscQB5iqjyN+T635bfM3UCf3gjicu5dztSqhQ4RlntNSf/C0kDixCN
	 l8C4XR3xgjeaw==
Date: Tue, 20 Jan 2026 17:46:08 +0530
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
Message-ID: <aW9yCK0rPjRcqplk@sumit-xelite>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
 <20260116-transparent-dexterous-nightingale-c029cb@quoll>
 <aWo0t1EoVhStmOj7@sumit-xelite>
 <6020af2a-5baa-4594-8cbc-bf7241f0128e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6020af2a-5baa-4594-8cbc-bf7241f0128e@kernel.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89825-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 32D6C49C13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 02:15:02PM +0100, Krzysztof Kozlowski wrote:
> On 16/01/2026 13:53, Sumit Garg wrote:
> > On Fri, Jan 16, 2026 at 09:46:54AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Jan 16, 2026 at 11:50:02AM +0530, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> Fix IOMMU DT propety for display via dropping SMMU stream IDs which
> >>> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> >>> to secure context bank stream IDs is incorrect.
> >>>
> >>> The min value is added for iommus property to ensure in future when
> >>> secure context bank stream IDs are properly supported then the iommus
> >>> property is extensible.
> >>>
> >>> These DT bindings changes should be backwards compatible.
> >>>
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml   | 5 ++---
> >>>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> >>> index f0cdb5422688..5c888f07bc0b 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> >>> @@ -33,6 +33,7 @@ properties:
> >>>        - const: core
> >>>  
> >>>    iommus:
> >>> +    minItems: 1
> >>
> >> Same comment as other changes like that, which I already gave guideline
> >> - you need to list the items (minItems stay), because you now claim the
> >> order matters and is strictly defined.
> > 
> > Not sure if I claimed that order matters now but rather the secure bank
> > stream IDs were incorrectly represented earlier in the DT.
> 
> The code claims this by saying that one specific entry is allowed, so
> that entry is somehow distinctive, special, different than the other entry.

If that's the implicit understanding then I will rather just modify
maxItems here to say only the supported non-secure stream IDs. The
secure bank stream IDs can come later once a proper DT description comes
in place.

> 
> > 
> > There has been ongoing disscusion related to how stream ID associated
> > with different translation context can be represented in DT here [1].
> > With that only the secure bank stream IDs can be properly represented.
> > 
> > Here I just followed the approach taken by Adreno GPU bindings for the
> > iommus property [2].
> > 
> > [2] Documentation/devicetree/bindings/display/msm/gpu.yaml +82
> 
> Such justifications are pointless. What about commit msg which explains
> why this was added? What about entire public discussion happening with
> this patch? What about all previous revisions of that patch and
> discussions leading to this piece of code? So you just found few lines
> of code, ignored entire background and any other arguments, and copied
> it here.

Looks like you are mixing other patch-set with this one.

> 
> That's the approach - I found a piece of some buggy code, so I can do
> the same.
> 
> Again, we discussed it 2-3 months ago for the same patch and I gave
> exactly same reason why this patch is incomplete.

Sorry you are just mixing different discussions here. I am trying to fix
the SMMU stream IDs for Agatti SoC which listed secure bank stream IDs
incorrectly.

And this is the first version of this patch only for DT bindings fix for
Agatti, there are no prior discussions I had on this aspect upstream.

-Sumit

