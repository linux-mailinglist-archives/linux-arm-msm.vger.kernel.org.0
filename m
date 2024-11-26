Return-Path: <linux-arm-msm+bounces-39159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B29D9177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 06:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBA616714C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 05:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E37DA82;
	Tue, 26 Nov 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRGWo8WJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50E36127
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 05:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732599937; cv=none; b=cUlwRLQ+oa/F7tzmI/LjRuRPy+bSAdoW95OOCO+FkabszcG+dAHUienLIn6wW4YS4lWNk95eQOhd1nYpR4DikN/tKrncTZA8IfJCAuRMmOrM6JTCVdFahq4cQ6+ni0SDComhWarqvcG/85fl4vX9BFPTyad/zpMESAZ6JAGFZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732599937; c=relaxed/simple;
	bh=LduKrUiuF+o4ID5hULsbw3YjGls8uuInoe2CDUqrjnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDbeEgH9fuiuggyasO6R0CSdYlfKyRHRABN8yYklGqYwhvIaKIzegRqG+2NEioM0v9CuJcBCJGmVHDVk1mwVMDGn7JO2ssy9G7nzGrYspxEeVb6Ix0Av1Bq70D8144IsrWdZvzakMQGUqnqIMw0sJ5KLDAtG7KpANgfgr7/gS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRGWo8WJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so3239367b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 21:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732599935; x=1733204735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ru8A8FYea7pWk45ZPv+cLA69r/6TsIev+AJUTgUfZ+o=;
        b=bRGWo8WJxb23tBA4xwr0/64TqF8c63yT94NYh3lUJB6ihPMJi/HKi6o04Bjpl9/lio
         W7jF5TX5E7eaWlgvQ85cHnD8YOBuo1MMaZEJFjpCTdnZrLCkst9UZoLPmo8oiExm8oSE
         kThWDQI64P5xa4hKkusGX1fSMyqYqLR0OC+LwEle/UG4FZv8VihxMFKVaNe/Ap3tupM7
         gl5CDXrnxHyOJn2/pJ0aDVK1Ye+0kEpYJb0dPQ5ASFF1xkdI0bMGmqKAAdtiXQ5ysRxj
         FGDL+HCx7ZMDavP6BIetAmLWMzGtzlVNbgoQrvKsj8O8Xiammk/ezjei9oxayPgd8omn
         leWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732599935; x=1733204735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ru8A8FYea7pWk45ZPv+cLA69r/6TsIev+AJUTgUfZ+o=;
        b=wdDVMMhzQdQxekChaciKEyU2I76DW8O+5ytMk9U1+ETxa1MWnbr2uINOfdSBzJsFvY
         9Q/AacfIoj28qrAm6/Ytzork7sdbTycHgoI0zGFLB2zBO/t0etExavnIvW+I5A/8kp2N
         5W3wGBocmkbKJPXYgCRzXGJl7a4V1O+T/58jht2rDqp2YO2BlVLiUtnAKExCMqxLYeou
         +ZMQBtaNbroLFrLDeKpLKrrWn1RocVz+jBVtok/3pOVE2Yt+8fJHsLr9gQXMnrrClJ6K
         tWJTnQCFvDsDKZgYiVwmsOFmat3s5VWGR4juA6ZQ3U7CMNbFw/sbrEeRQbLTBGZKnjmM
         t77w==
X-Forwarded-Encrypted: i=1; AJvYcCXhicpxdVDU0t2MTvLY6eOQJUETKnCAOq1kleLEinTZIAFBHRnHHq10zB0R567ur6nTSzftpsxdft2T54X7@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8XZn7cRKk6b7/qJQ21GaodMxiX7hEyuwM7uuTwXhR8PfZ5ec
	RGDH52zriCzaYzTRgi4lvyYKb5PZcHr2yRF5NzgXAD9+ITifygl237XkbN3s5w==
X-Gm-Gg: ASbGncsEh3aS2Yq4CKqF2x44chofIaXlg/AkwLYAGXwx9Dj1D0GhbzATZa5DwIV7Hv/
	t6Q32ZCOdm3aMIplNbc8SRR1PTTQAa4SAoF17HZiDrXgdgVbwumPbA2MXO4QQAtkTVCnOmEIZWB
	HFqx+3f2D8Jt2jl7zfSytPr1WD0+2jgh1YfqQznofLPakbw6u8x0uISnn4wAlv87V2bTYlTMET3
	9UEzuIYnSOUadCq3oOeM6+cmG/Qa7kEPKxe1I5tOtcgoOF78fj5mvUhasSM8CI=
X-Google-Smtp-Source: AGHT+IEBdAbqM+xFjnu+5Y3RUrCVenb/3lk9NHI94YHgWcVczPs6/2qW10NRSJW4WAL4o0zVcC2bbg==
X-Received: by 2002:a05:6a00:244e:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-724df5ee500mr20478083b3a.12.1732599935009;
        Mon, 25 Nov 2024 21:45:35 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454ae5sm7505161b3a.7.2024.11.25.21.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:45:34 -0800 (PST)
Date: Tue, 26 Nov 2024 11:15:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20241126054529.ewoajuaor4wpa4xe@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-4-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122085933.2663927-4-quic_mdalam@quicinc.com>

On Fri, Nov 22, 2024 at 02:29:33PM +0530, Md Sadre Alam wrote:
> The minimum size to fetch the data from device to QPIC buffer
> is 512-bytes. If size is less than 512-bytes the data will not be
> protected by ECC as per QPIC standard. So while reading onfi parameter
> page from NAND device setting nandc->buf_count = 512.

s/setting/set

> 
> Cc: stable@vger.kernel.org
> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Change in [v2]
> 
> * Set buf_count to 512 in the parameter page read
> 
> Change in [v1]
> 
> * This patch was not included in v1
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 31ec3db1246d..e1dca4857754 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2926,7 +2926,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>  		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>  	}
>  
> -	nandc->buf_count = len;
> +	nandc->buf_count = 512;
>  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>  
>  	config_nand_single_cw_page_read(chip, false, 0);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

