Return-Path: <linux-arm-msm+bounces-91712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBVbGz8xgml5QQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:32:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F6DCD51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28ACF302FEAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E72F30EF8E;
	Tue,  3 Feb 2026 17:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRVtDvHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307F287516
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139597; cv=pass; b=ESXtURV6ofOgtfMFdJ/d0JcPKuimYia6bTrvQ+YUOqyLFbrv+IS6HTBstGwqQ3mlscPzaLm3iZ5lqhVw2MqhJ+j6bomSfU/QldbECuhj/ZD0xxiUpaF07Kyts9v+UA8n4h+TCNa8WKLj/qSKFrqoCr1SVPezmibTaAaWRKcGia8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139597; c=relaxed/simple;
	bh=BVSKK1sQZS2pD9gylNFVpwd3l9Oh8g0ThiOWKnSHB+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRzOxyiJdOPhXhC7JYhKmIXbckjc+23bZaFdE+iUyGgcYeo03j5xRRuj/OXER7tpG7GxGdb2f7z6Pgm2XI1nmfQxabEZi/UHliECrWPHSbBCKD2ifFuKoMN3UNhK6u1Kmio3/yu/ZeP5wwvubnF4YQsl1OQR7mpm1Cqv+oYv4vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRVtDvHK; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so12327a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139595; cv=none;
        d=google.com; s=arc-20240605;
        b=hJIEtZhkGJx15ElE8ecaJtQ3hCKzWe2WhUjYIGqBiJ0CbIXKdmTitjQQWwWtF+wUP0
         TzGZ5dpslHoZdZTQvr2S1p4BFQJeicRpKQqW0X4UsOrejxheDVIOWVZ/Y8Ih/FhAMmnG
         jQhqnrsry8+BoTF7phTVNDE1vCzdnuJGamb75vNZD4B2rePw64D95rAJuQ8eiEdxfoHP
         5SdAc1v5LzaP59mgJwmDtnzEAOyieNZJPnC3b5KFSdlRXiYkl2BYfjhsgjtLjgui7ElU
         eQkJ06RgLw7tavnucGi/iw6a9lb5gfGMmNdgPKmYGqblByFIkvKcZak9QYIk1KHqnOOW
         JXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        fh=pTSLFTYP+DOl/HtOrag02wqHmKZmrvvZUnsjL8OgMyg=;
        b=QMWCublBvLdOu2oCuHVKWuAORGKwAh3KHRL5n3V9WS1nIqONX4A+lVAVST1x8Qaq12
         Lb5iYNt1/PfnPbWNRazjIb1dxl88XNraQRgYRkLdeb0FXQ7fkNqk+gjAHySdAyefHBWV
         wddTUnZgKGZqZ+VZRmL9q0nRJnIogCeJ5iBhe/rwVHUPBpF+FlFDIPdS6R68/cD2PMe1
         6MUBCkm0cw9XotYN6/Qf+1JgmF/j0NDti72E4Y0KmBFsNjuJa7spApZSKRvZF8WH41oW
         hWKqDQaoT91UU5Utjv7vGDIy7+CzGRxfue1CaIYfR43RLwMVbPDPgLqf2kwo+J+8j0U2
         KqOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770139595; x=1770744395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        b=cRVtDvHKZ1hdi45l0mFK8144ns71gJBBgjK3D1LMEfl2bvFjbt/ehm0NEStPMHiJyp
         iJ/lmieawSJefy6IZqH8V0Gn0u2OFKSr/u5OKQxUBdkBO4XdMGy9EnGz02PSJstaQTkW
         xzBcGKsgsUe609B6tuYJWxirpt2S6SkaLwWELFo/26Ok/yGFEL+XxSeS84fQ/jasDoBy
         tYykMdPrUrS0ZkalnHJndY9czeea81uLfyPZXPtCZalQu4tlrRDKLCRtUoaA45FfXJYE
         /VpQovQlN1c+CtRlqw98f3jIKUXXCm5zHQjF7/c8KZTRRU2bBlwv3cIeLgyCy8ZEYmTH
         VNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139595; x=1770744395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
        b=chxEp0L48JGVpLkdERpAmQZg9VDk8bWChMQb99xfIGoRC5QVrEZmiQunZH7MdtcOEA
         6Mf90rwa16gcoJ8qphon8KKM9+6atbLv3iCCI1uRk2N6C0u5d4AiQGATe2EiUviy3e93
         1YsHrKjU1TxrvktdoApOzVzq3CVmJhgWMzVDIHLVoLbvwUH2aAtJa4mfzQ1+llKYMfi7
         73v1wMrQz9D4HpoeXgCa0zgCkmygW14JE8XQtm5fCaF/+N+LYyGVLEAEhI2wa8H1B5X3
         suYe/NchRl1wVJS35lKgdGz7QTZJfMXeV1GZDor2fxgNN4H/AxN55zwJ/qX6Ux6VLDer
         2IwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLcZeytIuqkD3JkAIm54X9vaOd1Uw8HfgblhysMdS6vkb5iAAFAoT8Cy8WHF5dQq3dJrxXkk6ha99vwFEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxMxy0gzYt6kK2MqktsyqAbn+9Rvps4+fVsZdcYxWCPxE9VKU3g
	4n65M3Lw2VaPesTnrzwLcstWvfzM8bNhBg/e9+F9FEnornjN4SLKSDxIE+wtbf8slXDIOc+fAlC
	/WHmUYUBlzVatBi5PvZj6y4PlRioz96NuT9bjEogs
X-Gm-Gg: AZuq6aJmpRuVlADxYHbmbC3zKgX83KDlX2dfk0b5sx0CKUo1v/qtsSo2S+z/9poMufi
	c0+lmx9QT2VoLag2wXSSHKqbrI4+Kdc+JSi4TtQAMnR8PoIdWwTcswIjB/iECBnoAu6rt4PN6mg
	ad8uRMiA6ZVnTp0+ajOLoHwP4G7mUzyl3ulZfCjEMupB1Aq+OLBGQm8dv046nCTfdBN4Zv4TRSj
	ID2L9AOBTzC9wpZhxUiVOH1gxZiceJdbFSZCK72YFerfDEkl2bUR15L1eJ3SKdMk8WxUGOQ9b3R
	X25+gh6y0doqyEogzwErSLW3EA==
X-Received: by 2002:a05:6402:3098:b0:64f:8fc5:251c with SMTP id
 4fb4d7f45d1cf-6594a353279mr5513a12.18.1770139594461; Tue, 03 Feb 2026
 09:26:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com> <2026020315-conch-trickle-2d84@gregkh>
 <DG5H119NY68Q.TWLCK3W36CM5@kernel.org> <2026020347-sneak-embark-1b36@gregkh>
 <DG5HGZG62NNS.18BCSOO6TR70G@kernel.org> <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
In-Reply-To: <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:26:23 -0800
X-Gm-Features: AZwV_Qh4ac161-isyLFn5NPWx7VX7FdmQ6d8uiNuPee-beDbNAjAyPPpvPjCwQs
Message-ID: <CAGSQo01qf4i6LDyi1umH6-6vjiE-VrFc1dd+qLxDXkjiYLcOCA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91712-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,quicinc.com,gmail.com,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 148F6DCD51
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 9:17=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 4:56 PM GMT, Danilo Krummrich wrote:
> > On Tue Feb 3, 2026 at 5:48 PM CET, Greg Kroah-Hartman wrote:
> >> On Tue, Feb 03, 2026 at 05:35:24PM +0100, Danilo Krummrich wrote:
> >>> On Tue Feb 3, 2026 at 5:28 PM CET, Greg Kroah-Hartman wrote:
> >>> > On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> >>> >> +impl Smem {
> >>> >> +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>> >> +        if *dev !=3D *self.dev {
> >>> >
> >>> > How can this ever happen?
> >>>
> >>> You are right, since this resource is local to the driver, it should =
not be
> >>> possible to have another devce from somewhere else (especially not a
> >>> &Device<Bound>).
> >>>
> >>> However, from a Rust perspective I think not having this check would =
be unsound,
> >>> as the method by itself would not be able guarantee correct behavor a=
nymore.
> >>>
> >>
> >> I don't really understand this last sentence, sorry.  If this is "not
> >> possible" why would that at the same time be "unsound"?

The code as it stands doesn't do anything that would grant `Smem`
objects to something that exceeds the lifetime of the device. The goal
of bindings APIs like these are that it should be impossible for
someone to write Rust code without the word `unsafe` in it that breaks
its invariants. Without that check, someone could do:

let smem =3D Smem::get(dev)?;
let f =3D move |offset| smem.try_copy(offset);
some_other_driver_or_subsystem(f);

That other region of the code would now have ownership over that
function, and expect to be able to call it safely. We're not doing
that, but we're trying to design the unsafe API in bindings so that
you can't mess it up even if you wanted to.

> >
> > It would be considered unsound because the function itself can not guar=
antee
> > that it does not produce undefined behavior, i.e. it would otherwise be=
comes
> > unsafe.
> >
> > But I'm not an expert on this, I'll let Benno and Gary jump in.
>
> Yes, in this code, `Smem::access` is using the passed-in `&'a Device<Boun=
d>` as
> a proof that the device is still bound.
>
> If the check is not present, the user of this API can give in a reference=
 of a
> different device, and now you're pontentially providing access to the MMI=
O
> region to a device that is not bound anymore. A important property we wan=
t to
> enforce is that UB cannot happen no matter how an API is misused (it may =
still
> oops, which is bad, but better than UB).
>
> This particular code, though, probably should use `Devres` as Danilo sugg=
ested.

Mentioned on the other thread, but I didn't use `Devres` because it
being PinInit is problematic and I would need to encode an additional
invariant anyways.

>
> PS. Personally I think this check (and the one in Devres::access) should =
use
> assertion rather than `EINVAL`, because it is a bad driver bug when this =
is hit,
> and adding failing code path for something that is a bug is something I r=
eally
> dislike... It should at least be a `WARN`.
>
> Best,
> Gary

