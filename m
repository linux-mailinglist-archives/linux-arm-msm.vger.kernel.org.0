Return-Path: <linux-arm-msm+bounces-32855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A9598B7D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 11:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A583D1C2192D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 09:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D5719B3C5;
	Tue,  1 Oct 2024 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IR7nII9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4D1922E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773476; cv=none; b=ILXo0U4MCiJTOrmg2bMPsYr+5W3tzQxJX03MBYVvUm5DL3bDdSMCaxyuVxyfrddeeHle6FukW0ImiFaYHIOJgj2yvj0uWGOI7+iMX55jCtZYezOyN0f0CjKTCQQCvx8GSJJTSA27fQPimJAcOjHmONGov14OOaIMzJLNF01f1QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773476; c=relaxed/simple;
	bh=bmTiK36h+6z7r30jTioLLTDLekNBb+Ez7VaFm4dX18I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HDpjnS70y1pdxGfN+HekX2pQwu7Y4+4E4gRpgQdb/AMsIsNwt5ZIcU8+dKCBaETRI/JgNL53NaUo2CMbTAqGMHADAxFluj2ne280Mz3+Ymq3cc4OSeQEyCWMjtQ5wzGPMJjCdBVEIzlgnujSR0o7RWb56qA9ufY085EHpZ2g3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IR7nII9K; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cca239886so2995261f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727773473; x=1728378273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoOl3oTeEbaG2GOXACB28sw4PqDD0ifREAp/fJEBuqg=;
        b=IR7nII9K5lVrl5uOmwOoaR9aqcKavSMD48CNbmdzXtTY4x8DbTSBjbCBvUxTZBPFaR
         J9Z4VfpQkR1F40/ob6SrSBfITchTvEOk8GaIE7d7KwhKv3yZa1nnz8rRYECx1hSJQn1D
         0KFQ/IU4m/wpU+sPA68OVuJeD+4mG3UaOh2plp0N9vcRcRxcgN5y/Wiq80XxLBVkjcW1
         8lQDdAANCjNuSuvV3rfsE3yXIIXAekJx9XEvgHGg1S1eWynIbJKXkLDSiLt65dyJmXjH
         iSgh6zJHZ1z376FKa5DwX1Dp2HB2y2AF41fHJG4Mx6B9GSlRONlhlFFAxsBJyBfUkGVb
         VuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773473; x=1728378273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SoOl3oTeEbaG2GOXACB28sw4PqDD0ifREAp/fJEBuqg=;
        b=QR/pW7+oTEKnZmlOrhFVN/SEJP6AbYN66aDGM6z40LHT6Mgg7i/NbWzuNyz77JU5z9
         qVWhAJD1OsucMfsPv/uUDjXoDwVtIgkRVi0xPoWEUXXRtregwxtLdLmxWbhzNKOnGSQN
         8CSCrfb3886pInEFM2AD86oZ74LLj+cq40tJcFeF85hVURQ3RBJfjWpaZiszWv0DQFdv
         Tiru+fr3KDaNgbjIMOzLM/gD8MWEpROKqJlohCXau7VLdArLgKjxoBQJYz9unzZ8VPR3
         FDMVR+hPSEKSGfxfaVpJlCcO5QoDg7Z8lajBIJy83mAibTdWS5TGpx+tiUxeRp+qpkwn
         KrbA==
X-Gm-Message-State: AOJu0YwGpihYh9GVgkAYeiU/hsqCQSCvfzpFY7NhX7GknkpEDboUlPwT
	cONfwprvjt6nnrg6Vt96coZEEGz3vg7uuLUmv5zLgaupIo4+PUDCIkxKNH5hJiI=
X-Google-Smtp-Source: AGHT+IHSSvOtabVm0gIUh/kzsVHEg2Jl8p9Rr0MMz6KxOq+Hk6IBhxg7qa0GCnzqbN2dcux4iZCjSg==
X-Received: by 2002:adf:f34f:0:b0:374:c122:e8b8 with SMTP id ffacd0b85a97d-37cd5aaf90bmr6825772f8f.11.1727773473179;
        Tue, 01 Oct 2024 02:04:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ec13:4c0:b08d:b067? ([2a01:e0a:982:cbb0:ec13:4c0:b08d:b067])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fdb0sm11307237f8f.89.2024.10.01.02.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 02:04:32 -0700 (PDT)
Message-ID: <696d7b9d-affe-4548-9138-6b01d6cca81e@linaro.org>
Date: Tue, 1 Oct 2024 11:04:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8550: extend the register
 range for UFS ICE
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Gaurav Kashyap <quic_gaurkash@quicinc.com>
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
 <20241001-wrapped-keys-dts-v7-2-a668519b7ffe@linaro.org>
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
In-Reply-To: <20241001-wrapped-keys-dts-v7-2-a668519b7ffe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2024 10:35, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
> Manager (HWKM) to securely manage storage keys. Enable using this
> hardware on sm8550.
> 
> This requires us to increase the register range: HWKM is an additional
> piece of hardware sitting alongside ICE, and extends the old ICE's
> register space.
> 
> NOTE: Although wrapped keys cannot be independently generated and
> tested on this platform using generate, prepare and import key calls,
> there are non-kernel paths to create wrapped keys, and still use the
> kernel to program them into ICE. Hence, enabling wrapped key support
> on sm8550 too.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Co-developed-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 9dc0ee3eb98f..93c8aa32e411 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2076,7 +2076,8 @@ opp-300000000 {
>   		ice: crypto@1d88000 {
>   			compatible = "qcom,sm8550-inline-crypto-engine",
>   				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x18000>;
> +
>   			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>   		};
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

