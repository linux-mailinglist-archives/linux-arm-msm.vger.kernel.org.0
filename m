Return-Path: <linux-arm-msm+bounces-31244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB849712A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA6E61F21EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 08:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913501B1D7E;
	Mon,  9 Sep 2024 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmLUSfCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3D14B94A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872092; cv=none; b=fFevcqvKJ0BHgD0IVPi29Wkt2kznTKbCmH4OTvc+GfqoH3Egim/xi/RdJayUfqvuyu1YF5BKakT8jDeNO8LRc9hIqcEIQFXqGv6G5XhtqAdD7x6w4OU7gp5xvCfax4VgbSr4mAdTjGDOmVYcJQtUoSi8lf4urzdhR7afV/4Ik6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872092; c=relaxed/simple;
	bh=9NW2eWgUEPYGMgqTTAJOulDxRDM5ZibU1CDb2TG/UIU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bfpCgNGpgbcbSzWerTFsGeF43ebz6q1RlxTlJxwID7yJ8UMlbW8mRm7q/n/bMxbDutgvLqkAAXcOqR8KZlHYbM4MS9WxPRZ1iNdvsiPUWIgDUFEfs3rLkeb6BM8/KgtptnIilo3bOUS6o5vPExKzkgSF6WBrnymP1xecMtdRnWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wmLUSfCe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d64b27c45so33925266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872089; x=1726476889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG/d1qUdxYTFFDjEy58VtD5KHrMD8xW4N/b1u+y2Cz0=;
        b=wmLUSfCeZfx5N1YW7DQI+Nx8gTyE0MzE5qmzP1M15eOOtXLDV4Hx5iuyOHZLrv2CTq
         vsHCI4TeqFki44NEgXxIXmP9ciBb3ewhCVw+EVx4pxTVtnwLSjQRu3mxrqJxrbj/NHLr
         0te7IOIx5G2dFhmGPh69O3s+QYQtLp9NbGDgr71U+pPHHveP8j8XuuT7CRAkXOfQVBXO
         eP47SrE3tjLWvwXKXmAmoFpmksml42PSF0gMH0GBqRB+G0VKjIUh+9gcneJZ/DJ7PTDa
         qIjwXMrAQpoAKmMOGw6WdBerr9Mc/KtHoc2hWoMxAy+79FMXt6ScumW+Oa9+YgKUGBru
         kWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872089; x=1726476889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yG/d1qUdxYTFFDjEy58VtD5KHrMD8xW4N/b1u+y2Cz0=;
        b=nYVpnm47sw1UazzvypJyv3HpPWrdmZYdDAgywalwYusGaCyCbrZzhDBQVTu1kVgRCC
         XtLrwoJdfmjkNHJtsPdrsT3k9fQmIk9pvmBthyVynOQz8LPDA0Z+SVHXnogUjZxlAuZR
         TJiyq6QHfKuU9VL4eZ/Ba5BGlX48k1PrvYUmcYa6atjm7vI4va6unsl+I8lPDIRjyRRN
         A5keoCXqrSfDaKHKthnFuR8vM12BfBrVwl/Vv3fbuToEPnwoJexPp5OdnEVHUnS32GZC
         bWZ1K8Jlv8dE0rayLcl0zYQXaZahP350aZwfO0vOfcXz/L/tcb6N6xCP+jZw03yVwtdL
         nsSA==
X-Forwarded-Encrypted: i=1; AJvYcCXklFlFIzvhtKmT2g7WZJOiIQNMsl5kBBw5TJOZydW03AYJodp6EqGQgcygPiwJ/4WyXhbp2uE/K2joBctP@vger.kernel.org
X-Gm-Message-State: AOJu0YydRxC8fbXz11yvt2r00ACzjqtRHRJx2PAF6EJZcygcTLbsm4Cs
	WR55TI3X25JXccek+I4NOLx1qzqQLZgMSL20GSiifWJZ2FVLfrG74uV4ehpOUlc=
X-Google-Smtp-Source: AGHT+IEvfzk/SxAXufH/seMQzMP3N3vvMRUKKCoLzWJKRZt4xOsE+GdEic8FWJngVTj/WRC44oGsQA==
X-Received: by 2002:a17:906:da85:b0:a7a:9f0f:ab2c with SMTP id a640c23a62f3a-a8a8866090amr889703866b.29.1725872088318;
        Mon, 09 Sep 2024 01:54:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850? ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce96d9sm307445466b.157.2024.09.09.01.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:54:48 -0700 (PDT)
Message-ID: <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
Date: Mon, 9 Sep 2024 10:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
> Use  "qcom,shared-se" flag in a particular i2c instance node if the
> usecase requires i2c controller to be shared.
> 
> I2C driver just need to mark first_msg and last_msg flag to help indicate
> GPI driver to  take lock and unlock TRE there by protecting from concurrent
> access from other EE or Subsystem.
> 
> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
> Unlock TRE for the respective transfer operations.
> 
> Since the GPIOs are also shared for the i2c bus between two SS, do not
> touch GPIO configuration during runtime suspend and only turn off the
> clocks. This will allow other SS to continue to transfer the data
> without any disturbance over the IO lines.

This doesn't answer my question about what would be the behavior if one
use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?

Because it seems to "fix" only the GPI DMA shared case.

Neil

> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index eebb0cbb6ca4..ee2e431601a6 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   #include <linux/acpi.h>
>   #include <linux/clk.h>
> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>   	struct dma_chan *rx_c;
>   	bool gpi_mode;
>   	bool abort_done;
> +	bool is_shared;
>   };
>   
>   struct geni_i2c_desc {
> @@ -602,6 +604,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   	peripheral.clk_div = itr->clk_div;
>   	peripheral.set_config = 1;
>   	peripheral.multi_msg = false;
> +	peripheral.shared_se = gi2c->is_shared;
>   
>   	for (i = 0; i < num; i++) {
>   		gi2c->cur = &msgs[i];
> @@ -612,6 +615,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   		if (i < num - 1)
>   			peripheral.stretch = 1;
>   
> +		peripheral.first_msg = (i == 0);
> +		peripheral.last_msg = (i == num - 1);
>   		peripheral.addr = msgs[i].addr;
>   
>   		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   		dma_async_issue_pending(gi2c->tx_c);
>   
>   		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!time_left)
> +		if (!time_left) {
> +			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
> +						gi2c->cur->flags, gi2c->cur->addr);
>   			gi2c->err = -ETIMEDOUT;
> +		}
>   
>   		if (gi2c->err) {
>   			ret = gi2c->err;
> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   		gi2c->clk_freq_out = KHZ(100);
>   	}
>   
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
> +		gi2c->is_shared = true;
> +		dev_dbg(&pdev->dev, "Shared SE Usecase\n");
> +	}
> +
>   	if (has_acpi_companion(dev))
>   		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>   
> @@ -962,14 +975,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>   
>   	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> -	if (ret) {
> -		enable_irq(gi2c->irq);
> -		return ret;
> -
> +	if (gi2c->is_shared) {
> +		geni_se_clks_off(&gi2c->se);
>   	} else {
> -		gi2c->suspended = 1;
> +		ret = geni_se_resources_off(&gi2c->se);
> +		if (ret) {
> +			enable_irq(gi2c->irq);
> +			return ret;
> +		}
>   	}
> +	gi2c->suspended = 1;
>   
>   	clk_disable_unprepare(gi2c->core_clk);
>   


