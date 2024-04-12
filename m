Return-Path: <linux-arm-msm+bounces-17349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A338A33B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 18:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C271F22E63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ED314A08F;
	Fri, 12 Apr 2024 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SH4ffIlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29D14901A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712938889; cv=none; b=F049xBZgP57DjsMkDosorTAxjpiw+05aniVttfK2DKf/I693ClE4A3kiE+8FIQ6SsZwGGLtm38B2nOiZXvaukxANIP2l19kEvBgBakrlkQCGgpgo8tivhShm5oQmhawXW8/bxeavHWUgf0kTElGkPv3w9Z0OOnf3bTHBYMfRFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712938889; c=relaxed/simple;
	bh=/bBHf8+LhTSqvgNm4MM9zHrseS4i+FeUtlu8k8/NNp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDKQeurBuH7VXfHUQaqLjVOTQ0hCVabqkZ3C8T1kZXjBX8+x6Y4OsEDAbiKBfbDi3a4gK7cuDQKs7NS5nxNcJLaEzVxvdMaVVtoDlOuHQUTD8JJR0tacmC1vZSm+Jfhm599XP6+h0rKvv8TLtsfDsM6GPMrS5x8u2oUYtfU0FMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SH4ffIlJ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso819019276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712938887; x=1713543687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1QDHavbQQqC9GC6PjPIJvqoa4bSQDzx9RT4mlUCMRk0=;
        b=SH4ffIlJgdxPBfX/uf10HIlaPuQoH8KQCpIWonqXA2Xxm/3i2jcf7Kqpph/TXPjMfW
         cBB9KEnUl6AC8BmcWyGi4tp/tcpdVQH5SquWRnFqS5XaLlCayEThS45c3irsOgWYo4cm
         eJbR/ABn2CQwz1Ggb+ltSK2g+S/l+diMNLM6EweXsRnSo9ke6ZGPKJwGNi50luM5Fw+M
         hDedPoALa8RcnJrx7Yqkkcy3cN5QRRtHbZ/STsFv74pa5ukjYF8+jIkfdOMOGQXA+l2i
         Z52N5j72PLxBIZTVnq7iSXFLQuffJrijun1P3CXsSadu+cZRkmhqfpEsTGkIANPq3P4E
         zAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712938887; x=1713543687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QDHavbQQqC9GC6PjPIJvqoa4bSQDzx9RT4mlUCMRk0=;
        b=rq2anBnkEvYmphy/OKUgeyqVL687GErWBGUbDUsE48kJxFUG+VYyjjTIth1UvLMYoc
         2GY8EcBxu4GgxKcay+8E7YAoNOQcemxY3X9P3RA3y+n4Dd6ceTMaOpe5B/QpcSYQ5VI4
         YdQPgwj1XTxfvaauF/lORfoIDx+qWt4qG50tL/xMeBk/RsmufaQIjcsxVGDjAqb32s72
         zhKhWXSOiLvoEHO37FYo4Vozewlra9NjtvlIihOz/onf00bsyhd4nHRmkEp//4fQsBeE
         BGdPRejClOBzFqUxHahan0H/sCx3DVu6kPB9A0oE11PWLyEOX/OvAE9uyRwhDlCfUz3d
         4V9A==
X-Forwarded-Encrypted: i=1; AJvYcCW3KASOZNjVuI+WC/pGVd3Cbtf9FuV4PfxtTgcU6IVtBddiWooZUXg1CjNfzlb7nSBa1icC1rlYJcOrOZkwoifaz/bQwIXZREnweWFsmw==
X-Gm-Message-State: AOJu0Yz9FsnlE78N2P+di2ZtViqOT7s3dafbjGHfaEUq30jIqa0EkyjR
	RCvCNo4x/lt+10UpistjAPqMgh/YSqbQi0dz+j7KsirFKhl4ePrkcTGjJM9NEmxhKcJbQOw02hn
	6/twQ+Ro997Zf1pvKzsbGpVYrgyjVfPCJXQ8nyg==
X-Google-Smtp-Source: AGHT+IEz3OKXrWLV/ZvgH28LAtC8lxPsu1c1fGVznFCJajSMmkV0jqGzuKxeinO2n+Acyg6VdAJNuyazJ5Qz39MvgvU=
X-Received: by 2002:a05:6902:e13:b0:dc7:4367:2527 with SMTP id
 df19-20020a0569020e1300b00dc743672527mr3787576ybb.49.1712938887518; Fri, 12
 Apr 2024 09:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com>
 <20240412-pm8xxx-vibrator-new-design-v10-1-0ec0ad133866@quicinc.com>
In-Reply-To: <20240412-pm8xxx-vibrator-new-design-v10-1-0ec0ad133866@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 19:21:16 +0300
Message-ID: <CAA8EJpp-awdTyfngeYyJaOObOWz=UCSK9U08TfFPA0v=8Naz=A@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] input: pm8xxx-vibrator: correct VIB_MAX_LEVELS calculation
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 15:36, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> The output voltage is inclusive hence the max level calculation is
> off-by-one-step. Correct it.

... while we are at it also add a define for the step size instead of
using the magic value.

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Fixes: 11205bb63e5c ("Input: add support for pm8xxx based vibrator driver")
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index 04cb87efd799..844ca7e1f59f 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -14,7 +14,8 @@
>
>  #define VIB_MAX_LEVEL_mV       (3100)
>  #define VIB_MIN_LEVEL_mV       (1200)
> -#define VIB_MAX_LEVELS         (VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV)
> +#define VIB_PER_STEP_mV                (100)
> +#define VIB_MAX_LEVELS         (VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV + VIB_PER_STEP_mV)
>
>  #define MAX_FF_SPEED           0xff
>
> @@ -118,10 +119,10 @@ static void pm8xxx_work_handler(struct work_struct *work)
>                 vib->active = true;
>                 vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
>                                                 VIB_MIN_LEVEL_mV;
> -               vib->level /= 100;
> +               vib->level /= VIB_PER_STEP_mV;
>         } else {
>                 vib->active = false;
> -               vib->level = VIB_MIN_LEVEL_mV / 100;
> +               vib->level = VIB_MIN_LEVEL_mV / VIB_PER_STEP_mV;
>         }
>
>         pm8xxx_vib_set(vib, vib->active);
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

