Return-Path: <linux-arm-msm+bounces-60418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F180ACF8EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7961792AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E4E22A813;
	Thu,  5 Jun 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEAFWGsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D119D880;
	Thu,  5 Jun 2025 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749156383; cv=none; b=WFw8p05mtakB4lb3xaYmyNemXmXYoQhoDzEmQ1X/Ixe5TvEfSw2XsmbMoAsfUzvGc2sLrtC3JBqpAwE8VvpM0VMmn8n2HMtHRFc5B7hvDhTfRTNTAKqPKeTW/2eW4MX0+woXgB3u+UU1CAJ8gp2HSqubUxd3fqty5k8688Lc0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749156383; c=relaxed/simple;
	bh=UvdLdb+pxew9L0NYuA+94OAzZpwn/QZgmKSmKDC0QnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1xYK16iTC3+xAd3BZzOMJRZ877AySQVeT5jAxbBqjememogFiBoU8WlXofPJPeewHNev1og+cnHE1Vlv5QMsVcS68Zns1+pe/bL48271LV7KflqGeQNRMJalviXwxwO2ObmPEOQJoejyPCQmVC5wu89lR3hAUm3AvzehnKOnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEAFWGsO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E865EC4CEE7;
	Thu,  5 Jun 2025 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749156382;
	bh=UvdLdb+pxew9L0NYuA+94OAzZpwn/QZgmKSmKDC0QnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEAFWGsOtZ5iw44rMJfkzOufIoobgYIjrridKhQwVu2Ob9Hc8XeQi10XMHP2N99MB
	 uXYXc0bxWXPlHmFhd9CBpK3JESex5fmj3tPDRXYQL7rEvElcbGsn7S8VSlEb9uiGyn
	 1JqUHf8Id2Ojjr5y6NCQChbQ/F174bAzYQ8PtI/5SSmrPpi72jalilZ7Z4GEf6j+q6
	 GndvqZOC9DeO/8u88WfvS8++v4/qrDtrHeYriiHT7yEJtCZXD5CH2LizGamFl080mi
	 RoUgjcQ4RH4wYo3W3xPIj8ahQe8GuqWVUuG0HaDcRfR8/Wgs6Xz1BUqfnjZxmzNz0w
	 LoQixXDn6PqHw==
Date: Thu, 5 Jun 2025 15:46:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Conclude the rename from adsp
Message-ID: <ukst3ppor4ww53k4udt7tlpysleuanyfgylaonp3optvsl7k6s@uk2dd7hdrzij>
References: <20250605-pas-rename-v1-1-900b770d666c@oss.qualcomm.com>
 <9f6652c9-d0c2-405c-bdf0-fc4daa017a4d@lucaweiss.eu>
 <v765tixx2jqqx5rxylqmtulhotxbld5xvjrvo376hyzelmgrop@mqr4fcqdcrfj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v765tixx2jqqx5rxylqmtulhotxbld5xvjrvo376hyzelmgrop@mqr4fcqdcrfj>

On Thu, Jun 05, 2025 at 03:27:19PM -0500, Bjorn Andersson wrote:
> On Thu, Jun 05, 2025 at 06:01:07PM +0200, Luca Weiss wrote:
> > Hi Bjorn,
> > 
> > Awesome to see this being cleaned up!
> > 
> > On 05-06-2025 5:23 p.m., Bjorn Andersson wrote:
> > > The change that renamed the driver from "adsp" to "pas" didn't change
> > > any of the implementation. The result is an aesthetic eyesore, and
> > > confusing to many.
> > > 
> > > Conclude the rename of the driver, by updating function, structures and
> > > variable names to match what the driver actually is. The "Hexagon v5" is
> > > also dropped from the name and Kconfig, as this isn't correct either.
> > > 
> > > No functional change.
> > > 
> > > Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >   drivers/remoteproc/Kconfig          |  11 +-
> > >   drivers/remoteproc/qcom_q6v5_adsp.c |  46 +--
> > 
> > Actually looking through that driver, it's not just adsp-pil but also
> > supports cdsp-pil and wpss-pil, so long-term that should probably be renamed
> > to qcom_q6v5_pil.c? Not for this patch though obviously.
> > 
> 
> There's another "convention" at play here, the "pas" refers to the
> secure service doing authentication. The alternative to this is to do
> everything in Linux, which we conveniently refer to (here) as "pil".
> 
> Also, per the commit text the "q6v5" isn't accurate anymore, so perhaps
> this should just be the qcom_pas driver - or the qcom_pil driver.
> 
> I think the change as proposed is a good middle ground, we get things
> cleaned up and aligned without affecting anything outside the
> implementation.
> 

Sorry, didn't spot my mistake until Wasim pointed it out, I didn't
intend to touch this file.

Yes, the qcom_q6v5_adsp driver suffers the same problem as the "adsp
pas" driver did.

I like your suggestion.

Regards,
Bjorn

