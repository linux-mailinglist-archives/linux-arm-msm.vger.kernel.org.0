Return-Path: <linux-arm-msm+bounces-13474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708587362A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 13:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112F01F24B15
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50AB80022;
	Wed,  6 Mar 2024 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OObOWBOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50695CDCE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709727609; cv=none; b=d5rf9pfd+aV9F31yEGlgYyAKz7lrmTFhMbmTA+WBovAlRtzwc4pTq2ngPbWf6Zu2oze6UEdFpbUa2dZUAEU+oztcEpdY/86nvg/zDCifiirrKp1m3b5sNVO1ZXTmncUI38BGMSVGKSqMD18qF4kvMT/M3GYCP9add9tKeFvHHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709727609; c=relaxed/simple;
	bh=GgywhyYg02oQR+ukulXPdwnpOf+BubR6SiNSRsbeZyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMnrP8SVzbWtN4TwnXtY/Ie7449isMF9HjR36YhD6SFQkqRs+QaV6R20qaeKaRYF2oQDIjxVZZ5CAJ34krvfm0NyRfCwGriz1Oko8vZGbo4WCOZYYifoPKFxioxZu425kyEcdxn7QN9XF7kyX1k0X6umQMYApNzq0o96RLrHAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OObOWBOa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412e783c94fso21728315e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709727606; x=1710332406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWZJN83/bbNzf+Ic7CfQsRyRk+yU0zwq31wQFy4WgWA=;
        b=OObOWBOakQORb6cUDeZBUbcWQrG+53YGNvNN3YcWGDjXh7csYWRQvAYC9jOIC2EtcZ
         I4nt2D0JXRbeh0+EbnvQJO9IbaQz6aNNMrZHgEE/1uWo8axQ7s5q1DljiEuP00uEIoUJ
         3vqwFiTH/xCkY0jVs67L2wt6rgGkW5ip8ma5lGUyn/pU3NBYX8UVTMhlNRAO6FMDtG8K
         B+WSKx/2xDnREzDKWlL1QniOlEVJ83kRDHAxYUmkflAk28Uwitga/U5VifYUtjUQJMDh
         wJreYvcFzz6JcF4mFqprP2euf6Elkh5gbR4i+96YHxorKqOCXYBBo79wSsi1A9DlIdqz
         +MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727606; x=1710332406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWZJN83/bbNzf+Ic7CfQsRyRk+yU0zwq31wQFy4WgWA=;
        b=bBa68slJuKc/H8QmdCHM+eY86DtoWdYQErUTuzuhYQz//dfZRk0MxD0yhnCrAzp4rw
         s59SESxDaEP6zk6eEDIg16IMB4PBUQTERP1OynvRSoPkTpfxmskqse5ib1Wk9YqSxC2N
         St2HC5BxBMhas4tbnBDwstgDGJjNFllABufSb266Qui2yDv9+YTNl8IgFo+xSx34V+oi
         XWEZuJN/80vc8AdFcFXmjUkQXoHXkfY8PCf/rhyILcBWw3XPYrQAkn+w2qU/gJGTKsp4
         0vaNFDG9KhdXAJVbMbY/duEoeBObcyFxpyrLENHkag/z2wRZD3O60TjZYpG4+uS5XG16
         gHEw==
X-Forwarded-Encrypted: i=1; AJvYcCWM0HEuiFj9Q671pDQ1n6/dW+0CeG4vs73sBxluO4XGGH0z7JbNYSR3/6qGZ2uLGVkIqFyrdrAnLTKp3wioQSsK65VVGxZ9OUMCb7/fBw==
X-Gm-Message-State: AOJu0YzN+BhT611x4tAm8eyIMLBJ6f9pjoPsFA/BFtViNxfFigiyno+Q
	ftznsrL3jGf6DcSbc+0YMY9yOhC3g3rJZkIk/fMNXmq8l3+F5qcKOuQvtG4qdYw=
X-Google-Smtp-Source: AGHT+IHwjIZ0oB/Qdt/cf+7ESr9SOVAk/sZWQCvXlYHeCO0n1IGxqlDqFP6BTAPBfZ/0sXmuWpbgPA==
X-Received: by 2002:a05:600c:474a:b0:412:7489:c8c0 with SMTP id w10-20020a05600c474a00b004127489c8c0mr10696349wmo.34.1709727606183;
        Wed, 06 Mar 2024 04:20:06 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600003cc00b0033e451a9b64sm6112893wrg.61.2024.03.06.04.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:20:05 -0800 (PST)
Message-ID: <b6d6beab-39f5-4f00-8427-52b662181864@linaro.org>
Date: Wed, 6 Mar 2024 12:20:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-3-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-3-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> To make it easier to understand the various clock requirements within
> this driver, add kerneldoc to venus_clk_get() explaining the fluff.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index ac7c83404c6e..ea0a7d4601e2 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -23,6 +23,34 @@
>   
>   static bool legacy_binding;
>   
> +/**
> + * venus_clks_get() - Get Venus clocks that are not bound to a vcodec

Get non-codec Venus clocks.

> + * @core: A pointer to the venus core resource
> + *
> + * The Venus block (depending on the generation) can be split into a couple
> + * of clock domains: one for "main logic" and one for each video core (0-2pcs).

(0-2pcs) is hard for me to decode => zero to two parts?

Why are we double quoting "main logic" feels a bit "Dr Evil"

Suggest hyphenating which would do the same thing:

'one clock for the core-logic||main-logic'

> + *
> + * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
> + * domain, so this function is the only kind if clk_get necessary there.
> + *
> + * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
> + * statically proclaimed a decoder and core1 an encoder, with both having
> + * their own clock domains.

"statically defined" not "statically proclaimed"

> + *
> + * SDM845 features two video cores, each one of which may or may not be
> + * subdivided into 2 enc/dec threads.

"into two encoder/decoder threads."


> + *
> + * Other SoCs either feature a single video core (with its own clock domain)
> + * or 1 video core and 1 CVP (Computer Vision Processor) core. In both cases
> + * we treat it the same (CVP only happens to live near-by Venus on the SoC).

One not 1

> + *
> + * Due to unfortunate developments in the past, we have to support bindings
> + * (MSM8996, SDM660, SDM845) that require specifying the clocks and
> + * power-domains associated with a video core domain in a bogus subnode,
> + * which means that additional fluff is necessary..

"We need to support legacy bindings"

"sub-node"

> + *
> + * Return: 0 on success, negative errno on failure.
> + */
>   static int venus_clks_get(struct venus_core *core)
>   {
>   	const struct venus_resources *res = core->res;
> 

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

