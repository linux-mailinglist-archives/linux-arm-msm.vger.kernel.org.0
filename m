Return-Path: <linux-arm-msm+bounces-7996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09B839582
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26B581F30D29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D8812BE8E;
	Tue, 23 Jan 2024 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCbhgJNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DCF12AAD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028575; cv=none; b=qyXNfDR0Gxpl9jkb9ZnJGX00srQSrHdeevZuoEB3ppvjqB0haUJwmkQdn7TNZUqjTj3PEcG8YmZX8sV32Ex7RNKnlaogS51F++ddO7ChyGxa/2jykQPUdgGkzhVNGeSin4FX+/+5U7vdOhlsBiOSd8POQTsvQoETdCGMhUskNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028575; c=relaxed/simple;
	bh=0GodLf30+iNTBjP5Gh6/duXnvzTXZV9C69MvyxMo8U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAnIvMAp9R1dCxIRj3Mj4YaD/5iqnfkqDUhdNShltHJ2xm5hPS0IFRUGj+HSD1f/YluYhJWNcLxmasgFMsjs/fwP/hPkX3jdzNepPWAFVFribqGxzCssgZteR+kr0i07KgXzfMJm7slE2FlMbtJWQgDk6slXoD/ENS06i/jLMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCbhgJNJ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ffb07bed9bso22783307b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706028570; x=1706633370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aXz6WQyGCVGvl5jSp/sFyNgM0abYZYPNAeAICiPwHO8=;
        b=eCbhgJNJvcM1TmjWFhBZCwvo4N+jgvjxgMOR2MqTqudxEr99MPdQWJ+RJtEhwyxq7O
         eUqJTMAc32WZodMqMq9bhTuKCYpFqdH2q5DQw3qWnTJJz2KXCUqmZjpse1jA47qEr2Gm
         udGRMzYCeuPq2fQtBseRlG61FucIuhDcwa2JuYGJXldVDT2yDdKCB1vV8cZ4drdxw/ku
         Y0Yo7IT7FeW7sreqCbCreFWytvCnP6/L7RKDOAYl6MVzXX6a5HRRwBI4p53n/ED5Fh/+
         kq/F9dZaCW7sl3vYvWa4h9dKz/xXFsFhNfdQ7YWOTvNMFtTHN1fHXmAfkolTGRVOgRR9
         5D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028570; x=1706633370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXz6WQyGCVGvl5jSp/sFyNgM0abYZYPNAeAICiPwHO8=;
        b=Lj+OOvEmTacbOV3hnrDzyIP1nS8i8R4ZWdyWNZmSi3yeH39hNpp/jAb2d3sPUpAeQm
         gNhijRloLTrJFp/z6jOgOtj1t/KiIwcIpgczrFuWg8PqbWAaTCXnMNk+BU6XTB+Qm+qu
         +67781DecpMeFLL04DSAnn5hREQi8wsuMDVkXmLzWUvJiXUm5LKEw7J/BPJ3BX15cXk7
         olxCUkSj0Qo3lhi2rZfMvaqDZBNf0xKTWS5JjAQvmYLyJEcoag1z0JZhENceuOYCEpA0
         0NR3WDSnCRY3GYpjrDFTVXUMXYsB1+BC31uI8KKBCU8u0DqK4c9LMEtvANDRA5dcvm3Q
         OcKA==
X-Gm-Message-State: AOJu0YzJdKU4it6l7Nnv6B+s3odvaHuzIPOmFk16r45aht9wpq4WZWf/
	gR03RpYnx7wn3VJn8KETKutWBbH6uXp94sevYgVDFB4cVogUYutnU5nnvEyhgoYUHf1216qElpV
	CPx5DuYXRQmBKTNfjXc3MgGk09yKer72DGJA3wg==
X-Google-Smtp-Source: AGHT+IEE5iwDZNZnKWCqP0X/hJ8GqixDXEFeBY9HQDXHizFGiA1pCXIi2xw17JvVbOPkrHIwHkzBMtTYGJvnD55grhc=
X-Received: by 2002:a0d:d50f:0:b0:5ff:9eaf:be5d with SMTP id
 x15-20020a0dd50f000000b005ff9eafbe5dmr3326432ywd.81.1706028570482; Tue, 23
 Jan 2024 08:49:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com> <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
In-Reply-To: <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 18:49:19 +0200
Message-ID: <CAA8EJpqLZQNMzn_oC7AbzXP2f==PujUe-atfUNgFC3VaFF8=Bg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 18:35, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Add active_only support for gcc_parents_0, this is needed because
> some of the clocks under it are critical which would vote on xo
> blocking the suspend.

The kernel should be able to work with older DT files. Please add
support for using bi_tcxo as a fallback.

>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sm8150.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 05d115c52dfe..2a0608c5a104 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -123,6 +123,12 @@ static const struct clk_parent_data gcc_parents_0[] = {
>         { .hw = &gpll0_out_even.clkr.hw },
>  };
>
> +static const struct clk_parent_data gcc_parents_0_ao[] = {
> +       { .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
> +       { .hw = &gpll0.clkr.hw },
> +       { .hw = &gpll0_out_even.clkr.hw },
> +};
> +
>  static const struct parent_map gcc_parent_map_1[] = {
>         { P_BI_TCXO, 0 },
>         { P_GPLL0_OUT_MAIN, 1 },
> @@ -222,8 +228,8 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>         .freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>         .clkr.hw.init = &(struct clk_init_data){
>                 .name = "gcc_cpuss_ahb_clk_src",
> -               .parent_data = gcc_parents_0,
> -               .num_parents = ARRAY_SIZE(gcc_parents_0),
> +               .parent_data = gcc_parents_0_ao,
> +               .num_parents = ARRAY_SIZE(gcc_parents_0_ao),
>                 .flags = CLK_SET_RATE_PARENT,
>                 .ops = &clk_rcg2_ops,
>         },
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

