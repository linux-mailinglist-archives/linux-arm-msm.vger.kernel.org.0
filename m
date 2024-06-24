Return-Path: <linux-arm-msm+bounces-24052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DC915947
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4901C213A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95525143C49;
	Mon, 24 Jun 2024 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua/lPI2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD17131732
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719266057; cv=none; b=eJYzzp0kJwMy8LmiKdlVuzeHFT8XSTZwN/D+hmli6rUY0OhiOZ7VGd1wbUjpVOxHKVAeeUOae2KzDMZJxq+LJfpGwql1zV1lxexb7DqS27AlXIGwuGjsKHJ7KuvUdYrvLJKfz/yvimIJ/wo5mqYuiM6eLux9Q6/X+x00qa1Koj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719266057; c=relaxed/simple;
	bh=Wt2E7nYiF7jjVSHdPP6HNFTql7CUeq+zrWlRcuDDcqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cV6OLxaiuqjEgjmnDIvwKECd0b84P+kkbPRJbalQm+XgxFO62F/gfEcNHuWBKsyzoqiJ5kKDTVYAppASa67D2WlG7Jw2xg/EpD+hhTb/pGjW4mH6RbAAwOH2V/wfLWJ3b1SaGyZY80IkTepeIOYSp7YEKr1cmsMnwsIVnPA6WWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua/lPI2+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6fe7a0cb58so129287666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719266054; x=1719870854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY5Zh+sZGJTn9InmhZn+JpSx2JdQvo8kESASgJqojTU=;
        b=Ua/lPI2+DoQyIs5z5W1Mg2k3quvTFbohPT6SmPdvd2yd/9gm5m6pIXXxzaymecmrHP
         /vF+/iZhxAtFfCbFeCHurTY4AUuOjfrQK34fCNyk3ldjAYEsuYE9hHrSxiUKj50V94dj
         CmZRZCszQi2BKTHoPnKtnlOQL3cs/Gy+q/wpWZC+ZaWXxIrpvfs45uo8rU8Pl97BkJri
         WxRewdwmJMWZUaCdjP+syTvXVE50P+eVSL0kmUTu6Oer8JOsONmmRDXuhuTKQKhW4SV3
         LtYAOp086kCk2h2EFlQPXHQ6FgpiU/x1Jv1pBUdh51NX4M//qYWd+5FjcJzv+fYJRXmT
         mudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719266054; x=1719870854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY5Zh+sZGJTn9InmhZn+JpSx2JdQvo8kESASgJqojTU=;
        b=PW8mNhz16mrdNowXZvu9FjuURBuqY7h0kkE/UsHRiL966klVO8EXCn/R3WWLP7GiBL
         i9vt1tW77RmjRtkxworRDigMGoD2+fyFXA8jyb5q79kekvcK/A/IOrWem+p7rT5gdChx
         KN9NXjHBCXnYi8Q3n25QwGtLOb+uuvo6cmqMx7fyZ7Kou6I/qflenyisAbeegdP2s9T3
         MLy/Eibr/gZ1ghgUk+jx9nLlX6TlZ0Oxel/SHaKMW4gJ4KNAaIgZQz3wgm7pfog+lyox
         S0BqybASEWof4ZWSV6kuq8g1tU+rD0Bn1aZNqz3kLMl+MZPONOdNuthSi7VTk1eRRUdg
         tzrg==
X-Forwarded-Encrypted: i=1; AJvYcCXbAoRTf+iC69875m/G3SSlk1vR6VD8d8UP6tYi/DfaGjedN6z6jcoGiUcItXBXBdn0Nh53SGltzKekVsydtO84LVe6Ux6Ix6GlSog3/Q==
X-Gm-Message-State: AOJu0YywlBNXLT8/486EqkOCAy28USoIc582oyWKl4pTQZJVQj+SprTz
	n1jtTfrk4rLh/0WDa+aqykaD060H0S9filj9RrCGru1KEtQXvRhXZ4NB7Jim2i1kIDTQzCYckw1
	hwBi9hXGlMLHDmK//C5uZuHvQAng=
X-Google-Smtp-Source: AGHT+IFlO6mE5t9frydCQN+/Yhc4G3eSyEPhL5nKtOMuGvqS8bghROCeDRxKANS/FbEHSdYQRTHAkzuOkRJX4ml/jUM=
X-Received: by 2002:a50:9f6d:0:b0:57c:671d:8455 with SMTP id
 4fb4d7f45d1cf-57d4bd728c8mr4277655a12.14.1719266053800; Mon, 24 Jun 2024
 14:54:13 -0700 (PDT)
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
 <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com> <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
In-Reply-To: <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 14:54:01 -0700
Message-ID: <CAF6AEGuMxO_WO3Jm+wLHX_VQApxTqiF6RekBY_oMfAiumT5u-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:29=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 24 Jun 2024 at 20:59, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairpho=
ne.com> wrote:
> > >
> > > On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > > >
> > > >
> > > > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wro=
te:
> > > > >>
> > > > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez=
@freebox.fr> wrote:
> > > > >>>
> > > > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > > > >>>
> > > > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > > > >>>>
> > > > >>>>> When create_address_space() fails (e.g. when smmu node is dis=
abled)
> > > > >>
> > > > >> Note that smmu support is going to become a hard dependency with=
 the
> > > > >> drm_gpuvm/VM_BIND conversion.. which I think means we should nev=
er get
> > > > >> far enough to hit this error path..
> > > > >
> > > > > Does that mean that we will lose GPU support on  MSM8974?
> >
> > And display support as well :-/
> >
> > Note that GPU should be disabled by default without smmu.. you can
> > override with modparam, but please don't.  It is incredibly insecure,
> > you might as well make /dev/mem world readable/writeable.
> >
> > Is simplefb an option on 8974 or 8226 to keep display support?
>
> Not in a longer term, I still hope to push HDMI PHY/PLL support for
> MSM8974, which means dynamic resolution support.

Hmm, maybe it would be possible to re-add carveout support.. but my
hopes aren't too high.  It would be better if we could get smmu going.
(Not to mention, I don't really like the idea of people using the gpu
without an smmu... it is a really insecure thing to do.)

BR,
-R

> >
> > BR,
> > -R
> >
> > > >
> > > > Yeah, that was brought up on #freedreno some time ago
> > >
> > > Also on MSM8226 which I also care about...
> > >
> > > Anyone at all knowledgable on IOMMU would be very welcome to help out
> > > with IOMMU support on these two platforms (and anything else that
> > > old?) in any case, since me and some other people have looked at this
> > > (on and off) for years but haven't gotten to any stable or usable poi=
nt
> > > unfortunately.
> > >
> > > Regards
> > > Luca
> > >
> > > >
> > > > Konrad
> > >
>
>
>
> --
> With best wishes
> Dmitry

