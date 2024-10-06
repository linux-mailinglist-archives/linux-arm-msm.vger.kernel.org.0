Return-Path: <linux-arm-msm+bounces-33219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC7991D3C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 10:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80FD1C20F3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 08:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A6A170A0A;
	Sun,  6 Oct 2024 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AK4/R15Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47105166F32;
	Sun,  6 Oct 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728203370; cv=none; b=Wtsba0LuVgmguzj8bEur1bejld8b7UR6UDPtsQMkzLDNlj594IrUNhNTrSwVf/eqzYzX+I5q27a9Qsrjmynul0a92IgMZ+jv0aBbFPahurESUze6IXh5sUgNm3D4VH+WrLZHkHMfYVaDDJsAnQqU360DDmiu3DhVb47y3z01exc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728203370; c=relaxed/simple;
	bh=IeAGKkN1wUHgln50MQguJlxeJL1wxccB424rArOqimg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyUCv2nR7dRPlTRGreWkyTKq/dqFvooiRNtNgfSQRn4oZr7yIWS0usDDyJ5TRs4x5Yvg3aK2pht+17aXZnbLT8/aJXd3E/Fx/undYvWny4lSmCy/84/vYRajEPiwiko+9IHGfP7C+QtXvGmrGPOc3QRHrjnMFywKSscq1kWL/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AK4/R15Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F08DC4CEC5;
	Sun,  6 Oct 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728203369;
	bh=IeAGKkN1wUHgln50MQguJlxeJL1wxccB424rArOqimg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AK4/R15YMTDd0AWBOuLTknswIJMiOl65Me0tIed8vocFDiMO7uWjxW6fQhc/taULo
	 lWWaGmd4cRW9A6KoDi8zzmw7D/+dsslP18Wp6Kl0SOcLifUinzWL5xZPBX9TIGZEbW
	 jpRX0UqMUC43Q2S9xKyTM7kLO17uwuFdJt4qXKSU=
Date: Sun, 6 Oct 2024 10:29:26 +0200
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
Message-ID: <2024100620-decency-discuss-df6e@gregkh>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>

On Sat, Oct 05, 2024 at 05:40:53PM +0200, Markus Elfring wrote:
> > A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> 
>                    call?
> 
> 
> > possibly return NULL pointer. NULL Pointer Dereference may be
> > triggerred without addtional check.
> …
> 
> * How do you think about to use the term “null pointer dereference”
>   for the final commit message (including the summary phrase)?
> 
> * Would you like to avoid any typos here?
> 
> 
> …
> > ---
> >  sound/soc/qcom/lpass-cpu.c | 2 ++
> 
> Did you overlook to add a version description behind the marker line?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc1#n723
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

