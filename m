Return-Path: <linux-arm-msm+bounces-91718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDgCEHs5gmmVQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:07:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1924DD53C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10BF309515A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 18:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A6239C659;
	Tue,  3 Feb 2026 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNR5uij6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E7366579
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141858; cv=pass; b=i+NsR1ln3sHxqZqYpwz62R7mNDOhgWQf6X8XQbB3KQbomFtflP80kasYonCecBKzrRL2Da+LzZr9E0tRKqaShCTt9o+iKh6mz70pCwhR/HZtSIqS8qDMDckRI4Wcl5/nhcBtn/hWlDTQXFZSqnHUUXtDVdDLSRiVoN0uThAEPKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141858; c=relaxed/simple;
	bh=NiYmGhBDnkvI8ZJQgcCZNDyToFlarmUji712KD5FXgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aavt2zUaeuOSXhTNMGXE0M1KmVuikqdjYoNyeEnYxSqid831S2Tf4+ucdJUhIAl+gPmTffOWchKAS5+jNw0D00Kk0X5tE1KKf6dNh6OWt5dqLbCPfHN4GJU0Rl0DFJVa2MpGW/Px04CyLMSyxwvL4cPhMyfrTPDaxdpqEe2VHjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNR5uij6; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so482a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770141855; cv=none;
        d=google.com; s=arc-20240605;
        b=cX3+ZlUzvPt49+sgcmH5YfE4BmoAAHVaknTCTS/cb81Rdcdu/S42OZ3PAXrNin6y0D
         MERc5DglY9EewyY704Rb4C/YJoYj9LISWSqxldK1L1DZVMZjGdGH2FNC0bq8jlS7TE4N
         uyyqftkzvW5vL9zyk/5ombgrwHFM+zAglm9y3OH9Z9bOpPvaohOBiogBJjYHgKCTtZiU
         rH0fkEwbpub6ARLm9JzyTtD26u2o18PVjPyx4mfCca6ToH8JnP0Mq1QiEk0EQabStuOA
         4s6/sG3DCZPD4NibVFwcqNQyWTcwrZQrRNJbL2pyjw0aCC2RQHLdT327EF5zhHSvncqy
         U6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        fh=ELyqxrV8GvgU9r5kyMmxiaWptrgmPVDLj5azP47ZfSc=;
        b=LlQ95soU0EHA0SKfltm8ix56D0zlp6gRkGKlxVXXlHfdSbTB/IzkuDC0ZabhZve0GP
         Cks09qYzRwb3S7hoQe+mnRe+QFx1iu6ROla77ABAYMI+Tr/m4XY5DkxJzazE2uk3SvLm
         xi+bDmBX08w/TGFNHHjplsbjTkRUnu/V25i1Y4/7RqPdifUx89skXxcpL/l+Kv0dTmxH
         TrmVeG4stPx/96Ui5PdFnhEcPVh4o75b2k/xVB5RFdYhN5uMD6EvB80DzrOcxzSulGaq
         D5d0zggTciZ/oJBQmLVejlBOyAAC7lMv4dvX6Z1A/sxJTw+mFOPaXXm8ZIN0vL+ObhMg
         bpAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770141855; x=1770746655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=KNR5uij6C7FzK9xZwFmLsgZCkuZtZmjaWLp7PcA9CyI7xspZmm7CvlSzZMEwS3DgN9
         Cj9xbgNF1mV97TWI3f2ZGpsIo7h09OsDhH+kDMw9hux7PANFMxIa5O+85bgAB3fi2Czu
         Teeivr0u+gL2DWcfCVkfdT92MEfPWGnUQhPuAgAdsggDZMT7tI+OuSsL3a7/rcs7JkBX
         jNsFiDQKefQhCEg6HZl9NbXDeG+uGtZpARYiDaV+77a+plJcX5MiOrwtZNyJzADISdJr
         EP1XmBHgfNOQIXmZrahHQLxo3eabd3RoQECoa05lDa6iyKFyDW+USqo7lVIelyVnFj8t
         dTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141855; x=1770746655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=f8GuBSGBRqoKb5A6XRVBq30H8KPJk5nWS8OzpT/tKA3CQfSienJqwMn9B7G2nPmitH
         vzjGRCXLC5q0jou/Lh2q98Fv9vtJrj24PYoiVdnZdFTxGAo6M6vFPoNM98LZwatvKROs
         OUXDT/H3ypEhOM+EimkqtB3q3Fy83JySi5Os6C8Fidw8xNGs/VFmm3bw0gsD0z5YLaOb
         5uDKr8oSgOVvQR+EQ+vHZ5liq3OVd8Zrwv8hrFXk4gSt0ZpRtUHMBz7Yvq8X3q1j1Qf1
         5s/5Xi58I+Zs+cH3/7VCiZW1s2JjSqgea6GjtKal/8fXxItwdptGdvRN7c7m2+U27fnY
         7JdA==
X-Forwarded-Encrypted: i=1; AJvYcCWDa1FIcVgSLYSciFyM6Hof1pp9cRkpb+B8on3vKdOQsOIgriUE9NFObCvCU3UXK0cglyp3TWrfnsyosWhe@vger.kernel.org
X-Gm-Message-State: AOJu0YzZXJ6FZ5JYz1A9Cw0vI9KEW8dWYOtP6+kizNcpHgCbW815OvvB
	ODeqe8yAbgPfaVkLFZBGDwg+/p4oIBQQ1WJsfEeEnlfkic2bR1fiHqrr8snZohgTMrP0j5iZvaB
	5foRyri/xiDktDGZ/Ka9yOo38nS5bVjjZwe0mfjta
X-Gm-Gg: AZuq6aI5Wbg07M5r3FpaMZ1meW++Ydw9/SlaRDA2XA9d11GZJSKte2dTYPC04lhBI7g
	xW7RXMQED8kg/qzOjglUpQkLMJctvzcLcyInxbDNSdd6gexjH2cCE6jYEfTaLZ84GpHJ453/5xT
	zQmKaG0ROO1Fn/nJ9GmLzWZ0A64DV6OiXEXvzE1UKEBlo95uEhD7s6wBzz49TA9BTE4b3baPfaK
	W/YcfdpUorG+bTc/91nlgC0i0teSi4cvvvS0EgjtjiwIVhS9X2eGWN3QqDDePqnSutj4DPYSCFZ
	f764gfrFgCJ0piCSAPF+tEY3mQ==
X-Received: by 2002:a05:6402:5351:20b0:659:3fc7:e1e1 with SMTP id
 4fb4d7f45d1cf-6594a350f8dmr6491a12.16.1770141855228; Tue, 03 Feb 2026
 10:04:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-5-d6719db85637@google.com> <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
In-Reply-To: <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 10:04:03 -0800
X-Gm-Features: AZwV_QiFdGyk29eec1MFmYhNyUzLZTIr17YBC0D3LJX2IXJzzxnb_bKNmlHpqIg
Message-ID: <CAGSQo03g8bjRosYVPzxhK9FpSW1ZfW52unPaoxpcn=pXaDUriQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
To: Gary Guo <gary@garyguo.net>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91718-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: D1924DD53C
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:48=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> > This adds support for creating a DebugFS directory which is aware that
> > it is bound to a device. As a result, callbacks under that directory
> > have access to a bound device which gives them efficient access to othe=
r
> > Devres, ability to use dev_err! and friends, etc.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b66=
9e9ba61958bec609e 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -11,6 +11,11 @@
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  use crate::sync::Arc;
> >  use crate::{
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> >      fmt,
> >      prelude::*,
> >      str::CStr,
> > @@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
> >          }
> >      }
> >  }
> > +
> > +impl<'a, T: 'a + Send> Devres<Scope<T>> {
> > +    /// Creates a new scope, which is a directory at the root of the d=
ebugfs filesystem,
> > +    /// associated with some data `T`, enclosed in a [`Devres`] for th=
e provided device.
> > +    ///
> > +    /// The `init` closure is called to populate the directory with fi=
les and subdirectories. These
> > +    /// files can reference the data stored in the scope. Because it i=
s stored inside a `Devres`,
> > +    /// the init method is granted access to a `&Device<Bound>`.
> > +    ///
> > +    /// This can be used for cheaply accessing device-protected data i=
nside DebugFS methods or
> > +    /// accessing device-specific methods (e.g. [`dev_err!`]).
> > +    ///
> > +    /// The entire directory tree created within the scope will be rem=
oved when the returned
> > +    /// `Scope` handle is dropped.
> > +    pub fn dir<E: 'a, F>(
> > +        dev: &'a Device<Bound>,
> > +        data: impl PinInit<T, E> + 'a,
> > +        name: &'a CStr,
> > +        init: F,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'d=
ir ScopedDir<'data, 'dir>)
> > +            + 'a,
> > +        Error: From<E>,
> > +    {
> > +        Devres::new(
> > +            dev,
> > +            Scope::new(data, |data| {
> > +                let scoped =3D ScopedDir::new(name);
> > +                init(data, dev, &scoped);
> > +                scoped.into_entry()
> > +            }),
> > +        )
> > +    }
> > +}
>
> I think it is a big strange to have this on `Devres` (in patch v6 it has =
`Devres::dir` doesn't make
> too much sense). I would suggest that we domsomething like
>
>     impl<'a, T: 'a + Send> Scope<T> {
>         pub fn devres_dir(
>             ...
>         ) -> impl PinInit<Devres<Self>, Error> + 'a;
>     }
>
> To me `Devres` is just a generic container type, just like `Arc` and `ARe=
f`, so
> the assoc functions should be defined on the concrete type.
>
> Also: is there a reason that this needs a special API, and by
>
>     Devres::new(device, Scope::dir(data, c"name", |data| {
>         // use data and device
>     });
>
> ?

Yes - that won't work, because the function being provided to
`Scope::dir` is `for<'data, 'dir> FnOnce(&'data T, &'dir
ScopedDir<'data, 'dir>)` - this means that *intentionally*, if you
capture any non-static-lifetime variable from outside the closure, you
won't be able to use it with the methods on `ScopedDir`, because the
`'data` lifetime bound should stop you. In the general case, we
wouldn't want a reference with the same lifetime as `device` in that
example to be usable inside the debugfs callbacks. The device of a
Devres wrapped scope is a special case because we know that it will
outlive it.

>
> Best,
> Gary
>
>

