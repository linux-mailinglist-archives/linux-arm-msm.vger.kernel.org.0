Return-Path: <linux-arm-msm+bounces-4493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33453810723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 02:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6466A1C20BA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850FAA49;
	Wed, 13 Dec 2023 01:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPPzw0A1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D5F99
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 17:01:15 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cdc0b3526eso51575787b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 17:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702429275; x=1703034075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HfANxUWC3WxKXWhqphH39nW3rgCcomC7MKMCC29Qqg=;
        b=qPPzw0A1WklTkmCpG03AqXticzddPep3x4ETMERij+Xuw+VASBOo3UYgxs5FqobuZa
         aoX4nIdcBsKAbWQALB1ZjPR0ej6s6hPdXLixsURFItIELJDe5/a5GsTSrrbh3Yx1s5P+
         mG4ZnuYXDSQG5IsfmGvGIBPdMeOWdmRfaqslXYHR0yc0tenDEG5doTgxsnSlD8XmXA1H
         gGB2OHhNloAc65wESSsy7TcXVHd7i9t5T7H5pH9ec9AhOLLclMZzj+rQw6VvttQwKUJ5
         78No0guyRsMbQImd80tfZl0Bd+3SfFTRdlpIn8NMQiXTecuSifnGi0j9Px7JwCJzmWs2
         K0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702429275; x=1703034075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HfANxUWC3WxKXWhqphH39nW3rgCcomC7MKMCC29Qqg=;
        b=cHdfgw9PYN9v5pKiFpk7t4GBVL9f6rXqzsA6w5DYdsA82zSI0ikFAAD1g9MGqhZz02
         csoPgaeQQuTxc0wppvfcWJf3ViauRk9shvPv+KlmALGhAKUV0Rz9VXgYVDC3066kY/R9
         zDQL02IrhFsYZf3oKdP9F0kqktQgIvGDItucqH+1001inoMAK+TEpjWxxBRnsWYM3kqN
         bV1EP1vsuXJoYNq8Pz7l23Qlm38abDN1Dy1vOsEKZzFD1W2V3QRf65v86O4EsvLAP/nB
         wJe3gdZwxVJGetxc8E/E8COZ/VYz3VQO4wd0XRN/m17Vmg8wA3D+kFtVQa88MDQe/Wqy
         N0+A==
X-Gm-Message-State: AOJu0Yz2jzoBiAqKhup3u1U6H2oEYRl6zk/9Ul0gNSXwaYGI4RdoNkG1
	aVtu2AyIqbozLlsMlm/jcI7h7o1T/PsHtU27ZGoJvQ==
X-Google-Smtp-Source: AGHT+IHVi83Rrr1q31yucvfH4NV5e9tFDr/5T72ZOzl0h1OKhAR2Zyot33DCF6/ocWofbTJY3ircpd94xktl+xNzs9c=
X-Received: by 2002:a0d:d182:0:b0:5d7:e6bc:8641 with SMTP id
 t124-20020a0dd182000000b005d7e6bc8641mr5867867ywd.41.1702429274720; Tue, 12
 Dec 2023 17:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213005728.53060-1-dmitry.baryshkov@linaro.org> <d485c123-4dbf-ef59-4566-bff84cae516a@quicinc.com>
In-Reply-To: <d485c123-4dbf-ef59-4566-bff84cae516a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 03:01:03 +0200
Message-ID: <CAA8EJpoeP-6-oPnruK2LA0=E5ga1Uu9LJi=xaQBeRh6+vwDBFA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: move CSC tables to dpu_hw_util.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 at 02:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 12/12/2023 4:57 PM, Dmitry Baryshkov wrote:
> > Move CSC tables out of the header file to fix following kind of warning=
s:
> >
> > In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
> >                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:5:
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: =E2=80=98dp=
u_csc10_rgb2yuv_601l=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: =E2=80=98dp=
u_csc10_YUV2RGB_601L=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: =E2=80=98dp=
u_csc_YUV2RGB_601L=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 44 ++++++++++++++++++++=
+
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 44 ++------------------=
-
> >   2 files changed, 47 insertions(+), 41 deletions(-)
> >
>
> Strange, I didnt hit this but change LGTM,

It shows with W=3D1, maybe that's why you didn't observe them.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



--=20
With best wishes
Dmitry

