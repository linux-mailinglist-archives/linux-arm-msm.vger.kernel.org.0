Return-Path: <linux-arm-msm+bounces-7569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B5831EBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0729F286639
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8544E2D609;
	Thu, 18 Jan 2024 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYQH+sMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73C2D052
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600121; cv=none; b=eaGVDm4/4gdshPUnTkh67K1LNAJatSzZqmey/Ijp9RSkzQIWjtRvJD19Xro0msB1d0FZgOVd+qxNA5L+woxq3dkhS6xiPjYQSAQx6ql+1lW2yHRcmNHfLdAlEgI1JVNsMS+TBIyK97Gv8kHDrXZG9kqTRHgfx5cuYKL+VeaMp5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600121; c=relaxed/simple;
	bh=keLTQk+AvKOmkA5Q5qxRwla5u79ltM2//juuofixUWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjnd2FpNPYwMXVv7tOlVH+I9jQqlfQF33IaleQcCY7fSmCyg94WR7kS2rmQJ04XeF4bJd9FMVplGX7O/sVP+J6gZj7bp/6BQcmEaX5bm9XHyoLbZRdOIsIFcOMM5KtGPlXFrijaQvWVDWkYEMA1wIfyEv6hURkfYp7srxXARcYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYQH+sMI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd04078ebeso10336781fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705600117; x=1706204917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LkCXUxxtx6J5Nl/krXuwZsTy4uKTB0BO66v6ghWpv8=;
        b=LYQH+sMIsYAyKEHIloqnBCDHoy5IMsfNe7xonzgOZw5Tr1QgFCY6P02ziruZVwr7ik
         vSTBMuQtoBaM80z0qs292No7z5BxG9LZNLGbESd6EHaxNGHNk5sj563VxttAAk9IX21B
         52OTuo1W2veN3nNv4g0ZiYoISv6LiuBNXRhlLiJ7/t5txipHToTHn8CRY1vvu0pySr5k
         tgQ0q0yMTPBu2UgWNEtFQuKL5ZGxvvX0y0NUmc1ZjfiaeCz4XLkciTlMPjoqMHxmfeTg
         qIgXDoHLGcyWrc7vd2n+0o/EhQJ0wzt5MjAz0oX5XM3OwWoz23OJq9mi59JzEyXX2bO9
         bbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600117; x=1706204917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LkCXUxxtx6J5Nl/krXuwZsTy4uKTB0BO66v6ghWpv8=;
        b=T0eX8tQgEBjSMnFborBPoPERrLLvOe+lkngBKb3Oo/Si3uphenknCF9Rakwpnx0rzD
         mLlfWkYZ1fN26lXXnOrBXrhUmaILvcS9i5BPwstGEQ3+psaea+HP30k+qYJZoj5v3Pj5
         29mxphR1kj3jtKMbeA75fbfF1HbjWF1ouMdfwU56CY6SEC/8GlB4+7HnF5qHCjT55Nwr
         BnnzBVVMQT/knGYtOSpQhYCJfUxCrlBJI6fv12ywPp/PcEY0EgVum2pq8wtntdZASG8P
         AiPbrkG9mRjgouKNf+gxW3jIYM1BoIRRiiUUq8CpTM0PVLc4MfAm88Sc9hEve1jOm2JL
         b6WA==
X-Gm-Message-State: AOJu0YyAJWQ+R1n7CDW3Bfp4IwMjCllSMrrZQ3ADtWuYgdOzqFggxFcZ
	uqAzDmY3+XLXou7rJfKA/F0qWxs3U0J8MpbAjPxt2sx3k9nkw6Dp4tRWLpurFmk=
X-Google-Smtp-Source: AGHT+IG1n4qraOcDtB+OxaJOSlZ4etRCW/HR1z6Lghjg+8zt4pAxHJfyfgyq04DeO6jqaft4oJwxlg==
X-Received: by 2002:a19:6408:0:b0:50e:7bed:af45 with SMTP id y8-20020a196408000000b0050e7bedaf45mr1928736lfb.33.1705600117035;
        Thu, 18 Jan 2024 09:48:37 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y18-20020a196412000000b0050eed79975dsm722417lfb.24.2024.01.18.09.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:48:36 -0800 (PST)
Message-ID: <9b78a7c3-dea9-4d9c-bfd9-13d819d68890@linaro.org>
Date: Thu, 18 Jan 2024 18:48:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add qdss_at clock needed for wifi
 operation
Content-Language: en-US
To: Mantas Pucka <mantas@8devices.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1705486629-25592-1-git-send-email-mantas@8devices.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1705486629-25592-1-git-send-email-mantas@8devices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 11:17, Mantas Pucka wrote:
> Without it system hangs upon wifi firmware load. Bindings already exist
> for it, so add it based on vendor code.
> 
> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> ---
>   drivers/clk/qcom/gcc-ipq6018.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index b366912cd648..7cdaf7751566 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -3522,6 +3522,22 @@ static struct clk_branch gcc_prng_ahb_clk = {
>   	},
>   };
>   
> +static struct clk_branch gcc_qdss_at_clk = {

Hm, QDSS stands for something something Qualcomm Debug SubSystem
if I recall correctly, so coresight and friends.. Are you sure
it's necessary?

> +	.halt_reg = 0x29024,
> +	.clkr = {
> +		.enable_reg = 0x29024,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_qdss_at_clk",
> +			.parent_hws = (const struct clk_hw *[]){
> +				&qdss_at_clk_src.clkr.hw },
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Does it need to be enabled 24/7, or can it be attached to the wifi device?

Konrad

