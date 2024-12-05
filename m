Return-Path: <linux-arm-msm+bounces-40598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F899E5CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EE1284D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4178222576A;
	Thu,  5 Dec 2024 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnH/cwnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A67222572
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419019; cv=none; b=e5DjktT9T1UQYYzvWAx2jJd+ti4w4APO1HjLTnH994apKLxj+d2T7myb6QOh0a2uVsBT1a07G5JqU/Llq8Gd0zAiLkIdPWHlklpo7km+OO8VBY/k5X1oEDHDHYyoBaoUA/gjn8ptaECg1tMIDJatvDloRiEaE9Wq5Ji/nRsivHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419019; c=relaxed/simple;
	bh=bq3+bNN7RlTO3LzluOulsa1FFZoUNl4cRiM8pa4tVJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgV/gWjYIXuTN7Tz4N2AQKsmY/3pcqrd4EEtxPUKZyvvGRDu+hXPlnfIZeLdmMIA8UDeBQzalXB43VRuADOWCbG48zx+dH1+d3hsy2quS09kH2F8DWYzaO2mxTBV2TfPBpc5KiPm/V2/ZRnMhw3+e++KwvN4BgG5dOc7vV6CNEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnH/cwnU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df1d1b726so1200175e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733419015; x=1734023815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dk6qeu/c0aGQfq+iRGPsbk8IOsfqn1Rscd5YILluES4=;
        b=BnH/cwnUIxgrOlQcrvIzL5k5FYyrzFXriVP9v6rT00mU3hmp3yoN1HOtshV03Y2G1r
         vxCCMXQc52Uf8vaIfv74OzPs5LCSeu2tST7yr9PHTB0do1R0RB9JZ6hI/fe/CXB4BQPu
         GSqGiOIkQsuCDrbVcJ3Ir2HRh/k+CXd0SuNo/rTIMhkwEz/nQfozUz8Z8lm818BvVyPc
         IVUFMaRm89L95467XLACtZJVpBvWOS6W1nFL7eqPlUcub0rX3B8e9SkJxueZgGvJb+vx
         Et0XkaqeYM1h9RoEXoBS2mrWVU6Vi4rYoIknb5Lx0MeaD4U+vddmEaC4eRVHW19ZCt8T
         bbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419015; x=1734023815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk6qeu/c0aGQfq+iRGPsbk8IOsfqn1Rscd5YILluES4=;
        b=VibsxfTPjU1MFSWn9jGmDoHz7+O/hEM+he2KKXQHnfI/IJd3WOd/MUA4ZjNolw/3wN
         yU11paLS46j+iinSOurtywNM1c4KOM/vK2YveSbRHfdiqKPfJwkMkATYWzCf1Yl9v3Ix
         RS3D4tkuH47+lZBX3QLcTg0ljeKpe4utwOll73pco41LzBoYAy/FKcSZKeeUGnKhrYiV
         kM5htyQ+v3VEDr5uVpQArS/iZ5bCqCkqaDicBYJD3V2Rac9EHtRk8ZdI6I2LAwtCUYG7
         3dsBWXxkPL9Ch0xmJeSwBuZEC/iD3NcWKeHZB4T/0Q+qcN+/ZTS7u1tW4Q8myjCj49G5
         89Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUfbIXhgc2RePlKSTxH89PaVjehqj2/VJ2FxxXopjtbfg/G7HRc57uddWB1KyrY8YzgdQp+FSnVp47FmkuG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+p+Tv7To1RNYSg3CuOs7WfSG+ZA8JaE33AY9nXBETp8WtVmFR
	cY7RhnaSPMjuExZIGVyLgLb17R+HmnabBmV807KyQNvu0eBXIfYSK8rqdUQjt+DI5AO8O6KV6We
	z
X-Gm-Gg: ASbGnct2ZfTgsbW0+sgQ6WPmGjmoK3YNtkkE0gr/3C6Zzbg+pOMlC3iFD3i8qHFLqxt
	j9d+48qasmt0EETHdbgZwvmtYz5IXGAX4iZ8kBPLMBU/shWlbX5gagBDlDOJGCn2hD+00t/Wokx
	7xozjpZJfxueoBLzcEKTPlWjF9ncUX+TbMsvMJFsztZL5zOEXvxKujeYx7KgnSRv2hrXnqCCt2R
	x6uI9BYRoD++fBPICacnYOiYlCiszWu8nThGTG50WM+KAMXgpsH8NEdlvqq730IC5x8EzZX5LJv
	Wn4Aq7htdro1CbRuGSZoQ+NQdOhW4A==
X-Google-Smtp-Source: AGHT+IEQVBkrgjioAw00LjhLtyaVjJhAuyebF7gUV1LhQmmwc8b638t447Vk/yLDEXbFDy5Y4yCjMA==
X-Received: by 2002:a05:6512:4024:b0:53e:28ec:6000 with SMTP id 2adb3069b0e04-53e28ec6045mr525398e87.34.1733419014352;
        Thu, 05 Dec 2024 09:16:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974fccsm295501e87.69.2024.12.05.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:16:53 -0800 (PST)
Date: Thu, 5 Dec 2024 19:16:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v4] dmaengine: qcom: gpi: Add GPI immediate DMA support
 for SPI protocol
Message-ID: <d74ibj74mrluovh3ylok3dyctf3r4iimoosegdair5acvpre6c@w5xfl6adtfto>
References: <20241205170611.18566-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205170611.18566-1-quic_jseerapu@quicinc.com>

On Thu, Dec 05, 2024 at 10:36:11PM +0530, Jyothi Kumar Seerapu wrote:
> The DMA TRE(Transfer ring element) buffer contains the DMA
> buffer address. Accessing data from this address can cause
> significant delays in SPI transfers, which can be mitigated to
> some extent by utilizing immediate DMA support.
> 
> QCOM GPI DMA hardware supports an immediate DMA feature for data
> up to 8 bytes, storing the data directly in the DMA TRE buffer
> instead of the DMA buffer address. This enhancement enables faster
> SPI data transfers.
> 
> This optimization reduces the average transfer time from 25 us to
> 16 us for a single SPI transfer of 8 bytes length, with a clock
> frequency of 50 MHz.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v3 -> v4:
>    - Instead using extra variable(immediate_dma) for Immediate dma
>      condition check, made it to inlined.
>    - Removed the extra brackets around Immediate dma condition check.
> 
>    Link to v3:
> 	https://lore.kernel.org/lkml/20241204122059.24239-1-quic_jseerapu@quicinc.com/ 
> 
> v2 -> v3:
>    - When to enable Immediate DMA support, control is moved to GPI driver
>      from SPI driver.
>    - Optimizations are done in GPI driver related to immediate dma changes.
>    - Removed the immediate dma supported changes in qcom-gpi-dma.h file
>      and handled in GPI driver.
> 
>    Link to v2:
> 	https://lore.kernel.org/all/20241128133351.24593-2-quic_jseerapu@quicinc.com/
> 	https://lore.kernel.org/all/20241128133351.24593-3-quic_jseerapu@quicinc.com/
> 
> v1 -> v2:
>    - Separated the patches to dmaengine and spi subsystems
>    - Removed the changes which are not required for this feature from
>      qcom-gpi-dma.h file.
>    - Removed the type conversions used in gpi_create_spi_tre.
> 
>    Link to v1:
> 	https://lore.kernel.org/lkml/20241121115201.2191-2-quic_jseerapu@quicinc.com/
> 
>  drivers/dma/qcom/gpi.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..9d4fc760bbe6 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -27,6 +27,7 @@
>  #define TRE_FLAGS_IEOT		BIT(9)
>  #define TRE_FLAGS_BEI		BIT(10)
>  #define TRE_FLAGS_LINK		BIT(11)
> +#define TRE_FLAGS_IMMEDIATE_DMA	BIT(16)
>  #define TRE_FLAGS_TYPE		GENMASK(23, 16)
>  
>  /* SPI CONFIG0 WD0 */
> @@ -64,6 +65,7 @@
>  
>  /* DMA TRE */
>  #define TRE_DMA_LEN		GENMASK(23, 0)
> +#define TRE_DMA_IMMEDIATE_LEN	GENMASK(3, 0)
>  
>  /* Register offsets from gpi-top */
>  #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
> @@ -1711,6 +1713,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
>  	dma_addr_t address;
>  	struct gpi_tre *tre;
>  	unsigned int i;
> +	int len;
>  
>  	/* first create config tre if applicable */
>  	if (direction == DMA_MEM_TO_DEV && spi->set_config) {
> @@ -1763,14 +1766,32 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
>  	tre_idx++;
>  
>  	address = sg_dma_address(sgl);
> -	tre->dword[0] = lower_32_bits(address);
> -	tre->dword[1] = upper_32_bits(address);
> +	len = sg_dma_len(sgl);
>  
> -	tre->dword[2] = u32_encode_bits(sg_dma_len(sgl), TRE_DMA_LEN);
> +	/* Support Immediate dma for write transfers for data length up to 8 bytes */
> +	if (direction == DMA_MEM_TO_DEV && len <= 2 * sizeof(tre->dword[0])) {
> +		/*
> +		 * For Immediate dma, data length may not always be length of 8 bytes,
> +		 * it can be length less than 8, hence initialize both dword's with 0
> +		 */
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		memcpy(&tre->dword[0], sg_virt(sgl), len);
> +
> +		tre->dword[2] = u32_encode_bits(len, TRE_DMA_IMMEDIATE_LEN);
> +	} else {
> +		tre->dword[0] = lower_32_bits(address);
> +		tre->dword[1] = upper_32_bits(address);
> +
> +		tre->dword[2] = u32_encode_bits(len, TRE_DMA_LEN);
> +	}
>  
>  	tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
> -	if (direction == DMA_MEM_TO_DEV)
> -		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV &&
> +					 len <= 2 * sizeof(tre->dword[0]),
> +					 TRE_FLAGS_IMMEDIATE_DMA);

Don't repeat the condition, put it inside if.

> +	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV,
> +					 TRE_FLAGS_IEOT);
>  
>  	for (i = 0; i < tre_idx; i++)
>  		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

