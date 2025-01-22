Return-Path: <linux-arm-msm+bounces-45772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC8A18C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 08:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43BD87A2466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 07:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA3D19341F;
	Wed, 22 Jan 2025 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWLmSVc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E51865E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737529297; cv=none; b=PEUYQBDik9DWWP/TZT+zD4eWhkHMm5tJyGWPCi960c9+nKjyJE1k7TjM3kOMV6Yb4HPCSElWldFNNC7mQbQIChcvYs3i48ZdTmU5jDUgrwAwA8sAJbI2+Mxsg1nSIQ3WJDJf0LV4SkEuZln/MjetUQtoF2jCR4R2uIPg5R5VmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737529297; c=relaxed/simple;
	bh=0ncMhmiWDDyDcDoaCjFkumTi0iies/xdgm4nwy/AcjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WB5rFX17LyYxkI8ReQMumY6mupVF6koGSIiQL7DiH+NGlhcs4Ogvy2AJKgwiNuToK4O06TsBLhVLjFBBdeBxa8xBU9qMx4Q1HkSRYq4F4t7Vd74s3c92DLgGyv3DHwTpyOcPEOOuiNt3y97LlKUx8IYGm5XgYsx6qkdFuaXtBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWLmSVc4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5426f48e501so988189e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 23:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737529294; x=1738134094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1gxGfqa902ustpLEaMMtfCYXH3SBTFhan9QqkMWHQ=;
        b=eWLmSVc4JI0nlzXDLIeaTku9z94Dhnr29MB+2GNFpgFLSGSbTDuI9Rd6IXDIVVL40j
         HIColpsFeHh4NV0Ah9LYpBRcVdNfnpZsQA/4FmfaHG+kOv/rnf2mJfdVAQwqMdJvqd+N
         s00XitFK1gPQ0QIPEd95zC+X1ZHyl7VMAIW1GCqeIdWVo+kpMTK59hb0RcHrB04i5HcJ
         sFRPbIzNimdD4V9PJjyQ5WN7qG8ZlbeQOxKOH2JjyGHq5Kp6luYuM2SL5DnOojEbiwLz
         mCsfkMaJEkTtHtmzGKVuvriigGmbcu/E9uPvBClGC39fpcXzq4TRWqBFs0G0Z99AD4p1
         nG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529294; x=1738134094;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1gxGfqa902ustpLEaMMtfCYXH3SBTFhan9QqkMWHQ=;
        b=VIn0ygRVRpLfE2b5nDQMJ4T27pGxdiQzDzh0fpfwQV7XnibOWFucr0WYHegp0dP0qf
         vbeMzErrdWDDpl52w8QpQFj6RLwo6fowICgEWEwJoVyG/yLHueiByofNd5Ke3ptfNuGu
         2EEsd0NHmquwZjf9MzV3CbbdUMAys/7/kIkmva51h8sWfYLkdml+LZ12tSjlo0twokYs
         8dIauAjQwEsJdAjRkYHAsJBdGBvt5lcGTCdf4cfqfquSLa/odj8KhNrMY4/qPnYyYm/R
         V8lDVIcwgxinhwQzt/rnzkofJyp29dCqdpKvmp1yONXr095RoSEub44INMHvNRXmZcl6
         C8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZaBbGgfW03zKo+H0KIEeVYfvrdrpdCQWbKwhekbZ8k7jOikZA9son3oefDHdAgQCRBT22tkXrpt9xj5se@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSgg6qVb/t8Ut/IrvLpUYCIkvkLvu9Ls19+p6sBO+p+u0+AFv
	OXpPnpiHE4FMhasyyJqVOyUwwbytLOkgDvcKG/dqaGHUVmlYp3sDI7oh8k5/ecGTAxx9rgIQSiv
	F
X-Gm-Gg: ASbGncsC7+UMJa2EAZr4PG+rwtG5qxoAsmuIAKDXIvsN4obBxoALb4+jeuGoKlbxoIc
	Ufhol70IMsrpL4IDwSI5ERpTsUSGVN8UuKaq5k3Lll9EXclkZ68FqOVE4QSfQmSaebDdj6wawWS
	U6tq8tIQEiXmqZeUSZyqhaIAyHYLrpaSJ786NaCB0J5wz9SAKEaiPdN4HY7ZfLnhTEQ6VVvzFEQ
	Dg/vr6RVdFVdQ+O+XDV58jWUMsY93BRW0a1ONg1uPWZZudWe6UcBvJijMmjmdfvEN7sIvXCff1B
	J8R4hKGdABone5mcMOJ1AA7wzq3h5bw3K2Hthph77+FYwTlf
X-Google-Smtp-Source: AGHT+IE8RKQTrH8l/x/rnVSgr23pLF4p4DF9w4yQ3qsCIFk/+CBX3a2lnUTrQWg+AJh8JdHAc2B2cw==
X-Received: by 2002:a05:6512:4018:b0:542:1137:612d with SMTP id 2adb3069b0e04-5439c2537d6mr2367482e87.7.1737529294223;
        Tue, 21 Jan 2025 23:01:34 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307587bbe26sm2814751fa.66.2025.01.21.23.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 23:01:32 -0800 (PST)
Message-ID: <b708832b-a0c2-4a1b-88a8-0257b1d22fda@linaro.org>
Date: Wed, 22 Jan 2025 09:01:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Update i2c frequency table to match
 hardware guidance
Content-Language: ru-RU
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/25 08:46, Mukesh Kumar Savaliya wrote:
> With the current settings, the I2C buses are achieving around 370KHz
> instead of the expected 400KHz. For 100KHz and 1MHz, the settings are
> now more compliant and adhere to the Qualcomm’s internal programming
> guide.
> 
> Update the I2C frequency table to align with the recommended values
> outlined in the I2C hardware programming guide, ensuring proper
> communication and performance.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..cc0c683febbb 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -148,9 +148,9 @@ struct geni_i2c_clk_fld {
>    * source_clock = 19.2 MHz
>    */
>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
> -	{KHZ(100), 7, 10, 11, 26},
> -	{KHZ(400), 2,  5, 12, 24},
> -	{KHZ(1000), 1, 3,  9, 18},
> +	{KHZ(100), 7, 10, 12, 26},
> +	{KHZ(400), 2,  5, 11, 22},
> +	{KHZ(1000), 1, 2,  8, 18},
>   	{},
>   };
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

