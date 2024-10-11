Return-Path: <linux-arm-msm+bounces-34165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 436AA99ACA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 21:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547051C24199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 19:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDC019CC01;
	Fri, 11 Oct 2024 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IL32EvOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0FE194C73;
	Fri, 11 Oct 2024 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675048; cv=none; b=Tse5v3QswQZiJGIuC43fSTlEMBxQ1DEMRPr5mRZXb0kgk9BOquBi6fEt/TrOfXb5nEft4Aqvey2FMyOCdepB9qaxvsRqY1Hb625vPlVEwzM+R4sTuGdxL0038kkceJ1raX+/GoKGUvCka1OYjs4S4OegE8CzCAUpQdNFH/aELDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675048; c=relaxed/simple;
	bh=GI8Z5QK28ugDi2LmkOVVQMDWNM7/kSHzt1/iwKAILoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STh93Tq9B144MmpdwZX9pQGF4mqyTjUiqpj1ZkWafEcSWh8onB5mkQssl+JGgvj3+o6jiN+scOk9J07cAK/5T6xeanYocA5yG/bxD1vBSsVZhmdn37BO7ERwr03lOCaWWbkyyjqcgPOiGR6SMtZ5hF2gYnXwnVoxbVsdu1bUn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IL32EvOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDA7C4CEC3;
	Fri, 11 Oct 2024 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728675047;
	bh=GI8Z5QK28ugDi2LmkOVVQMDWNM7/kSHzt1/iwKAILoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IL32EvOCkLzIod6EUgrbsRNf53vha4jN4nHCojZz8Q6w1fya1IDkb8L1vv7cWpeIn
	 CK+InFlaJEHyi9dMHx+F3G9zyby4WblT/C253uaitHlXX9jnqeUDPpBQeI1hB/NWPa
	 qkkJKNu6edJaXcmjmQP2eelcmFN/dCMLnZ+HAUxRwV8AbbJ+iKzBX0p14LFaik+hj8
	 BCdsT1Wk74g3P5xsNewUi5+GSYVgyHLBDip/EhibfiG+RK+IYP96wVMryKBvTEiA7j
	 zMa6wNPUMWfvz2P3Xf3+I/XtUf0kmlWh5H1tSf6Z4/taMMvdavCux3bgfSaTtYU5jm
	 2OVZcHUOJhyWw==
Date: Fri, 11 Oct 2024 20:30:41 +0100
From: Simon Horman <horms@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>, UNGLinuxDriver@microchip.com,
	netdev@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH net-next 3/3] accel/qaic: Pass string literal as format
 argument of alloc_workqueue()
Message-ID: <20241011193041.GC53629@kernel.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
 <20241011-string-thing-v1-3-acc506568033@kernel.org>
 <468f05e2-1717-3bd1-2ccb-280865180b0c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <468f05e2-1717-3bd1-2ccb-280865180b0c@quicinc.com>

On Fri, Oct 11, 2024 at 08:27:43AM -0600, Jeffrey Hugo wrote:
> On 10/11/2024 3:57 AM, Simon Horman wrote:
> > Recently I noticed that both gcc-14 and clang-18 report that passing
> > a non-string literal as the format argument of alloc_workqueue()
> > is potentially insecure.
> > 
> > E.g. clang-18 says:
> > 
> > .../qaic_drv.c:61:23: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
> >     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
> >        |                              ^~~
> > .../qaic_drv.c:61:23: note: treat the string as an argument to avoid this
> >     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
> >        |                              ^
> >        |                              "%s",
> > 
> > It is always the case where the contents of fmt is safe to pass as the
> > format argument. That is, in my understanding, it never contains any
> > format escape sequences.
> > 
> > But, it seems better to be safe than sorry. And, as a bonus, compiler
> > output becomes less verbose by addressing this issue as suggested by
> > clang-18.
> > 
> > Also, change the name of the parameter of qaicm_wq_init from
> > fmt to name to better reflect it's purpose.
> > 
> > Compile tested only.
> 
> I'm not sure why this looks like it is targeted for net-next.  I'm not
> seeing any dependencies on net code, nor is this a net driver.  My confusion
> makes me think I might be missing something.
> 
> I'll plan on independently taking this through DRM, unless something is
> brought to my attention.
>
> Regarding the patch itself, looks sane to me.  I'll give it run through on
> hardware soon.

Sorry, the error is on my side.
I should not targeted this patch at net-next.
Let me know if I should repost it.

As the series isn't entirely for net-next, I'll mark
it as changes requested in netdev patchwork. And plan
on reposting the other two patches for net-next some time soon.

-- 
pw-bot: cr

