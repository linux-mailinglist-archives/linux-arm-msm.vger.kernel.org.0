Return-Path: <linux-arm-msm+bounces-10659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C84851604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B6F6B28AB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACCD3B782;
	Mon, 12 Feb 2024 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vb63mbps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56A3C08D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745338; cv=none; b=oo0D0adSxdNV4IphOZvByGGOTwJZ+5nuEYv1E2IjWyySeN/2oadfoyTEaGExgCqLLy3Tv1e4n6ABlGH4b2lpwZkIlBj724IQWTTckEuAagfA493CHSjrZgu9MlpO1CT5KB4Bi0Sj/gzkuPn0t4obY+BfBadHEATtDqnIcDC0DE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745338; c=relaxed/simple;
	bh=rqH8V6xbdfF0F13rCGzXMzpp7vuMjDdnewyWWsEO/78=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HqsmXVS3wMQe1ZQsLxmikxBvVdwBte/5vFZlhQh7kyN0cLxSqK/xMkZdkc8rjjN9VdwDWO53FQ4yXm9RbuKk9xQSj9iUtBdlIi9m9wZUnqzcphkZRRhLh0Y/2bvE2ECkquOsUlNFK8qyphzYzbb/zR81wFN7JhrtFdvWpC3dxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vb63mbps; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5116588189aso5597615e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707745333; x=1708350133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1egguljA3sQnHDnPRPPbcueWjcXgdGipGLJzM0d48g=;
        b=Vb63mbps2X2lwnZu/gl7kssWgwOwnlcllMqQMgrSU+1mDNDq3HaQ0GiZSSM9FViLl7
         n7K7SDL6Pbk/1BYSeWN4kGD8SfIlUtCxjyyxGbWuqwCHVJXu2DOcpZtBCMSPiwP/XG8n
         5CM6lETdijaGEZU5jWlN1dNC48a0tSfr3U5GY8Cim8/yhs9r59gc373fB6fCQzHhEDvI
         XuYw28xYdI1qQHhJgblXW0i1OJimfSD19K0DCp4W9xO/rNcHSpav5zEWrDyyl+w27Zo6
         jBAqzz5MG9hwf3iUaL5+H52t7VQnuUM/E5uuO3oBcvJHlmI15/mdpe7/lPllHrF2DWcU
         LPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745333; x=1708350133;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1egguljA3sQnHDnPRPPbcueWjcXgdGipGLJzM0d48g=;
        b=UC5kF3KqSXYT4dq0ZMq+k3RTB1KsSNuKBtQnAD1l7ESiaKLN3/lk834lA5mKjxytvE
         VXhcRjLi44aMT1N/S+wnf78X4rrl3FnpKcdkGY38HuhA7C258HgdJhJuuHBd5QQ4XJga
         sT6vZo0Fa9vTKJ95bRFcASxyRHZpXtHH+OZc7Wta655tQy9HXjt9LXWqbFtJHFhDxph3
         xVwPJbzI7dSX+yteAc5tQneZw6rNHFhZUo0yF7mQMmNAHTwOngMNV6WX+FfRkPLARgtF
         aN9FQ5qR2Z9/yv46zaMWAQkb3tbTnZbYV/sI7SmNDErm4+vL04awq3yMFMtu8SHZ8LmB
         DsAw==
X-Forwarded-Encrypted: i=1; AJvYcCXtS8uD2sXea913FiDf4xv2Bs/CptPpRt+Eq9Bxt17T9qBuosoCIU4oY3ELVfo64S6eupvXorNtLGXLFXe5czuqcI4E2Dx7MKC/oVLdPA==
X-Gm-Message-State: AOJu0Yx/0SR+XHZZRFKqdwzzUMKYaa8AihcFkrChovw7NpC2m/saXiWP
	0cuTBwSzrG4OxIUoBRudYkzXw9LFUIrr8EcRzW/H+AG8KXRoD9oRdEZyCQbtoxQ=
X-Google-Smtp-Source: AGHT+IE7YwnAR/t5AkP6YIn0uMqvFArgd0ofli+tExgAVx4Cgyw/iRwBsY/FeDi710tbkExSXCIOYg==
X-Received: by 2002:ac2:518d:0:b0:511:694b:245a with SMTP id u13-20020ac2518d000000b00511694b245amr3909298lfi.58.1707745333527;
        Mon, 12 Feb 2024 05:42:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSGZEBeKuVwG5VasUk/o18BoRvc4R9Q7F5J+Lo/pwWIDyLBSFsdfdBW+Ug5S6sQEiESgazczGJNgzEtXSH7KCgyll9dF+BWTwx+GtoKN60WaP1mxhCL4fl78Ibxa6BuZedFAfxdWRl2QOtzLs0YMxAs0Qy8TDWgDGiw9R1AqO+qTDUa0mwR4/2z3eG/guHgkoYL6e0nyD08WAnBw8PwCSv0Sl++XmwvsvGrrH/VM5BB7mwS1DXZ0iQ11/yQ961yzkSNNY9qK4D/RWvzpoY5X2nHz7Vsmr7SiAi0TC2exwwFDgLeSk3xfUUQ4KFZpcY4ThLjhiprCW28zdR71SZdwDlRutKrgd+4g9zoCTFNP3CvfYn9ClQMO5rOiBN3qFFzBXa4Q82On/G6BD6B8AODSS5zfJNW2epYPclYs/rLndb6hRhzcCIDm3pQSywA5BNb3I+oppsOAKPZn8O3WF+qwQ5vL7coeQHKSzbuUO/3Y84WACJl9TaEmvEQQmdS0ssukbSHkkXAZ6Db5IpdejXVN4mPWGFz1wp6vxEY4LY/0XAGDvChusbP8yxm5I8zHD4CfIaQczmcu4jqrdx5d3qj4Ol77vshh2JZvZv8wS4nZ7mE99gvyqJXpISln4wJwVMSE/nyqlTziVSBurxnlZqQfqY9R3y2jJetsmfBlJynt1IHJystVq3bbo/JtqB6syONugrNRLdDT7wSMx008w61EgjwECmQpV43svrG2LnFwQI3osPkWrp6uWIuQ5jcvdoob/B3d6WGfNbfSgKptcxPPDHh8+ZXdZWV8c/ZHD1+zRZU5XHhPoG+s3Bjw==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b00410ebcf8180sm1605785wmm.43.2024.02.12.05.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:42:13 -0800 (PST)
Message-ID: <3b31a7da-1ac4-471c-827b-1d9782c9d9d8@linaro.org>
Date: Mon, 12 Feb 2024 14:42:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-6-fda0db38e29b@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240210-topic-1v-v1-6-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2024 14:10, Konrad Dybcio wrote:
> In a fairly new development, Qualcomm somehow made the DWC3 block
> cache-coherent. Annotate that.
> 
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 925e56317fb0..e845c8814fb9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3207,6 +3207,7 @@ usb_1_dwc3: usb@a600000 {
>   				snps,usb2-lpm-disable;
>   				snps,has-lpm-erratum;
>   				tx-fifo-resize;
> +				dma-coherent;
>   
>   				ports {
>   					#address-cells = <1>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

