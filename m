Return-Path: <linux-arm-msm+bounces-10658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB38515AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA5741F21267
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66803AC34;
	Mon, 12 Feb 2024 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ih5fje+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0F3AC19
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745328; cv=none; b=YlaUediLT5GTY1O+QFrTUKoHO3pKo7uag9MWJD/3UhoH314V9P+QVy1Sv/yDRHWDpjCd8fvWbI1OdTx7QIVVuXN0mDd7NLRx6dN2IZReQKY9CRMFgNy+SdrTxfVGyCaSETNGFBwyp+RhqwdA0lhjtLDABLGV86RQlUipr3i0khg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745328; c=relaxed/simple;
	bh=dWBpDuEOTKutbVODo5O8JgmUh/BDERlL4YllkvQWSXc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BSFIp8l515baLn6bjDK3w0XpwgxlqdaxbNKwWU+g4wM+VMU02T+e4dRWlhuzMpvx9LlkZEGMyGr6GZURk5vgFJmNTHEoLykk9H/vG8Al6v13WZztB/8GahNgqF71XqHTHtMlmMHa5DHJrFUk6DeGmARGuLtOk7ZqKLN2Bjuchuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ih5fje+k; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5116b540163so4487573e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707745325; x=1708350125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dE2Uu2uCSHa14SdY6tBLgLnoKp7H4jLEiI18y+He1o=;
        b=ih5fje+k+fkh3pOl8xssbvZ48upBI1jsNmnrFZgi+8SjCRSyUht65pSOrS1ac1FMHP
         v2lYEVMiqQEmgdnD9B3UQwN5/Ejy5q3PzaWml3WhQIeLpmDKEND+E0WizFdNMcGRkD3T
         P3n3c/JMCEIMrE+erDkY0ePgBCEaUnpsQX69iDX1jnoqoGn6glmcDWNI1Yok5WWjS/yz
         aJECXG1Gv34vh4PZMuR1RSpB4ZPRJ3IMqUlqnXU2dr4RPpTuuvRUssIjS78Yox2hPWXn
         HboFjnkxXluJqS23CMbwHr7DqgqEWVxSKw3f3sTM8SvD2A/UdG6LjwrtdKFxj+EH9Ryn
         z7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745325; x=1708350125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0dE2Uu2uCSHa14SdY6tBLgLnoKp7H4jLEiI18y+He1o=;
        b=hRx9iROEhaEHaR2meKIScHPrjwgcqI1/8oLyfjYTnZATh9W72CzSBg/pvu90Ef91nC
         t7yHnoFCNapCj50UZDsEVctldjlSyI+/6chTHzYJmlFIpZ6Q3mmMIuyjSLMsATIhFuw6
         dvRI0CtiyCcr2AqkBElNolf5c127laJ4aoVZ3FsJeQ9GXKvqm7rVUwWsdGXidrOCO7Ib
         HN+YgLAKlGZxv6DdNZ2Gh754/yIW6dkuW8rYgg/MHKh1qKoeQaUcATM9V9ovMm2nQ4n6
         sV7zL3hK6sPCCNsKf9vy0YN1cCvF60Do+Eg6dRirfUx+U0CvEiRnXPn5DxpQ21Nw0qsO
         OQxQ==
X-Gm-Message-State: AOJu0Yz0HByO4mzfu3MF6UMeLagoqgY617qggoMaunFzPl0uDuSsJyX/
	ZKiQHvAD+N8kgUMXoDnYyarXxTxfIhPj2S8Tf2TPIVu953chhk8rDQzeATNWiV0=
X-Google-Smtp-Source: AGHT+IFC5y9HwH857WCaVUaBtTyClAsbj4tu6E7IXIMqaLfUCEunlC+uc12C7TefW6aIn61+SjuuZA==
X-Received: by 2002:a05:6512:6cd:b0:511:7fb2:3f7b with SMTP id u13-20020a05651206cd00b005117fb23f7bmr5753221lff.17.1707745324626;
        Mon, 12 Feb 2024 05:42:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSCDI13qgx99gAbVFEn8ESfRFYG3keqn6rI28ZLBCkIqMNqoaabEiI3cBGM7O9tlzvU02SKyewJkZORCNvRQZY665r0+D0P7R2GFyUbf3qmniApbAZlbpNWKyyckPQpM3mgDIMqLc59vsRRdlNdf3jOYaQ7k1eKC2OR/7qDgstSNkqzPr9PB+EL3ov9ICT5d7bC68uXbx5eN9dqIaWYDgtc+A8xK5k6vybqX1wLKbKV14Jt4S4L+qZm5NKfoGfrd3aLCgjayTLixopVDfTH9V4MX0GGtgebtL/7BjppbJhZ3uYbP8SXNPej08+YmdA3NOrS0IZVfVj8Y9IX4Gm8+zX2S+g+R2v4QJkk2V+zUqoSLmgvXMeg4IBs5yesC99XrrVI0I+k/YSvvicxICZir3PcWNLQyVuYHr4fGgriS5VTID4fIMMu/kz8G8rkkGPbWtvoYRdTGIOfj/zmPNj+Z+0Tuqo0EQqhfI6LuMKzAfcjR1zPO0VUjWpN+X6Pt6aOTtwZznLF6p9OmL5Nalg9xtYA2Vn40A95/E7MoLcGjnMTsEixnGoHXlfDS+dXW93MXVNqHXU6vWqcLJZuEkvTPMBcMvbK1EDrYTKrvscw9M4K1m8HzOwG8xvUb+sJ5zjM7L1fn9kgcFVMwFgkeySR+lqKFdxehdGJ4GfAsng8REtuSPf/B8FPnG6NUT1V6j1YqZjDrn5/3ACmwBj7HKcjHFhL4nnZSFF91u17Uc72V9DulKVMEbmuHxap0225/4iaayl7kR8hjDpzYapURif95IGkRU0mpcKQnXvgHD2exJWE6X1wo2DUTZB7Q==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b00410ebcf8180sm1605785wmm.43.2024.02.12.05.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:42:04 -0800 (PST)
Message-ID: <8ffe81a6-e609-4ca7-8075-2d630dc7c378@linaro.org>
Date: Mon, 12 Feb 2024 14:42:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8550: Add missing DWC3 quirks
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
 <20240210-topic-1v-v1-5-fda0db38e29b@linaro.org>
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
In-Reply-To: <20240210-topic-1v-v1-5-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2024 14:10, Konrad Dybcio wrote:
> As expected, Qualcomm DWC3 implementation come with a sizable number
> of quirks. Make sure to account for all of them.
> 
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 868d48b85555..925e56317fb0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3193,12 +3193,20 @@ usb_1_dwc3: usb@a600000 {
>   				reg = <0x0 0x0a600000 0x0 0xcd00>;
>   				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>   				iommus = <&apps_smmu 0x40 0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_enblslpm_quirk;
> -				snps,usb3_lpm_capable;
>   				phys = <&usb_1_hsphy>,
>   				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,usb2-gadget-lpm-disable;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,is-utmi-l1-suspend;
> +				snps,usb3_lpm_capable;
> +				snps,usb2-lpm-disable;
> +				snps,has-lpm-erratum;
> +				tx-fifo-resize;
>   
>   				ports {
>   					#address-cells = <1>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

