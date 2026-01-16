Return-Path: <linux-arm-msm+bounces-89393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF8D315A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 036F8307AB76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B48121E0AF;
	Fri, 16 Jan 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4maBpBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C11C84D0;
	Fri, 16 Jan 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568002; cv=none; b=gNo8I6jipvZ/GkywTV+LVC84a1xwfK4fKzzNUdSOBcP0Sxtw80HzsY4JGMetWRtpUWq2MiMjJjn+b763SV0vY8y5gbPLWwl+cNLiJ68YqjFkORMfsYS8qt9o+19cctR9cBowy9imh6Ye8lMRMjsfeah+nKK3Jv0Og6mLzsR3Z3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568002; c=relaxed/simple;
	bh=be2Q/jGm6FdW1LqpflqDBK1cYmcDFgJYdX6bRQzagsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpxTKoobIKHhtOKrVt7PoNfhGIUKcXicFlOAZL9vpKY7BOY4w/wpNltX4pENtqkxIWpbrkJ7Rh/zi26WOoRITgLMMbAaqL4uMVta/RylOPLRSDpM4+DfZu4cY7OpvpBeYyIvkuA2VgX379nqnAfKyFQxd4DGq/KqejNUXyiZ/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4maBpBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2BBC116C6;
	Fri, 16 Jan 2026 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568001;
	bh=be2Q/jGm6FdW1LqpflqDBK1cYmcDFgJYdX6bRQzagsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4maBpBBd6K0pk0TmS8RZS56h3m0pXqvARKGVOtK/5PUje3FWWAmwSiF1FJTKho+7
	 RstmRcvCLIH8OCeMScdccdHLjCmkr4QQYHWoWS9blmu067Wri4JJPgNYIKSeJBkk+W
	 UWQu1wEk31X1h6BoNyn0LmgLNCyDAbcMEm/t+2zt0ncJbkSy4uC3WdxdP66CU2CreT
	 3ZGW8X3FDrO648yPRDDqnsu84R9r2EWAlVAITf60kMerwK736CACjJ+0oho17pftcu
	 d73QgJlJVx8axouXvenfWoDnYSCPnESh0qJ8KTZ4i05Q2uFh0mPg4XMFxdPcKlU7yg
	 wDWrMQlEzFJiw==
Date: Fri, 16 Jan 2026 18:23:11 +0530
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
Message-ID: <aWo0t1EoVhStmOj7@sumit-xelite>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
 <20260116-transparent-dexterous-nightingale-c029cb@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-transparent-dexterous-nightingale-c029cb@quoll>

On Fri, Jan 16, 2026 at 09:46:54AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 11:50:02AM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Fix IOMMU DT propety for display via dropping SMMU stream IDs which
> > relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> > to secure context bank stream IDs is incorrect.
> > 
> > The min value is added for iommus property to ensure in future when
> > secure context bank stream IDs are properly supported then the iommus
> > property is extensible.
> > 
> > These DT bindings changes should be backwards compatible.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml   | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> > index f0cdb5422688..5c888f07bc0b 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> > @@ -33,6 +33,7 @@ properties:
> >        - const: core
> >  
> >    iommus:
> > +    minItems: 1
> 
> Same comment as other changes like that, which I already gave guideline
> - you need to list the items (minItems stay), because you now claim the
> order matters and is strictly defined.

Not sure if I claimed that order matters now but rather the secure bank
stream IDs were incorrectly represented earlier in the DT.

There has been ongoing disscusion related to how stream ID associated
with different translation context can be represented in DT here [1].
With that only the secure bank stream IDs can be properly represented.

Here I just followed the approach taken by Adreno GPU bindings for the
iommus property [2].

[1] https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/
[2] Documentation/devicetree/bindings/display/msm/gpu.yaml +82

-Sumit

