Return-Path: <linux-arm-msm+bounces-25053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A999256E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB74D1F23730
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A333E13B5B6;
	Wed,  3 Jul 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/uRHskY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42913A261
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999274; cv=none; b=LVeD7ruaUvFIrThEvT3vDDnLUJ6xLlHL/h3Rfbm95l+kjF6HRvlGbxQ2p8j+rJcV4Op7evYAnG50tfW/jyIvmXWyPTBcIA3P2Bdx3OWWFPlW8hGWd2yUIunPyYtitVd0WM+EHDY/7ANttXgXZlu+bsO/Zf76TlEI+eR+jRd+v0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999274; c=relaxed/simple;
	bh=adwOBgHH5XMcMSCMH3NojJ7KKp8NE0uPl/YyyiJ3Vfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daAV/sTE00GATbD0if/QNu27XnvboXLuBoxjop72P9KXr8aEjz324hHxk7Ja862hFMhcftTZJTOzRvvFDO1xtvgNqg9aWT5MH+x1IO1nbqN+LrZir5cPMl1nQv3Z2G0gqIYgqrzv8Yga8N+0w86S9Vy0b47XE20mxBTeuNTc19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/uRHskY; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64f4fb6ce65so24518747b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719999272; x=1720604072; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KSZSFBoSPSHlgVrFeyK4qe9IWtkmE21sNNnRmfF3nw0=;
        b=C/uRHskYNIfKEjqucL1m+mb80FcEGw673GI3wXVWGou6h1ZhQsqhewRyw2ZlWDz7AM
         A0cgMeVHjEdycjJvtkii7g1PEqmLSx/13y5m3MsKSfRcBNt7lZHKcz1QzonE/gMvxJ0K
         NSwOwKIghNtS4IAc5UiEdrmcpoM65AWXfWbbQJ3S9K1la2ACm6B7EJh5zghmqUv3M7WS
         6/km0W1sEQaKIwmTdQDV47Ux92CsOHXPKo7odysXlNJn8qxJdRNSWvsZQUE85fBy6FN2
         2IZ6LYAVSzjIGuy8Z67w3wosR/Ywk/FnawGRGfVicNzokiOXf3ucqWdhm2SIAV0DZ496
         edFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719999272; x=1720604072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSZSFBoSPSHlgVrFeyK4qe9IWtkmE21sNNnRmfF3nw0=;
        b=hbWASe6mvT0jE2rQLaE4M4mZnkYseAPA54j0KgbdRlCDeUph+f+FNzPILRIjz1jkYq
         795LRuNEhwpkxBTqYcnqWq41QI7J1kjDmqAwqkdDGr5+axWxLHKp8DtpyoQ0VU9VYc2t
         hJc/VNOTneyGl56nNdiKMnadwTowOG2eLidNrcx35BvACWUaEXQIkvunwKldnkVD+j7a
         QMePQzuvUtVbEE3Fa9upSK+3lO6hO06Wc9DfYoCCq0S8lxBJ+Y8cf+HX6bBJXUAUbU0S
         L0vpwmqSFt5Yweu3Wi5oWqSuZPMSl/jHsB4qy8zizSl2xOxXNAaTRemlE9dMG/tRTWc0
         HYeA==
X-Forwarded-Encrypted: i=1; AJvYcCUHztffPwU4irhGqHsjFWR5Scvj4yyWhEjdZAe3SO9mIVuD6Mb9Pek3OalGcsHLJDTUys7688dEw3+8q9ix9e65ou25+6tM/kyr9985CQ==
X-Gm-Message-State: AOJu0YzVFD20GcxDE0s2FPbldZhNvdYFXSUHiYNHOhkhCFWw53oZTi9J
	hEkXMkmnxB8sBcnWK6dY9VQbDFxwnMF0Bv/599sQDxFG5XirwRrca7lZdx4dZbc2VIx3TZST+wf
	KDQ5mW+H+F3BbA1iXSrJ3tr+NprEb3RS4X3fOkemo40xrc3CGadc=
X-Google-Smtp-Source: AGHT+IGWJrwgezmMBB6Ff49RsWgWP+Dhe5l/1vgBTjC9Giv9ON6cteJavMgb4zcMw8s9IVqCUUpd79nEFAF8DD6ncSA=
X-Received: by 2002:a81:8313:0:b0:650:a1cb:b12d with SMTP id
 00721157ae682-650a1cbc444mr35317037b3.20.1719999271734; Wed, 03 Jul 2024
 02:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com> <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh> <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
 <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
 <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com> <CAA8EJpoxwNv-wpJvqEf9U+Dg9=BJXG++GWB+2DES92MSqXN-3w@mail.gmail.com>
 <c48e17df-1806-439d-b0c9-2c6b7c208505@quicinc.com>
In-Reply-To: <c48e17df-1806-439d-b0c9-2c6b7c208505@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jul 2024 12:34:20 +0300
Message-ID: <CAA8EJpqJSo36_ZNT6FH2+BG0ZZPQMdPnANPyU9X-=b6a4Pfs3g@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, arnd@arndb.de, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 09:44, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/2/2024 3:10 PM, Dmitry Baryshkov wrote:
> > On Tue, 2 Jul 2024 at 10:07, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> >>
> >>
> >> On 7/1/2024 10:41 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
> >>>> On 6/28/2024 7:51 PM, Greg KH wrote:
> >>>>> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> >>>>>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >>>>>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>>>>>>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>>>>>>> initial memory requirements like shell loading. This size is passed
> >>>>>>>>> by user space and is checked against a max size. For unsigned PD
> >>>>>>>>> offloading, more than 2MB size could be passed by user which would
> >>>>>>>>> result in PD initialization failure. Remove the user PD initmem size
> >>>>>>>>> check and allow buffer allocation for user passed size. Any additional
> >>>>>>>>> memory sent to DSP during PD init is used as the PD heap.
> >>>>>>>> Would it allow malicious userspace to allocate big enough buffers and
> >>>>>>>> reduce the amount of memory available to the system? To other DSP
> >>>>>>>> programs?
> >>>>>>> The allocation here is happening from SMMU context bank which is uniquely assigned
> >>>>>>> to processes going to DSP. As per my understanding process can allocate maximum
> >>>>>>> 4GB of memory from the context bank and the memory availability will be taken care
> >>>>>>> by kernel memory management. Please correct me if my understanding is incorrect.
> >>>>>> Just wanted to add 1 question here:
> >>>>>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> >>>>>> allocated huge memory?
> >>>>> No, because any userspace program that takes up too much memory will be
> >>>>> killed by the kernel.
> >>>>>
> >>>>> You can not have userspace tell the kernel to allocate 100Gb of memory,
> >>>>> as then the kernel is the one that just took it all up, and then
> >>>>> userspace applications will start to be killed off.
> >>>>>
> >>>>> You MUST bounds check your userspace-supplied memory requests.  Remember
> >>>>> the 4 words of kernel development:
> >>>>>
> >>>>>     All input is evil.
> >>>> Thanks for the detailed explanation, Greg. I'll remember this going forward.
> >>>>
> >>>> For this change, I'll increase the max size limit to 5MB which is the requirement for
> >>>> unsigned PD to run on DSP.
> >>> So we are back to the quesiton of why 5MB is considered to be enough,
> >>> see
> >>>
> >>> https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/
> >> This is based on the initial memory requirement for unsigned PD. This includes memory for shell loading on DSP
> >> + memory for static heap allocations(heap allocations are dynamic for Signed PD). This requirement tends to
> >> around 5MB. I'll update this  also information in commit text. There will be some additional memory passed to
> >> the PD which will get added to the PD heap.
> > Could you please clarify, are these 2MB and 5MB requirements coming
> > from the DSP side or from the userspace side? In other words, is it
> > coming from the shell / firmware / etc?
> I did some more checking here, I'll summarize the problem and try to propose a
> better solution:
> init.filelen is actually the size of fastrpc shell file which is close to 900kb for both
> signed and unsigned shells. User space passes this memory and size after opening
> and reading the shell file. The bound check is for this filelen which looks correct also
> as this size is not expected to be more than 2MB.
>
> Now for PD initmem, this memory is needed for PD initialization which includes
> loading of shell and other initialization requirements eg. PD heap. As of today, the
> initmem allocation is taken as the max of FASTRPC_FILELEN_MAX(2MB bound check
> macro) and 4 times of filelen(~4MB). So every time, atleast 2MB memory is allocated
> for this initmem for PD initialization.

Why are you using 4x here? Shouldn't the heap size be a const or at
least more or less independent from the object size?
Also the object size probably doesn't include the BSS size of the
file. So most likely the allocated memory size should be sum(p_memsz
for each PH) + heap size.

>
> For unsigned PD, there are some additional read-write segments loaded on DSP which
> takes the size requirement to slightly more than 4MB. Therefore allocating 5MB is
> helping unsigned PD to be spawned.

Which read-write segments?

> I hope this helps in understanding the problem.
>
> Proposed solution:
> I believe the bound check macro should not be used for initmem size. I can add some
> new definition with FASTRPC_INITMEM_MIN.
>
> In the create_process function, the "memlen" will be set to FASTRPC_INITMEM_MIN
> initially and it will get increased to 5MB if "unsigned_module" is requested.
>
> Or I can add different MACRO definitions for both signed(3MB) and unsigned PD(5MB)
> minimum initmem size.

From your description I'd prefer to have:

#define FASTRPC_EXTRA_FOR_READWRITE_WHATEVER 3MB
if (unsigned_pd)
   initmem_size += FASTRPC_EXTRA....;


>
> Please let me know if this is not clear, I'll send a patch for better understanding.
>
> --Ekansh
>
> >> --Ekansh
> >>>> --Ekansh
> >>>>> thanks,
> >>>>>
> >>>>> greg k-h
> >
>


-- 
With best wishes
Dmitry

