Return-Path: <linux-arm-msm+bounces-22732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C769908B1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 13:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 893BCB25797
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E45196DA2;
	Fri, 14 Jun 2024 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="El5R+pqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37EE195B2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366107; cv=none; b=Ld63jUtc2JjejyqAJ9PVJKmIeVpAypwuGqbCrtHWIjlZ+GSE2KkEb/4obrAHDe1dCn/PP8z/cuWrEW77cIK2Ffo2owh/fkwZ8MzkhNnWDjvO7w48BxS4Rw7OEBhNkWtJXP74nGTFYogxmW2db39HBoupUdmvLvkLI0RMFqkZ1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366107; c=relaxed/simple;
	bh=0xk+eEIcvM/0GFDdxJwHuj5+qajg1TCsvgzLU2nLgo0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aAM03KjWzvVih4/jd6ukNZofBGi5bYGT0JbS73MySNNqx9QKBqqPPZtgaFrxGKqeyQhjvQo52xvIRtkYbqLLFL4zPZ+y3cTV1PMogeDtar127mSqN7HM2AhMvJtYO5VPQgnDy/4JQ+XaquJqDMi9Z4WkUMGothPf6GVnfYYQUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=El5R+pqx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f1a7386d5so2022467f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718366104; x=1718970904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV5ecN0ys6S0OSRYU9azuVV6qH2IDYeWmzVoZmqUUmI=;
        b=El5R+pqx2u6bPZnhPzCmm9N0XrbldhIQ6usbm1IyNtzmPk5cOVTeknNLBejhxP4EMC
         gQnS2qrLKaJ543C3ca3axMkgVjrxdJQJcn1v8msLhBYpkf5kSX4GojAmJ96lsMT8d8x6
         Sa1r9a3C0jwQZnKJOqOwxKDVLTjw+UtKCRbm413EAbds5QHec1iuLz+RJbsWrUNDTaig
         rCjKqOqZ0Vm9WTGQ9BhfejS4zoHbNE4Q2UF34x5VGgP6EFWPCPD7uF4/6pSzB+dCSto2
         XacZqgxVpiTJnIGGRxNzbJ6eq4VgYCx166fzaFrjUBc4PLSPUJnnCqGXK6qAIzz1LFDG
         BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718366104; x=1718970904;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CV5ecN0ys6S0OSRYU9azuVV6qH2IDYeWmzVoZmqUUmI=;
        b=DGHP3GQQ0MmNU7wVUVfqYGXtISa1kWZhDQw4dRWhGd+n6JVGLXlbNwlNLAfHmtTC1O
         LQDDwlQLV5GLnMyFclTyV9mxsX4oSnlW7cXKtMjupDEVpZSQMhOWxoJp1E57MUBG9j0p
         vWJONb/f4laYkDiDANgKwxwyYOLXUp4nl7WjRfE93oQP1bgWx/HlUKgY0iRDfk7aSS7d
         lcVtg7eZ4inzKemG2XdCynABGMC8kpIday+ttSojGV9/flbgRCGHIHx3++rvFsZ8xR34
         pWEfSej6M33HX47OWDeE5tAhc8ygbzfYwcmDb3TH7GRP1pbRuxDRhZkFxVYiegvMH7W0
         5j9w==
X-Gm-Message-State: AOJu0Yx7YiKE48KXuTdkg2xS0tXz5Si3XxbQkOUXgRp50HehZBGNA090
	7Xgnc6tdoQ5QJpVEodTx4UzFnh/OGk1p4S+/b9olferbgZdgBL99hBsIqJRyBAQ=
X-Google-Smtp-Source: AGHT+IFS0FLeZQHvFvpXBl7p3q8gSKN8Fu68VQ20x0vfBbNGoG9iIueMVIWVzUYkF5Jn9Yax0F422g==
X-Received: by 2002:a5d:64e7:0:b0:360:73f4:7937 with SMTP id ffacd0b85a97d-3607a7b0e7amr1860670f8f.6.1718366104015;
        Fri, 14 Jun 2024 04:55:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc? ([2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a8fsm4194073f8f.110.2024.06.14.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 04:55:03 -0700 (PDT)
Message-ID: <a4800ced-b825-4ead-ad1c-56990c66cfd6@linaro.org>
Date: Fri, 14 Jun 2024 13:55:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8550: drop second clock name
 from clock-output-names
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org
References: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
 <20240614-fix-pcie-phy-compat-v3-4-730d1811acf4@linaro.org>
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
In-Reply-To: <20240614-fix-pcie-phy-compat-v3-4-730d1811acf4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/06/2024 12:18, Dmitry Baryshkov wrote:
> There is no need to specify exact name for the second (AUX) output
> clock. It has never been used for the lookups based on the system
> clock name. The driver generates it on its own, in order to remain
> compatible with the older DT. Drop the clock name.
> 
> Fixes: 0cc97d9e3fdf ("arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 4234c92aafe3..be4f0609c436 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1939,7 +1939,7 @@ pcie1_phy: phy@1c0e000 {
>   			power-domains = <&gcc PCIE_1_PHY_GDSC>;
>   
>   			#clock-cells = <1>;
> -			clock-output-names = "pcie1_pipe_clk", "pcie1_phy_aux_clk";
> +			clock-output-names = "pcie1_pipe_clk";
>   
>   			#phy-cells = <0>;
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

