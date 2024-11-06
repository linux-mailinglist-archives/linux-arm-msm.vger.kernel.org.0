Return-Path: <linux-arm-msm+bounces-37147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112989BF22F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 16:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430ED1C262F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681F6205E09;
	Wed,  6 Nov 2024 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifpKDqTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879062038C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908152; cv=none; b=TMxYWwepLA7XyVonKekCnV9IX7Y6J/K2J2YVMJ7Yf4QETb2KQUPR5Jjk7EDQm8aK66OTiYMvxz5r+Pr1Uw48WY22FzqLzTcW3kE5k8WB60Wp4z8fjxhFAxD2Rl0U3I0XH3BD1Mwpvy+O3Mj+Pe+338d/5dtz8u/eA+BHXmlMaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908152; c=relaxed/simple;
	bh=hVFUihgc6QnT1Xq1fEruAaXhETYPBpDfWfSixYIRYIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ppsy+QBnNokm/YLbhDD37QcJZlGKrrLJFOhUJSOCHX3PVCtHJ2azF7xKkqZVfHgwK/+Yar48dw6w2np1M7mCKbkvxf1qC3Rjw9uN5rdRLL0SDYJtZ2OH0dTH83+gSSew/lKiWHbEaPAc0LbbaRZGDiWxDW5JE9ZM8F/CFp3f7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ifpKDqTB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a16b310f5so1078157366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730908149; x=1731512949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPH4C+vsdNY0v9MzcBPeqyGD66BVdCTndzKOwNg3m20=;
        b=ifpKDqTBv18cn2nXsbM/siAChx4Zj95etoqs8AaaIJpwPzKesVtnyEIfLZR4GUlpbo
         Jg2nMLDMJ1JF7XD4Em1LIhbghG/V+tWqm0KjzUftEMuDvfpLoZzD79jGRy6TgyXJfJ1A
         2NUr5rRaWpck6l1PiLYAfliR+3m1X5U/AM8fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908149; x=1731512949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPH4C+vsdNY0v9MzcBPeqyGD66BVdCTndzKOwNg3m20=;
        b=tthWhpqwmA2OGI5ts6kQAsVGYVy8dyyVPLM+j5skKtgSjzk0UJrTp1fWZFyF4UpJr6
         /0BOGhJC/E6I1n8o37yrZIvojAZMNc2dIekxXAhFn569/oXkiGulqIRaQVOLy6q4hAFv
         tUnReDyP0isPT830bHqA9vZDCjaOVc0XjHJQJLiyF6pNIjSN5Y9/H/8ZcEm6YgqoKC1X
         5dnSTQFEURP8IvWNmfj6HGFirLcRGqdWK9R8ReD26UOqoYLACM4B90iU5o/25ZO+ZG4u
         USID3TTvD7KBFbCFGCLx+Nr/LIvCGxfi56y0awTn7y8OUZll6tEF8UmZsmkpPaXY9viG
         HtHg==
X-Forwarded-Encrypted: i=1; AJvYcCXGdGWpFoYGDEoIqnMpx5d0YJYOLqHrXI4Demh8PcTtbTccyjIVPWMC+8pJHPqxPPcSTAT7N5+iRuKF3Ggl@vger.kernel.org
X-Gm-Message-State: AOJu0YylQ16ri2jIcbrMMboOAIWZaucaVDccZD7W5QSPwHIJd60gJJjT
	HcSdOnjBQoYUSdUC1O9G/yT7GDlDcfIe5zfn490idz0CPhfTKI75VtWmosfQ+P+XSpy1Vns1Jh4
	=
X-Google-Smtp-Source: AGHT+IEYHdEAg9g/4lzIrpfQDAIoGPHN+zclwdHmRXh05mEKf4Zn4ak38pwOQRYUOb4yqtRWGVwcNQ==
X-Received: by 2002:a17:907:9812:b0:a9a:49a8:f1fa with SMTP id a640c23a62f3a-a9e508e9870mr2149404966b.23.1730908148623;
        Wed, 06 Nov 2024 07:49:08 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f7977sm299013566b.140.2024.11.06.07.49.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:49:07 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so13786a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 07:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXD3LNNVd6qBlk+She+5b8322wIpbkiG2hKo9fbBytT09BFcS9gOaDnPdP9LsUkQinrvz7ijFPHeLMPIUUp@vger.kernel.org
X-Received: by 2002:a05:6402:206c:b0:5c8:a0b1:9c4 with SMTP id
 4fb4d7f45d1cf-5cefbcb8e25mr22907a12.6.1730908147253; Wed, 06 Nov 2024
 07:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
In-Reply-To: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 6 Nov 2024 07:48:54 -0800
X-Gmail-Original-Message-ID: <CAMfZQbx6-11k1eN1FC=_kRSgsh7FbTp2uvk3ufh+gOyhvxgEGw@mail.gmail.com>
Message-ID: <CAMfZQbx6-11k1eN1FC=_kRSgsh7FbTp2uvk3ufh+gOyhvxgEGw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] media: venus: Add hierarchical h.264 controls
To: Fritz Koenig <frkoenig@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stanimir,

Would it be possible to get this in the 6.13 pull request?

Thanks.

On Tue, Oct 22, 2024 at 10:40=E2=80=AFAM Fritz Koenig <frkoenig@chromium.or=
g> wrote:
>
> v5:
> - fixed formatting
> - included reviwed by for patch 2
> - Link to v4: https://lore.kernel.org/r/20241017-submit-v4-0-d852bc7f7fdc=
@chromium.org
>
> v4:
> - addressed feedback from Dikshita
> - included reviewed by for patch 1
> - Link to v3: https://lore.kernel.org/r/20240814-submit-v3-0-f7d05e3e8560=
@chromium.org
>
> v3:
> - dropped reordering patch
> - updated cover letter
>
> v2:
> - cover letter
> - testing methodology
> - Signed-off-by
>
> V4L2 has support for encoding with hierarchical frames using the
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
> specifing frame references needed for temporal scalability. Encoding a
> single stream with a single layer allows for the layer to be dropped and
> the stream to be decoded without artifacts.
>
> ChromeOS is planning to use this feature for the L1T2 web standard[1].
> This allows video conferencing apps to encode once for a clients with
> different performance/bandwidth capabilities. As the application is a
> real time encoder only P frame support is added.
>
> The ChromeOS test framework ("tast") was used to verify that no
> regressions are present. This was done on SC7180 ("trogdor"). These
> patches were also run on SC7280, but not with as an extensive test set.
>
> Verification of the added controls was done with a bitstream analyser to
> make sure that reference frame management is correct.
>
> [1]: https://www.w3.org/TR/webrtc-svc/#L1T2*
>
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> Fritz Koenig (2):
>       media: venus: Helper function for dynamically updating bitrate
>       media: venus: Enable h.264 hierarchical coding
>
>  drivers/media/platform/qcom/venus/core.h       |   4 +
>  drivers/media/platform/qcom/venus/venc.c       |  71 +++++++++-----
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 126 +++++++++++++++++++=
+++---
>  3 files changed, 164 insertions(+), 37 deletions(-)
> ---
> base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
> change-id: 20240814-submit-05880a074377
>
> Best regards,
> --
> Fritz Koenig <frkoenig@chromium.org>
>

