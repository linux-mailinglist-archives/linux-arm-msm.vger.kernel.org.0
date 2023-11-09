Return-Path: <linux-arm-msm+bounces-289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A17E6B38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 069BEB20BC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00DA1DFC7;
	Thu,  9 Nov 2023 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZiJpeaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4F1DDD2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 13:29:05 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB7A30CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 05:29:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40842752c6eso6257045e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699536543; x=1700141343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6lBJj4NeOTlbTzOMMV3Vht/yRGVcOP2vUzfnCr54NA=;
        b=GZiJpeaLEZKQEBOMuNyM0oa2jRjY54GreheXU8MAGkJO+N3oMg78LLMtKIaDoC/gLL
         GoF8WOEwbiwypxKji3hkR2T2U6eIt0GebM/ChEbIVH1CBYKq+HAjrN80K0K707B8M8lo
         LrAO1BeoPW3+4qOMiRqI+tHzFWJ5Q5KTae+zWX7hSfRvEp21n1U7/JE8wFXpaaF5A3Ni
         HFLHy4i0D6alB1jIFX0E2MPCM+BFmhZcvwObuBYQ+IDO2yRJ1rRIKqfwxz/hPzhTlsKL
         bJlCqnDGKMgFmcyI8t5ptzsO7ZIQf1gFhYcf0vmwfiPsGWh1JZAlpsI2p4XVdf3p1TSB
         5aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536543; x=1700141343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6lBJj4NeOTlbTzOMMV3Vht/yRGVcOP2vUzfnCr54NA=;
        b=f3ztWY2s8zpV+CjJiePrMmzkHsh6l82treRHZrwq9GwmZKVjyAs5IuVlj95jbP8VMl
         cHMp6mTi2YYxF4vjPcCEvsQC86ZoqqeAIZG59yfykGRQ8DLL4Utv6v7Ox+lj127vzsB/
         bPpg4TBEg2USE2hizU71LhVqXGU3lugosAeP1UtgANYCXFyUgvDIQqgpINeqorqJexey
         6tCwo/z3xnT10GqVX/MWqeD7TTrmxbhQWeWNyN8zrH7z8IXMsXBaoBMjNdeWifuna7vR
         9mvv5PNEyu5bp4XWhdjg/kQrfdttJoaecuoHOSNaPO5OHeXUYCosEYcdITl8+qOTnyBn
         nnqQ==
X-Gm-Message-State: AOJu0YzhPa6+CoyJvZ/1doFXPkqbjx4DxJycpbqdR0podl3kJkJ/FRiA
	Uqo2Sy/aiL7ZYr1oxlDiRwXkDDL47CUiLrZOQhJWaw==
X-Google-Smtp-Source: AGHT+IEz2E5ROHq7FzQOUSdgDqt0dBtEGV3u7QEbT82rj8kDTN+wurB8NdRa7RfMlwzRk8zXZ5MS8g==
X-Received: by 2002:a05:600c:35d2:b0:406:52e4:cd23 with SMTP id r18-20020a05600c35d200b0040652e4cd23mr4107757wmq.0.1699536543052;
        Thu, 09 Nov 2023 05:29:03 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b0040648217f4fsm2052596wmc.39.2023.11.09.05.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:29:02 -0800 (PST)
Message-ID: <0edf26f9-46c8-4c9b-a68e-a92a78b5684e@linaro.org>
Date: Thu, 9 Nov 2023 14:28:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix port sanity check
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20231109093100.19971-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231109093100.19971-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/23 10:31, Johan Hovold wrote:
> The PMIC GLINK altmode driver currently supports at most two ports.
> 
> Fix the incomplete port sanity check on notifications to avoid
> accessing and corrupting memory beyond the port array if we ever get a
> notification for an unsupported port.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org	# 6.3
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 974c14d1e0bf..561d6ba005f4 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -285,7 +285,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
>   
>   	svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
>   
> -	if (!altmode->ports[port].altmode) {
> +	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
I'd personally use PMIC_GLINK_MAX_PORTS directly but it's the same

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

