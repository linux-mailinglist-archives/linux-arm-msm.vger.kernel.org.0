Return-Path: <linux-arm-msm+bounces-46096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F29A1B858
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 16:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CAB4167C0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 15:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8158C155333;
	Fri, 24 Jan 2025 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZ9RYmrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21B14A098
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731065; cv=none; b=je3b1dqh1LlxTLWFfnDLLxg49/O31XT7+POTLr0b0CoXQ/03/3bVQ/2SBaTjzjWdp1RMUz3i062aYB7L8yKUvLGBO3TpmtiKKBvYj6PHA5bSbVuv7pCNm7Ai+Cg6esz9x76NgNrIuZ26RJQbfEXAu0H4VZyjgAasnpfzLIB5fRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731065; c=relaxed/simple;
	bh=liY600PqK6SuQdA8zCm1S+bF6lwoZE93mLEyzx5DfHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thEErjjFtttm8haXYyqzBf1TLbJz1eaCKnMIztCof0zgYr00rIVmSARniUFP/sHLCd2HIoyYbo12Ngva+cUPGPoJib+nkxcEl/BO87B8rT9EmJ4LLpipc073zq9Fe+LHrfDFL/3GfPvs9SOBiyNBBCiAusbMFYKR98oKD4eoHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZ9RYmrg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so2071259e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737731061; x=1738335861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BL8Ul2XcyUU343amcRNc5uIxhkMMSlT+CFrfiyK8B1g=;
        b=AZ9RYmrg/L63vTEDtxEQWasvEIvnald4/gbd53TszLmXXlyHW57crGX0OcXO8AjVN7
         T+TDxL5WasomnB+eKJQOn53pff85EBtF6asYiivLcrj6vG54A8kO8ZLx8pvvUf1pH60I
         mKv3czd/B+Uo1z7FvW2mE6KkfGSNRIrZBA/eb86icGQX210ivGCPeUZNWl+aJr5Ha1fS
         rMdj0WwExqxbe49Br2Qb306kLGxqmTDU16G6MlY6zbaOIKwK7i5kSuDv01woBaRRRgXl
         0k/jBxHvesYorRb/4CAbxE2XZiJ1fuqES1ZEdZ77EyiH3MNfKw7ONGYIxFxudFRpAJVb
         iEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737731061; x=1738335861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL8Ul2XcyUU343amcRNc5uIxhkMMSlT+CFrfiyK8B1g=;
        b=VHeVR2PZpoGNUerobRmoI+bfUV4P8doJOMLAqhOneMIf6WEXSr3oIkiUTb36yRgUZ+
         pcwPZXoEHI7amgCrm+t2GcFUhA4c8uVuQsnyQJxmEkZpeovic4iCQsS67NfXUVlSUpGh
         w8YN35gGmbqmjlgG0AZ73kojf06L4mf2OxktUSvcoM4esxCXkfJ4Y8BjlJwFSz9lqTMR
         rbc0GHMUjx1om3JDhBoVEeNcQjRxHjLNG+aVi6B9IQOCqk0if8x0ASBnS2TsjgBwpOvj
         /KxrE9HbGFW9wJQvSZMHtupc5IHcBhLx+inLosgKH/5y7noC6d73DCSsssdjNBylHOmg
         nVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQRyoONk5FaiGbxiHUCieDqogVhuG6TEUGxs67EBB4uEy2hDCftOopTsEQyr6HZkcgLkc6IDk6jwFVWCOU@vger.kernel.org
X-Gm-Message-State: AOJu0YyMpDCAZA7YeWF0+gdjJeEL5jflmBZiPWDWbjV4gLJVsvRZjxW2
	AT2i3EjaUWOlFu4K/XawZ81ECfkEMaHoIsyjuO5hPpYFW53iD7KcPGmHFKibN4w=
X-Gm-Gg: ASbGnctJ5p+peVhVG9pgccNfPBuLe/qULQYstBoJvXsERAdU2bdF+JHIHI+bs/CnkGw
	5aRefId8R/aFaIA+4cWE7Qn+34kLt+w2ByIwHXqVF5dyGorjUinF7l5NlUcQ76P9CVvhbNA9eJO
	JxsWHPe/T+bxTUHwa5EO2WOTbd8E9p2CtXRKOkQRdBJKnH5LJDh/3I3VSakq0LYT3lYlo4Q3gwC
	4W4zBKJ2kaEON1herbV8r/A1bRLNHWSC2aw1a+/wbocFurmagGW0y2RSU1qd38VXBTa5Am8IbK5
	gYBJi+6GoyxnAyPtMdecR0aWHOsRD0IPkMYDJU7MRApquSoSP17v24V7nIFu
X-Google-Smtp-Source: AGHT+IHS9PHO9x4XDZcJT55m+6x+Q9EK3neB+9wDND3aZQ9uAKr907TwYhmNzs8zVGiWd1E2ypV6CQ==
X-Received: by 2002:a05:6512:33cf:b0:540:3572:1864 with SMTP id 2adb3069b0e04-5439c286c06mr11579332e87.44.1737731061182;
        Fri, 24 Jan 2025 07:04:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836841asm317213e87.131.2025.01.24.07.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:04:19 -0800 (PST)
Date: Fri, 24 Jan 2025 17:04:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 6/8] i2c: qcom-geni: Load i2c qup Firmware from linux
 side
Message-ID: <d3tydp3m7pehhiphupwybjlol5v2u3sabqotqximxmnswjlczb@jmdzpbrcrgou>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-7-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124105309.295769-7-quic_vdadhani@quicinc.com>

On Fri, Jan 24, 2025 at 04:23:07PM +0530, Viken Dadhaniya wrote:
> Add provision to load firmware of Serial engine for I2C protocol from
> Linux Execution Environment on running on APPS processor.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7bbd478171e0..9ad3b8c9a224 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -872,8 +872,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	}
>  	proto = geni_se_read_proto(&gi2c->se);
>  	if (proto != GENI_SE_I2C) {
> -		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> -		goto err_resources;
> +		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);

Hmm, so if the SE has been configured to e.g. SPI by the TZ, can we
switch it to the I2C?

> +		if (ret) {
> +			dev_err(gi2c->se.dev, "i2c firmware load failed ret: %d\n", ret);
> +			goto err_resources;
> +		}
>  	}
>  
>  	if (desc && desc->no_dma_support)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

