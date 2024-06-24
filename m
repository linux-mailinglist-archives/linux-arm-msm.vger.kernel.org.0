Return-Path: <linux-arm-msm+bounces-24017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E369F91561A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 19:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A89C28D47E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D181119FA60;
	Mon, 24 Jun 2024 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwNCh4G9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F519E822
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251978; cv=none; b=Ad6aS9PMLyyxKhM3nI67V6IJib4h9qUO+MhT/GRQny6uqqZwO3Beqb4oXzilP4Zvr+stOAhatoEND4KSuTuKrsMOZE68BwG5VLQ+hkuLNnv1Ebfmc9IQ167cdnLAWFpx3WZk6h16dln+sGOy2TAlfLEOLgDF7Kx1zOCiEv1sIG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251978; c=relaxed/simple;
	bh=pqMHCioVrxDY7vOFCbBO5tbo0XgJDYYSym5VZt+RZgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XT+n2XcXy0Eghq7I50Oc70NVzmeP8NvZKulz9Lf67nU4X+D8h7cPmizFG+J9HiIJDEAF5QJBWzoA5TWX5kJKzT8BP4JFfSfQnYXUqubINlUumPp6+N7WCfiMvdcNcIla2n0LAXL4kyBTty1iNacaF7rUZFbfchlkfxaIG3DUiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwNCh4G9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d10354955so5114875a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719251975; x=1719856775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIAIWt1Z4eDmMTYINpUjLJ9mlruxPvEMQ5OTZoQ2ABo=;
        b=CwNCh4G9oEOXP43Gk21hNlSlHatyizq1SlK2MSQ3O1H3bJOc8v2qHpy+qvhPUdH3k4
         cEWdJ09EB9RUmrPnquZrc5uHaEVbUUp8Xb96I4PKxV9CBwFmQ/loy9IFBQv7P1unJ7nf
         G1YUH31M5PhDi1II4siHZ/WVJ3GEDBRZY40hAYX4RPIzMQcXXGNm9z0bT8pUhJt5YFt9
         RrvNnTCjNm6gVQHnch3inAgMjdW8PPQmpDL02z1UFaS7VBidICx4c7yvMUhJZ92kJX0s
         /aBvlll2+rAeO+G1tmiLDjkboPZwnoZ1JIYdCs7ljlSiynNVaCorCjC2M2EizeKyIwU2
         /38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719251975; x=1719856775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIAIWt1Z4eDmMTYINpUjLJ9mlruxPvEMQ5OTZoQ2ABo=;
        b=biXE/YfcsgFE4Nw8VGMuLmpHL3oYSzO91yAzloxraDdFDbQyNFCfnT/KqsWs0N6HZv
         lngih6V7g6iasAopbJ5U+hwYYJZ29qk0sWg4uipFL2aYXiLq3aZwwh1yVEzEVuKdin71
         zoEMSyGpYn7CV5o8yxj+QRA5J2i4oSjmNsyfCVI1P9yp7P+NPLTC8vM1C4X6/SkN07ar
         b1mglosWhCOMdV7WNTb6B6L+ZVKKrHcNfoDlCvCBPG0CJN4Pf5B9LifJpdVrbqrMpMaz
         uNxeFvSjCgsfGUnuQFQYdIGtiTYGuoOhHA+PY+XDOx9V/MAIcvaCM61o67Ic+Ppg+iUp
         NXiw==
X-Forwarded-Encrypted: i=1; AJvYcCVaRjn2PXJm6o0mXsNVQF1PXB5WgDZ0HZcnnzbwabVvDrpxDb/TRA+vyYC+clReDLJHk48BX3TTorlnclynSiJ+zH3VnIzq9/TAk72m3A==
X-Gm-Message-State: AOJu0Yz9/V/ixvxvzuZQpyMzzEiFp94WZOBr1KSdcjHT+aqrucmETI5i
	a4ipFVEnT2iRULuy+ijdtrpDuQ5xl6S4pr/drfKxK4lXr0+iu5BuWfJ7zisGxWMTLCBGxtwNgb5
	1HXy+WOBAtURsm8GQ1RPzwqETbts=
X-Google-Smtp-Source: AGHT+IFNrTbtVRMR1bNA/VkMsDt63271yjVLvXvkXcuP88vnraU7GiWcQXI66OvIraPkqnoiDENoj1UsWzOIPOW179k=
X-Received: by 2002:a50:8e53:0:b0:57d:105c:c40c with SMTP id
 4fb4d7f45d1cf-57d49dc29d1mr3725659a12.24.1719251975388; Mon, 24 Jun 2024
 10:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr> <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org> <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
In-Reply-To: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 10:59:23 -0700
Message-ID: <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marc Gonzalez <mgonzalez@freebox.fr>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> >
> >
> > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
> > >>
> > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@fre=
ebox.fr> wrote:
> > >>>
> > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > >>>
> > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > >>>>
> > >>>>> When create_address_space() fails (e.g. when smmu node is disable=
d)
> > >>
> > >> Note that smmu support is going to become a hard dependency with the
> > >> drm_gpuvm/VM_BIND conversion.. which I think means we should never g=
et
> > >> far enough to hit this error path..
> > >
> > > Does that mean that we will lose GPU support on  MSM8974?

And display support as well :-/

Note that GPU should be disabled by default without smmu.. you can
override with modparam, but please don't.  It is incredibly insecure,
you might as well make /dev/mem world readable/writeable.

Is simplefb an option on 8974 or 8226 to keep display support?

BR,
-R

> >
> > Yeah, that was brought up on #freedreno some time ago
>
> Also on MSM8226 which I also care about...
>
> Anyone at all knowledgable on IOMMU would be very welcome to help out
> with IOMMU support on these two platforms (and anything else that
> old?) in any case, since me and some other people have looked at this
> (on and off) for years but haven't gotten to any stable or usable point
> unfortunately.
>
> Regards
> Luca
>
> >
> > Konrad
>

