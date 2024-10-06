Return-Path: <linux-arm-msm+bounces-33224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2060991DA3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 12:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CEE2282FC0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 10:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1466D1714CB;
	Sun,  6 Oct 2024 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H7SDFpix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7144F4F1;
	Sun,  6 Oct 2024 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728209301; cv=none; b=XbdvQlnO+/Mml0zaQ5khC4XQo1Kn5iOEJamagxGBm+9vKpW46ukC6ngk0FMPr23T017IYSuwxbgaLWZ1Wv/rOFKJEHmKi6cl481NyDd/+55YA7KR4HAsVgmCOMxbRb5cYkO8OGp6R/AsTlkkIOPsa44XYI3hEcxa0kW7bQs1IWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728209301; c=relaxed/simple;
	bh=SRdoJ/oFK8ch6KkyAW3YApgRnZkaX3MlPZjHqx/wc9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSZd3J3WP3cmIpz2XQJALYVnb8kELwoOt/NFrBcF/BMQkY7S92J3r1CCqO5ilzuo+G/YO8TnFQEPh+xSHupU/eZqsMVDA8heuAlzQj+BnpL7jiUexfJ303legouNOHHDK2IDpod5Et3wXh/EssmWLFUfGKOYLnCj+XLOXb1ORvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H7SDFpix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD40AC4CEC5;
	Sun,  6 Oct 2024 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728209300;
	bh=SRdoJ/oFK8ch6KkyAW3YApgRnZkaX3MlPZjHqx/wc9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7SDFpixabJQXU5lZJLkiEFqpQS9BlhXRpx0oDUoocdqZytKIzB0HGu19gve3R0qt
	 R7rD6b9WQCwTgG146lqLOaNbGvnBX0V2um69KNlPQt4BR7eCeXStX/dr3wwFpdA1ob
	 ndR4YlsSteOd34NZwSW5zHuGMn5i6srQzCFDWbCE=
Date: Sun, 6 Oct 2024 12:08:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <2024100608-chomp-undiluted-c3e2@gregkh>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
 <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>

On Sun, Oct 06, 2024 at 10:56:51AM +0200, Markus Elfring wrote:
> >>> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> >>
> >>                    call?
> >>
> >>
> >>> possibly return NULL pointer. NULL Pointer Dereference may be
> >>> triggerred without addtional check.
> >> …
> >>
> >> * How do you think about to use the term “null pointer dereference”
> >>   for the final commit message (including the summary phrase)?
> >>
> >> * Would you like to avoid any typos here?
> >>
> >>
> >> …
> >>> ---
> >>>  sound/soc/qcom/lpass-cpu.c | 2 ++
> >>
> >> Did you overlook to add a version description behind the marker line?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc1#n723
> …
> > This is the semi-friendly patch-bot of Greg Kroah-Hartman.
> >
> > Markus, you seem to have sent a nonsensical or otherwise pointless
> > review comment to a patch submission on a Linux kernel developer mailing
> > list.  I strongly suggest that you not do this anymore.  Please do not
> > bother developers who are actively working to produce patches and
> > features with comments that, in the end, are a waste of time.
> >
> > Patch submitter, please ignore Markus's suggestion; you do not need to
> > follow it at all.  The person/bot/AI that sent it is being ignored by
> > almost all Linux kernel maintainers for having a persistent pattern of
> > behavior of producing distracting and pointless commentary, and
> > inability to adapt to feedback.  Please feel free to also ignore emails
> > from them.
> * Do you care for any spell checking?

No.

> * Do you find any related advice (from other automated responses) helpful?

No.

