Return-Path: <linux-arm-msm+bounces-91716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DUdKIcygml5QQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:38:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927DDCE56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A04D3037166
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB853254AE;
	Tue,  3 Feb 2026 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0j6yyqgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701562F49FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140289; cv=pass; b=GpqGiJAfqK40o0hVf9i3y/GVS7kSkkMh93vbF7746dXpI6jMflrqJB/JeU3MZeqKCf15MmF7pr9RqerkwKtlGcpSw0g2FEqfS7Tjp++2cAa0TIZaJESJvNzNBUdo5DfsV8WDTrVQa8+F3KCgDmT3A8vCWz0CS1Nc2+d4VgpPHhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140289; c=relaxed/simple;
	bh=4YzknxHBfsROI3oe/0Gw8Zry6luJZkfAyc2iFek3R2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYSR9bZumK0N/WgmFrrjNJiIq7JvpGwoDPkZl+7rorKDEIlx+GAy6n1XigaBAMR9IuQMWcOjgo0j9eSRcTahFzXrQH40dKWKSOunNgFSgLax5sMPH0RoQfNbgsENA7pLAeW/oNP23PMLTV+zje3lttVW8hymHap+npIzR2emBi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0j6yyqgN; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so125a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770140285; cv=none;
        d=google.com; s=arc-20240605;
        b=ZRiujmqxmI6SQWo+DhMZ5jLPdjT32j0kh/gIbMVx32mIpsVxL7bP0fBStsbw0X+9RB
         pOVFa4hnGfLwRr6zA/f9HUOOwUIG2C4YmkP8I9A9CHjJvQ/vwtDnyMsXQqzfmo+3+er2
         R2JlnHxF3vHj0B/BnTwuFioanV4Qv9dUWBSNd6TYZ/lVhwXjJKEo2h4eCdKgVNbF6UUt
         U+W3wbt24lUKYnc6YHWanhs/RO9GXIVH13veBzRhZglC8k52huiMiEjPvPvVLQVo2zFD
         lsiRju3T8WQVMeOw/K+AosA0D8CJSudJTj7EUc8Rj65c3DWALvCGEOzoXqKZmHsGUNph
         TzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        fh=yroNJl0KQ5flWVG6pVkkMUBWgIICJQW2BJg6QBxHDq4=;
        b=c48LU4ityEbS36eMUTuU3tVvsEME+s/h5vLUqqDznul0kW48QlfOIUCsR9A8AMnNYZ
         jPYOVRUIal4NG6qDXklDhOMP4/0RXq+10Xwn6V2KNbR5OS04zNGqn86RhA3oJoL0zMJ8
         U9+kfse64l+ErB8msnsG3bEWGlFBN29mbxy5EGThYDR5TM0pQuaHz1tIRpRMta9kHCFK
         ojXVdpdJlCPy7IvwAF+x4Pqn9orEMeD0JRrCV658Efkx6r8oXn/7jzpZt+4jtLhLpjnM
         AE612TbMr5EeAKQKiSPUM6gZOiULlcFXq6/MYGI8sAW4bZD8r1y8C2swzAzkbZMMYpBx
         N4BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770140285; x=1770745085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        b=0j6yyqgNgfMuyQjAhaiZKIEp76zEYzKPM7YtpLIPKFoJRpL2eeHqQTfXu2kippPwrl
         9AUpt6POE/3ryJYTH9PjKRHhv1wZ1dKD7nZ+0/dcbKmlpKz+22q571dOV2ZA4Vv8hSjE
         jyVcOTpT/xMFALZ6h/rbSouqDalRfUOlYOlB/xtJ7aCvl5vpTZUpNTcikPiAvhVqTTwl
         kKw33KIt2eNk3/Ts9mzJjCAovvyP7yxZJc59t+f5cPW0Yno9QsAt1F8MZMUb3QMRp8JX
         zdDgDAYR2iSO/l3vgq539E6fBsYhQTDelvk9EW9cYOfxd+ScXREVhzxZ/KPL8VMiAZFT
         6oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770140285; x=1770745085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
        b=Hv0PobFIKXZ5Y0ZG53MaZM01nnwHQEHSdYsU63TsFikY4shyTka1ohgpB7Zbvb41Ep
         yfN6R7vV8S1cLMCgdyXDW/uB/fIWqczHVJocCYyRP0Cnakus/ixz3dnbcwFRRpvE11G5
         owNooAcnwgGNdIM8jolmq0BemubgWCeovx8CFUqaVo6F40GF1jgeHiANXDW2xWMSObxP
         gH9Wxch4/ltFHlZyaBqZigFERSNkItXlYuPM+jzatoI4/It6RkSSLp3wSDnrhg/8RRDV
         h8MYtY0qDZVIterY8xJ76wCY0psTQ+sUFu7NDaz49i5+IQcZY/WKwfISoIOzCQEL42Qf
         ZdPg==
X-Forwarded-Encrypted: i=1; AJvYcCW1r3QPKpA51N0lVIC8tj/rgP9jCMUINMRrgvvrppD5d2+ShXIlIeW1F4IBZaf8xNzGLC1AuGEmZi7VAFTD@vger.kernel.org
X-Gm-Message-State: AOJu0YzH70WRdkW+iY0SFLQ5UeSpZiRF5ouR/reyYaW2Ci0M8kmsOo9F
	GCnFBTj52dJypAd8b53ctVEtFcQxW8D3lA83/4O2fug34uF/43H0fFJ+DfC44J69kmBsQaNf+CY
	FU3p0zO4OMrrnfmdLV1GOkU1TMD/2gfJrT6Tcza0A
X-Gm-Gg: AZuq6aIY4Sp9SlTmjRMfy+iFi2P4ZKNv0lUnjyPjRjSQwwWdxBm3+YB71ykzsybOxJx
	IMpNDTiFCmR/9hGEpOkFbK5wo0HXW2yrgpCvmkHihTX5EJXQ0GZWpKyE8qvzSpDbfC8xfagb5i3
	Z8Ln+2IEq6QtkwLwUHfHTX6+F7Au2nNbxAtwESd5hIlWXrVrdKmdo0PAdVRgnnYdH36yzoDbO/s
	X3i4tQ3qGblfR5rfv2Bak1lhnwg29eqSJN20dyJ7b1F0cQzbkIICuYXGjS2qGeQ+R7xqVYlYgwc
	oBYsN0rdebC+Rrwo/vzWi5VpMg==
X-Received: by 2002:aa7:d355:0:b0:658:bd2d:929c with SMTP id
 4fb4d7f45d1cf-6594a33abd0mr5612a12.12.1770140284581; Tue, 03 Feb 2026
 09:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com> <2026020315-conch-trickle-2d84@gregkh>
In-Reply-To: <2026020315-conch-trickle-2d84@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:37:50 -0800
X-Gm-Features: AZwV_Qib0Xwq7jvSK8YoP13KkCRLNUErONN49KXCI4YsJMCfMFPdjadu_r-_mhs
Message-ID: <CAGSQo03Ok1sv4myQk2Ch68rET19ypq4Mm-=82Ue-T-2Z8kaGmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91716-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0927DDCE56
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> > Convert the socinfo driver to Rust for a number of improvements:
> > * Accessing IO mapped regions through the IO subsystem, rather than
> >   through regular memory accesses.
>
> That's good, but the C code could also be "fixed" to do this, right?

Yes, nothing stops the C code from being fixed to do all of this - all
of this is representable in C code.

>
> > * Binds the device as an auxiliary device rather than a platform device=
,
> >   ensuring the mapped IO regions cannot be accessed after the smem
> >   device is removed.
>
> I'm all for this, but is this really an aux device?  What is the
> "parent" device of this aux device?  Where are the "siblings"?  What
> does sysfs look like before/after this?

The parent of this aux device is qcom-smem. In the prior
implementation, qcom-smem loads this device through
`platform_device_register_data` and `platform_device_unregister`,
holding a reference in its global struct to release it when being
released. The probe table for the qcom-socinfo driver was empty, so it
would not probe without an explicit registration.

>
> > * Adds bounds-checking to all accesses, hardening against a repeat of
> >   CVE-2024-58007
>
> How do you now "know" that the bounds checking is correct?  The C
> version also had this, it was just "not correct" :)

While it's technically possible for the Rust code to have an error
here, the error would not be in the driver, but in the kernel crate.
The advantage here is that the bounds checking is all centralized, so
we get it right once, for the entire kernel, instead of needing to get
it right every time.

>
> And which accesses are you referring to?  From userspace?  From the
> kernel?  That CVE looks very odd, it's probably not even a real one and
> should be revoked, right?
>

That CVE looks like this:
1. qcom_smem_get returns an object of size N
2. When initializing the `serial_number` field of
soc_device_attributes, the offset of the serial number field was
checked as <=3D N, rather than the *end* of the serial number field.
3. This resulted in the driver exposing through sysfs whatever data
was mapped afterwards, interpreted as a number.

I agree that the severity seems oddly high, given that in practice,
this will expose the remainder of the IO mapped page - I don't believe
it crosses a page boundary, so it can't even *really* leak anything.

>
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3=
d2b457422ad9f342c 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/hwspinlock.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > @@ -279,7 +280,6 @@ struct qcom_smem {
> >       struct hwspinlock *hwlock;
> >
> >       u32 item_count;
> > -     struct platform_device *socinfo;
> >       struct smem_ptable *ptable;
> >       struct smem_partition global_partition;
> >       struct smem_partition partitions[SMEM_HOST_COUNT];
> > @@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_sme=
m *smem,
> >       return ERR_PTR(-EINVAL);
> >  }
> >
> > +/**
> > + * qcom_smem_get_aux() - resolve ptr of size of a smem item
> > + * @aux:        an aux device that should be our child
> > + * @host:    the remote processor, or -1
> > + * @item:    smem item handle
> > + * @size:    pointer to be filled out with size of the item
> > + *
> > + * Looks up smem item and returns pointer to it. Size of smem
> > + * item is returned in @size.
> > + *
> > + * The caller may take the loaded state of the provided aux device as
> > + * an acceptable proxy for this memory being valid.
> > + *
> > + * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
> > + */
> > +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int hos=
t,
> > +             unsigned int item, size_t *size)
> > +{
> > +     if (IS_ERR(__smem))
> > +             return __smem;
> > +     if (aux->dev.parent !=3D __smem->dev)
> > +             return ERR_PTR(-EINVAL);
> > +     return qcom_smem_get(host, item, size);
>
> So you are returning a void pointer?  But don't you really know the
> "type" of what is being asked here?  It's a memory chunk, so u8?  Or
> something else?  void * feels "rough" here.
>
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> > +
> >  /**
> >   * qcom_smem_get() - resolve ptr of size of a smem item
> >   * @host:    the remote processor, or -1
> > @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem=
 *smem,
> >   * Looks up smem item and returns pointer to it. Size of smem
> >   * item is returned in @size.
> >   *
> > + * It is up to the caller to ensure that the qcom_smem device remains
> > + * loaded by some mechanism when accessing returned memory.
>
> What do you mean by "loaded"?  You are saying that the caller needs to
> rely on this driver remaining in memory for that memory to be "valid"?
>
> If this is the case, why not take a reference count?
>
> > +impl Smem {
> > +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Opti=
on<&'a Mmio> {
> > +        if *dev !=3D *self.dev {
>
> How can this ever happen?
>
> thanks,
>
> greg k-h

