Return-Path: <linux-arm-msm+bounces-85159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D6CBB1D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 18:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68847304A2AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 17:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBB12E0920;
	Sat, 13 Dec 2025 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oF8d/ors"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3072DAFA8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645901; cv=pass; b=f2/bk3u0roArQDU686fNwkxzL8KDUdTFIcNFOePKLTHgVR6HIB603G4ueQxtjIf+m+EIEuztWLgWJnhAbPDpio/DwdX/SK8OdXJKrJdF7xbt0KbnuJgcPrQ6Dj1gddmFQ7JUez+rIZOKPW6iubGGK3A+PQ97ynRPeddyfgtx42E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645901; c=relaxed/simple;
	bh=l70D1g+ajJ7BQH3hfBcc87/a1PidVWYQ+64HL14qUqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hur30nHyxlhe4eO2DyJLiFgMvtbSZ04YWb61hlpqvArqXf5/8pmw6Z6CkT60jkjLvlBPBFRLySk6aM8wDbrC1YRYkDq7el0khpRS808OUjrI3bhe/rNwda4HNLIIX1xTiwCedlKQLspKzBB95wuOoZnUkSLKVHRerdQHj2PmSaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oF8d/ors; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so30398a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 09:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765645898; cv=none;
        d=google.com; s=arc-20240605;
        b=JoaAnyTDiU1RTZxIWFEbQMe5Hjl0JYamsdrm6OuTTPZLMgOwos1mvK+vrPcTZKToon
         A1sVug7+MSXOCf8MdbfBFMxvMS45JDGkWAcODiKBiNcKFD9IjItGvli4JK92M+FY1IpL
         +bye/ONJ4etc6pSEx3M0EsNOV69nnB9en6f/hi5KIQCjEZ7YfE2yg+FBCqQuqB7BPeBV
         0ex8tVldKi/vw7mFGtwOOT7yYQyHO40mIUvKEWUSKuLIM2dmQavqDeTJzMDgZFnpK3NK
         I7GMcwa5Ly4ine67Cagj3ORtJG/bs6JF5FnoDpTxk4L/Y9ggXCr81PrP5x4lV4E0/95U
         uTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        fh=oME0AZcywoDLokT3Er5cV5bj7mn+DAYELO7t6xIfaZw=;
        b=ViJDhvgRgdsaODoU7eHotua+D0k7o/fo58w1nzFHUSNycsalJL7JPBIh7zErZQYFAQ
         mLcJllakKR1DryqfCtEJe/wc+Q8pn6axcEJlA7Az9MJcmR8WAXNI+RvSGs8Z3NkVRaf3
         MVGCJKE3BSgIVNU2m68/u4TbOBL0vo7pZwB7b6lPSUVjfF2KIrS9lpiRckfPFO1E5jVJ
         SyT8kc2hFVlx+WeAHTKqZcr5URl25H1Qtn0SvoOqE8sGlMWwQB18V6WgGyfMzWW1eOl9
         W3J93bAnyTPt6BLdAOouUwyejxPCkBdhEb5aGJ3URtL3M+FB5/wkwRh3PY22oaDQI813
         uUXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765645898; x=1766250698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        b=oF8d/orsiUfS3ysoz7/eB4QMkFQIf4ArZfSUJaouAOkb9qMFbT62U76UspywkpLEGm
         8ds2dPRktVC9HWPbuhMVi9VB+HAEYlwUTS7tIG3Ps3DxSJNZaA8ufphv9BsYwTUPEOAQ
         tlDVHm4YEemzj+ngnyDwQ7N+w4aDHjqo/aHRtcSsgnRVp3DbOAzE8JBYPlV4xgsCPOKU
         xkuUTQTHHeCJDMbokP6/I3Vd2RaJS4GapfmfCvtGLca1Qro0qeEMd7pbJVfL+CqB8PlJ
         vbg6CHEQhW+4qrRE8wOgjfUGgMD0bCKeu5TlMEXdqd66tX42GVFw3qFE5XIS03r6uEEm
         yfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645898; x=1766250698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        b=UBUbKvzkHiKmSxjnmHpX0Ig5lnJshesmG9IqfzIQSYVI8GdrK0DVMVOnrj1HOTCSVh
         L/gGPgdTObew10KM5LMW2ugAHsq7HG3a/n1ynUj3d/KwJjZWtysvS4qgxwJVeYMuLiSe
         l7kpEXvaNX98/BsyUXgNqEDTAWgjl+wMgY16OEMnlFk4/arEOIpqkKhdKC0dCxJeQ/6o
         QwBZIsA63qS+RBnnPuZRpdsuz5HH3xR28FCBE9UrJ8bfsQNaFfimT2KsNbIP7T0oPoag
         jgkdQMazI7/V/ll+z4R6pQeUHrsyo88XCXyPmUElblJADHfE2YsKCzqOOFggwWVvWFWI
         iKfw==
X-Forwarded-Encrypted: i=1; AJvYcCWYzjDSjDtHkC1gQhcZbAJTwcxFJMEzvb+Y8dX3ZSEIUsI3DvF6XW6E/GPB2DZtBN/4BSX7hN+tcF6sVW/N@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNrMkAAwo0NHkFm/k5brqnAYwh+8oEAaGoSdk0xhGkdiGIGqE
	e1oqGkiYusGA4cm6ndn8k9OGc4NwZcaIq9hUv86fYsn17kpibG5y0Idma2QtCNx85IjyhklFGye
	KaERZJegWn1O1rVmqDGlIPDRUVV0IKbM+eFgY6NWO
X-Gm-Gg: AY/fxX74GalkkgmrKYs/BwJRxqwRSbDClIrRKEvXrvfr5o9LFOR0d1SKH5UXYRaEG4a
	wXZL+HN5W/GHA9VGPsM3Favt/w1Oi79rFtdlaSk4jvAMwvbzoGSHza4Qo1gcAtsD3ZfB1ypobZj
	H9slx5VQmlzE5P1dXckfJ6XTu3UsYs+CaVkN5pJr16dqNlEO2QeuAmYgkmAF6qZa/HHiwC9rS4X
	A3f9xeE0CSFARmyW8F8eFJADEpD8BuzGpv+pUlVJdd06R3IgPgFduDPKNNsZ1e63pHEnxmPDclW
	vrxGWHiX6o4zCLlfw5DMtydhBG5P
X-Google-Smtp-Source: AGHT+IER387+iwTYlhSsOPbUejaitfS6ZZh7+wI1vPrLm1/OniZ+ZuV9xmhUqhxlTtaqjxIwiQ5j+Dvbq+WAu/crm5w=
X-Received: by 2002:a05:6402:4546:b0:643:6975:537f with SMTP id
 4fb4d7f45d1cf-649b08ea5c1mr44839a12.13.1765645897944; Sat, 13 Dec 2025
 09:11:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121339-giggle-throat-3ef5@gregkh> <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
In-Reply-To: <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 09:11:25 -0800
X-Gm-Features: AQt7F2rppisxkQn7oi6YmIZWcvygbmDMhQRouBAclteGu9My9s10ys8i3RoDf3w
Message-ID: <CAGSQo01p2h53h35y_1z6+D=EGnT2TvvcYSwgfgK-hAOULEkUag@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <greg@kroah.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 8:26=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Sat, Dec 13, 2025 at 5:28=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> >
> > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based Debug=
FS
> > > bindings.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > > This patch converts the QC socinfo driver to Rust, intended to be the
> > > first Rust driver in Android that is owned by a vendor rather than th=
e
> > > platform.
> >
> > Um, shouldn't you have a signed-off-by from the maintainers of the .c
> > file here?  You are deleting it, and then not adding anything to the
> > MAINTAINERS file to take ownership of this new file, which I thought
> > checkpatch would have warned about.
>
> Checkpatch did not warn me about this, but I did add the maintainers
> of that file on this RFC, so we can see how they feel about it on this
> thread.
>

Further clarification - checkpatch *did* warn me that perhaps
MAINTAINERS needed updating because files were added or removed, but I
saw that the maintainers were by `drivers/soc/qcom` which should
include all the new files. It did not warn me that I needed any
additional Signed-off-by lines.

> >
> > thanks,
> >
> > greg k-h

