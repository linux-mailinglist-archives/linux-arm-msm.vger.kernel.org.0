Return-Path: <linux-arm-msm+bounces-47806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60443A32E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7E73A839E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4597E25C709;
	Wed, 12 Feb 2025 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tf7m3kZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E8209663
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739383990; cv=none; b=b2+D6GRUg/Wh/IOQe0D6luJ/F+RdEgRMQQkfDNAlsck+6IU1OM01TY3VY3lHhrCcgPWkk9uNjk2frscK2S5bcy+iKp5R3I/gWOOqKQ5VOuSJE3Ib2y03wfjSKx7JBwrJF0HNbphYgFALBz0Cbq0zPoboWSXbwmrccLBlSXKNrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739383990; c=relaxed/simple;
	bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+yovZqMx3JTUDxb349z+Fz+sJj4dyOpWrevGtuU4Zs4dBioGNR91lX478rgNj221B5PZH1GUQsUOFTOiejFW8PccBZ+bSRB+2Z+a0m/0bvWMljc6wuJ5/AVNnEaVYu2CPj5Q555kgSCz+AyIlcnXs3zXQmsWZP0x6GRBp9BQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tf7m3kZe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7c81b8681so14695466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739383986; x=1739988786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=;
        b=Tf7m3kZev4iYM0WwK+38V1v8f+CIAbVhXd3HHT/EnWDJ03PhPMdvROa13EE8sk7wOh
         znHalMMEwotzv4EizeMGWRy8XKp4pB/QpPuyOoI1K6QKspicmH89QRPzwEBx3gD96nhO
         kdcqZyxAD6lcdYewsvkMSiYqjRMiAqAEif8HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739383986; x=1739988786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=;
        b=A7VmOBosrcn7BZ9w+8q/fqd4u83B22197iGY9+Bju75YoLvu/wUZytAZ83TE5g9Lq2
         rGx6PmPX93pGF9C/90+r5d2FsIyDYqyYvuietftSV45nviVHBIp1xfan/29uCtfN1H6U
         ufdSc3tYEhk5Cfk8OMi4AkO41RsR4ao+k/s/QAJpqeDgRv1nmUzfBuHaTLnEcP/pl+gE
         49VsN/tMW7u+JFfFpESmalTQyKWWOIDZy3zzcg8yS/d0XHSSEslvecRfiOFU5zcvpOGQ
         3Tr7qIUtQTHH87ZxxvrRnFwYKbc0zs0VMg2Dk88bpjAjeO1Yrbm1g/nhuEsEbU4qyiSA
         S9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWPCS7hx2souBkTTZE5mtTcoqsps9W1GJ+0lWI3LIgMAqQa5s5CH3We9LwuZezRR/JFIN/cP0CYyEEZfIFu@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6LMF5uZRT8/URi4GqB45dBnErVlGTs3siPz8lH/wRe5XjIWg
	smaWyL2Jc7/Gpkx74mEQS+6hPsvw6faTkyCv1MdRPgadSLXlJrmS2uoIgUl3WaZDPyZmYQUVjyz
	fQjVT
X-Gm-Gg: ASbGncsIV2cE+bJwkFmyLyN5+IMxACq6oDKqIf60Myv99YGpDf0MO9fyZ5PqgHRHAnq
	NbmxWGy016hdjgZcVvmceqwi9/GokjcExnQjS9xNIjJ9nh2iPdXaFUNds0hUKEv7Xf7CBRJqcDu
	o/LTC3ubd8ZgTNHn3JNWOAyCFWu+yKE+QRGIavW0L4LDxBVbcNLCkFTJiJt8qN4jvl16txC+D5q
	iMbg9jWROpeiswZpSbtYu5ZSECT2+kiLxo7gIwdsXVAz3tfo5FZTb4ctXcWK8WwdyfwNxyEVvyM
	I64tCnxl7gV0woIbmP8aOOyZtWFjF/jOdESQAXFkQqTxTqQvg5M5qNE=
X-Google-Smtp-Source: AGHT+IEtliMyGnO0cDqboJXFcT0RJbx4a3dVYQNgmPLjWSehj9HgQOVsikFS3OXgfx5J5YLmbCJAbA==
X-Received: by 2002:a17:907:2cc5:b0:aa6:acd6:b30d with SMTP id a640c23a62f3a-ab7f389f247mr433239666b.48.1739383985716;
        Wed, 12 Feb 2025 10:13:05 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e18b410fsm369608066b.2.2025.02.12.10.13.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 10:13:05 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so608699366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw7CG7KkNG6rqztDP94JfeFV8Tif5mn4wnmKyGaqDPZr/ZPkqoNLOFowZT+FjtzxbDsu3qJDqxJggBYCiw@vger.kernel.org
X-Received: by 2002:a05:6512:23a0:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-545184bc10cmr1392880e87.47.1739383553822; Wed, 12 Feb 2025
 10:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com> <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
 <Z6zf3YJq6qqoJQRi@arm.com>
In-Reply-To: <Z6zf3YJq6qqoJQRi@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 10:05:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZnb-c+9LVYWmA0EZPTX0enpZQdwokRanKZ78RRQOAzw@mail.gmail.com>
X-Gm-Features: AWEUYZkYpo4ZdBFbmBIkTo_Y8VQo51FzREvP3YsId9scTLFHz9v6oyFYchRiLcQ
Message-ID: <CAD=FV=XZnb-c+9LVYWmA0EZPTX0enpZQdwokRanKZ78RRQOAzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Roxana Bradescu <roxabee@google.com>, 
	Julius Werner <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 12, 2025 at 9:52=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jan 29, 2025 at 11:14:20AM -0800, Doug Anderson wrote:
> > On Wed, Jan 29, 2025 at 8:43=E2=80=AFAM James Morse <james.morse@arm.co=
m> wrote:
> > > Arm have recently updated that table of CPUs
> > > with extra entries (thanks for picking those up!) - but now that patc=
h can't be easily
> > > applied to older kernels.
> > > I suspect making the reporting assuming-vulnerable may make other CPU=
s come out of the
> > > wood work too...
> > >
> > > Could we avoid changing this unless we really need to?
> >
> > Will / Catalin: Do either of you have an opinion here?
>
> Is this about whether to report "vulnerable" for unknown CPUs? I think
> Will suggested this:
>
> https://lore.kernel.org/all/20241219175128.GA25477@willie-the-truck/

Right. The patch in its current form is in direct response to what
Will requested and then subsequent feedback on the mailing lists from
Julius Werner.


> That said, some patch splitting will help to make review easier. Should
> such change be back-portable as well? I think so, it's not only for CPUs
> we'll see in the future.

Personally, I don't think the patch will be terribly hard to backport
as-is. I would expect it to just cherry-pick cleanly since it only
touches spectre code and I'd imagine all that stuff is being
backported verbatim. I did at least confirm that it applies cleanly to
v5.15.178 (I didn't try compiling though). I guess there are conflicts
back to v5.10.234, though...

While I've had plenty of time to work on this patch in the last three
months since I posted the early versions, recently my assignments at
work have changed and I have a lot less time to work on this patch
series. If breaking this up is blocking this patch from landing then
I'll try to find some time in the next month or two to do it. Let me
know.

-Doug

