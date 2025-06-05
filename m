Return-Path: <linux-arm-msm+bounces-60416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C2ACF8C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91271765C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6A727CCF5;
	Thu,  5 Jun 2025 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFOyFEi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74851A5B8A;
	Thu,  5 Jun 2025 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749155242; cv=none; b=QtnWjvKESi6rDc6XUAkJ1WO4M61zOOaveYleGR0/qEaxPxsEjJ6qIO6gIdhb6fkPZ2MXOCK1mb4dK9GozbW5lFKPdm0ZPpYHE0EhJD0Ap0Ik3Cpet7XfWiKGSa+P/BDjyIJzOJtsBRJbK7iBc1x9uFaNeZY6kBskNoAwzbyi6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749155242; c=relaxed/simple;
	bh=UD0f2aiYkLmpekoEpWZj548Tflm0OEq08J6LaazoEuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRSO+Ef4HqaedpDevOL7uAKB9TkG73pvJokT8pCI7Nv6h8PpCiG9UzmXfCj0mTmii+9nN9iv8FxYAFJKf3Wy5/vttPJIclGW5ZYnRD3eWH1H9xmok+YonRvjvA6Q7/rijsStH9c8wA1sekFdE6PoaPnzH647sWJBInYZZu1sItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFOyFEi8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84EAC4CEE7;
	Thu,  5 Jun 2025 20:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749155241;
	bh=UD0f2aiYkLmpekoEpWZj548Tflm0OEq08J6LaazoEuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFOyFEi8RUmDkPJ26jNDEhgwb1NHCWc7X7Vk0NG19/CZA9aMfp0RRGY6rhrQ7PCWO
	 9Cb8+sPNf1kqrod3Yhvidyx/mslDAeEbGt7U5ffWQ9zMut1oqdB2FFUJM0K7Q+wfSa
	 BXlRvmYcTzcLx26o1Am275U24L4PW1gSR1dojNSHa5HsY25oyWxSo2w/6efJXfIOOf
	 K440hYuT1iGLOPBYwR1+fc7TvtW1Ebm3gkWh9JVb+dbZKU91DQflbfRq3xUITP3gpP
	 NZ/JMWv6X73GSKwCW1E5Elqxg0iAZoDnkjIe3RTyg4QMa1r38P2uCvbaFWYKkpS/5i
	 G0lLUQVrvRHEw==
Date: Thu, 5 Jun 2025 15:27:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Conclude the rename from adsp
Message-ID: <v765tixx2jqqx5rxylqmtulhotxbld5xvjrvo376hyzelmgrop@mqr4fcqdcrfj>
References: <20250605-pas-rename-v1-1-900b770d666c@oss.qualcomm.com>
 <9f6652c9-d0c2-405c-bdf0-fc4daa017a4d@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f6652c9-d0c2-405c-bdf0-fc4daa017a4d@lucaweiss.eu>

On Thu, Jun 05, 2025 at 06:01:07PM +0200, Luca Weiss wrote:
> Hi Bjorn,
> 
> Awesome to see this being cleaned up!
> 
> On 05-06-2025 5:23 p.m., Bjorn Andersson wrote:
> > The change that renamed the driver from "adsp" to "pas" didn't change
> > any of the implementation. The result is an aesthetic eyesore, and
> > confusing to many.
> > 
> > Conclude the rename of the driver, by updating function, structures and
> > variable names to match what the driver actually is. The "Hexagon v5" is
> > also dropped from the name and Kconfig, as this isn't correct either.
> > 
> > No functional change.
> > 
> > Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >   drivers/remoteproc/Kconfig          |  11 +-
> >   drivers/remoteproc/qcom_q6v5_adsp.c |  46 +--
> 
> Actually looking through that driver, it's not just adsp-pil but also
> supports cdsp-pil and wpss-pil, so long-term that should probably be renamed
> to qcom_q6v5_pil.c? Not for this patch though obviously.
> 

There's another "convention" at play here, the "pas" refers to the
secure service doing authentication. The alternative to this is to do
everything in Linux, which we conveniently refer to (here) as "pil".

Also, per the commit text the "q6v5" isn't accurate anymore, so perhaps
this should just be the qcom_pas driver - or the qcom_pil driver.

I think the change as proposed is a good middle ground, we get things
cleaned up and aligned without affecting anything outside the
implementation.

> >   drivers/remoteproc/qcom_q6v5_pas.c  | 617 ++++++++++++++++++------------------
> >   3 files changed, 334 insertions(+), 340 deletions(-)
> 
> <snip>
> 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index b306f223127c452f8f2d85aa0fc98db2d684feae..b0fc372ff0a9e032d784b1a4403ffeea5d0f9a00 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1,6 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Qualcomm ADSP/SLPI Peripheral Image Loader for MSM8974 and MSM8996
> > + * Qualcomm Peripahal Authentication Service remoteproc driver
> 
> typo Peripahal
> 

Thank you

> >    *
> >    * Copyright (C) 2016 Linaro Ltd
> >    * Copyright (C) 2014 Sony Mobile Communications AB
[..]
> > -static int adsp_unprepare(struct rproc *rproc)
> > +static int qcom_pas_unprepare(struct rproc *rproc)
> >   {
> > -	struct qcom_adsp *adsp = rproc->priv;
> > +	struct qcom_pas *pas = rproc->priv;
> >   	/*
> > -	 * adsp_load() did pass pas_metadata to the SCM driver for storing
> > +	 * pas_load() did pass pas_metadata to the SCM driver for storing
> 
> qcom_pas_load?
> 

Of course, thanks for spotting those.

[..]
> > -static const struct of_device_id adsp_of_match[] = {
> > +static const struct of_device_id qcom_pas_of_match[] = {
> >   	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
> >   	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
> >   	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
> 
> Not really for this patch but shouldn't those compatibles also be -pas?
> 

Per the naming convention later adopted, they should have been "-pas".
But changing that would break backwards compatibility with exiting DT,
so we'll leave that as is.

Thanks,
Bjorn

