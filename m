Return-Path: <linux-arm-msm+bounces-11642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71785A068
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 10:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47B31F22A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 09:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31CE25569;
	Mon, 19 Feb 2024 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHNqu4gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DFA25561
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708336765; cv=none; b=qIXUZ5Jo+O+W/HwYcm63aeom1Gtj9iohhhyfTu0wz/svICxzXmdpQ7y878Ew63JOPOLGm6QTbSIYWd3qkeZRl5ZgWqOYbR7Ub0v/7qtKSaDB1TZ5fFIpW+fQjGxMMSqjpvQdRh8HEQ4sSPnqhPBg1j4dODq9UPW3bgETTuHfBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708336765; c=relaxed/simple;
	bh=+51psQD7bb/Oa4T+MFP8wncBfjGz+puKKys+c8LD/zE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bQIA9GHaIw7eerqm04HDduzNrZjFeIpKIK6UVPO81+AS0VlOLNmR/Popc8tby5uwU/rySyNG2TNb0kjXMnRAPjGH3KNFOzmKZo9Zf2r0ERNWyry1rRYcSjBJUus7wtVYMZxwHNtJII88dBiQeJNSKfiDZW8UJYWwTPdph0WCHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHNqu4gm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4125edd1433so12247305e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708336762; x=1708941562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQnaoRg0OcXD43oUOLOIkmEkqA5MmodUK9yZS2QQYNs=;
        b=vHNqu4gmuoISJjJaskMtTNP7ruUoc+ND4o2kbpfyXFJPsWYHgMIEmXiYFpVYa1/rRh
         Ih33t7z+c1/qJ57h0JGpFySRppXPIAsM2fw99ZhTeQBUVcDAY6H4rNrknKeux/TzKtf/
         Pt9yRAuNUFklbUyuhj3bBBNIKdIPbJBcEgyAzpEVhyhXtae0GW51UWIvasLGvdSeFllF
         MAJJy8xzhemXt5VvI8lYJeedN5qWqKRfdQSGUaT2NcSigjgdGV42txFLadAoAGGl6sgd
         d7dsZrBLG2ZULbY4xFzGcxB53k0JJoqgw7wH8c/NhcFXG7eio9wAuq/GJY9G0JaRmOAb
         Yp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708336762; x=1708941562;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uQnaoRg0OcXD43oUOLOIkmEkqA5MmodUK9yZS2QQYNs=;
        b=v4Ywsv6M9FwAetz5W2nvHvMXGjPJ10hIi9ua52cwp5VzCjGcl9ZksMh0mYwnWZtuAF
         kSChSGqqkfH7spJhf8WIq8EOmaMlpgDWGS0670NXbO7qFn4KYOEZXvjJXzOaebZf/mc7
         AvgD747zMdqoIkiPpO104LfQ3aE77I1cFNic8/ompHXjM5pNiGbz4aqjaeA1JQHdDP3+
         tA+8NfVYK3aT+D2BYJFG5kA0dssF+PxlgRAKbMRLeYC+UiJksj+rD2z7ZiSD9t+IC1OU
         refz4UU/M0nbdou72/s1C+1xcqPfMd2ES2PsbOF7mX1rv+Dg65yse8CaemRJRWrU5+Xz
         8fQw==
X-Gm-Message-State: AOJu0Yzw1DQWIWQEsTYaSu7/zpAjK6tsWm+kZlmrLAaZNZhwhPVm91AF
	7Oi29Vi+nG1kG6yeogbw95G96KC9xd/f+IetZ2pPkT1CKtfG5+HgPJHWL/Y/dQE=
X-Google-Smtp-Source: AGHT+IEPWCw2eRmI7UZZlYyf7GjQ9NtYbNMbDUZNx1KRB17Odf+V6wSPyk7WKj1c+RpQM3Cbjxu2pQ==
X-Received: by 2002:a05:600c:3b02:b0:412:5f54:f402 with SMTP id m2-20020a05600c3b0200b004125f54f402mr3142487wms.22.1708336762410;
        Mon, 19 Feb 2024 01:59:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f? ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600c11c100b00410cc2f5550sm10636819wmi.19.2024.02.19.01.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:59:22 -0800 (PST)
Message-ID: <ade835c0-6a01-4045-b2e6-1c4b90fe044f@linaro.org>
Date: Mon, 19 Feb 2024 10:59:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: sm8650: Add msi-map-mask for PCIe nodes
Content-Language: en-US, fr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240216-sm8550-msi-map-fix-v1-1-b66d83ce48b7@linaro.org>
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
In-Reply-To: <20240216-sm8550-msi-map-fix-v1-1-b66d83ce48b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/02/2024 18:05, Manivannan Sadhasivam wrote:
> "msi-map-mask" is a required property for all Qcom PCIe controllers as it
> would allow all PCIe devices under a bus to share the same MSI identifier.
> 
> Without this property, each device has to use a separate MSI identifier
> which is not possible due to platform limitations.
> 
> Currently, this is not an issue since only one device is connected to the
> bus on boards making use of this SoC.
> 
> Fixes: a33a532b3b1e ("arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index d488b3b3265e..12ba839f215e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2277,6 +2277,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			/* Entries are reversed due to the unusual ITS DeviceID encoding */
>   			msi-map = <0x0 &gic_its 0x1401 0x1>,
>   				  <0x100 &gic_its 0x1400 0x1>;
> +			msi-map-mask = <0xff00>;
>   
>   			linux,pci-domain = <0>;
>   			num-lanes = <2>;
> @@ -2404,6 +2405,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			/* Entries are reversed due to the unusual ITS DeviceID encoding */
>   			msi-map = <0x0 &gic_its 0x1481 0x1>,
>   				  <0x100 &gic_its 0x1480 0x1>;
> +			msi-map-mask = <0xff00>;
>   
>   			linux,pci-domain = <1>;
>   			num-lanes = <2>;
> 
> ---
> base-commit: d37e1e4c52bc60578969f391fb81f947c3e83118
> change-id: 20240216-sm8550-msi-map-fix-ab8fe5e24df1
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

