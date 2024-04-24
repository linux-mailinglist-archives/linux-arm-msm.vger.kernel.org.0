Return-Path: <linux-arm-msm+bounces-18441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CB8B0A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 14:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1562867D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 12:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6B215A4AA;
	Wed, 24 Apr 2024 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6GKHJtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8A142E70
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713963111; cv=none; b=S3U6WC4UdZH0Udkho/C15v6lFnCvZLdC5bmwCgt7R1beHRaj4/VAYRNYPwNBlPlaTMfOobgu3tvz9xN70rkU10YC8wbu+xi0GgHUsgjBfvXx3l34cVS7EqVIpVN2LbvolGK9y+WMDiMzsqjkxHybkDzA3ihF04K0WmOI1ejsQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713963111; c=relaxed/simple;
	bh=uf8KdRTFjaykwcHvBAXxOh8kxKdvQ5fIlhceg0rMfEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTxs99EgUJBNWr72QPDoog9bo3hvR0w2knqKWZdj3SUAzpUvfUA4NypZGPq5c2iHrwoGZ3fMPZrAIUYcOfIEiYyqZAbQW//S6FsoJvCf6M66o3fg8Ua92qvfGx0jvKFt6ifRQtnEdOSieA3v75n1l5/H9rA0iNt2km+HC3nXf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6GKHJtq; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc71031680so6381534276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713963109; x=1714567909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
        b=v6GKHJtqAV6p0+P1TmXzhwYfUOgx6LxWIkaeJ7e9PzAKSXW1vekpuhgLzjqHofyrWh
         rBKiUyly4J2J0GggPUamMpAM0Q2g3DnhUAFCaMuI3930Pmx6WYgWrL4ji1pcltkCnm2J
         IyCWZEBnD4TXdTPakRdBlN6ub2iZd69o9dWH5qkZiceNWuvvs+g8a38XY5iniN2ovnY+
         FJXWjj49TdNHouyOBlzqup6Ic/vOCK5t1GMcDLWktG3+lM1nq0HJ5yG4FlwONQyRcYzh
         BgXFSn/AxVPXkEO/jzHxq2pLFw+503tzc8JWkg384NgsZgxbz611jH/iPrUVEewdinSb
         Ypag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963109; x=1714567909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
        b=LX7mgZk5uexrL6XQLGwMN4nFapMcE1HDw9rFTCFlDwnwlAzGoV6GTa95EmCdsBX3ud
         a1irNlE9GGb51LJ17PUMo8sA287e863PKV40n+Q6vbAh2owVx4BMCRjICilea43COEtK
         50NC71RSi24CchPZ02i4kT4V2tRu3w1uIPMAWm82hMAM5RagvLLgPOc8vAdwrl4p09Cp
         2Os/RezoZpiIglNulSXhXISiariOHm2PmFZUPtR8/jI7IPc72/vHUYUbIbtRRdLLi3wk
         9h9b3ZdQBcf76CJT3QhBnqJN8+ubw4qcjed+QRkaguwfaqRuGCkT2V2ibsKTPkhglZl3
         sAgg==
X-Forwarded-Encrypted: i=1; AJvYcCUWpHYgzFBjVQJYGcJa3f8e8GLw+D7e8oWdB/RSddJi1PwKwGhGDYUatkyp8UcCIumQlBKkQ2vTqccStUpDHarS7bm/OcCwat5isRk+1w==
X-Gm-Message-State: AOJu0Yy7LDjqJopuOnfBFVsYoc61RjafWtdT3XNf63EOA91CXHGxTXQi
	wU5mmyy82SOVI/bkCXdc5YJ6jO8B9LY8zpsYFX19Fjxd5bCSh9aEldMS2oGK74Qnbw1rnIcG+78
	WmA+8C5VKdJKgRMdWJ83mpFP8P5u98kUzmlYTJQ==
X-Google-Smtp-Source: AGHT+IEtNwcLByaURm4S0W2WX61nHBOa/bBuBHOAAc6U0o1qOXu8yZcg3XBDxOP5Yl1UNJOhL+Nqv3uIUQoTgcemjRI=
X-Received: by 2002:a5b:a87:0:b0:dcc:f0a:e495 with SMTP id h7-20020a5b0a87000000b00dcc0f0ae495mr2062785ybq.3.1713963108899;
 Wed, 24 Apr 2024 05:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org> <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
In-Reply-To: <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 15:51:37 +0300
Message-ID: <CAA8EJpo=BP5wrFoXHZhAgc8MKf=pV5B8Psp=NrSCr=5mVh1bAA@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] drm/msm: import A6xx XML display registers database
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 at 15:21, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Mon, Apr 1, 2024 at 3:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Import Adreno registers database for A6xx from the Mesa, commit
> > 639488f924d9 ("freedreno/registers: limit the rules schema").
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
> >  2 files changed, 5198 insertions(+)
> >
>
> FYI, this will conflict with a series I will send out soon based on
> the register updates in [1]. Is there any chance to update this before
> it lands in msm-next?

I'd suggest updating the XML file as a part of your series. I've
already opened a MR for the display changes to be picked up by Rob.

> Best regards,
>
> Connor
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28883.



--=20
With best wishes
Dmitry

