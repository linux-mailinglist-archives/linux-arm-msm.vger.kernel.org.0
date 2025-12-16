Return-Path: <linux-arm-msm+bounces-85326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BCCC1D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0F5E3008BD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1E833A018;
	Tue, 16 Dec 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJlcmCNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9C33A00E;
	Tue, 16 Dec 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878353; cv=none; b=DZUvd1Afetm764VuGzrPZYaJ7gyV2lP17/FuNFwEr1U/Ore00/qrG3dnqr5hEZ7mcxNV5u9J2qWXTbvXf+VCAMkOOLrZnmo1FyUlJML9WbCFxwWg4wBdmsCN4JFC08S1OzVHO0VJLlh27dIUogF+yYCGe2kmxnnd0LLMe+nqUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878353; c=relaxed/simple;
	bh=ax7ofr3mupkflVZqS0Cr8rqGx9oHvS8vOd0NUMisBqs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=opwK+a6vJjQqoUaVrn3taSKinTg9DEW33l4Onysx02H4vPw84LZRnWux7UuiLfxGhhxzj2Hhys3fAbaLY1fiZ3kBsaMELJriQtvRgVj5O+/Va7fG2QP+ZTAJPk6g4DzrkCpIM/84L9RLCSi9NIPZnAiytU65eEAoWZopDXDskOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJlcmCNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8598C4CEF1;
	Tue, 16 Dec 2025 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765878353;
	bh=ax7ofr3mupkflVZqS0Cr8rqGx9oHvS8vOd0NUMisBqs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IJlcmCNepcd1SWoZvxkfK/sEeTH+RX8PnxPui9KxQs2a1xxfcXKJwMjTzCXhd0oN5
	 CegblyCs0InftzRR+KnXUudgSB1v44tf4f8DtAEg/qKEGG/0CnoDjahfpOnsxi5dyH
	 B4w12/SDQW1MXROCdeqWeY7AlCnmudlakD6Z0m45U6tg0eYgRRmeKP8gOmKp980hmW
	 KCERrE0v+dfAeM40LiP/Lh/optN11gXs5WhNN1Hz70QUyZ6ou4zgbWmOt57iG2rmUC
	 ZU5+lXCPVhnrmhIasIFkU63dEGOrLGj0oo+bAKBsfi4BM3uiOqlKIh7tQXw8dCmbsF
	 FcsNx9POFzS1Q==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:45:47 +0100
Message-Id: <DEZJMPRAWXHW.1CYQA0PONEP97@kernel.org>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Satya Durga Srinivasu Prabhala"
 <satyap@quicinc.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Trilok
 Soni" <tsoni@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
 <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
 <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
 <CAGSQo01-yjNBpo0jCO0sK+0XHLKUyZY8vyA0X2M=fDtcmv6Vkw@mail.gmail.com>
In-Reply-To: <CAGSQo01-yjNBpo0jCO0sK+0XHLKUyZY8vyA0X2M=fDtcmv6Vkw@mail.gmail.com>

On Tue Dec 16, 2025 at 1:55 AM CET, Matthew Maurer wrote:
> I'll get to your other comments in a v2 soon, but wanted to focus on
> the lifetime of `qcom_smem_get` buffers for a moment.
>
>> > > > ---
>> > >
>> > > > +
>> > > > +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'sta=
tic [u8]> {
>> > > > +    let mut size =3D 0;
>> > > > +    // SAFETY: qcom_smem_get only requires that the size pointer =
be a writable size_t,
>> > > > +    // host and item are error checked in the qcom_smem module.
>> > > > +    let err_ptr =3D unsafe { kernel::bindings::qcom_smem_get(host=
 as u32, item, &mut size) };
>> > > > +    let ptr =3D from_err_ptr(err_ptr)?;
>> > > > +    // SAFETY: If qcom_smem_get does not return an error, the ret=
urned pointer points to a readable
>> > > > +    // byte buffer with its size written into size. Because these=
 buffers are derived from the
>> > > > +    // static ranges in the DT, this buffer remains accessible ev=
en if the qcom_smem module is
>> > > > +    // unloaded, so 'static is appropriate. The underlying buffer=
 cannot mutate, so upgrading it
>> > > > +    // to a reference is allowed.
>> > >
>> > > This is definitely not true. The smem data is ioremap'ped during
>> > > qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
>> > > Accessing such a pointer after unloading smem would result in the
>> > > exception. Current socinfo ignores that and keeps on accessing the d=
ata
>> > > at runtime (which also allows it to read DSP versions which are upda=
ted
>> > > at runtime), but the comment needs to be corrected.
>> >
>> > Thanks for the info. In v2 I'll look into seeing if I can make those
>> > slices hold a reference on the smem module while they're alive.
>>
>> It should be a reference to the _bound_ device. I don't think we have
>> a way to do it. I suggest just fixing the comment instead.
>
> So, unfortunately fixing the comment doesn't really address this issue
> - a `&'static [u8]` is a promise that this buffer is immutable and
> will remain valid to read indefinitely, and it sounds like neither of
> these are actually true (the former due to the DSP live updates, and
> the latter due to the potential for the buffer to be unmapped).
>
> I can deal with "this buffer may mutate" by changing to another
> abstraction, but it'd help a lot if I understood the intended way
> (even in C, we can ignore Rust for a moment) to know that the buffer
> you got from `qcom_smem_get` is still valid. My best guess right now
> is that because the smem driver is a *parent* driver to at least this
> one, we know based on where we are instantiated that it will clean us
> up before we go away. Is that the intended mechanism?
>
> If that is the case, then question for the Rust maintainers, since
> `probe` is not an `unsafe` function, could allow the equivalent of
> safety requirements on probe methods? Since the match tables are
> empty, it will only be probed if explicitly requested, so there's an
> argument to be made for "this driver may only be probed by a device
> descended from a qcom smem device".

This is a driver lifecycle problem that arises from the fact that in this c=
ase
you deal with two (technically independent) platform drivers: the QCOM SMEM=
 one
and this one, the SoC info one.

At the same time though there are dependencies between the two, i.e. the So=
C
info driver tries to access device resources of the SMEM driver, which requ=
ires
a lifetime relationship that mandates that the SoC info driver is unbound o=
nce
the SMEM driver is unbound.

So, rather than having two independent platform drivers the correct way to
handle this lifetime relationship through the driver-core would be to let t=
he
SMEM driver create an auxiliary device and register the SoC info driver as
auxiliary driver rather than a platform driver.

With this you get the guarantee that throughout the whole lifetime of the S=
oC
info driver also the parent driver (QCOM SMEM) is bound and the correspondi=
ng
device resources are valid to access.

Or in other words, for "this driver may only be probed by a device descende=
d
from a qcom smem device" the auxiliary bus models exactly this relationship=
 and
is the way to go.

In order to make the precense of the SoC info driver still controllable by =
an OF
node, the QCOM SMEM driver can parse the OF node and register the auxiliary
device conditionally.

With this, your qcom_smem_get() method should take an additional &Device<Bo=
und>
argument, which is the parent device of the auxiliary::Device<Bound> you ge=
t in
probe() in the SoC info driver. I.e. the parent() method of an
auxiliary::Device<Bound> provides you a &Device<Bound> of the parent as the
parent is guaranteed to be bound when the auxiliary device is bound, see al=
so
[1].

Additionally, you should wrap the resulting &'static [u8] into a Devres [2]
container, which will revoke the slice when the parent device, i.e. the own=
er of
the resource behind the slice is unbound.

Given that we have all the required mechanisms in place (in Rust) to model =
such
lifetime relationships safely, I'd love to see them being used instead of a
comment mandating to do the right thing. :)

I hope this helps!

- Danilo

[1] https://rust.docs.kernel.org/kernel/auxiliary/struct.Device.html#method=
.parent
[2] https://rust.docs.kernel.org/kernel/devres/struct.Devres.html

