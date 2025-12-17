Return-Path: <linux-arm-msm+bounces-85593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D18CC94C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 19:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A2E0301F3CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 18:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422E92BE652;
	Wed, 17 Dec 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkWytR1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10276157480;
	Wed, 17 Dec 2025 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765996524; cv=none; b=r8diewnALHAVD9GoWh2HQgKZ3VKMcw+7VbjDacysV4LhK7x7fOhwrZUrj+LFjGYbsuStqygn39YPD8LM76WqH5PEVI0I1N2ytayIqybUqe438Z//k3BKhydfnNhlKGxTIAVj/L/aIN33Dng0ySBwSnH/FHsUlBQwGUTkhqTJEMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765996524; c=relaxed/simple;
	bh=wkoYQNOz8uDPAwaNnUJqLX1WDKlbAS/f7jOm0sxH/eE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=MXccIwggKAOJzCE4IfiMwHZUvFUIcsfKaItWJQ2W4qThN4pNbYo6oFvS4QXGRFofoOCWHgbEj5OLPzmZ9FF7K5KDzBb7u7rjs2/q1kAWMgLVUfCUJPqpAR5/oBr0zcTH+mgknjJ04efqNOjNwMPY7XY2gQT97rblskL9arGOo6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkWytR1T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827CBC4CEF5;
	Wed, 17 Dec 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765996523;
	bh=wkoYQNOz8uDPAwaNnUJqLX1WDKlbAS/f7jOm0sxH/eE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=dkWytR1TS3olyYUHYNSO7Syq6rEOPgYhHKQaiacC9pucMbtKWkVLAIcuiiensi4h7
	 KvfS51a4zqk0XVhrhYA38g8L2xX8T3FJNLDRKkLPA242tJi2N+NUefRv6pJlcfgDTr
	 neysKycEwGxHETaSZNFC0eIBKdP2avpzTVNNnuTDuPbI2ocJBIvo2KxDZmEiEHLwMq
	 AiMexAff42VFXOhRB1+h9lulxRAcT2cAPa5nLi/BhR1yuLLJT0rivqcMcZSLwsyBy1
	 Gp9bbUjGJj1CqtgofV3IOTyYKTXRLrsTA1YpHm34Rdlvd4jqMjKr6AHatYs4UO72ds
	 kvlE/07I7gdaA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 19:35:18 +0100
Message-Id: <DF0PIORGZZ4L.30S2XEKT9V1D4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Cc: "Matthew Maurer" <mmaurer@google.com>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Satya Durga Srinivasu Prabhala"
 <satyap@quicinc.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Trilok
 Soni" <tsoni@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Bjorn Andersson" <andersson@kernel.org>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
 <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
 <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com>
 <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
In-Reply-To: <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>

On Wed Dec 17, 2025 at 12:13 AM CET, Bjorn Andersson wrote:
> On Tue, Dec 16, 2025 at 02:13:08PM -0800, Matthew Maurer wrote:
>> Rust likely does not provide any significant benefits for the socinfo
>> driver itself, aside from having caught the slight disconnect
>> (mentioned on the other thread) where it should probably be an
>> auxiliary device because it assumes that the `qcom-smem` device will
>> remain active as long as it does.

I want to highlight that this is an existing issue in the C driver that has=
 been
caught in Rust by the language itself.

However, a Rust implementation of this driver ensures correctness for much =
more
potential pitfalls. For instance, the C debugfs infrastructure requires the=
 user
to ensure that the exported data remains alive for the duration it is expos=
ed
via debugfs. In Rust, it is not possible to violate this lifetime relations=
hip
without producing a compile time error.

This is just one example, and I assume there are many more (I haven't read =
the
full patch). Maybe Matthew can chime in again and give some more examples.

Again I haven't read the full patch in detail, but it is obvious that is a
fairly trivial driver. Yet I think there is room bugs / mistakes that can b=
e
caught by a Rust implementation.

>>=20
>
> Yes, this isn't unique to Rust.

The auxiliary bus and the corresponding lifetime guarantees are not unique =
to
Rust. However, with Rust's type system and the corresponding implementation=
 of
the driver model in Rust we can ensure (at compile time) that driver
implementations remain within the given boundaries of those lifetime guaran=
tees.

This is a siginificant advantage -- violations of drivers using device reso=
urces
after device / driver unbind is a very common source of mistakes. Most of t=
hem
we can catch at compile time in Rust drivers.

- Danilo

