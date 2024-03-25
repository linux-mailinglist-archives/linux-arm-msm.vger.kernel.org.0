Return-Path: <linux-arm-msm+bounces-15066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BCD88AB90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74DE2C1ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EBC12D761;
	Mon, 25 Mar 2024 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XLLBaugm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76812F385
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383579; cv=none; b=VG98Y0AXrRplCL3ZUl6RcgkTwZ3rzyYkvn7p+jqk7oKh0J7xKW0PXBrWrouXJXpVUeJslZyVbnhvPxzID9mwN1EYWenL9faBxsekNSvUmR5ITitP+hElLYPBwkQk6MKiNYyaedDZuVxj8UBPh2KfnDLKQ5agyQz6NshYably7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383579; c=relaxed/simple;
	bh=uh9WFKIeWkaAivfeZSQMhbdOFpPDb/6h8qrwur73QbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fv8LQajGnTr+edHLo/+nREuUiEb6lNuvWzPss9EKOV26lMMlrKoQvpnafpWUY90HmUfaYrvfoP/YFlS7OJYmTXhOTUXn8g9irs2engIwtdLwN9FN1Vtp3zPdxyUIFrCx+xKBFPMFFaL5ghQue7nTtGt755r/DuOMIEopJXPAjJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XLLBaugm; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-430ca04b09bso33681571cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383575; x=1711988375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipKnULZuL+tAFscQ7D07riaZRlX7/8LgeP9Tufvdjpg=;
        b=XLLBaugmiPhoNGtKG73uPzqJiCtlYMpyH4dUevRSjdhxmykhJTTypVfEsU/yZgsMGV
         WJZ+UxEy7BnWNSg7QGhxdBl+6uxr44ZqX6Fg0M1fr+zfpQMP4BAozvxGeGxUVTubgt4D
         U+d+WQK6R2mTuERnuSzeWhx97qTykJBGXKiHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383575; x=1711988375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipKnULZuL+tAFscQ7D07riaZRlX7/8LgeP9Tufvdjpg=;
        b=VXYOPTLyAmSlGsrmGxn+8yFlicFY3E/eyBcvFO7paZMbQxwx9ed6pFMyKcpMTWk2l1
         SuqwHWKnAHIArwz1tzeXEi7g1apSzxjzb1KcVlEhi23TxC2CBY1mzoqEJyyLOf2ycA1N
         EVqELwT73+QiUlV/Xr+m4d+pc65LfJXT/eVnlflcVEloMR/1hohGcQmoEuJj6iqiGZ1z
         1Yf7Ro9a9fjLkj0uSn4/2hJpm6w4eQyTcq2YPqJISqfLFp2dTFK2+A8msLN2jA0r1KQt
         1CChFovPCslyVANdMAs5Oqu5JaX4dWqVoDSDHTgMEs4WjchDS3cnvXLsaCxA0ZbeqGpx
         udfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+e4HZvv7vlMgVaGAE94S+fExar68FcrLDjdUlOUZW7dY6XXrVEmTjhtI2rl6ZWdisNci/jmf3AXuYQNa6sWwbmO/E2bL7YG0rK3h0w==
X-Gm-Message-State: AOJu0YxC7kCoVi8NfEju4z/vSz6jGK8BUvUUFfWLig0hh4A0nFm7+Yri
	ox1dD8N82cRuXmC/A14L16Amsb+QsrSmCEzWnJg1Us6m7BZGWw502F/OYyIk4E8xlKCJosvIasA
	=
X-Google-Smtp-Source: AGHT+IFS95JMiOi6587/zRCax+MplR1Pc1kxELnX4RmRLFoFuSZ9TMPX0aCegZM3PndySdh2aUg/HA==
X-Received: by 2002:ac8:59d4:0:b0:431:5aa1:b6b5 with SMTP id f20-20020ac859d4000000b004315aa1b6b5mr3304126qtf.37.1711383575373;
        Mon, 25 Mar 2024 09:19:35 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id a5-20020ac87205000000b00430bd60afa5sm2727568qtp.48.2024.03.25.09.19.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:34 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42ee0c326e8so413691cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGSkSddPl2GRMjUqDqhV4tRRR2F+dCf9BK/o2YsIg7wNoQS2KfKJ/4XwXm4fYoSZyt9ZSQo4WMCGITn5+945a4LGYnxUm/vmjliA1gCg==
X-Received: by 2002:ac8:5c0f:0:b0:431:1e00:996a with SMTP id
 i15-20020ac85c0f000000b004311e00996amr1088763qti.27.1711383574002; Mon, 25
 Mar 2024 09:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-4-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-4-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vc-oe=JVJmg4w50VB_-AyxNoWe5KotnXPzrXUfgqhpkQ@mail.gmail.com>
Message-ID: <CAD=FV=Vc-oe=JVJmg4w50VB_-AyxNoWe5KotnXPzrXUfgqhpkQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: Initialize struct clk_core kref earlier
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hik

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Initialize this kref once we allocate memory for the struct clk_core so
> that we can reuse the release function to free any memory associated
> with the structure. This mostly consolidates code, but also clarifies
> that the kref lifetime exists once the container structure (struct
> clk_core) is allocated instead of leaving it in a half-baked state for
> most of __clk_core_init().
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9fc522c26de8..ee80b21f2824 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3959,8 +3959,6 @@ static int __clk_core_init(struct clk_core *core)
>         }
>
>         clk_core_reparent_orphans_nolock();
> -
> -       kref_init(&core->ref);
>  out:
>         clk_pm_runtime_put(core);
>  unlock:
> @@ -4189,6 +4187,16 @@ static void clk_core_free_parent_map(struct clk_co=
re *core)
>         kfree(core->parents);
>  }
>
> +/* Free memory allocated for a struct clk_core */
> +static void __clk_release(struct kref *ref)
> +{
> +       struct clk_core *core =3D container_of(ref, struct clk_core, ref)=
;
> +
> +       clk_core_free_parent_map(core);
> +       kfree_const(core->name);
> +       kfree(core);
> +}
> +
>  static struct clk *
>  __clk_register(struct device *dev, struct device_node *np, struct clk_hw=
 *hw)
>  {
> @@ -4209,6 +4217,8 @@ __clk_register(struct device *dev, struct device_no=
de *np, struct clk_hw *hw)
>                 goto fail_out;
>         }
>
> +       kref_init(&core->ref);
> +
>         core->name =3D kstrdup_const(init->name, GFP_KERNEL);
>         if (!core->name) {
>                 ret =3D -ENOMEM;
> @@ -4263,12 +4273,10 @@ __clk_register(struct device *dev, struct device_=
node *np, struct clk_hw *hw)
>         hw->clk =3D NULL;
>
>  fail_create_clk:
> -       clk_core_free_parent_map(core);
>  fail_parents:
>  fail_ops:
> -       kfree_const(core->name);
>  fail_name:
> -       kfree(core);
> +       kref_put(&core->ref, __clk_release);
>  fail_out:
>         return ERR_PTR(ret);

If it were me, I probably would have:

* Removed "fail_out" and turned the one "goto fail_out" to just return
the error.

* Consolidated the rest of the labels into a single "fail" label.

That's definitely just a style opinion though, and IMO the patch is
fine as-is and overall cleans up the code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

