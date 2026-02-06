Return-Path: <linux-arm-msm+bounces-92012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKWbGh2+hWmpFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:10:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7EFC859
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52D3C30053FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5CC35DCF7;
	Fri,  6 Feb 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=forissier.org header.i=@forissier.org header.b="pNyRo1j7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0012EE5FC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372634; cv=pass; b=XZmYGhzmnWKK0N1w62ZIxr59cVr2EOtbbuNqd3DsjYuqV9G4jKaUgA+byUoW9NJ9Y8QkBsw7iXk8M3MQyxG067DrKHLFtcBPC0JspzuYUYsOCQrCQ/lZhX6HAlASB8mhRhdCH8KVjxV7RX7kOmpBaUZyDkMngXM3srWqzpjcrqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372634; c=relaxed/simple;
	bh=+raMpszw+VfiU8LwlzdNKHxES59Mccz7j6Z7SxfXCao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2Pni4BdF630Eax3Idz/T9CwG/qzb2Si5WyQ2rwK0uMX7kY8tuEnLVPUsM+CXsA9u9bsOjqpweyVXDA0sxR9nSwn3ltK3ob9Kz4/+5owhnYEIBME0DJ6N8LCb95mDwe7eRvSLFCyOvEXhRQJ8usO5AtNsO51LdOfRMiRjHC66SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=forissier.org; spf=pass smtp.mailfrom=forissier.org; dkim=pass (2048-bit key) header.d=forissier.org header.i=@forissier.org header.b=pNyRo1j7; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=forissier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=forissier.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7d98c1879so12442615ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770372634; cv=none;
        d=google.com; s=arc-20240605;
        b=PVuReLvRwvh57n08yarr8JZraOU6xwTgdqIFJxqC/EPs4HDV4sSZHBQLc0sJz/tihW
         ijRAWvbWm7dhnctlSs2p9lwxgJWT2IaY8Xu2z29RcbI9oZYtdF/4qYmFxsE+x3/iN8ea
         VIaJq0YaZfb4GgwBDR96ga1dwMOHLqA1hQZv/wLtH83dVsUrWam8WgXQ1B8A7N4ixqin
         2O4RAz9aQPyzpzEjiGQZxKVHLoZSSKWok6mflKKZtlCk8IDCWZ+xZteh9mZvnc3RaaZC
         XLNNZDoKchLquqzRePiIYDgfhpHV5a9JXsxhbAF208vZuUepfbw6/9pocsjrmmNjGsd3
         ztDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCPgnb7KEPXry1O1IYURNqjbLQ+f0InuIl7jk/xq6CU=;
        fh=CMWSj4eV268rm7PQO8v/p9akvUMIg8PP0dwHBRtnhGE=;
        b=dNf2P8r+yYwOoPZ0oi6aBnCVlNmtRpyOgkoaPIE6ngKHam1fb17KA9n7xUUhM8DDQ1
         +1f6q1J6ZyKJ6V1pifYVGLKTotIr+bblqbFUnv/kxtUJhTxzpAcUdSViYEK9jyEfDA7s
         aiIyMMjSMlaEYz1d1A7nFJw+FAykrk34ffOJHyXqytjz73qjRH/AFBbzIhP6P6pdKlFK
         bvf7DAQiaYLn5F3IZAyrlizbJZyBawNftvmrcm05pGZ1QEo0olUyXk3ureU1bq6t7uyj
         h4rsMbCorfGIT6VCCXO2s8rP2upzho0J0nf5gZRtRhEKxVEdUcjBqgpgj0t0Qy6MDBtz
         AeBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=forissier.org; s=google; t=1770372634; x=1770977434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCPgnb7KEPXry1O1IYURNqjbLQ+f0InuIl7jk/xq6CU=;
        b=pNyRo1j7y0tp/jKSocmSpghpxdbsjWPf/RPQzGm6LgGS3REvSowlN1Bkt8PVTkt8hQ
         YTIZFeZciVeu4AijhlXeLnjCaEhDtuc9vepDq4a1PP1uhbIatv/537fiikIbSGA8CJam
         +ae1oeRBaFK7eRAbHm6VtY2yaM12SlaBoIbtJdRu47wc+onhSBqZhCRbQ3F8ljhnbpC1
         pdEIAJu2GlsW/zZP2p7QnviWXkybid2JMP5aywuRuvw2LSjHKUl0pabSog1FBwBFt9rY
         uTIMudqAyCBB5ZbdRGPCucbJGeNlvElh9jybLGRE47pc+uguwbETnpVvvCIihBfYb4WH
         tKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372634; x=1770977434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCPgnb7KEPXry1O1IYURNqjbLQ+f0InuIl7jk/xq6CU=;
        b=opzAWLrm70crxxNW1ogkB0i2xwVhaWz/G8nMjVnTDVWMh8JnppwxX/e+0EOLNHPh5I
         gM5Jwd6+lCh3t6lpoE6lbuCf0WKNC0ioWkZtz1udhOvWyWlNpcBRqdtefegNhTuBHLLZ
         h4Zxk2QLIuMKUdSw9/2Ai7yJfghSFXp0OWLk7HwI6DOgPq9DwQnTRniZT28HD11onx7G
         p+0jGYP68NHRmYqjM9YFzhRajvFvpS65qexR5eM3gKIBsglWwkBmJdz+CZsO1QD+wPV1
         jhr8H7P5JRQnmwwjsRk8zqxPrf1hE4rQiQAxCezp1fBhWLT+8DhkHr5GNrJ7ZL57pmCA
         pyhw==
X-Forwarded-Encrypted: i=1; AJvYcCWB1Ui5OWdhkAucvu84bDtIHb3JAYs7QNTdxfIb3hSoSZAT6HPF4+uXp7kkUizFSLaLCLZYOqHecNlDc4Nb@vger.kernel.org
X-Gm-Message-State: AOJu0YxywH1t1URG+M70DzroTEyC4IJWXqfL397HCHP3YHD6Um7j0RBq
	iE74XTkp5KdKSOVa30wRBPtbXmWvy5eHoznRXBB4lqL8PUDaijB/5CNS26lGZnBLulSxOO4eJwM
	6IIaaIEUP2SK8Ud4i1+76m2PvST7eBglXxgf3nQ814g==
X-Gm-Gg: AZuq6aLnCBEdOT8SBdQgMzMRIujMpMASQ0EJZi0TDyf2F4jzMDHUzTyIpgUil9cPBvx
	QYkz540ysH0l50UidWvxGkQbGDR+V2AlUDc7CiC6t9ZfAQlBxnh3a6ztOomRrUzmGokmczRw5XX
	2WZqmIdGP7FkwuZg8oTHpARkoVZQ/B/D7amgBg2OpgqrNRTyK/J+GjpO1SV7+w3knF1svXusGnX
	X8uON9+o9C0eBJwJL6QkpxTX2S2rxbDu9QUqgabquo8Kc7tf4BDwNinVMTxCwMUTvfXB7OQE494
	3xUQAcQ=
X-Received: by 2002:a17:902:e809:b0:2a0:d34f:aff3 with SMTP id
 d9443c01a7336-2a95164c0eemr25673595ad.18.1770372633718; Fri, 06 Feb 2026
 02:10:33 -0800 (PST)
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
 <b8086bfb-f240-4115-9ab0-18509775932a@oss.qualcomm.com> <CAHUa44GhTy=TWAuG7JY_6jjWG-uCGnLyZRn1JhGWgaWt28cH7w@mail.gmail.com>
In-Reply-To: <CAHUa44GhTy=TWAuG7JY_6jjWG-uCGnLyZRn1JhGWgaWt28cH7w@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome@forissier.org>
Date: Fri, 6 Feb 2026 11:10:22 +0100
X-Gm-Features: AZwV_QgHFkxvM7-SfE4zulthjLCOgAI9_C7OQtk4WJKE5RyCOXruSJm_rkaAV_M
Message-ID: <CAA-cTWYKSiWRFipi6Ka7h9c99t-RAA1kVrwbjApZseErv3gFwg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.63 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MIXED_CHARSET(0.53)[subject];
	DMARC_POLICY_ALLOW(-0.50)[forissier.org,reject];
	R_DKIM_ALLOW(-0.20)[forissier.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92012-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[forissier.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerome@forissier.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B4B7EFC859
X-Rspamd-Action: no action

Hi,


On Fri, Feb 6, 2026 at 9:54=E2=80=AFAM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> Hi Amir,
>
> On Thu, Feb 5, 2026 at 3:13=E2=80=AFAM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >
> > Hi Jens,
> >
> > On 2/4/2026 6:46 PM, Jens Wiklander wrote:
> > > Hi Amir,
> > >
> > > On Tue, Feb 3, 2026 at 11:56=E2=80=AFPM Amirreza Zarrabi
> > > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> > >>
> > >> Hi Jens,
> > >>
> > >> On 2/3/2026 5:59 PM, Jens Wiklander wrote:
> > >>> Hi,
> > >>>
> > >>> On Tue, Feb 3, 2026 at 3:09=E2=80=AFAM Amirreza Zarrabi
> > >>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> > >>>>
> > >>>> Hi Jens,
> > >>>>
> > >>>> On 2/2/2026 10:36 PM, Jens Wiklander wrote:
> > >>>>> Hi Amir,
> > >>>>>
> > >>>>> On Thu, Jan 29, 2026 at 4:22=E2=80=AFAM Amirreza Zarrabi
> > >>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> > >>>>>>
> > >>>>>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") mad=
e the
> > >>>>>> client wait as killable so it can be interrupted during shutdown=
 or
> > >>>>>> after a supplicant crash. This changes the original lifetime exp=
ectations:
> > >>>>>> the client task can now terminate while the supplicant is still =
processing
> > >>>>>> its request.
> > >>>>>>
> > >>>>>> If the client exits first it removes the request from its queue =
and
> > >>>>>> kfree()s it, while the request ID remains in supp->idr. A subseq=
uent
> > >>>>>> lookup on the supplicant path then dereferences freed memory, le=
ading to
> > >>>>>> a use-after-free.
> > >>>>>>
> > >>>>>> Serialise access to the request with supp->mutex:
> > >>>>>>
> > >>>>>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() =
while
> > >>>>>>     looking up and touching the request.
> > >>>>>>   * Let optee_supp_thrd_req() notice that the client has termina=
ted and
> > >>>>>>     signal optee_supp_send() accordingly.
> > >>>>>>
> > >>>>>> With these changes the request cannot be freed while the supplic=
ant still
> > >>>>>> has a reference, eliminating the race.
> > >>>>>>
> > >>>>>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
> > >>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.c=
om>
> > >>>>>> ---
> > >>>>>> Changes in v3:
> > >>>>>> - Introduce processed flag instead of -1 for req->id.
> > >>>>>> - Update optee_supp_release() as reported by Michael Wu.
> > >>>>>> - Use mutex instead of guard.
> > >>>>>> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-f=
ree-v2-1-1fbfafec5917@oss.qualcomm.com
> > >>>>>>
> > >>>>>> Changes in v2:
> > >>>>>> - Replace the static variable with a sentinel value.
> > >>>>>> - Fix the issue with returning the popped request to the supplic=
ant.
> > >>>>>> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-f=
ree-v1-1-a70d23bff248@oss.qualcomm.com
> > >>>>>> ---
> > >>>>>>  drivers/tee/optee/supp.c | 122 ++++++++++++++++++++++++++++++++=
+--------------
> > >>>>>>  1 file changed, 86 insertions(+), 36 deletions(-)
> > >>>>>
> [snip]
>
>
> > >>>>>> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx,=
 u32 ret, u32 num_params,
> > >>>>>>
> > >>>>>>         mutex_lock(&supp->mutex);
> > >>>>>>         req =3D supp_pop_req(supp, num_params, param, &num_meta)=
;
> > >>>>>> -       mutex_unlock(&supp->mutex);
> > >>>>>> -
> > >>>>>>         if (IS_ERR(req)) {
> > >>>>>> +               mutex_unlock(&supp->mutex);
> > >>>>>
> > >>>>> We need a way to tell the difference between an id not found and =
an id
> > >>>>> removed because of a killed requester.
> > >>>>> How about storing NULL for revoked requests instead of an err-poi=
nter?
> > >>>>>
> > >>>>
> > >>>> Not sure I'm following correctly. Are you expecting supp_pop_req()
> > >>>> to return NULL instead of an err-pointer when a request has been r=
evoked?
> > >>>
> > >>> I was looking at it again, and storing an err-pointer as you do in
> > >>> this patch has the advantage that we can tell whether the ID has be=
en
> > >>> revoked or was never supplied. In the latter case, it suggests that
> > >>> the supplicant is doing something wrong and might as well restart i=
n
> > >>> an attempt to recover. So, please keep using an err-pointer as a
> > >>> placeholder, but we must be able to distinguish a revoked request f=
rom
> > >>> other errors to make sure that the supplicant doesn't restart due t=
o a
> > >>> revoked request.
> > >>>
> > >>
> > >> Understood. What if I switch the stored err-pointer to EBADF instead=
 of ENOENT
> > >> (which seems more natural), so it doesn't overlap with other supp_po=
p_req() error
> > >> codes and the supplicant can reliably detect it.
> > >
> > > Any error returned by TEE_IOC_SUPPL_SEND (or TEE_IOC_SUPPL_RECV) will
> > > cause the tee-supplicant to exit. Even if we update it to ignore
> > > certain codes, we must also consider the installed base. There's not
> > > much tee-supplicant could do with this error, except logging it. But =
I
> > > don't think that is very useful either. Unless the tee-supplicant doe=
s
> > > anything wrong or if the device isn't working any longer, we shouldn'=
t
> > > return an error.
> > >
> >
> > The direction of data flow in optee_supp_send is from the supplicant to=
 optee,
> > so the only way I can return meaningful information back to the supplic=
ant is
> > through the return value. I suppose I could simply ignore the revoked r=
equest
> > and return success, but it might be useful for the supplicant to know a=
bout it
> > in case it needs to roll back something.
> >
> > At this point I'm out of ideas :). Do you have any suggestions on how I=
 can
> > inform the supplicant about a revoked request in optee_supp_send while =
returning
> > success return value?
>
> This became a bit harder than I first thought. At this point, to fix
> the possible use-after-free, we have two options:
> 1. Returning an error code: tee-supplicant will exit
> 2. Returning OK: worst case, tee-supplicant can leak memory
>
> During reboot, neither case is a problem. During normal operation,
> it's annoying if tee-supplicant exists, but you still need some
> privileges to kill the client. If we return an error, it's enough to
> update tee-supplicant to handle that error case, and we're done. The
> advantage is no added code to the kernel.
>
> I think we should do what you suggested and return an error. This will
> not happen during normal operation. We'll fix tee-supplicant to handle
> the return error properly. tee-supplicant doesn't care about what
> error code it gets. If there's an error in TEE_IOC_SUPPL_SEND, it
> knows that no one will receive whatever was sent, and cleanup is
> needed.
>
> Sumit and Jerome, what do you think?

Sounds good.

Thanks,
--=20
Jerome

>
> Cheers,
> Jens

