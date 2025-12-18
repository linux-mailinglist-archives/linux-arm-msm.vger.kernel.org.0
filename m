Return-Path: <linux-arm-msm+bounces-85717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C6CCC891
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 16:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1426305B3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A5A339860;
	Thu, 18 Dec 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeWyc7MN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC343148C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071955; cv=none; b=tQydcDqKXe6j5e2d4/HGWrSNA/FGrUpB0rwctqHo2ibNDZDFM5MblMo+NN3kEnZAgq0wSuXSfHX6DRN9DmzsBEpXw+HKWn8k3dxDHNMj0LrcWhSBLC3GMgrVNJVL6i+PDIJ13g9f/n5KjuJkR8B0gvihb0+AxLXZWdqCeRtm+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071955; c=relaxed/simple;
	bh=mtJEaxRJ0pSaciF6SUw8joG1pAlhDTsgA230AZ93/YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3bOcPVTJptQuMclDZCu9vKoprGsB9Ev3OXvdqxDenb8cgxbwoJhKO8wUu+FRODY50dRZI8d/x/YprTKJhAWb/J3Th8CMoUIFVBp+/Ot6dYX705P/EVmG0387I+zGu6W4rBGmT8v6LOBVzLouA6jHca3yU68Vb9hZg0yIwora7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeWyc7MN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16980C4AF09
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071955;
	bh=mtJEaxRJ0pSaciF6SUw8joG1pAlhDTsgA230AZ93/YI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oeWyc7MNHd7xMNURlUMQSB2cKjZLIoO1fWwRQCKIl5mEiJEIRQG/wCJzkVujuOHwX
	 Tmm6USZvdic4Zg2DeI98s5v10XmOgitA0hQJDlfcqw1dttw06+NOnDuWGBZLogEDxq
	 E4SIgshvsg7CNH4BEaTPKF5B5MPlDu9rV7qETF3yki/2r+198/1bD/MbCdK+3ygiMz
	 NHnWwLof7mQP2Xj0lTyUc2jrp6uW55pGFcFR/hoxMtaFoE/eYjx4sFnxlmf2F2CrBn
	 MalY2IPKkYcos5DbyQwxBEiDHiuvV0y27BjyUVi36nva+tcxcjaDok+PtqDDvuEgPZ
	 y4FUjry+Nfe3A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38007fa1efbso3689891fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:32:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8/gqVf49w3EBvmKCxElsAE95rRAPO7MVDB9Fx7tytNu4Kn0F0/4//T3w+eIAR85fgMJ/q79+vuxAabwKv@vger.kernel.org
X-Gm-Message-State: AOJu0YzeuKrv4m7/JoTTEN91cDS/AA0CZQEzRHalOUfUgWT4G5v9CFCo
	Z1HPuDRcw8OgwQmCBRgxIgV4jXp9/il55iMqcigb6bZ2gE26gZ2CG+cGtSgMvSupkiWjGdF1qX3
	HyuKS9uFVOvYyJsmrvneWVsQb5vhWgDyg5tseBpB1mg==
X-Google-Smtp-Source: AGHT+IF6LzK0HuPfeatnJq9XbiQ0+26VjO0wEIfZhLGkpB7aa4MhNQWClndM2CR4LTEg/jW+unYGn+Uqi4sUq1ySSKs=
X-Received: by 2002:a2e:be22:0:b0:37f:c5ca:a0ed with SMTP id
 38308e7fff4ca-37fd087a5a3mr65865261fa.26.1766071953627; Thu, 18 Dec 2025
 07:32:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org> <c15e156f-fd11-4d38-98c0-f89b78044407@oss.qualcomm.com>
In-Reply-To: <c15e156f-fd11-4d38-98c0-f89b78044407@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 18 Dec 2025 16:32:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeDQgDzjRDVodJhPpHye6LYLmigsHhRjDqTK1Kn5+EhqQ@mail.gmail.com>
X-Gm-Features: AQt7F2oR1ydtP2acJpQiF8tSxBxoIBWtjl_WKVgiAkSvnymIweDphsjTepEVa7M
Message-ID: <CAMRc=MeDQgDzjRDVodJhPpHye6LYLmigsHhRjDqTK1Kn5+EhqQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] crypto: qce - Add support for BAM locking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 2:03=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement the infrastructure for using the new DMA controller lock/unlo=
ck
> > feature of the BAM driver. No functional change for now.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/crypto/qce/common.c | 18 ++++++++++++++++++
> >  drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++---=
--
> >  drivers/crypto/qce/dma.h    |  4 ++++
> >  3 files changed, 56 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
> > index 04253a8d33409a2a51db527435d09ae85a7880af..74756c222fed6d0298eb6c9=
57ed15b8b7083b72f 100644
> > --- a/drivers/crypto/qce/common.c
> > +++ b/drivers/crypto/qce/common.c
> > @@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *=
major, u32 *minor, u32 *step)
> >       *minor =3D (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
> >       *step =3D (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
> >  }
> > +
> > +int qce_bam_lock(struct qce_device *qce)
> > +{
> > +     qce_clear_bam_transaction(qce);
> > +     /* Dummy write to acquire the lock on the BAM pipe. */
> > +     qce_write(qce, REG_AUTH_SEG_CFG, 0);
>
> This works because qce_bam_lock() isn't used in a place where the state
> of this register matters which isn't obvious.. but I'm not sure there's
> a much better one to use in its place
>
> Wonder if we could use the VERSION one (base+0x0) - although it's suppose=
d
> to be read-only, but at the same time I don't think that matters much for
> the BAM engine
>

It seems that we can use VERSION as well, so I'll change that in v10.

Bart

