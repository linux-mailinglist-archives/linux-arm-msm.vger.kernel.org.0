Return-Path: <linux-arm-msm+bounces-42536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61459F4C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D2916F19B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938F61F426B;
	Tue, 17 Dec 2024 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fgaT1Tki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7581F3D44
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441944; cv=none; b=rFssu2EasGpNVGIj3B6DpxAvCNRu9E8iJ9SPqdYmKFU19zn0V3zyysIDyp7Gz8lOgaMxRYmhoyNQ2c78qmllyI+5cpTH8+QF5nA1s/qIyQdcdTMSP1rOmBaf3eAF9FipR4k1UrIkV1z4BypYXox5N8bmLWOAzD8vqzQ/2utq4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441944; c=relaxed/simple;
	bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFJgo359o2/1ipLj5Q1PZt1yB8s9Yf/vMBbTO9Ivu/6ANDUkhQgVtB8zZP/3eXEWREte5OGDdSfsOFbOrynLgf6i9L8oMP3PLoj4vEdylmgdEHF9AAX8UhSxQ5I964EHlmo5Qfkz8kszJLgPlnmAshq2VUeFdwP0al3jrQLA1qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fgaT1Tki; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467abce2ef9so277381cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734441941; x=1735046741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=;
        b=fgaT1Tki7LfUtSCyzIDSO8O+up4yVeY2oBPpR/QJ8nebZZmEC8HGvVuoehcUOeQ/vM
         UN1JLm5v05byaMo4IlcmJcbJusj4U/HJkOaa9ECXxUgk4UAyjEGmSCeekoJRn5+r2Cu4
         N+N0m2bEGTVCGvmU/dE1IcRSFbxf8+wlM1YDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441941; x=1735046741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=;
        b=KMVG9dV/pSj02KbWZeaN/NLMPIG8pwrUz8xzTbaMT0IMTWpg3QptAhcvL/YCbn2dgq
         n35XjMaMIOzBEzg39PHLfiSi7cGfy6OmvkR/a5+BomDHnPfoQ8skjH45VLCEHIU8wEkn
         QvQuUzHRPHQ03bs0dNUPCryCped5RR5h67Kh+nAIPr2Htztn0PREQqdDX4+wszXlI8E1
         mlel2zJbNMg0l5BMWcBGW307TZ26CYg1ZXEFZunnc3pGwabvfeGx8ZBJOdD0Uqt7RxmR
         GwXKjn1/yuK3ZATGZ4H8lfQ16vdXGchCrnzcESWZ5I3lV81a3brkVlv2bvvkD2AUobaz
         1h/A==
X-Forwarded-Encrypted: i=1; AJvYcCU3PbNZbBmAYeMe77Zuu7f/t9YZFHl8l0PWYcxU7Fu7XF31FYs7TFq4HKBKXgvHVhD1Wajsofc82vwNLOuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UsIkag6OzwGgRFx/vAa9DIqQ10j1/yBldt/QhHiJcVM1xg1m
	ka4ynObHsXAQ7AUuamsRjjS0vzoCTcxXJtC4RsuWRsByp6Zfwl1S6iQHih1AFFkGSBAWm4SUDIJ
	yI6lXoEN0qF6lnf3W7Pe8hwlNrYZbwIScbhZX
X-Gm-Gg: ASbGncvMMbbPBZMvzpR6hd/vKj5zoDkEK+ryEOA2MfCHt5zcSYvS3rbI0jgO/YiRNa3
	1FylnwbdxY8307rDpjn+6jYZme6EHzQUen5kkZn9PctY+/Z7gRdtwOI9MQipgvFXGaQYy
X-Google-Smtp-Source: AGHT+IGJW+l9zXfMUaeo40XK+7bPUSnqauK+Az+lGUzluD+yQ/VlTXkwH2X6x8KUeaEMIrTECPFcD4EfU3yVGGK8l9A=
X-Received: by 2002:a05:622a:20b:b0:466:8a29:9de7 with SMTP id
 d75a77b69052e-468f96fac57mr3950571cf.12.1734441940466; Tue, 17 Dec 2024
 05:25:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com> <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
In-Reply-To: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 17 Dec 2024 14:25:27 +0100
Message-ID: <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Doug Anderson <dianders@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > - Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
> > instead, which starts out as zero, is updated by
> > spectre_bhb_loop_affected(), and is directly read by
> > spectre_bhb_patch_loop_iter() (could probably remove the `scope`
> > argument from spectre_bhb_loop_affected() then).
>
> Refactoring "max_bhb_k" would be a general cleanup and not related to
> anything else here, right?
>
> ...but the function is_spectre_bhb_affected() is called from
> "cpu_errata.c" and has a scope. Can we guarantee that it's always
> "SCOPE_LOCAL_CPU"? I tried reading through the code and it's
> _probably_ SCOPE_LOCAL_CPU most of the time, but it doesn't seem worth
> it to add an assumption here for a small cleanup.
>
> I'm not going to do this, though I will move "max_bhb_k" to be a
> global for the suggestion below.

If you make max_bhb_k a global, then whether you change all
`spectre_bhb_loop_affected(SCOPE_SYSTEM)` calls to read the global
directly or whether you keep it such that
`spectre_bhb_loop_affected()` simply returns that global for
SCOPE_SYSTEM makes no difference. I just think reading the global
directly would look a bit cleaner. Calling a function that's called
"...affected()" when you're really just trying to find out the K-value
feels a bit odd.

For is_spectre_bhb_affected(), I was assuming the change below where
you combine all the `return true` paths, so the scope question
wouldn't matter there.

> > - Change the `return false` into `return true` at the end of
> > is_spectre_bhb_affected (in fact, you can probably take out some of
> > the other calls that result in returning true as well then)
>
> I'm not sure you can take out the other calls. Specifically, both
> spectre_bhb_loop_affected() and is_spectre_bhb_fw_affected() _need_ to
> be called for each CPU so that they update static globals, right?
> Maybe we could get rid of the call to supports_clearbhb(), but that
> _would_ change things in ways that are not obvious. Specifically I
> could believe that someone could have backported "clear BHB" to their
> core but their core is otherwise listed as "loop affected". That would
> affect "max_bhb_k". Maybe (?) it doesn't matter in this case, but I'd
> rather not mess with it unless someone really wants me to and is sure
> it's safe.

Yes, but spectre_bhb_enable_mitigation() already calls all those
functions on its own again anyway, so I'm pretty sure the "must be
called once for each CPU" part of spectre_bhb_loop_affected() is
covered by that. (Besides, it would be really awful if they had made a
function whose name starts with is_... have critical side-effects that
break things when it doesn't get called.)

> > - In spectre_bhb_enable_mitigations(), at the end of the long if-else
> > chain, put a last else block that prints your WARN_ONCE(), sets the
> > max_bhb_k global to 32, and then does the same stuff that the `if
> > (spectre_bhb_loop_affected())` block would have installed (maybe
> > factoring that out into a helper function called from both cases).
>
> ...or just reorder it so that the spectre_bhb_loop_affected() code is
> last and it can be the "else". Then I can WARN_ONCE() if
> spectre_bhb_loop_affected(). ...or I could just do the WARN_ONCE()
> when I get to the end of is_spectre_bhb_affected() and set "max_bhb_k"
> to 32 there. I'd actually rather do that so that "max_bhb_k" is
> consistently set after is_spectre_bhb_affected() is called on all
> cores regardless of whether or not some cores are unknown.

Yeah, you can reorder the loops too. I don't feel like moving this
into is_spectre_bhb_affected() would be a good idea. Functions with a
predicate name like that really shouldn't have such side effects.
Besides, I think is_spectre_bhb_affected() is probably called more
often per CPU, both once from spectre_bhb_enable_mitigation() and by
whatever calls the `matches` pointer in the cpu_errata struct.
spectre_bhb_enable_mitigation() seems to be the function that's called
once for each CPU on boot to install the correct mitigation, so that
feels like the best spot to put the fallback logic to me.

