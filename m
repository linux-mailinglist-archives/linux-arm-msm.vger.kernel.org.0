Return-Path: <linux-arm-msm+bounces-52012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6EAA6942B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B509C3B935E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9AA1DDC01;
	Wed, 19 Mar 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IPgVT0oM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED71DDA2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399576; cv=none; b=E+iplTHvfT9cONyWmSXOr/2So7leX/XGokJi0XqJlnuPoyfvyMMWIe/VP+yxbzDDrAofUxFeFX4PHO1T5258kag8yXrjBA+RowbUFYrhpsQRcco0zM+yGkxBZBije9NmpQGR0VbGRU17IEeWHUdQ0BYmJPkXQsTnIEz30sScnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399576; c=relaxed/simple;
	bh=O11BgruQbl+UKgDttpGfPSppdluCW3BNuYGdXOixy6k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bXM6movWsjbdQWWx0O+4Llf29c9S4qdiummrW6yHR3QMumQEUz18+EgPK7DoU61ZZscEi1v3PqQYd9nqw9S5V7YYjItfZxSXpQJDL9pDDSIhVd9DKOouiERINlMpOui1ezRm05EiPxZkzWtuEv0DcDEmMZUUdXzRZXseqAWckwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IPgVT0oM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso32325285e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742399572; x=1743004372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtS7yrlPmvbmoIZ5I3j5iqPfhEamBd1a1pbda+O2aq4=;
        b=IPgVT0oMtKgPbVTsrimDkNKsLb44VRrLiN7gqASDcjIW3PbPPQk3uC4xw6uf1qTPcj
         CsCDWnGMevAJhuX9ScNh/vvp5WInY0VHroC1plfe6SeZ1qpr9/fWNqAnRvAWNijGBK/O
         hMI3fV7885I/sXXjwRK3yJNyBQEoN2QjDf/ZLe75KUDHLnRwvrZLzdIdMtge4Ral0Z+f
         SB9LyAcUdHNHWP/LyPgjFUbocQBKvxbfYUn9crLvk5QWJvvfntbqP7P7f7GxizKuYO63
         JoCv+ljsAfxHQARBxGTNsos733siiyhC46pSoXwHOE8T0oJMZuXlAh2rpHIb5vWZGvxW
         Gkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742399572; x=1743004372;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OtS7yrlPmvbmoIZ5I3j5iqPfhEamBd1a1pbda+O2aq4=;
        b=meSQAbZiSw1cTeSl6XzYxPmsrYzO4PUbn2UKzxwa4Ikl5kIerLfQUvos+q0XuCB9P1
         V5Pt/bsCHYZNfyks0kMaHeXXAYifHJj/N91OO0+pvVWtuQz1PL1WJLnJx2i6Ig92xKZB
         jHu3PsZsM1h6C7P/BABVFDG/e0G7U9oF98sIzX8LjBqlgOdCEbPXyB+VuPbBGKwVfaaF
         lfVH+MKn4lemvcmwCafSMWrOWkdFaqUEtDbv5gjTyDnxSiFskvtXgREdGnNu/zPvki0g
         FYR9EKKnzsAIa7RWSddgzt0Ys/XIjOnk5zOEaRG30W7/Vtj28wp8sk1JWKEX1T2bYaK1
         AxIw==
X-Gm-Message-State: AOJu0YyudT3SzeUcCVv61VFNLM7DccFUspqZE5qdaSirQc/Q99N71aIs
	Nh5dUquvDh8f3wwgOA+oTS1byV18dI8PcbZJcoApqPGK62L0FJxDaO/HzaxbJlU=
X-Gm-Gg: ASbGnctLMX7keQoq27dJ+WP3kXhG1AT65Lhf2UMI+MnbEbdS13zApGV4Rc0sAHZvCPX
	PcWf3FFpM+LYWPZHEwUbv3F35ToM9IMR+hnsIMsaLPLHS57ubUHSKr0PO/Q2VeHpc3YRbGmhoL7
	/fHqmsiNbc1W1oux9LBE9Zv6nR73KflMd/CiKm5qcid7Rho354XNJ0A8r5dmjopduGp3NDhypVx
	jHHwe0pq0le+pYO47WBz+f2t4bvB8PuHlNCk34zDepGI83tzal/aYYywGWOTI9N1NC+Tvvf6RBV
	rsUNOpWsGZqz9l0qMETuSFY5W1noCA3EhNhuFblL7Ae5we2qZm8OXY2FQ/Y1DNEHkIoHE2O1Iyo
	cmaxZockl6HTJqDvYvrmfOQ==
X-Google-Smtp-Source: AGHT+IGsoc3lhwMmNWUU7VPFLD8o2mSVAZY4GJxoMl37et8H1SS/K5nKfGy4iqKsLgIPiZmC2lFXVw==
X-Received: by 2002:a5d:5f90:0:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-39973b08eeemr3730040f8f.44.1742399572180;
        Wed, 19 Mar 2025 08:52:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f407:ab81:b45a:93e8? ([2a01:e0a:3d9:2080:f407:ab81:b45a:93e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm21539248f8f.55.2025.03.19.08.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 08:52:51 -0700 (PDT)
Message-ID: <bfba8edb-b1e9-4b9f-bf96-bcba35e0cd8f@linaro.org>
Date: Wed, 19 Mar 2025 16:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] usb: dwc3: core: Don't touch resets and clocks
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Saravana Kannan <saravanak@google.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-4-90ea6e5b3ba4@oss.qualcomm.com>
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
In-Reply-To: <20250318-dwc3-refactor-v5-4-90ea6e5b3ba4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 20:05, Bjorn Andersson wrote:
> When the core is integrated with glue, it's reasonable to assume that
> the glue driver will have to touch the IP before/after the core takes
> the hardware out and into reset. As such the glue must own these
> resources and be allowed to turn them on/off outside the core's
> handling.
> 
> Allow the platform or glue layer to indicate if the core logic for
> clocks and resets should be skipped to deal with this.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/core.c | 20 +++++++++++---------
>   drivers/usb/dwc3/glue.h |  3 +++
>   2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index b428b6fc3d0a55811e2f75d33d79df4b0c67dcac..77a9848a0ac70fbe563988cecbe489130989aadc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2198,15 +2198,17 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>   	if (IS_ERR(dwc->usb_psy))
>   		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
>   
> -	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> -	if (IS_ERR(dwc->reset)) {
> -		ret = PTR_ERR(dwc->reset);
> -		goto err_put_psy;
> -	}
> +	if (!data->ignore_clocks_and_resets) {
> +		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> +		if (IS_ERR(dwc->reset)) {
> +			ret = PTR_ERR(dwc->reset);
> +			goto err_put_psy;
> +		}
>   
> -	ret = dwc3_get_clocks(dwc);
> -	if (ret)
> -		goto err_put_psy;
> +		ret = dwc3_get_clocks(dwc);
> +		if (ret)
> +			goto err_put_psy;
> +	}
>   
>   	ret = reset_control_deassert(dwc->reset);
>   	if (ret)
> @@ -2321,7 +2323,7 @@ EXPORT_SYMBOL_GPL(dwc3_core_probe);
>   
>   static int dwc3_probe(struct platform_device *pdev)
>   {
> -	struct dwc3_probe_data probe_data;
> +	struct dwc3_probe_data probe_data = {};

This should go in the previous patch

Neil

>   	struct resource *res;
>   	struct dwc3 *dwc;
>   
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index e73cfc466012f07214291abe56454934ab014013..703d40c189565b1e28ae28afb8728b78f4cd2fca 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -13,10 +13,13 @@
>    * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
>    * @dwc: Reference to dwc3 context structure
>    * @res: resource for the DWC3 core mmio region
> + * @ignore_clocks_and_resets: clocks and resets defined for the device should
> + *		be ignored by the DWC3 core, as they are managed by the glue
>    */
>   struct dwc3_probe_data {
>   	struct dwc3 *dwc;
>   	struct resource *res;
> +	bool ignore_clocks_and_resets;
>   };
>   
>   int dwc3_core_probe(const struct dwc3_probe_data *data);
> 


