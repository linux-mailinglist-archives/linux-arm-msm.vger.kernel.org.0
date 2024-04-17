Return-Path: <linux-arm-msm+bounces-17683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD99B8A8209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B65281D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198DF13C9AE;
	Wed, 17 Apr 2024 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5fIZBeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B613C9A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713353210; cv=none; b=aHOCODjVLr35Q+rX3ypQOjNrj65g3tUuS5+628dy4YChHXc+86A7UyRvreawCY6XsAoLda2Fy31tXvTcTdpe9iemwT8Cve4SlvitTH78pPLu7Gf+T4z84g5N2U1XDwO504dzfLFyRv4zjxYrFhNkBl1QafgX9zKAn67txNN+BIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713353210; c=relaxed/simple;
	bh=9w15mbaH1qCPmMzqW2fuVbi4t+4cdxNW7m9J6W+SAcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy/uCxtYXw6JpaBPuw0+iUph69FUR1nlOioxQnXsD66Ju/uPHY6OUBwgNI7rERv8K4b0qqzL96fv+qL13nAUSon8MKKsfTq3dJhog7IUhtdUojlwVLlloFZA9RKHu56aaRu9d9p8rpl+VP35uKmFU4y5kmyHQGlWoYC2AuetVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5fIZBeH; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso5815627276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713353207; x=1713958007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEf0tlVvOtKKoShUsakltVb3hD3/VpXcFyQ1gefjJfU=;
        b=Y5fIZBeH5Vy4N3V6A691s9vvWkxIhtBUw9MmdpaEoVD3T9H1MljZRsfDVdd4zrdwub
         egO8NOLvTbbn0FedpzowPCK1rMFTJA4IjEygopfIzqnFyhdaeQBAD6XeRTOd+2OZHCiX
         KSfb7inzPb0p/Jf/F0I4GxCtZmG9z/V9I4IiOt4sopzJu8GGT40diQllvXnHsWG95P9i
         e/uOaDCNA+Azoik6ysPUxkrtaz29gLO7solHQQLdkpE25+hGGEBS0GQ/xLCogiFiyXlC
         MDGSUVHCyEXvANBW+LZywlaO3orhHIRWz0/SCCWj7oaru5ZcLNi3um46BuNY5b7kG+ft
         5T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353207; x=1713958007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEf0tlVvOtKKoShUsakltVb3hD3/VpXcFyQ1gefjJfU=;
        b=jhDI5pD1SwRtYS67uSSIyJei1BBt+9c26ZrHeCX0WU4tuq17MaEsAm6Kl3vxSPzGFN
         t5xnfJX7orOIfxflYfHeupH5TqcxtHdx1jS0FklEUv7bFffn0pLN1slFScZHKwngeOC8
         Vh5TiovME+4XUWUYEKFqZq2hi+M0QzoHFEk5nyjf8l6z9lt41svepwtRD+fzUYk134+g
         vvR/RYGJa0L614gR89HuYmtomsI0+ZZieMzIYFQEsFcnmEFfJD0BYWwyrd2JI9ziHW2x
         kC6dMNbgIC6Fvg7fxKJoY8ye/vo+H8CdlETTQyQAot4qwQYhep4dU3mWkLvK+6Mxivhk
         LHcg==
X-Forwarded-Encrypted: i=1; AJvYcCW/XkitQkR0VtdunrKkTOzc/ZCYIBU6TgbtuXrFG1I0tVoPL79+cQKSLOBKyWk+zkImakHbf1eF5FMyNjjqhrb+8pr8F0obDfj27U5EPA==
X-Gm-Message-State: AOJu0Yz57u4hHJc6IVmF1U5yd7i6J8LCSvtwKz/8tuDF5bln11rrVCxa
	mv6TMSZ94Pc+Yj+JV3pYXbRM/wALBS+GqjkJwC9iGYJ1v9ynLeUn0UH0EtvHzybsuwiNdWFEwxC
	65G0wHgFA71n6NzhyyXHGpknc/dwTWevG4JZmfQ==
X-Google-Smtp-Source: AGHT+IEQk/I5LetE/DhGDVVO0twPSlWrg1ZbN08OoWEw3G7KQntEEGuJ8Lq3vNPpkhg2jG26xZma+XZL1vf3+BIUoXY=
X-Received: by 2002:a25:d354:0:b0:dc7:45f4:44f7 with SMTP id
 e81-20020a25d354000000b00dc745f444f7mr12803841ybf.14.1713353207586; Wed, 17
 Apr 2024 04:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417105605.836705-1-quic_varada@quicinc.com> <20240417105605.836705-3-quic_varada@quicinc.com>
In-Reply-To: <20240417105605.836705-3-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:26:36 +0300
Message-ID: <CAA8EJpqaXU=H6Nhz2_WTYHS1A0bi1QrMdp7Y+s6HUELioCzbeg@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] clk: qcom: cbf-msm8996: Specify master and slave id
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 13:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The icc-clk driver has been changed to take master and slave id
> from the caller instead of auto-generating them. Update
> clk-cbf-8996 accordingly.

This should be squashed into the previous patch. Otherwise the driver
is broken between two commits.

>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> index fe24b4abeab4..a077d4403967 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -237,7 +237,12 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct cl
>         struct device *dev = &pdev->dev;
>         struct clk *clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
>         const struct icc_clk_data data[] = {
> -               { .clk = clk, .name = "cbf", },
> +               {
> +                       .clk = clk,
> +                       .name = "cbf",
> +                       .master_id = MASTER_CBF_M4M,
> +                       .slave_id = SLAVE_CBF_M4M,
> +               },
>         };
>         struct icc_provider *provider;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

