Return-Path: <linux-arm-msm+bounces-4512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3974810CE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 10:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDBA2815E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 09:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1F21EB38;
	Wed, 13 Dec 2023 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJqE7Ae0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C52AE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 01:03:00 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3536cd414so1704825ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 01:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702458180; x=1703062980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ5v76BnrmLWivZZ9vq4Wy8nZbRsobKtjTZUA/itlB4=;
        b=nJqE7Ae0E6XlIFIbzOUZjvgIcTUdLs2raRXlc+qtRt4gfRVcq6AzcsbRR3FwSnwDd5
         RR9pKjlFhsgInOyJsdWBbWCGcGl6MHx6G6w+ftQMi1reCeukgD0Q/XMm6zO8S6tkp3IH
         uQgDcwalF5W8BGhumz/ZOIqjTpUOL4oj0wVLnbux1K7vv5w3pXjdB/u6BcuaSfiAlSvP
         aZzafSvjgIl18h0z20pEFbPoofXGc9uxsjahZ988JjE6TYeKWb4nUO7oQeLYpmQpqH05
         NSZDcH5au93eM+kxLRxSECdqVf6zHsxWt5I3WNsO0mmBdSkqWnzvG90QxIjbOgEeEMXg
         HHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702458180; x=1703062980;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zQ5v76BnrmLWivZZ9vq4Wy8nZbRsobKtjTZUA/itlB4=;
        b=ARF9w/BddfeezRRAKyPGDTfYuIeaoUaw2fcAbCsVsOQ6Ogkr+RE1C/JOsAgoGJ98h+
         Xu2z6r57WsgxC1A5Ml2ZwhgZOoAcMTItO5A2M8evQEbs/r7tGkq2b9FlIiHLQuTD8W3j
         NvaM0IK/MzcfXtqzPKQiz44GnBk17D92nOIczeZtg85XzSCTwcKF6ps7GBZHigNaHcxU
         wZw/FAyE108bYO7lqkymcTDGNbzw8GPWP+yR7QR9qbbfQW25hCc2JvhTDEXuO2mAKif3
         ehJOM9jzkhLtQuRZnrpeEd/FXK8SVFKbQhRJ5fucTdKBA8jOzdKTyuigyE69xkkYVWFT
         R4Rg==
X-Gm-Message-State: AOJu0YyHcBcSpGYTce9Xdj2OijzRtAjS9exEd8heEj8QDU6Ny9Ly15Ju
	yKbOW0/+XsbGg9+DqRNLs96ZGg==
X-Google-Smtp-Source: AGHT+IGvzCS6OB++JiwOWbdsEBhTqhA3QwJu/M2SlJeaob+iOdQDtV+McX/e9U1lUrRgrMI4tWneow==
X-Received: by 2002:a17:902:7d8a:b0:1d2:eb05:9d05 with SMTP id a10-20020a1709027d8a00b001d2eb059d05mr6614482plm.90.1702458179815;
        Wed, 13 Dec 2023 01:02:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65? ([2a01:e0a:982:cbb0:596e:6d4f:fc0a:ec65])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902748900b001d33e6521c1sm2516143pll.102.2023.12.13.01.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 01:02:59 -0800 (PST)
Message-ID: <365e012d-7fde-4cf9-b4c6-bebf2dfa53cf@linaro.org>
Date: Wed, 13 Dec 2023 10:02:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add missing two RX Soundwire
 ports in configuration
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231212185415.228003-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231212185415.228003-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2023 19:54, Krzysztof Kozlowski wrote:
> The Qualcomm SM8550 RX Soundwire port configuration was taken from
> downstream sources ("rx_frame_params_default"), but without two ports.
> Correct the DTS, even though no practical impact was observed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not adding fixes table, as I am not able to identify whether this was
> actually a bug.
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 17c4f0a7638a..1f06fd33d1ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2109,18 +2109,18 @@ swr1: soundwire-controller@6ad0000 {
>   			clock-names = "iface";
>   			label = "RX";
>   
> -			qcom,din-ports = <0>;
> -			qcom,dout-ports = <10>;
> +			qcom,din-ports = <1>;
> +			qcom,dout-ports = <11>;
>   
> -			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff>;
> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff>;
> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff>;
> -			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff>;
> -			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff>;
> -			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff>;
> +			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
>   
>   			#address-cells = <2>;
>   			#size-cells = <0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

