Return-Path: <linux-arm-msm+bounces-30058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B82BA964B2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 18:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71817283E90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7B61B4C58;
	Thu, 29 Aug 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gDeXTXAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA71B3F27
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948000; cv=none; b=okYnwcO8jOx/rfmsjJ+2H0g2YmJevc2CS4/32iCSo8zh6yBmiTi9SWuQmqf+bjwRmvdxPnwZCJnb480ioUhyMta3IHxdbF1qWYnCSvMkZOon9oB6Zb9UK6ottViSfd+VkcDFtGD0APJEb+sr5S4s4MBFW8gErE53lB66V/3ew0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948000; c=relaxed/simple;
	bh=dHkC8BQ/oCFG+KGsaHIHKPgYPFJGnB+AcptiQKVOpA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mknpT59fYDkqWFTXf2dxJftLJyErtYZQ3xC6rMgV9/2ILOeJjWewaXXGa9YUkG4cznNj364l4ZeeUij3MgBM8vrPZC8BeOEIhQgDp0C16TD8HDnsNkVz1sXooChLoetRHXZPh6UwS8CjclAd0zv9xpCv6BwZit/pgoI0Fik3bNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gDeXTXAG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724947998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gjf9lEYKxo79UOeU1ud431sTBQCGkwHKYo7rx3w8B+0=;
	b=gDeXTXAG070NZM5MtaHVLnRbLjt5/c8A/DaNXvxNK2Lfu5fA4iphw0VlvGyKS77YdBeU1d
	VK7MQl1L7UZP3AjG3jDP+7Ou7K56jeUnQ363KbZ4EjRhHg/67oqx1bf+Zow3jI6BeUe+qi
	CXuC+qGThQPU415jSbevBqoT3qoKHmk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-EcqcxeNFOSyOfM-ajUTYUA-1; Thu, 29 Aug 2024 12:13:16 -0400
X-MC-Unique: EcqcxeNFOSyOfM-ajUTYUA-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3db2e938b79so954238b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724947996; x=1725552796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gjf9lEYKxo79UOeU1ud431sTBQCGkwHKYo7rx3w8B+0=;
        b=VuGsSKLkG/mwvVxWsLU3nOQ8HQjNNl3tl8Rb+O7SflumN/Mp3ruLvPhVfDydo8PVKy
         yXIWgko18xaEXe2k7fo9IIbBnt/4jxVsfYdBf9Jvte6aSZqa338cjYrT+6MTvm3s0W5h
         +V5lSZZuLBlCOqfFPtif8kxmESLg9PDkFs15JuGUP45bpIV3OztD1JgZ6kwUFBnrxs4g
         dmkjqXaEgFLQY4p0o2+jq8iBTv/S4EhuVlK0/6QS0HVSJ31iOC+3LCbHEpW+sqrivp4j
         X4GmcCfVoW2eH62Zho7cXgbCr+pLJuXJmg1Pdy2qT5Z6snQxhRJEVcjIth1CsczGofTf
         5Uxg==
X-Forwarded-Encrypted: i=1; AJvYcCVjZYCFtJv7leHkTU/zQ/7wvMfPiPM13P/pXTLI+mvILv0+t07hVRS1X82axQoAPrep8iExhVZujNmxbA5h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1toABRAISUJmSIR1WeMplYImx5UwMIJxcr1UGtTemHwmGfZQ
	XvcAC5mTRmg6PD8uGQA2Xg4GPJoBLJkNwWie0ruGU9vfg9PaeNKNey0YU1TeqtAA0WbM0qXfYkT
	uxY37SnElcayXGKYL25uUBy6B3Hrr/OdWEcL3d8Uyy1OawVpwT+NS/azEaXnQRQDHkAxHn+jvJ7
	Afn1lEIj1+z7z4KxUQBiDGy7P6lDXg4ri924aWBg==
X-Received: by 2002:a05:6808:158c:b0:3d9:b33e:d3c7 with SMTP id 5614622812f47-3df05c46699mr3393138b6e.5.1724947995777;
        Thu, 29 Aug 2024 09:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp2WvBJh6ce6etsdNcPyEsUAS6R8viWHcvInnOKhT3fldRVCreceAGksb536DXzOLO4wV5wrO3yDa/aIrEbnw=
X-Received: by 2002:a05:6808:158c:b0:3d9:b33e:d3c7 with SMTP id
 5614622812f47-3df05c46699mr3393107b6e.5.1724947995414; Thu, 29 Aug 2024
 09:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829012005.382715-1-bmasney@redhat.com> <20240829012005.382715-3-bmasney@redhat.com>
 <20240829155829.GA6489@eaf>
In-Reply-To: <20240829155829.GA6489@eaf>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 29 Aug 2024 12:13:03 -0400
Message-ID: <CABx5tqKJ9Swc3dF3wG46BUL9-zDpVNyqXLeuA92kOZCbNU_wCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] crypto: qcom-rng: fix support for ACPI-based systems
To: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, herbert@gondor.apana.org.au, 
	davem@davemloft.net, quic_omprsing@quicinc.com, neil.armstrong@linaro.org, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 11:58=E2=80=AFAM Ernesto A. Fern=C3=A1ndez
<ernesto.mnd.fernandez@gmail.com> wrote:
> thanks for the patch. I have one doubt:
>
> On Wed, Aug 28, 2024 at 09:20:05PM -0400, Brian Masney wrote:
> > The qcom-rng driver supports both ACPI and device tree based systems.
> > ACPI support was broken when the hw_random interface support was added.
> > Let's go ahead and fix this by checking has_acpi_companion().
> >
> > This fix was boot tested on a Qualcomm Amberwing server.
> >
> > Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface suppor=
t")
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/crypto/qcom-rng.c | 36 ++++++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
> > index 4ed545001b77..470062cb258c 100644
> > --- a/drivers/crypto/qcom-rng.c
> > +++ b/drivers/crypto/qcom-rng.c
> > @@ -176,6 +176,21 @@ static struct rng_alg qcom_rng_alg =3D {
> >       }
> >  };
> >
> > +static struct qcom_rng_match_data qcom_prng_match_data =3D {
> > +     .skip_init =3D false,
>
> So with acpi, skip_init will be set to false now, right? But before
> f29cd5bb64c2 broke it, skip_init used to be set to true. Was that wrong
> before, or now?

Good catch! I didn't check the _DSD and assumed it was always false.
I'll verify on the server we have in the lab and post a v2.

Brian


