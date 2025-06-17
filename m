Return-Path: <linux-arm-msm+bounces-61613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B6ADD0D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 17:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C515F3A2B18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4852DBF5F;
	Tue, 17 Jun 2025 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIao7zf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4BB21C179;
	Tue, 17 Jun 2025 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172328; cv=none; b=P0qzd+944w6T7Zqu2IIE1S8mfLoMhgIGsykUB0ixA1vgM+7q0jEFzEJlJjh0PtiB/DRpgiYldwfhHs5qhTEw3eF7a8PA4vkxaXmlQsYbZglnjXQ57yv+kDiJNQyS7L+67ywzFPWmHX/4BrjUqoO7sArMxj+u5hLHP0m5g5uiXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172328; c=relaxed/simple;
	bh=aNMSlYMqBh7TGkZwIvZm9sYZFPP2n8ZRe16P/iTVhJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADbc5MGNT/N6cgWdxyedadouIHpjQUdyNhHm0/ukFKpLERrUM0Bbcfp4wg1Tlr4kdFx+MrGVrUBMaGAyAhvT5bzdrTUm3k46IkUa3B/e03wIVL2mHnF2C3o9haNWn3KZ6wjJ9h9UycrFbjvbqRxb/g2MiPkCnWATm4jKY83YSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIao7zf4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade58ef47c0so203131866b.1;
        Tue, 17 Jun 2025 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172325; x=1750777125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFMbIK8XdkubBwMqAxMT+AE6lntMwC1zhKGYkr2V1/Q=;
        b=RIao7zf4QsZDfaDHcQu4Z4758i4indZhpB5pDkhoz3dUtylnSwLYsLC61NNGT+zDMA
         Q0VVhSV4sH7/gOelhcdcQRBefriyGf151r/li0Fo2SbKyY7qjyykDIm6Xj9AqxVAbcHN
         gbaEgYm7P9vVgJ7rc2VhitQrqKdnL2nvPMHlj8mJv+GLaxIjA1+r30S4/xUk2oqheqML
         /69jkMutD7GeoGxJ/vxpaEvnlOECYdW8ixGHG8PMDqP7vTnRMCnwy7zQb+mc8aCUqQVU
         M8U8wzpdHozzMoo5TuNIhLZPJKm0ySwnXL1AhgnIbzNtDHZoO+5dxqnDgCq6EyHxjASx
         PBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172325; x=1750777125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFMbIK8XdkubBwMqAxMT+AE6lntMwC1zhKGYkr2V1/Q=;
        b=ueEYb2bfpouZgI07/PlbJQUwehcwHi2FrL/N3gRCHAdAey6i5pmgTKp4+alcfNIlsi
         cpFvqOgTVv2Dl7rZrZLkzlYUWNbKbe9+TBhTnKdXs1bZu60jC7Ue+XqwM5baJ52Ns7LR
         jL9W+Wy0BaZv+h4VgLE+qaAv9pq25cN/1rwu8GHxKDIOGNBVSXh/bwlYzhIZ6UlVhUbB
         8E03KVbbQnD0OkwiZfiIUs3x0QrdE7jqtYup40llXqvnlaPjqwSq49gPNH+QV9tgB2dx
         mQ2tza5vbyApBT9ooiDH5pDQuTB3PjIaxhu3OM4Vz4QsJq21ZT/KcN+9nXGjuuPmWwIE
         86Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU1zuWt9zWzSW04jSAk3r8PDuQs58cfRzsn6iCFeHP4o9H4yyJk9HVJjCPEmXSVrv600qzbmjXftcipplp/@vger.kernel.org, AJvYcCUnhk4XFQxaTm0cfpXQd17u63Blwj8JeyNKwlxsDckCY9mdzEa10scnh88Ha+yncicA8k4vtET9dIkpM1fq@vger.kernel.org
X-Gm-Message-State: AOJu0YxuljwBSxW++HXu65hZEcalWYTitpoPmhRV3DXsnkQzs9lg2KCs
	WPQ8P3MrIF2KFwHXNV276qHr/5IB4tqofRKojoa1/rO0nvDlGo/elpVmL/bwE1vpoQZV4rmyoxq
	H8l5sQ3UjXyWRyDdCM0PO3oL9Ja5fbZM=
X-Gm-Gg: ASbGncsMyPStklaZRO2sAFF32cWmv6ckK0MYPeAzc1yejVOyQcI7nELDkhUIqbe4oBm
	r3FmX5NoeEDsmCeHOmcTC87lAigsIyAxHQjJFB3VUVSjKNXncqfyvvCqLaegqE65E0yHYiQLfeJ
	T1UonHYEeuMsdzPeDH484DfeF79P/Ka5NyjMFLaySl6Q==
X-Google-Smtp-Source: AGHT+IEETojlBs4zeufKnNAfPKmtN/B8jrW05fqGi8+W2dBQjH4hXvU3OfIrvlGAII9WXyCqbuomLNHiFkYPUz/b9eM=
X-Received: by 2002:a17:907:6d0a:b0:ad2:27b1:7214 with SMTP id
 a640c23a62f3a-adf9e1d7e73mr1415402966b.17.1750172324179; Tue, 17 Jun 2025
 07:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528175943.12739-1-zxue@semtech.com> <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
In-Reply-To: <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
From: Aleksander Morgado <aleksander.morgado@gmail.com>
Date: Tue, 17 Jun 2025 16:58:30 +0200
X-Gm-Features: AX0GCFuY-iFnlHE8Oy6B-92n0XRHmRePA1s_4SqNR6ji4ozUguRonyfoH8Ay69c
Message-ID: <CAA3JqEfpuwn5OL6SasVGRU82+2+D5nNXk-WALzcnWnuz9384kQ@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Adam Xue <zxue@semtech.com>, Thomas Perrot <thomas.perrot@bootlin.com>, 
	Aleksander Morgado <aleksander@aleksander.es>, manivannan.sadhasivam@linaro.org, 
	slark_xiao@163.com, johan+linaro@kernel.org, quic_vpernami@quicinc.com, 
	tglx@linutronix.de, fabio.porcedda@gmail.com, quic_msarkar@quicinc.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imocanu@semtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:27=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> On Wed, May 28, 2025 at 10:59:43AM -0700, Adam Xue wrote:
>
> + Thomas and Aleksander (for EM919X related question)
>
> > Add MHI controller config for EM929x. It uses the same configuration
> > as EM919x. Also set the MRU to 32768 to improve downlink throughput.
> >
>
> This also affects the EM919X modem. So I want either Thomas or Aleksander=
 to
> confirm that it doesn't cause any regression.
>
> Rest looks good to me.
>
> - Mani
>
> > 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
> >       Subsystem: Device 18d7:0301
> >
> > Signed-off-by: Adam Xue <zxue@semtech.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/=
pci_generic.c
> > index 03aa88795209..9bf8e7991745 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em9=
19x_info =3D {
> >       .config =3D &modem_sierra_em919x_config,
> >       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> >       .dma_data_width =3D 32,
> > +     .mru_default =3D 32768,

I cannot test this now, I need to look for the EM9191 that I know I
have somewhere, but this default MRU update feels right. Hopefully
Thomas can verify.

