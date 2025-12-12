Return-Path: <linux-arm-msm+bounces-85088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3484CB78D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 665253024360
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007D027E1DC;
	Fri, 12 Dec 2025 01:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ik7jLDgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7DE24DD09;
	Fri, 12 Dec 2025 01:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503564; cv=none; b=Lhw+W0rXlkKlsO5vVfnEC3RUkPNaCCUs+Kc537+RLZlj9Hw/6ZbNw/11DfPUwedAWA16Zwx3Eurze4+/SSDl0o5n9awdMCSRCLh2hRZmsy8IVUggia35krlJXlzkLVOzLsalDUafVk6pzeFbOkERlPZqPaAzTbn9hFzks0Y13vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503564; c=relaxed/simple;
	bh=Rz6mYmYPM3LGI9FUI2Vag1OS+r7/wF5Tfx278FfBGoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCXThLFYfSi8Fwd+xsKmC6Pc5tq5ijO3Apvr4GM9X38jViGhBZmQyO3+DeeMl1MKXWHl6NXWiLA/h+hOmMTvJ+DGy7eAo2OL5HEQQA05vC49DEzG2tpd5tqzi8owZwUD328dy89gGN46v3HwFk3D7VnQxebcrrw/lxn6vuMyGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ik7jLDgq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8293C4CEF7;
	Fri, 12 Dec 2025 01:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765503563;
	bh=Rz6mYmYPM3LGI9FUI2Vag1OS+r7/wF5Tfx278FfBGoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik7jLDgq1VVyn2fCkoUruaqw1b1UgMIgImPl2aH8THpUnU1sf79hJTI1zErWYLQ71
	 iuowr7jD0qAq4JcPCCNdR4UpjAJH1pf8sAbE7/F/zHsc8eWdkHDZAa9/LfbreX4Kz1
	 CMDqALV67oASBiZMW2tFdI8ve4QmnC+0/CHoY4QRUILF+wwRfUtdXX9eiPLOTpgl7W
	 Zx1GBEqOLaYrJtbhsmpAzkCqGD8EBWJOUtqNsG5QxHsFUR0txjFFm1hvKH7U4puYYN
	 28lpzLLsE9U7d0/Qg0Px7KdMDXL1ySqGQr21VkHsYdkVWBtV7OLefeV1PU9O7mgVL6
	 /ZkMcHtb+nagQ==
Date: Fri, 12 Dec 2025 10:39:19 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
Message-ID: <aTtyR5J3AqXoE7to@sumit-X1>
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1>
 <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>

On Fri, Dec 12, 2025 at 02:07:40AM +0100, Krzysztof Kozlowski wrote:
> On 12/12/2025 01:55, Sumit Garg wrote:
> > On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
> >> Initializing automatic __free variables to NULL without need (e.g.
> >> branches with different allocations), followed by actual allocation is
> >> in contrary to explicit coding rules guiding cleanup.h:
> >>
> >> "Given that the "__free(...) = NULL" pattern for variables defined at
> >> the top of the function poses this potential interdependency problem the
> >> recommendation is to always define and assign variables in one statement
> >> and not group variable definitions at the top of the function when
> >> __free() is used."
> >>
> >> Code does not have a bug, but is less readable and uses discouraged
> >> coding practice, so fix that by moving declaration to the place of
> >> assignment.
> > 
> > Okay I see but..
> > 
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
> >>  1 file changed, 8 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> >> index 65f9140d4e1f..8f8830f0df26 100644
> >> --- a/drivers/tee/qcomtee/call.c
> >> +++ b/drivers/tee/qcomtee/call.c
> >> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
> >>  				 struct tee_ioctl_object_invoke_arg *arg,
> >>  				 struct tee_param *params)
> >>  {
> >> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
> >>  	struct qcomtee_context_data *ctxdata = ctx->data;
> >> -	struct qcomtee_arg *u __free(kfree) = NULL;
> >>  	struct qcomtee_object *object;
> >>  	int i, ret, result;
> >>  
> >> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
> >>  	}
> >>  
> >>  	/* Otherwise, invoke a QTEE object: */
> >> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
> >> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> >> +		qcomtee_object_invoke_ctx_alloc(ctx);
> >>  	if (!oic)
> >>  		return -ENOMEM;
> >>  
> >>  	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
> >> -	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
> >> +	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
> >> +						      GFP_KERNEL);
> > 
> > ..this makes the code less readable with variable declarations floating
> 
> Which is intentional.
> 
> > within the function. I would rather favor to not use the cleanup.h construct
> > but use explicit kfree() invocations instead like it's done in all other
> > allocations in the TEE subsystem.
> 
> Sure, fair. I just don't get why introducing cleanup.h without actually
> accepting its explicitly documented style...
> 

TBH, it is likely overlooked during review of the QTEE driver. Having a
builtin warning for the undesired syntax would help the reviewers here.

-Sumit

