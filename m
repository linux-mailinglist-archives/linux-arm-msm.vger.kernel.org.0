Return-Path: <linux-arm-msm+bounces-6695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276B827C14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 01:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D562E1F2412B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 00:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B2623;
	Tue,  9 Jan 2024 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZQWM+wJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB8631
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e4f7119eeso484055e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704760489; x=1705365289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PG45xY7qdUYvxRUhu1bd0cfdjPVsmY2YVRBeEKS5RT4=;
        b=nZQWM+wJJ44gefEw18BZ10nMa6oT5ihVpY4jSdEI3SFCEvp8rABNPa0hvK1GP5zih+
         4NA0Kzc1KXxGFVQyRrBzrvPsDs/k7dQzh6qcGdasnir/ZmeqF/NYRb7HsWczwh8NVSz5
         dviBHD5UROFTsO5+MGkRy3Wf1/1De9c4V0kNe4i3UhT52i/aqAkXbeVWFG0HOQBJ88eI
         dqw0qzp0LTHx5ublLvtxnoKi7UENyWpIBBIlLpqrlcHP3tY0rEEtzVaZLATVHujTf/ot
         GHpiJYd/cd56gdmiG5aTzHONXvIRBWLIXLTrUxsD7wxl2qDvxf2AXc9DRzG12Lt6wZlh
         WUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704760489; x=1705365289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG45xY7qdUYvxRUhu1bd0cfdjPVsmY2YVRBeEKS5RT4=;
        b=rB1FUweNwylk3XQk6yv3eVXhlx+KaJ02PwMScpeNHWUKu+I+o7vTR5ONqcBXnWuk7R
         dL+aGBNko6Dj82XGanTzPHerY4G+vl2seAtHtZjnYlj6qcTgE4hElBk/vHgK2qJKNT8d
         Uitd4LOXvPBBqkDdO9H9W1X5OSeXclFI3XLoAN2+iqWoUR3S0Gi63FjFAomOj5WfSesM
         Z22mGWKTwk3uf1DkxseSc5QWFH2CBJtVBobMzXqjC3Tg4X0197fnSJAtDLk9ONNsVVYX
         FOzkITAcX4oxaCRaMy7jdK/5iCxJAC5D6wBYA5RKJfZnF3fKde92VNF0kwBH1d1av3Tu
         FGKg==
X-Gm-Message-State: AOJu0YxVTi0BXmPbaYDumLx3qZ/IqNDhkEYjPMWBclt9LG+qgMv3tKXW
	SC2r+PL+rMaWMG/E9chg+KDc8cHQ5VOfnw==
X-Google-Smtp-Source: AGHT+IGDQ8FvZzuUdUo9S0hXw8aqSkdIwxxo2l3Q6O2E6tuyGiskmVwFvAIe7TkLE3tqqtpa2dK5Jw==
X-Received: by 2002:a05:600c:4e01:b0:40e:44aa:2360 with SMTP id b1-20020a05600c4e0100b0040e44aa2360mr1711162wmq.14.1704760488777;
        Mon, 08 Jan 2024 16:34:48 -0800 (PST)
Received: from [192.168.100.48] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id fm7-20020a05600c0c0700b0040e4914f28dsm3518325wmb.18.2024.01.08.16.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 16:34:47 -0800 (PST)
Message-ID: <0cbedc75-cacf-43f8-a1f9-284546ad548a@linaro.org>
Date: Tue, 9 Jan 2024 00:34:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] clk: qcom: gcc-sm8250: Set delay for Venus CLK
 resets
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
 <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 12:32, Konrad Dybcio wrote:
> Some Venus resets may require more time when toggling. Describe that.

May or does ?

I'd prefer a strong declaration of where this value came from and why 
its being added.

May is ambiguous.

"Downstream has a 150 us delay for this. My own testing shows this to be 
necessary in upstream"

Later commits want to add a 1000 us delay. Have all of these delays been 
tested ?

If not please describe where the values come.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8250.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index c6c5261264f1..61d01d4c379b 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -3576,8 +3576,8 @@ static const struct qcom_reset_map gcc_sm8250_resets[] = {
>   	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
>   	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
>   	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
> -	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, 2 },
> -	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, 2 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, .bit = 2, .udelay = 150 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, .bit = 2, .udelay = 150 },
>   };
>   
>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 


