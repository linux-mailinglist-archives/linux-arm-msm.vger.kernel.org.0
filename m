Return-Path: <linux-arm-msm+bounces-25751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF192C69B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 01:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44CFFB222E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 23:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5259D187860;
	Tue,  9 Jul 2024 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CuyFg2By"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0217156C7B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567868; cv=none; b=uH4hHSdyGlyjc3tYcSy8XrXFtRwLl3L0MINpygF5ULFMVq1YDFMFRsK2v/ypRlpEd08cI+fBikocLcucFrFoUaj6Mpf0OXrMSgxcQqFXfeK/AbUxaK787RvRccWvKtULCjPZK3oLSzD4T8FaSMgdoG3uYyeD1h6r0X4ZVX172ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567868; c=relaxed/simple;
	bh=FAmfLU3iQFSgoCdv6EnHXIwlHcCQMJUyMdiu+4TZIZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhmsjpHy5AF6eVkHvhS/1WLORzeJjTOIaUkwGzYD5DLgqiFxgPTUff6QTSs2qtdKbbcTB7cyBU1b0zLhZsYgae9TLeKkCF/o57M93y6MU5AMT9vI9TU5p+nuJ/eaurwtEK+enRNAo2SWz6CvcddlTkOyLFbhJoK8Tt1dh/SCtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CuyFg2By; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d92c13a2fbso1670089b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 16:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720567863; x=1721172663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZFheUR/qXoImqQXtjj2taFVa+bsRTO/bNKZR5rHkB0=;
        b=CuyFg2ByteNaLGT7XsjEEMyD5gz5II2N/c6o/pYENQ9EyoOE+1ZFf1SmVw/K1rK231
         yF2VxBouhNOfIN5kM2cDpUMi5B1zRHri/TkESFD4BwECOlV1QoAPtTgB7EvSLBm9YuXi
         weNMSPM8S0Ztaq+kAEtxXHHPrYwuxkeP2El2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720567863; x=1721172663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZFheUR/qXoImqQXtjj2taFVa+bsRTO/bNKZR5rHkB0=;
        b=huQKcUakjiEORNWIHouZvY3gGPtRNBbPjq4EU1UWzXLjuJ8rQngbeWOUAwws5dMFUE
         flNdaQvvyXbEmSj/ou8LEk2Vtt86J4a0gYDP3XI9G9B3WKg+7+8NsJ4CqHHd/1fO8/xL
         cg3t8fUWTWqZXMcNG/eDnbVGup3hT16AgXVddtf+7ZtyVEa2XVKdyq6nVCWjqESo0iUB
         ztfyzIRaBpF+OJzliz9O0FouFa5POJwwVUEnXimyBCfHkGBArMh164cdkkiyb+BxUo28
         LdH0USjvEcZwQlfJFISYLNahEZWpExeMN/+bLZOwIilsFsfJQh0h8wPVARmam0nTDRRi
         VtXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFMjLDtgG2aR3zeQgr8GZGHhblMY9gb4gReySWRUmZWYCRWlpJD/nfB6SI3FUEavvrh57ztGGUdJgw05AhIUUmqgd/EOPNnEVJRvFvWw==
X-Gm-Message-State: AOJu0YzdGF/t1dFFlKacITXPfjIJH/vO2fnhsvvKVNdDYo4Hfx0SGmLE
	yhTxSSeZpfWjfDx7sf3F1e8cVNTguEWfBkfcnAbPw7HrLYuyAXEpufyxsmF0tzY8HVhFmmhB71k
	=
X-Google-Smtp-Source: AGHT+IFiwdnKen0lC3XyCeOE7K5D/EY7rE//TvfPq3mI2mIgPIu1WOOIeFgUKLs5hXifIsITm1iOdA==
X-Received: by 2002:a05:6808:1588:b0:3d9:2b24:5b8 with SMTP id 5614622812f47-3d93c05df99mr4585496b6e.32.1720567863015;
        Tue, 09 Jul 2024 16:31:03 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6903sm143006185a.25.2024.07.09.16.31.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 16:31:02 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44a8b140a1bso116221cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 16:31:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU18laH93rlnBEkWXyzSMrfXUVLhvKbnMVrNOPB/h9WzNEJSu763YKVLH/Hg6d4XO/ElNuDLz3LxEFKjuqKh271xmCu+YAd5LMnlvxl+Q==
X-Received: by 2002:a05:622a:6dc3:b0:447:e423:a463 with SMTP id
 d75a77b69052e-44b16e711afmr680531cf.3.1720567861417; Tue, 09 Jul 2024
 16:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704101805.30612-1-johan+linaro@kernel.org>
 <20240704101805.30612-4-johan+linaro@kernel.org> <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>
 <Zo0Gco1igkL185US@hovoldconsulting.com> <Zo0zJ8icZO9VFG8h@hovoldconsulting.com>
In-Reply-To: <Zo0zJ8icZO9VFG8h@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jul 2024 16:30:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR=iJ_3eDFm52GhmMTMfB3qQE_vhCqPs=EcT2DkebgsA@mail.gmail.com>
Message-ID: <CAD=FV=WR=iJ_3eDFm52GhmMTMfB3qQE_vhCqPs=EcT2DkebgsA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: qcom-geni: do not kill the machine on fifo underrun
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 9, 2024 at 5:55=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Tue, Jul 09, 2024 at 11:44:18AM +0200, Johan Hovold wrote:
> > On Mon, Jul 08, 2024 at 04:59:59PM -0700, Doug Anderson wrote:
> > > On Thu, Jul 4, 2024 at 3:19=E2=80=AFAM Johan Hovold <johan+linaro@ker=
nel.org> wrote:
>
> > > > @@ -878,7 +878,7 @@ static void qcom_geni_serial_send_chunk_fifo(st=
ruct uart_port *uport,
> > > >                 memset(buf, 0, sizeof(buf));
> > > >                 tx_bytes =3D min(remaining, BYTES_PER_FIFO_WORD);
> > > >
> > > > -               tx_bytes =3D uart_fifo_out(uport, buf, tx_bytes);
> > > > +               uart_fifo_out(uport, buf, tx_bytes);
> > >
> > > FWIW I would have rather we output something much more obviously wron=
g
> > > in this case instead of a NUL byte. Maybe we should fill it with "@"
> > > characters or something? As you said: the driver shouldn't get into
> > > this error condition so it shouldn't matter, but if we have a bug in
> > > the future I'd rather it be an obvious bug instead of a subtle bug.
> >
> > Yeah, I've been running with a patch like that locally in my tests, and
> > went a bit back and forth whether I should post it. My reasoning for no=
t
> > doing so was that the bugs have been fixed so we don't need to spend
> > cycles on memsetting the buffer to anything but NUL (I used 'X' in my
> > testing).
> >
> > I guess that can be avoided by only padding the buffer if we ever hit a=
n
> > underrun, but I still thinks it's questionable to spend the effort as
> > this is not something that should be needed. In any case, I didn't want
> > to spend time on it to fix the 6.10 regressions.
> >
> > Killing the machine is perhaps an effective way to get attention to an
> > issue, but I'd much rather have an occasional NUL character in the log
> > *if* this ever becomes an issue at all again.
> >
> > > I'm happy to post a patch or provide a Reviewed-by if you want to pos=
t
> > > a patch. Let me know.
> >
> > If you feel strongly about this, I can either fill the buffer with
> > something else than NUL or add error handling for any such future
> > hypothetical bugs. What do you prefer?
>
> Actually we just need to clear the buffer on entry, which would do away
> with the unnecessary memset() that is there today. This should also give
> you a printable indication that something is wrong in case a similar bug
> is ever reintroduced (e.g. the last four characters would be repeated
> until the transfer is complete instead of a fixed char like '@').
>
> Perhaps that's good enough as a compromise?

IMO initting 32-bits of data should be fine to do each time through
the loop. I've sent a patch:

https://lore.kernel.org/r/20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f=
6497cdfaa@changeid

-Doug

