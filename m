Return-Path: <linux-arm-msm+bounces-85293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CFCC062D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 01:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90BE23002882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 00:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420532147FB;
	Tue, 16 Dec 2025 00:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O14ocu4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6815B971
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846531; cv=pass; b=W/znbEhrnE/GgMYcX9MwNRQancLaYham0l28tpq/ROJS+PGN5RCgOJnNbpTAvOBqFgOuoznV11Z93h8rKlptNKcAnQzw98w7UZmXW507NfP/fnLxGYuKcKs01C2o5JJeOnKSq07TDOg85PbvfW406qGFelGuCNMssC/gX4oQll0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846531; c=relaxed/simple;
	bh=XedozhfciyhSP4b9nDQllsAAs0EUvQS6wn7xvBD6/wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QitOoCg3XDlddW4ZVd027sALVQAx5naduFlR/aXIKQ7d4ccL+zlDVza5ISSChGb75L8cAZyMJ1CK2VAX+KNaxtlYLrEb48DE6o/I5uIWgfzHO10V27psNzuU5JJkF04sVAPTu5efe/ZXKyAFCyjqpFdFXcQhEaPaMIN668qpxlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O14ocu4G; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso2541a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 16:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765846528; cv=none;
        d=google.com; s=arc-20240605;
        b=QEe/RCdBxSgbvIdgL/l1tlfdDKVPZZj2GjOFSAKreCtJT8OFGUIfWUDghFrs6yam4I
         wtc3zJUTbf+kfilUsCHo5Idijjmkky4ci+CptOhjXqewoBArTK6L7pndmvPuwn9l2kDS
         TG+sBuhxghgSUUfBOiEZE5r2U01PkCiG3/LhJWy6eR4wpt+HjrJOD2rGcdFvDfkUcK4F
         rmEQVXCJmY2V4XNwhHrPKbOKrui6Zg6Ny/MM5cPzYSsV1qDVN+2swDd6wnYR2FrQb3c2
         Y5bFqjkLPz05KL9cWjGreimjjhTNGA0bmm6AIUMr8QdE+4UbEd+WQ6QrlILmlUHq4G3i
         xF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        fh=r5NGdNzZNijZs50ZT7wdoJcEldusHLRr+Aps2SYouMM=;
        b=lv9EUV3zHdymVQ0mZ+gqwxHhSPYKXGiW9rd3jOl9nKXoATC2bSKCUFEvOWK9wT+Oqy
         n8E5imWhtUMBMdaxZtJYJyIY7gJee++lVpKsIx1UIXvDerPpu7fvKQrOH9ofCjX9NaYk
         MuaQ0M2Tnn1KhqLSejFa/KzRz/QRacAtfEIEWJBQNCEZ6FGXkYq5KBp/9ImAMK4mUeHd
         4JOyt1r4wYoxm2dntiljoZWSlUpTNLJjPGRIZUTkCYOMxhbx0Oyor2SRzMhYNDN1/IMs
         qwcFKffpO+6wAl1sl9M7GPB5Kx8A4Zu/ZV4/Bvw/ludRnF/ZjIbHsaLLChQs2vY6Xxod
         p1aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765846528; x=1766451328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        b=O14ocu4G9tZd4w4Lhwk2KyfG0R+RclS/ZaCOaVAmonJtYpgY6jc81ZNuqyGtSFfqIj
         GLnh1rwm774/luN4Aym9/92bNbFmAVgI1gdMewlgfQyi4R4+hNRbv0WDezGAZo9kJHpt
         MkzHFK4ugnA9wWLsEfzDukOtsoXJvWzcoGYhADDPZ/0pLGmi322FsOPmgNDrdcvFXua2
         nW5oUq05vMVidtnRLzFBAZdfxsvlkxGxi4P316ZSakoWvc6IcAav7u86YD1bn/DTwzdd
         h6AL3L+j6HWz891ELiiH4CsJpsj0hEnIHN2izjuugTIMiDdbbbFbDMrhQ7fm4tmbiIzY
         KPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765846528; x=1766451328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        b=f7m4hBhcsZ2p/xVryhmk07ylZVuxHwPUxAZrbHh89ZSpBRA9YOdQq9QFZmmj4twy0y
         rjZI0RwyR2NgHVkYzA+SSoKvZvfx4sxYEqir8Sdvfq+0ITaOgj1UpnyTKEbH3zFsrDYA
         16GEQD5w0BFbblpPUI9J5cLv8b1LqdQB4ZTywz56WOHRimAAzud51H5YEs6SCCxAl89X
         iAtBA+S8xuOp9Y+9VI2+V2HdIYGPCj5Kh1+Eze8JohDfRQ9e8VkMkU8Y8glXYKckHQct
         l5DtDMWGwAA8GXOblTeSJdhFsshdymwn18H9a7aZrkm7xG7NosNq25CIXIJ907aa/jXd
         ydAA==
X-Forwarded-Encrypted: i=1; AJvYcCVlMAq0kZppT6m9IqqMmhIzqJVZSJn7rjdmo+HK92JnpalPoVseBszmbK+hzkVrPXHoPTJTVlyz5zVPFro/@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxaCE9mHZaFNSoh1qireleddugoCZQiHZOt0Ae2RUgqG4pqXm
	XzEazn0FaShQhziHfqeIGqmg0LD8UcTSuRnpsJ1lZOAnfjd2yToBgVkqMdEz6vhJK634eYSdFgk
	HxUqEexrDLA5MxcR0zYoQE4GgdmpvDD1z93v8QnNs
X-Gm-Gg: AY/fxX6uo5x7NUjRzkM5oxdIIbW2CesU5itUd/DXqkmilgjUcCY9HD+QMKMNryHQWBr
	vP8pcTmPNPBX1Aj6qjoogGoCImKe+J1wtnYve+XvkFevyE+iVgQ50iyKup/BRPxQ53hj7bJybd1
	8vlNMar//WejAmA3PYFbg3iZoIUrYtoWdkrwpSLQtfksszkO6wqAfbI+iNZyEsAZRJukSsWzItV
	PxeBobc0ljthF2yCEBxpGRLfWCXWHQd8HlHv5/1NwpWfSSabLgC5jSYcVLgBhNe9wD5Xhm1DfwT
	fOSgDyO35aOaVNdknZEeUPXk1A==
X-Google-Smtp-Source: AGHT+IGLXFs6ZQQjk1EVFsSaR/XVMTlgzBvW4YPps7Xv9R6FU3z3dQSvYkmM2olzGcfSdFq+ShBjksrAZKnvMeWwNio=
X-Received: by 2002:a05:6402:23c6:b0:643:1fab:c9fa with SMTP id
 4fb4d7f45d1cf-64b300ec1cdmr5438a12.9.1765846527695; Mon, 15 Dec 2025 16:55:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
 <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com> <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
In-Reply-To: <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 15 Dec 2025 16:55:13 -0800
X-Gm-Features: AQt7F2pHWe0LIWFXW8BDLU_8yyVD7qL8ToGLKpD173W1Z7xz7u27E-MDk1pJUSs
Message-ID: <CAGSQo01-yjNBpo0jCO0sK+0XHLKUyZY8vyA0X2M=fDtcmv6Vkw@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'll get to your other comments in a v2 soon, but wanted to focus on
the lifetime of `qcom_smem_get` buffers for a moment.

> > > > ---
> > >
> > > > +
> > > > +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
> > > > +    let mut size = 0;
> > > > +    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
> > > > +    // host and item are error checked in the qcom_smem module.
> > > > +    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
> > > > +    let ptr = from_err_ptr(err_ptr)?;
> > > > +    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
> > > > +    // byte buffer with its size written into size. Because these buffers are derived from the
> > > > +    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
> > > > +    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
> > > > +    // to a reference is allowed.
> > >
> > > This is definitely not true. The smem data is ioremap'ped during
> > > qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
> > > Accessing such a pointer after unloading smem would result in the
> > > exception. Current socinfo ignores that and keeps on accessing the data
> > > at runtime (which also allows it to read DSP versions which are updated
> > > at runtime), but the comment needs to be corrected.
> >
> > Thanks for the info. In v2 I'll look into seeing if I can make those
> > slices hold a reference on the smem module while they're alive.
>
> It should be a reference to the _bound_ device. I don't think we have
> a way to do it. I suggest just fixing the comment instead.

So, unfortunately fixing the comment doesn't really address this issue
- a `&'static [u8]` is a promise that this buffer is immutable and
will remain valid to read indefinitely, and it sounds like neither of
these are actually true (the former due to the DSP live updates, and
the latter due to the potential for the buffer to be unmapped).

I can deal with "this buffer may mutate" by changing to another
abstraction, but it'd help a lot if I understood the intended way
(even in C, we can ignore Rust for a moment) to know that the buffer
you got from `qcom_smem_get` is still valid. My best guess right now
is that because the smem driver is a *parent* driver to at least this
one, we know based on where we are instantiated that it will clean us
up before we go away. Is that the intended mechanism?

If that is the case, then question for the Rust maintainers, since
`probe` is not an `unsafe` function, could allow the equivalent of
safety requirements on probe methods? Since the match tables are
empty, it will only be probed if explicitly requested, so there's an
argument to be made for "this driver may only be probed by a device
descended from a qcom smem device".

>
> >
> > >
> > > > +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> > > > +}
> > > > +

