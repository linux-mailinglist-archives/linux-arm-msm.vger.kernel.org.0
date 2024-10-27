Return-Path: <linux-arm-msm+bounces-36055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFC9B1B82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDEC71F21730
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 00:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEAA1367;
	Sun, 27 Oct 2024 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDJgdSQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59569195
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729988588; cv=none; b=l3fxIvKaPig1Gr96DgBOixZSIjCVfGa2cMv1IW8ZgsJFmrMo+OqlLnS4Ro5Qk6lX/QOayDGS5auftAL6eoJgcYYnu0ax4VVDeJraowle8RSmVSyQZhLe5O+B4pxPJlZHJWUreHRt9cUo+mNqr94k+m92gEpNKCkK0rkHFl/FFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729988588; c=relaxed/simple;
	bh=5Pqui25DPlwIWMLdGTLyIk3J0Uf993iIacmKnnuy3Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZywuPRw7WYtf8iOHdrXcvKj5jxUNpkQmIzvf+r6vNGMpcg0EVAcfmfFwxGu0wEbkCP9MOevMzJrkzhRBP8dVl7lPE/Hb4Tu3nwKAuhVm1wwgU711u6M3bYwhaQANkAyFEteRIt4p6J+KcUhPCSmq0719f8WOBfIIha3Z1B3FRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDJgdSQT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f0802bf1so405068e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 17:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729988584; x=1730593384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFbW2IR5f5096oBox+ScFmNcX3VP41oZ+AfH+USsxkg=;
        b=WDJgdSQTVgI9WqkJS4dNotgaakbY4G/r/cKN4Gzsn8dYqqi1H4gc3p0QaahEX3vRxy
         Aynxt7k97yK2CCZFsA7STlz/BpV+HWwfIW1ZYtWTVAhiX6/7Bdby95pSB1NKnhVaQo6I
         91RWYsPnp42GJz3vo+CtXFuH8eADg8laJz2SJlk7SK9lYhQlOE3N5kGStPzfrxJgFWWn
         GmZhjjinUXl2kVSBURYlRAv/YNO7ENFGAT7Y835esjUWDxRvrzsdB5QUAyAwmes8Xd/M
         phZGgHbjMiY5nsE0R6WNqMO7E00Fq0S/AKQqU5XyIqwtUO15voqwSlJQ775xXlQxs5m9
         gm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729988584; x=1730593384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFbW2IR5f5096oBox+ScFmNcX3VP41oZ+AfH+USsxkg=;
        b=A6RtKAnfphXmHEUqtmCw2lAd9vZbAhe+1NpKymZKhpWOma0dFeQWgKnKnMtmFxeOkc
         BYUiQ2z5vxtRGO5/kNzUR6xeX19JA7usd+4dWnU7aQeHnmytUWRnToXlq2y3YILJUcpn
         LPx4LiFbC1s/kcrr97RlSlTuAryZf5ya0PYxjseGgeuQHQGdvNjCk6UvCVLKD19GDzyO
         5VQyEd2Mowx5JaGDlNNjy5Qxal4Fg6Ro6kb17gFo4uUMl15rTgWLn//4gtupZUa8jEcm
         H6xFw/7ur3Bo4yAsfNRWJGCLOCClXx5im+5J5hJpJXX4yPkSaILqj7w+5yTYHvrFOI0+
         eUiw==
X-Forwarded-Encrypted: i=1; AJvYcCV1qFhSTyC6kgzi8k4ATWRxKdPs6J6sfyI60ecX9Z6As9TEPrW1a3uvb8IjpnPXEAuULcZuh3CasqGKkEyZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6dxZ5xAIEFmIwyG+v7e7CGHz63bS7FWRfIYp4n5bmGGRvSG6
	NxrMLazWG2yqyrzVnKN8amI0TpUC1T8GyTFIFWK1NLfPyHkd/R4jv0NijX0+fh8=
X-Google-Smtp-Source: AGHT+IHdy29xwLOA70AzPMwplw9gzzYMMz/eIfCANOvEjDMYS3JoalrmNdgzM+1ItaoaGQam7GjFHw==
X-Received: by 2002:a2e:b8c9:0:b0:2fb:48f6:27af with SMTP id 38308e7fff4ca-2fcbe0676c2mr5270641fa.7.1729988584175;
        Sat, 26 Oct 2024 17:23:04 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4618b4asm6893501fa.131.2024.10.26.17.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 17:23:02 -0700 (PDT)
Message-ID: <1039ff2d-a6ff-47b3-bace-7f2ba291f94a@linaro.org>
Date: Sun, 27 Oct 2024 03:22:51 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/24 13:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
> required, as the GCC driver defines and instantiates a bunch of GDSCs.
> 
> Add the missing dependency.
> 
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 953589e07c593fd49fab21c7cfcf466d33f99a27..c298d8e6700f6293f62269e5cc4ef518afc97a7a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1042,6 +1042,7 @@ config SM_GCC_7150
>   config SM_GCC_8150
>   	tristate "SM8150 Global Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC
>   	help
>   	  Support for the global clock controller on SM8150 devices.
>   	  Say Y if you want to use peripheral devices such as UART,
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

