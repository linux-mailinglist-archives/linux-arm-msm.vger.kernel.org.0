Return-Path: <linux-arm-msm+bounces-7122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8482C23C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 15:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9050E1C2462A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A8F6E2A7;
	Fri, 12 Jan 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SisCOnh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D16DD18
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3376ead25e1so4418973f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705071288; x=1705676088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6Qa3jrvQodva+4geqsdAx5EZoSC1Kv1GVKpRBOoHNE=;
        b=SisCOnh0eAXyS8EnBJAvGX+Xb9wxRV45Utw9DeFS8DtraXm520VB2NVPGNDttwyImC
         ptBgf73YkwVwH/ccm2FfeW0AZ93/LoT1Vj5j9AibhWVmxKdiLpyMaigi3scxI9drkWFO
         C7kS756OepfduW2io1/g97tP7nBVZCkszP/UlWqDSemfa4kZByUMWJY+klZeP9P0zsjS
         kKjzTqPL3NpZnjQtAXx0zk7eiaXfmZObcHIgblSTa3eJ6JE40OxpB8qzCFl0OxbE0ck2
         8WOQOYFfE4b4rEmH7tjkKLFu43oibFPJCfuoFtTJZiATU9R7eVZKeVN1d1u9/Wl33788
         34jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071288; x=1705676088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6Qa3jrvQodva+4geqsdAx5EZoSC1Kv1GVKpRBOoHNE=;
        b=eWLJQE/LTDeHtPXyOC1rhdzVnQ0jQcleoRDGqTpliwHBizVMtsitwqvJBSxC5GnCVo
         QirPOHJ39rDdYDF5nUOrjSzcqOsxIexW9gaW1LFgED6F6tAaXsi0wjeVacv2RT+4a/qP
         6oUqS03ZThNSudNnRMNSSqMJy/C3uAgtbPOnklo4XYCSU+6in6pomb8VoE6B/KsFSY5c
         nhtjLMDvumG+IqmL0wskhgngCdT/tbyNIoX16TBcn6PWaQZstYeH8wPnVbQekcpNVeQ8
         5bDI61kq9VZyVX2Um4DQETM6DrCARV4YyGa9jm2wfAUogdciI9vmT+90gNR6F5c/XEWQ
         mIKw==
X-Gm-Message-State: AOJu0Yz8RUaJb0XktjmtT6yJygoXncErplftJAbg+nAOaDnmmVrnUAux
	xN4XZmcAs9icNuKal5nWaXgBPR16FrIcpw==
X-Google-Smtp-Source: AGHT+IGAkoJisp2kQvc4IzllenA2B1gRogJGT+N3jaFZFuKEI//zFeWjS90ALtZhMvUfaHjB5hRIYw==
X-Received: by 2002:adf:dd85:0:b0:336:e369:cef with SMTP id x5-20020adfdd85000000b00336e3690cefmr767777wrl.130.1705071288407;
        Fri, 12 Jan 2024 06:54:48 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d29-20020adfa35d000000b003375009accesm4082058wrb.50.2024.01.12.06.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 06:54:48 -0800 (PST)
Message-ID: <e8a81915-30d0-46e0-b73f-f6522e2269f6@linaro.org>
Date: Fri, 12 Jan 2024 14:54:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
References: <20240112135332.24957-1-quic_vdadhani@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240112135332.24957-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2024 13:53, Viken Dadhaniya wrote:
> For i2c read operation, we are getting gsi mode timeout due
> to malformed TRE(Transfer Ring Element). currently for read opreration,
> we are configuring incorrect TRE sequence(config->dma->go).
> 
> So correct TRE sequence(config->go->dma) to resolve timeout
> issue for read operation.

I don't think this commit log really captures what the code does.

- Sets up optional RX DMA
- Sets up TX DMA
- Issues optional RX dma_async_issue_pending
- Issues TX dma_async_issue_pending

What your change does is sets up the TX DMA first

- Sets up TX DMA
- Sets up optional RX DMA
- Issues optional RX dma_async_issue_pending
- Issues TX dma_async_issue_pending

but you've not really root-caused by re-ordering the calls fixes 
anything for you.

This may be the right fix but I don't really think you've captured here 
in the commit log _why_ its the right fix if indeed it is correct.

> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

You should have a Fixes: tag

> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0d2e7171e3a6..5904fc8bba71 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,6 +613,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		peripheral.addr = msgs[i].addr;
>   
> +		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +		if (ret)
> +			goto err;
> +
>   		if (msgs[i].flags & I2C_M_RD) {
>   			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>   					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> @@ -620,11 +625,6 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   				goto err;
>   		}
>   
> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> -				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> -		if (ret)
> -			goto err;
> -
>   		if (msgs[i].flags & I2C_M_RD)
>   			dma_async_issue_pending(gi2c->rx_c);

If TX gets moved up top then the second check for if (msgs[i].flags & 
I2C_M_RD) is redundant.

You could just have

if (msgs[i].flags & I2C_M_RD) {
         ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
                             &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
         if (ret)
                 goto err;

         dma_async_issue_pending(gi2c->rx_c);
}

- Please investigate further.
   Why/how does the new sequence

   TX DMA setup
   RX DMA setup
   RX DMA sync
   TX DMA sync

   Improve the situation over the existing and more logical

   RX DMA setup
   TX DMA setup
   RX DMA sync
   TX DMA sync

- Add a Fixes tag if you work that out so we know
   which kernel version to back port to

- Include the SoC version(s) you have tested on in the commit
   or cover letter

- And drop the redundant check

---
bod

