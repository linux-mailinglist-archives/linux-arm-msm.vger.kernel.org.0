Return-Path: <linux-arm-msm+bounces-27230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3C93F2A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66AC1F2290C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236A8143C6F;
	Mon, 29 Jul 2024 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1a2rk9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727D143873;
	Mon, 29 Jul 2024 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248892; cv=none; b=YzNIMK0aezvFvoqBOYl/SObcIPJ5UBYOGePCSZPl1ucoJ3ZmLkPqd1kW/gaEOgKZrEwahzyW+Y7k6gZ5XHnKI/iX7jHCik1m/uKQzscHxhyZVYaqewT660Q8xOJE+pXtOv05cQFQNg4xz66IHsBgfGlHqwLLwRYa++joCiNm8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248892; c=relaxed/simple;
	bh=KuzVOdTe+hO7Q9gOCAU1cgdeJs4oTsd+ZTmC99wf0o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKKIWGK1NnLu4ozjPZlH5lEz5CtVPgMvvAl4mZBY+GAUZbZ9OoSMnnq4fPuD7gTG+Dl7oXrN/NKschrD5VssQLiNwSp/ADEAGTCb3ThML19rP1Z3/dspTTBks8HZ1iKeslalIu46l/nfSKaRt8PAGSNyQpqZDtJbaTJRbIaHxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1a2rk9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD0CC4AF0A;
	Mon, 29 Jul 2024 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722248891;
	bh=KuzVOdTe+hO7Q9gOCAU1cgdeJs4oTsd+ZTmC99wf0o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1a2rk9lQllu79+405YVwLqJgJVAm4OxAJrnNMwo1dIHOL4CYoFWk4f/VXJf3rY3S
	 sGPT96RzP8fiAnSr08OIsw1NLP5gwztytDF8ZQg4zDTN0qfyhPKK78avJNX9hHwkCH
	 T9Z5ceOjLkzubEacjKSk/8osk7tj791Wa9Q4VZ4cEOSp4gZJRGjbqdAEX4nkfvtEto
	 V4Nbols+cZ1tM34A8qw6ioxgKTCCSwEsLAOTw1+SxwF1fuoqKAitoLGbP9NgTeajX7
	 RPx9hujv/r4ObGNN5lRmHZWBUHSAdcTOBd0DUopVAXOCY7mTwqDVlnJdybx26paQ7G
	 DC0OoIpFX5bDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sYNbz-000000007W7-2zXI;
	Mon, 29 Jul 2024 12:28:16 +0200
Date: Mon, 29 Jul 2024 12:28:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ
 allocator"
Message-ID: <Zqduv66H2OczRgaH@hovoldconsulting.com>
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>

On Mon, Jul 29, 2024 at 12:03:55PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 29, 2024 at 11:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> >
> > Using the "TZ allocator" for qcseecom breaks efivars on machines like
> > the Lenovo ThinkPad X13s and x1e80100 CRD:
> >
> >         qcom_scm firmware:scm: qseecom: scm call failed with error -22
> >
> > Reverting to the 6.10 state makes qseecom work again.
> >
> > Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> > Cc: regressions@lists.linux.dev
> >
> > #regzbot introduced: 6612103ec35a
> 
> How about at least giving me the chance to react to the report and fix
> it instead of reverting it right away?

Lots of folks have been running linux-next on Qualcomm machines for a
month without reporting or fixing the issue. And v10 of the offending
patch was apparently never even tested before being merged.

I'm sure you'll have a few days to look at this before we revert.

I'll be on holiday for a few weeks, but you have an X13s so you should
be able to reproduce this yourself.

> Are there any other messages about SHM bridge/SCM calls in the kernel log?

I've also seen this combo:

	[    3.219296] qcom_scm firmware:scm: qseecom: scm call failed with error -22
        [    3.227153] efivars: get_next_variable: status=8000000000000007

But usually the first message is the only hint why efivars is completely
broken.

> Do you have QCOM_TZMEM_MODE_GENERIC=y or QCOM_TZMEM_MODE_SHM_BRIDGE=y
> in your config? If the latter: can you try changing it to the former
> and retest?

I have the former in my config but have tested both, made no difference.

> > It's a little frustrating to find that no-one tested this properly or
> > even noticed the regression for the past month that this has been
> > sitting in linux-next.
> 
> I have tested many platforms and others have done the same but
> unfortunately cannot possibly test every single use-case on every
> platform. This is what next is for after all.

I doubt this is specific to sc8280xp and x1e80100. Which platforms did
you test qseecom and efivars on?

> > Looks like Maximilian may have hit this with v9 too:
> >
> >         https://lore.kernel.org/lkml/CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com/
> >
> > even if there were further issues with that revision.
> 
> This is a different issue that was fixed in a later iteration.

The symptoms appear to be the same once you get past the locking splats:

	[    2.507347] qcom_scm firmware:scm: qseecom: scm call failed with error -22
	[    2.507813] efivars: get_next_variable: status=8000000000000007

So it's possible that this never worked.

Johan

