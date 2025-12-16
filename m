Return-Path: <linux-arm-msm+bounces-85411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D5CC521E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273403011A71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 20:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AA32D7DCF;
	Tue, 16 Dec 2025 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7SLo7Vk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7525A2A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918527; cv=pass; b=rFgDBaXna2CVj9qd8C6QG2uFuhBZc1ihOaEkSqBzbxPRvRR1vu7ZUwlFuHntasl8jeEZ2/3GeAGQyHRCgEPjJlCnkIsEBAImS1RBqYlFAojPW5801I6AhXgm6rZD/4xKHXU0ftk42ttk8PAJE3XQlWk/grLR8xdSlnFMcMjEHnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918527; c=relaxed/simple;
	bh=XMfwca+6IgBX1mGQW2ZtGykWl8XuJMRTmtfG6eC1w78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzcRQsPIeFsWTAkiUVSbaDHYpc/ng4dF9CaY9qFfrxy+0qwZc63L21s1lrHeUTvqINhNRPe7b26tPXECh/4pomDjKVChdAKWabaYnNS5AANrvrlXMpSzd7HOKFa0OixEXphywloCK8uB22aGc9LuOD1H1XPLI6WhA+0Wri2k54M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7SLo7Vk; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so2806a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765918524; cv=none;
        d=google.com; s=arc-20240605;
        b=fmBm1uloOmlfZv+toeuGvIVJcmAbwO5SSYt+UMI2qtcliZCeDGZUAU7yBKV4ifOcj3
         nEhqJULdAnsP2deQVfAnZIzyslTBsScI9rNR04iiXd1hwjYm1zQ6XkC4NNIIGogGi5hw
         F5uBvTi7dzxDL505lxzxmILsKrhMM76Lwkec6Tw0UZhcVp2gkhYOym7UnZOcN5vNTskV
         xjS5Lfl07QuvHg9NQPDMvfCbo7es8zK2/yYn3DEJ4E0pAAF3lw8NGxZWrTRapi3kLS6f
         HslljAidPgBWX6bbzd750y1mlASXrOb2dMwbUNkI0NXQG8CrfaPLs3nVub83Z5e83+EW
         MSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        fh=cfa6IJLR6UQV4sZ51q1Q7UakGmyXltLPVuNTw2vo028=;
        b=c3h4GAAbe2hYXKZnFTjrKHbYZqtiAerf9cLexrIdmwgtFk3B2HfJsaofAKy1BjLKnK
         KCTpFttGFqJN7gs5XqUQDldTvu3Mctk7WB9d52dVHOYRh7ZFylZ94dzbcbC6Vkmt2Bzm
         Qk/PfCsgawH9TgCVE8g6EkFSP8BOyg/nwjr9qchgM89l1DUtgyTQ5XOtLjNgyXgliIlp
         qbVUbKnzdBWUaOM2vyPmPihcfSeSsMf1NdmCcE4MG6zs4ePV1+J2bhT8/50LVw27nt1S
         0akNXxtx+ByngYdTxEEriKuNSsNuVi023mE1ASzUi03p6ZVRSVq+p8OpdY/88UxIOF0V
         bQ3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765918524; x=1766523324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        b=f7SLo7Vk+htYayx0UcMConq1uILGWzyiEFVHAGAxoXpdZjrFjZ/wHt5ucr1WAo3BlW
         7M6s+UqeSaJqI/ik5MPczNR1y0JmhJkSrVJuqAxgTnkGynIRQHbd7t1BhjmOKVgOb3a3
         cPHXOaLj9TZJuGDRkbZuod9vcw9rrXBq7YrLOwBKz+Je1zA7yKq8jZrWEHbCWYqSEeLa
         FNTAQ2aJWBWYIaKmkZHvuDHBGAgMWNzH4VNv/jZ5EzoXp2w6PaThC8hOp1gGp95wG1wR
         ociKBE/6qW8MeyCZCmHFuLN5OiiRiTeAMhz1dEOlCbK7ch+x8XQB58nS6u+/SGGGHoOT
         PvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918524; x=1766523324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        b=Yu0ORUY6r8h6q7EeM6z1mKByoFoWHETSuGZLqCQT8JH/vxC+BSI7UNY5lynGQOV4gU
         X+jAVfgccmjdh2CriwIyyF/uaYXKZX/NbSEey0aa6OvqrkOzLprG9HmdWlzXZm/mmGn4
         uOPt6+pYuNqlnFkHddUk0C4s0ObC0SRkyt07MfyQs/b5Jkc9BKGiJJf23u/QOBT+nPw5
         AS2FNoSv0QXrTeMHGb71MBqrBhfb1G+x9JcWANoDKgawE9faTmbgB8o+4MMoN4W6bzow
         mopsZxFK6VX2vWK7WpJdKo0gUlaF3nIubjTCVdg6yqyAzQeuYkUv0uCCyGh1mv4+2cXb
         qNwg==
X-Forwarded-Encrypted: i=1; AJvYcCXIu2wyO+DYPIgCK6aF1YR+DeIWIiLf2P8+V2gkncNNUZK1PSZEm0Nc/Cq6dTU2Lem2Qu5FKYT2erhD/oyb@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKCVHqB9GrU4/R+QH5tb0LwPfsm5bbIbbc/BZjgpp+wu8oOCb
	VRcyuVW10P70YXN87t5i2J8icBwbruO55wv9yZNwnYmWSXjKE864CsQLvEvlqeuB6ZqTZU/sBbL
	E6cI3baLTAH3zH03uv26d6/xQUtU+q1B792tbr0UW
X-Gm-Gg: AY/fxX5RJXpHuC6MlFfTvFKvDJQSNp43HDdPdTpho6ZcJlsIJkic+lvjOAfNXCQIfVm
	7wjPwSyFXfAr3DEdhc5Q0LQOSXkG1E8TQpuSADEJdSdcoiBwldJVHd/Nl5vUkWjPrzyed/wgbh8
	6k8DGbMoijCALZp4HUzcHBfzD60eXi15j+4av1ex9T4CuS22b19n7iX27QlpuiAKUSPWwEvM76W
	eKSenunGkz++Jp294J7XUKA/+clZnc+pAkQ4fvW+DfMSne70t/XTq+Xk4oPtEx9B7pmmq91ltTN
	0Z9RPcpNHqmHD3UYGx+3TICv4Q==
X-Google-Smtp-Source: AGHT+IGsz1tDpW+49yJ/nc0dBXZ2gMbZxB0iidEu4hhho1b5ydd5gY5zW3RYgrYE2+/84hxzFVkC6qexu8x/FiUhkVE=
X-Received: by 2002:aa7:cd64:0:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-64b4013d16bmr8195a12.11.1765918524027; Tue, 16 Dec 2025
 12:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
 <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
In-Reply-To: <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 12:55:11 -0800
X-Gm-Features: AQt7F2olNYfBzUfT50sKKiFb9bKqZfz2W8W5EYDMqFhKnOcHZBrOqkNe5zCyA2Y
Message-ID: <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 12:52=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> > On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > Shouldn't this all just be in 1 .rs file?  By not doing that, you hav=
e a
> > > number of public symbols (that are very generic), that will "pollute"
> > > the global namespace of the kernel symbol table (unless rust does thi=
s
> > > somehow differently?)
> >
> > Rust produces one compilation unit per "crate". In this case,
> > `socinfo` is the crate, and the other files are included as "modules".
> > Symbols defined in them are not public unless annotated with `pub`.
> > `pub(crate)` makes them only exported within the scope of the crate,
> > i.e. inside the single produced `.o` file.
> >
>
> Does this imply that a fully converted drivers/soc/qcom would have ~50
> subdirectories in it then?

Not necessarily. Directories are not mandatory for a Rust module,
whether to do things this way is a code structure/stylistic decision.
I did it in this case primarily because I wanted to separate out the
large in-code data table (e.g. SOC_IDS) and the logic for speaking to
the smem driver from the rest of the code. If you have a preference
for a single file, I can very easily put it all in a single file.

>
> Regards,
> Bjorn
>
> > > But putting this all in 1 file should solve all of that, and remove a=
ll
> > > global symbols.  Especially for just a small and simple driver like
> > > this, no need to split it up at all.
> >
> > I'm willing to put it all in one file if that's preferred for
> > organizational purposes, but as explained above, this shouldn't bloat
> > the symbol count in Rust. If it were my own codebase this would be
> > separate files, so up to y'all what level of granularity you'd prefer.
> >
> > >
> > > thanks,
> > >
> > > greg k-h

