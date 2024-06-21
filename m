Return-Path: <linux-arm-msm+bounces-23586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D149126E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE3BB2734C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21F68BFD;
	Fri, 21 Jun 2024 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gro7t4v8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2FB67D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718977375; cv=none; b=dkVrQvaqKd8gkcmvbp6/BC+SkZu+FqcLw6x/xNQRICw/T7u73aFlxtwbktqHM4Fz9dmeBYMupgfhkdFXl4UvYdk5iF+HXQmND6RQ+lfDvbcq/WoUWgPvbw1+J2k88SwX8TSedb20c7Mud+ou5F153V5Wj5yYCo3g2qOJ4SDnWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718977375; c=relaxed/simple;
	bh=xTDco5y5zMHfNQrIXpXx9hG93QyktZFABb4TC1wrwiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjtnVVjtxQBmV1Zvgd7tGDQ/3wPvm39iSKAIWAyo8K7BZtZqlENyCqxW2gcyddigMQEKWU3zhaxeIq1FqkPHix0tUpPH946gpuFxEs22nN5+IXu96LyfA1is9GYjEISeqUAsHfFPTtq1zqirZeeKRcoc5F9giBHYjUU7Cw+KYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gro7t4v8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c32d934c2so2076510e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718977372; x=1719582172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ok5aSN9mBgn8wrFYODhxaqdyy2yPpSIKzg8yKMrNqU=;
        b=Gro7t4v8IQ1tvOAerQff5wO4SCPfoMGUkwnreo7DcOe5UmIQFKkZBF0JYyzYgJY9Du
         O9lu9SJwbcCfqOhlS5jzNM0A81tdNrB63xQx9iyTUUfIKSS7YX0IYqrwGeIwNFtl2Ocl
         O6O26Cu1jwU286u2H1PVTWXAwLI+TdemYeGWiuP7t9HVRw+ijNd9cIx45QHE1rte6Sbq
         VAlcgq98LX1ZL4lPLdxzOo9WNzVQkVpAaC30DVdFr5vE1mPnxEL+uJElrjdy+kkHK/z6
         QFDHVoJa+I7N9cAFz7G6sszKMQbTe152cj7OfyDfTB9E9P4Qws9p32cpSCdPk9titY+W
         oJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718977372; x=1719582172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ok5aSN9mBgn8wrFYODhxaqdyy2yPpSIKzg8yKMrNqU=;
        b=KLR8yBP+YNuL7oI1hiAX+xeLE59DexrpnkGlR1ErjC/egZc2tmaJJw7j7MXndEe9og
         aLtqFHm6MJYIZ1H4ie5fz+jBxoNtNLZPtg36X7GI3UsoRO/mz4heOG7yq6jBDT679fEC
         w0jVWJnO/4eQcqGDtRDv7oucf4IQSJn6Xs3rp9RNBoZ75qBTGrF/70r6017isDzF5lmF
         WtQiN+AzUX5tGFSd77oGoIMTcpD+iyWc7HKKbyHmtABhhqCDWFZjYskctrlYUprOop4y
         DAV9G/I4qxYy+j4fu8w0JvzTL8gASSV9HXEMZgtc4LSEYvSIjpo/weCTzBNFLVUhWeuP
         7O0g==
X-Forwarded-Encrypted: i=1; AJvYcCV3QgejvGS0Hapfd7fv5dH/likAofMFAvBdbalwIm7Gfgxqmbmj5GShoSqR9t7mxLCjNnBIGr0+lALdxukdqhCxHQxo+N+SWMwguWee0Q==
X-Gm-Message-State: AOJu0YwrF/rh7YNFopC8FSudJP5dGzX/K04eSg7iqsB1bCscFCrFGGJy
	vOQOsRZ4J0omsOGFUS7Qhso/hheeuY+GaJaGC3P7uEzQjE79i1+2PXlrJDDFGr+hKZrU3EDNk2z
	f2310djJrV3wIQriQ35T0rNPwz23ADvNE0kYh6A==
X-Google-Smtp-Source: AGHT+IHdpPft57o1H9+QCaSg+D/jEJgjvnJh9jmVAke5h3wFi+XaALCQ+22Vt7cHkTOx5G0TXYGs34rFU5FJ7o52p94=
X-Received: by 2002:a05:6512:3582:b0:52c:dbc7:3d36 with SMTP id
 2adb3069b0e04-52cdbc73f0bmr285147e87.26.1718977372099; Fri, 21 Jun 2024
 06:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
 <20240527-shm-bridge-v10-13-ce7afaa58d3a@linaro.org> <20240620155335645-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240620155335645-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Jun 2024 15:42:40 +0200
Message-ID: <CAMRc=McKtc5CSJPhJ8syqukGnVC8MXuWdv0oEFY-Jaxi_GM19g@mail.gmail.com>
Subject: Re: [PATCH v10 13/15] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Andrew Halaney <ahalaney@redhat.com>, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 12:54=E2=80=AFAM Elliot Berman <quic_eberman@quicin=
c.com> wrote:
>
> On Mon, May 27, 2024 at 02:55:03PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The "memory protection" mechanism mentioned in the comment is the SHM
> > Bridge. This is also the reason why we do not convert this call to usin=
g
> > the TZ memory allocator.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-think=
pad-x13s
> > Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
> > Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/q=
com_scm.c
> > index c82957727650..86e26f17ca19 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -583,6 +583,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const =
void *metadata, size_t size,
> >        * During the scm call memory protection will be enabled for the =
meta
> >        * data blob, so make sure it's physically contiguous, 4K aligned=
 and
> >        * non-cachable to avoid XPU violations.
> > +      *
> > +      * For PIL calls the hypervisor creates SHM Bridges for the blob
> > +      * buffers on behalf of Linus so we must not do it ourselves henc=
e
>                                 Linux

Can this be fixed when applying? I don't think there's anything else
that warrants a respin.

Bart

> > +      * not using the TZMem allocator here.
> > +      *
> > +      * If we pass a buffer that is already part of an SHM Bridge to t=
his
> > +      * call, it will fail.
> >        */
> >       mdata_buf =3D dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> >                                      GFP_KERNEL);
> >
> > --
> > 2.43.0
> >

