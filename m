Return-Path: <linux-arm-msm+bounces-3255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5165803397
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A65B20837
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDFF249E8;
	Mon,  4 Dec 2023 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tb43P870"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F64114
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 04:56:59 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66cso28081895e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 04:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694618; x=1702299418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+q9PsfDSbiTCX4sRk2gAmeG6TMjtVXB3TsNuwU3s2M=;
        b=tb43P8705FQ0CvL2hzOdn/vcRAWKZuevj3TSUp6zFkYpZt6QSQzSAMUx4wHzFB2pEe
         LIN+b7MYZi+FNS1wLte5NucRtDn1DocB+qHfYbx60K/vEFAobnM0X1kOb/dswY0658hh
         TZGFDRmelqudSzcgq/tqoOgNVoSYLouDmj5Xd7YGhXux3D1IQ3u4VWXKhRRgxxkapfW9
         6wcwLKAnI+M39pqrsRs7KP+67lE/W6SlVJYpOFvUdT6GNZCOL2dQ4vwnAinw6lkISfW5
         KN6TBri9h0ycTZo9+QCRkLWFYzhr6k4JRi2dVciaGayk+OZHSrF4saldEU8+jSblxwaO
         6ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694618; x=1702299418;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+q9PsfDSbiTCX4sRk2gAmeG6TMjtVXB3TsNuwU3s2M=;
        b=bkdSyAEr9Tgg7S3XaRdhmlr4fDInq4i31EPKI4+5G4BMEEXnAT+c2/ntZ8sgmoyQkr
         DmLy40ixs+NN+YmoC5mg2LwWypNh6E33/PKx3zyl0VzcEvuH5RTNvB6LdCT0765BFbB4
         Kb48SWi1Rh03FAvRrf1ED1/WutBOjgxXc5+pwaOLJLWzMtzgpzxki8DOwpmhZQl1Y9q5
         64fmJopKriNdA9r1QpVLsdp21cGhVlkjApKOqWu9/dibYGf+SwuG+Uo8btY9otU9gflz
         dMLM1VaAQUVVYuYoOyyOXs0FA2g9jVfAw1yS/GS1Np8WJHnmhrptMhhz8R5rGv/v6R2/
         sIAw==
X-Gm-Message-State: AOJu0Yw/dkaaxCxfxue1IeTDnYWlwuWf03TVvbVZ+nuUrG+5MqUU8H/w
	lfcUSgdZgl3504iHEOdvix+PZQ==
X-Google-Smtp-Source: AGHT+IFJLWGbQaVwO4b9GwX7Vw8hCjkfJlTSLbKMOiI//kogOkjAYBUDbjwRRBgpR+k3ipTX8EbuNA==
X-Received: by 2002:a05:600c:11d2:b0:409:19a0:d247 with SMTP id b18-20020a05600c11d200b0040919a0d247mr2866954wmi.18.1701694618080;
        Mon, 04 Dec 2023 04:56:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58:12b5:777b:9d17? ([2a01:e0a:982:cbb0:58:12b5:777b:9d17])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c501000b00407b93d8085sm18677041wmr.27.2023.12.04.04.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 04:56:57 -0800 (PST)
Message-ID: <771bdf58-31ac-48b7-8b49-3034426634da@linaro.org>
Date: Mon, 4 Dec 2023 13:56:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sm8550-qrd: Enable the A740 GPU
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
 <20231127-topic-a7xx_dt-v2-4-2a437588e563@linaro.org>
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
In-Reply-To: <20231127-topic-a7xx_dt-v2-4-2a437588e563@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2023 13:55, Konrad Dybcio wrote:
> Enable the GPU and provide a path for the ZAP blob.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index eef811def39b..9fe51d308675 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -596,6 +596,14 @@ &gcc {
>   		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>   };
>   
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	};
> +};
> +
>   &lpass_tlmm {
>   	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>   		pins = "gpio17";
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

