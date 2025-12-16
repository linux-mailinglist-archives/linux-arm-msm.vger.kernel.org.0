Return-Path: <linux-arm-msm+bounces-85410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E0CC5209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B765F3011403
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 20:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0302701BB;
	Tue, 16 Dec 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zH2ikxtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAAD18AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918424; cv=pass; b=M+Y128eK5eKGyScRFBO68T0v1xxyPj8GVAUNt9bL4P1nkJFHaaspRSsi/lQjfX6jKWpPCR2nvTCJ27hEB3ktWzUCNLba8GOC6u8VpM1wbhZUEknyHH4fd9VFCV+r0kRBvw9Ri7HEfWePqAESA4izeNCFj77wtn5GxRX+GumiKrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918424; c=relaxed/simple;
	bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ox+cfxYzGYmXtD3XRGn4ydE1djJE7XBiR69HewZpfnmHZMSHR1stfeqikAz/y/6pymvHTItlWkziS8f+yX3rsCxZHmFJEpNcylITGrdaJcq0ploAdb9oFoN3UDa++0Jk1SgqEjqFGrF8hdGWVARj2wjPIgN3ex6jpOi4LbB03GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zH2ikxtX; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so2790a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765918421; cv=none;
        d=google.com; s=arc-20240605;
        b=icbtrNAew+JZPR5QhiaAooiJW+7FuKGRXtPcUZY36x2iHlQWPHuyWms8TK+ysJjkh5
         IcsHG25qUHQNUc0YeCPzCOm97S3jmRnWCv/IQDCdV2Ry6sJwOYyMK/HGhRs0fRvS25qn
         eH1mKuT6uqudSoN9+RY/DdPTm1ad3DrB3nFW+pXnOEJ++gJxvh3cf2j6Dobd0t+OLs4o
         g4iRdwBBt8majF+XitnDjg8CPlGtNevxGzMDv/TWN1PSuhYdw9fNZw325h28CxTExudP
         CW8jgI5Izs8aEFzu63CNRgSIIGDOAMK/ag8t18cMVHcKp7qp7FWGo2n0dxrYUPzhMpan
         cmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        fh=1I5SG+pB2kbWCCa9Sh9hh3LsfUx63cMt8kyNoQBp1iQ=;
        b=kRL4kRDvfo43IbNM/h4czmQEtvhxm7Kx8I9gJj8QKdqBX7g+h7PRO5WhDFvZa4/rzj
         NaJDY5QPW+oEmXVoyBd+57tdpTT5db9ojnQZPLQkxPQPWI3016kn7B/ezqxDvT6+o752
         g6Ep3OoUYPhofcAX3iCZycP5+i2G98/XIpdphFvQemaCtP9rP4PFwWYtlE+aaFgZkZOq
         DrYFtfgBytuSEaokzwwqdQSwCZBO6NURtksQxA2kCz+H+IISKlVgpHEPziqzCAsbXQDC
         fYMs5Z2DzjVAOOCpisGpuWpVZcohGptt08iyoFEO6FnCAxPQaR8KnMiWr6pfZ8GxQO2+
         6asg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765918421; x=1766523221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        b=zH2ikxtXSyw/nSVwduoZbM29JF+gm1IupaPUtajDTZJyWip6LOTurKDsH84RwFS6SU
         EMwWZknr6XN3wXyhHbOhwPHzEDqT2MUq2FekW91FIvhux1w6fATYtBbdLkOjjcYbV06n
         lrl33W7JF8QFjUJ7mOqNPQqxZgVrk9IoeKVVJ0x/PqtHyvgbbBUStJNANaZEXIpo3oZP
         nn2DzhLV2z657wsaZHeNkwf9SfX+HsmZ2sfwDa7uiwQlaoCMJoWNWI2Uw541LFYOvkEx
         o/U34T3Joq0nxdRFRYWeSZoIMd1mWzi4jBmqJZqn0tcMrj8g0MYPuwql98GtPurp32bM
         T1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918421; x=1766523221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        b=AvabpIMgT8b6GNOpXW+lhZn3ARgzBOuEJOjF1olBC3J+hkD9LjSi9gEaVQeieEeM5V
         c+F5qvtxsbt2GTfdaQOmwKnAqMSMcCGuTPN46vaeaCId3r7Sze2lJKBXKJQRDR/zEVqv
         WTNLedusJqHxk9HYwr2t5O6nYvJIDgCNXClEKURNFQ05v4w5BM4A5EfFqv9eO860/rTy
         PKjRpWqQH3S1hkxMWLcuyeqLzyOqvtBe+9ZpEhHqilVuD96BH+D0+nJs2Qy0Brh4U895
         AnknTinM695Pburx8LyzJS4zxeEuxmvtX7T57tj+3wFaAwpwxtRhSNURYJamBiQh7LDp
         CJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWCr2TNBhd1bKE+Nzsr9AUrt0RBGw+ch8Ma4LTGMurBH7ymysoHpfu/aGxkGPRB7zZq2TxeNIBLR9J3V1i@vger.kernel.org
X-Gm-Message-State: AOJu0YxeizhosYvspAwC9h59wGJ9cJIpKYp7VaABBwxB102Oy8CVYVku
	LQXzucr7LZj3cbXCo42Ldp5rHAFfQKN9ju18bPvZ2GNmGrMC8WRo0RNOyloIxk5ttvpF/vUxkfu
	UrCLsbQT/OfhA3Gsyl5Da8mN8p7VRNlb/DlEud4Ih
X-Gm-Gg: AY/fxX7MQ0ERui7UVKp4D23G8JtkIEa4NUjjALi6XJ/4BU9ZGkoNImNhi6Z2aK2x+O2
	pFkvUlqFFNuEbhSpx1DK3ZAyoPt3eYFLP6O/gU1UCjY5PnYl4sILFqqvo/dlx8pDUw7sXcXnMef
	W9YknsS4Dz4cbzOyBB3nKl3BsbCNlugW2+7b2jbcEymF36dWicodQhME9o32mRxtJ0cix2DTlRG
	LlgDCJGplhckkTdeZoj4P3wdrjwWtPblOLmQn+HxSThQzNzxjv5K1OXm6Uo8nBlJOhrfKgn+agi
	NOKeusnrN/JMOELiIX25j55Xiw==
X-Google-Smtp-Source: AGHT+IFlOvKMhimG9TFoBpuVqH9GtXgyGZ2U02aYOYY30YWANnZ6aMhDL6EnJrDezEKB6RJNaeCQrFHpvip4H8DwYGI=
X-Received: by 2002:aa7:dacf:0:b0:63c:1167:3a96 with SMTP id
 4fb4d7f45d1cf-64b4011f599mr8097a12.5.1765918420655; Tue, 16 Dec 2025 12:53:40
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
In-Reply-To: <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 12:53:28 -0800
X-Gm-Features: AQt7F2okKfu-bKqlTg4yU3QLph0ShB8kLBxero0Gp3Hpjnyyxgk-uDLozLNKpHQ
Message-ID: <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > bindings.
>
> Okay, but why?
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
>
> [..]

I'll move more of the text from the cover letter into the commit
message, but the short version is that it's intended to be a low-risk
driver to pilot vendor drivers in Android.

>
> > ---
> > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
>
> So, it doesn't work on a clean v6.19-rc1 tree?

Correct. Those other patchsets are patchsets I'm landing which add
bindings used in this one.

>
> Regards,
> Bjorn
>
> >
> > Best regards,
> > --
> > Matthew Maurer <mmaurer@google.com>
> >

