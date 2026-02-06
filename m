Return-Path: <linux-arm-msm+bounces-91990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cApiMrWshWkRFAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:56:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC766FBB38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D006B3014C25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4670F34E741;
	Fri,  6 Feb 2026 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vd7wxPxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44BC34DB68
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368066; cv=pass; b=Y4TWwSBRBqas3tHUjcmF7BQQIvV8D6vpgIx432+2L1hJctcXA2e10kzX/KBWl02Cvyorscbhlnl3QQc81VGA76B7rgdnL9A6sV/uajfPgGKWL5Okg9xuLW/qR/1TJtn4UeQzOr6AKtf68tGQc3zl347Xas1fPgCoD6Mr2fXIDDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368066; c=relaxed/simple;
	bh=fDd5VaqBJQ5Yvb56kv8Pe45EHRO43aqFHAdUjQDJK9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLEYcJPnKbcJCZpO9Rqb0CVdawInOwWdL155W4PsXgfNUVAiUpqgVj1XBGih8z5M/DVNx3NGTzuU5rirARvQGCKcPRGcbzrl5hLiGALm7BpHkonPWa6whjUk8ck3I6m5OMUAFQ1qvhqUY1l4WchndSRxzoJuCHfNdwzbL6nXPvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vd7wxPxM; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c9f47e1e8so698706b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 00:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770368064; cv=none;
        d=google.com; s=arc-20240605;
        b=SX2jPdFKBk44eBSZK36Fbzc8zaQER4kMkXaPFfX6sjlao9glniIVpwoEFzTU2Gt4yn
         KiGTJYNB/FXyrmgV22F1JAkhOyyPYE395UKJi4PgPOmnP6k9O07xq75VSdOauuG7PCow
         g3bR+eajDe7JzrMs4l41Shx7FMShtJzoINfXhfBMJQ7I8jWYEROWhXIP6QiCv/vG2iWg
         +TozJla7eGWM0qu+C/SrkEhLuKBLTOzjZvDeeuEnZmGmMPHp0WxzmrviZqQq19jb1f9G
         DhtJRdBal99dyvAM7zbdlfBPPeLA77G9uLEqxRFmi0+lAsO00SnjaWj7QU0UZ32qEbMt
         71Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9DJtIDUEGNrEq8AlmzBB0bLgfpDOb+/qA8Qqcio5/DA=;
        fh=bUoNTyIEogWSVIi+W1c2tXfRKvw4u0p9YwDLVC6oUHM=;
        b=Qj8dpW483iy8PrB+PtX1YL2lDqO/wjJBhMwRXC3vHZoebvvHq5YdcZLCpYudiv/OBz
         jFZfd5QsT2EL2cVJ5Wqg8d5aHnOe+CLriIhLDF/ilMxNuW1EOtNxvxJiYXXfeDbINXhw
         b/6Q5faAUKv9GJfT5YYQ+eRa+vohVqpugfIlxbDPh8qncv6Nhe14Q4beskL4g9PJGN1l
         opVeXpZhLDR0pTpefRcstDqTFqUwMFOqk1fQg5pIj4oUudyolkieBIc34HcTtXAO5zf4
         bZ970Zb9B6Jj7JOmaTvwVdaSrL28z/5Ut5sEUuY2T6xP15qBeolXk5r0DmU/y/WaQcTD
         M9jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770368064; x=1770972864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DJtIDUEGNrEq8AlmzBB0bLgfpDOb+/qA8Qqcio5/DA=;
        b=vd7wxPxMVyYKF47t9aGwp9qRjgC4wukyu/cSKhR8MgmP1TTGZS2tByUHfApKBvUVw9
         mivg8kUOtZqsngmg6sjcxCbJEudTsoka4FKMPTyHV/kNxgr+vM33B/yjzEA7EhW1RV7v
         QgpRbEvcmOht5PvMxx8HKSpqUW1KzbhqCeCKjXfPcuoNW8oHxTUKuyp5jzIt/nR2RD5T
         h3r3rPRqAvsH25yD4cwspAD/84PPgnlCzHo4zs8aCwrhQp+5s0HujD3y/itHFUFiG2In
         wYVlV+MoiBq0qxcLa8OO04f2e8aFNy9TL1rEI3HbfQT1u8KFTNZPeJkk+var+Kfr8GVG
         KXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770368064; x=1770972864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DJtIDUEGNrEq8AlmzBB0bLgfpDOb+/qA8Qqcio5/DA=;
        b=Drbf9Phub4NAIHJ8HfGNFdzXmgkg/HO05VNopqxiTgeSTAiUGsfXXeTRr6mDEheD9e
         Oo75C4gESxc08kX970XB1+77i/6ef42z51mbpNvlmJzIUPp+uipNxDulE5hLf9uvK9tG
         GSDvP2QONPDXZTHXeb6xvQvJI9li7w0mAI+dF/8JEhloK8IeAZ2kyObYXf9ZqxQmA9CO
         jXrx7SlEBStm5zWu8Vrb83fG9Ddv0uc0jzrfPDYPdh3BTRvdYO07J7okFICflWktC4zp
         3F7Eiurw5rsKCG7xQQMKhGHWaPLFg8/pJdi3iLJVQKu5ShQ2KBmrgxrBTpDrEh+5jX/q
         4sKA==
X-Forwarded-Encrypted: i=1; AJvYcCUgeA+fXNYB6MBIC+US7tEPQVdsTQ57SZozV2sl+4yihJsUCpnusBIFSNd2ENqzVCZ1NKQN1k1AoFMW/l+H@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxvl6lt3ZjpGfqNj5Abip8d1IFScGQXQ2oAuOI1GXS3gSmptw
	A3Ws5HEcsXBN9CCKqLcWoJvXcMS+2Ec+Tm/HLTU6qGiyVXeYVk5cElnq18Z9GcsEVsNP5OfJmVd
	TY0yx/e6eOddUMbgOwNRSjpDWmQTqv48Tx4uTDjmPprrc8Uu8JMTRaIQ=
X-Gm-Gg: AZuq6aLvRuNn5lqNTq2tu3fxjuD8xxI3flIe3CMVcBObnLbP4XX8dp0QcR1awgVZIQ1
	xGDgF6sKkhFaK3V47/DNUkzfMnNdjEKRgahph8SNBtgkaDTgcLxnBCs8nWxV++dDBmLoB50o4l+
	IOTJvXRXdhxXV+6LnCP/K6VMOVG+PZaoqOGJ4nOZtZRdnZJ799aAy2X9qAfcz5wXLel+xQiwtHM
	/DFUGk7haj9x+0iWUssL50mVUg8h1fFOgxHrsXCwez0JtmkgEGoyL05S0nlB8iUXUta+cV9kqVK
	G0UE4q4UP+Sok4kyd+sIeNr46vBXzg/NU7Mv
X-Received: by 2002:a05:6808:1b07:b0:45f:bcc:8e05 with SMTP id
 5614622812f47-462fca5d17cmr1173039b6e.30.1770368064303; Fri, 06 Feb 2026
 00:54:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
 <CAHUa44E4Htg9zEMY9XtkMsPRJq+13mq6kSd8RUznHTRvXVXKVQ@mail.gmail.com>
 <55546b03-cbe6-40dd-b794-b2e81efde33a@oss.qualcomm.com> <CAHUa44FfowG=GpgLcq=sp_TqRArJtf0_V-tsJY11HH+FEA6u+w@mail.gmail.com>
 <4c9e4f5f-e0f3-42aa-852f-064f4024af26@oss.qualcomm.com> <CAHUa44EhaztJ+5piu0c-HQbqZFX47uLPJ+VDRp=Bp6BMeeARAQ@mail.gmail.com>
 <b8086bfb-f240-4115-9ab0-18509775932a@oss.qualcomm.com>
In-Reply-To: <b8086bfb-f240-4115-9ab0-18509775932a@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Feb 2026 09:54:12 +0100
X-Gm-Features: AZwV_QgdxhDE0N5aO3VLshGqQtUq6DLJKHqdZXnXy_iVActddXjXNWnDBO0uofw
Message-ID: <CAHUa44GhTy=TWAuG7JY_6jjWG-uCGnLyZRn1JhGWgaWt28cH7w@mail.gmail.com>
Subject: Re: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	Jerome Forissier <jerome@forissier.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91990-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC766FBB38
X-Rspamd-Action: no action

Hi Amir,

On Thu, Feb 5, 2026 at 3:13=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 2/4/2026 6:46 PM, Jens Wiklander wrote:
> > Hi Amir,
> >
> > On Tue, Feb 3, 2026 at 11:56=E2=80=AFPM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >> On 2/3/2026 5:59 PM, Jens Wiklander wrote:
> >>> Hi,
> >>>
> >>> On Tue, Feb 3, 2026 at 3:09=E2=80=AFAM Amirreza Zarrabi
> >>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>>>
> >>>> Hi Jens,
> >>>>
> >>>> On 2/2/2026 10:36 PM, Jens Wiklander wrote:
> >>>>> Hi Amir,
> >>>>>
> >>>>> On Thu, Jan 29, 2026 at 4:22=E2=80=AFAM Amirreza Zarrabi
> >>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made =
the
> >>>>>> client wait as killable so it can be interrupted during shutdown o=
r
> >>>>>> after a supplicant crash. This changes the original lifetime expec=
tations:
> >>>>>> the client task can now terminate while the supplicant is still pr=
ocessing
> >>>>>> its request.
> >>>>>>
> >>>>>> If the client exits first it removes the request from its queue an=
d
> >>>>>> kfree()s it, while the request ID remains in supp->idr. A subseque=
nt
> >>>>>> lookup on the supplicant path then dereferences freed memory, lead=
ing to
> >>>>>> a use-after-free.
> >>>>>>
> >>>>>> Serialise access to the request with supp->mutex:
> >>>>>>
> >>>>>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() wh=
ile
> >>>>>>     looking up and touching the request.
> >>>>>>   * Let optee_supp_thrd_req() notice that the client has terminate=
d and
> >>>>>>     signal optee_supp_send() accordingly.
> >>>>>>
> >>>>>> With these changes the request cannot be freed while the supplican=
t still
> >>>>>> has a reference, eliminating the race.
> >>>>>>
> >>>>>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
> >>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com=
>
> >>>>>> ---
> >>>>>> Changes in v3:
> >>>>>> - Introduce processed flag instead of -1 for req->id.
> >>>>>> - Update optee_supp_release() as reported by Michael Wu.
> >>>>>> - Use mutex instead of guard.
> >>>>>> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-fre=
e-v2-1-1fbfafec5917@oss.qualcomm.com
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> - Replace the static variable with a sentinel value.
> >>>>>> - Fix the issue with returning the popped request to the supplican=
t.
> >>>>>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-fre=
e-v1-1-a70d23bff248@oss.qualcomm.com
> >>>>>> ---
> >>>>>>  drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++-=
-------------
> >>>>>>  1 file changed, 86 insertions(+), 36 deletions(-)
> >>>>>
[snip]


> >>>>>> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u=
32 ret, u32 num_params,
> >>>>>>
> >>>>>>         mutex_lock(&supp->mutex);
> >>>>>>         req =3D supp_pop_req(supp, num_params, param, &num_meta);
> >>>>>> -       mutex_unlock(&supp->mutex);
> >>>>>> -
> >>>>>>         if (IS_ERR(req)) {
> >>>>>> +               mutex_unlock(&supp->mutex);
> >>>>>
> >>>>> We need a way to tell the difference between an id not found and an=
 id
> >>>>> removed because of a killed requester.
> >>>>> How about storing NULL for revoked requests instead of an err-point=
er?
> >>>>>
> >>>>
> >>>> Not sure I'm following correctly. Are you expecting supp_pop_req()
> >>>> to return NULL instead of an err-pointer when a request has been rev=
oked?
> >>>
> >>> I was looking at it again, and storing an err-pointer as you do in
> >>> this patch has the advantage that we can tell whether the ID has been
> >>> revoked or was never supplied. In the latter case, it suggests that
> >>> the supplicant is doing something wrong and might as well restart in
> >>> an attempt to recover. So, please keep using an err-pointer as a
> >>> placeholder, but we must be able to distinguish a revoked request fro=
m
> >>> other errors to make sure that the supplicant doesn't restart due to =
a
> >>> revoked request.
> >>>
> >>
> >> Understood. What if I switch the stored err-pointer to EBADF instead o=
f ENOENT
> >> (which seems more natural), so it doesn't overlap with other supp_pop_=
req() error
> >> codes and the supplicant can reliably detect it.
> >
> > Any error returned by TEE_IOC_SUPPL_SEND (or TEE_IOC_SUPPL_RECV) will
> > cause the tee-supplicant to exit. Even if we update it to ignore
> > certain codes, we must also consider the installed base. There's not
> > much tee-supplicant could do with this error, except logging it. But I
> > don't think that is very useful either. Unless the tee-supplicant does
> > anything wrong or if the device isn't working any longer, we shouldn't
> > return an error.
> >
>
> The direction of data flow in optee_supp_send is from the supplicant to o=
ptee,
> so the only way I can return meaningful information back to the supplican=
t is
> through the return value. I suppose I could simply ignore the revoked req=
uest
> and return success, but it might be useful for the supplicant to know abo=
ut it
> in case it needs to roll back something.
>
> At this point I'm out of ideas :). Do you have any suggestions on how I c=
an
> inform the supplicant about a revoked request in optee_supp_send while re=
turning
> success return value?

This became a bit harder than I first thought. At this point, to fix
the possible use-after-free, we have two options:
1. Returning an error code: tee-supplicant will exit
2. Returning OK: worst case, tee-supplicant can leak memory

During reboot, neither case is a problem. During normal operation,
it's annoying if tee-supplicant exists, but you still need some
privileges to kill the client. If we return an error, it's enough to
update tee-supplicant to handle that error case, and we're done. The
advantage is no added code to the kernel.

I think we should do what you suggested and return an error. This will
not happen during normal operation. We'll fix tee-supplicant to handle
the return error properly. tee-supplicant doesn't care about what
error code it gets. If there's an error in TEE_IOC_SUPPL_SEND, it
knows that no one will receive whatever was sent, and cleanup is
needed.

Sumit and Jerome, what do you think?

Cheers,
Jens

