Return-Path: <linux-arm-msm+bounces-10347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4F84F9FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 17:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099A01C21609
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 16:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E75F84A26;
	Fri,  9 Feb 2024 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzW5mZ/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530157BB02
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497183; cv=none; b=eGUlasjKg/5Xwjv2hpBUlzsrdh+y5JTlmdW906ORV5IdQRqRsEEOvYFiVni5EtexZyY76HmAOY4cM0z2XebUeepX9dTph5/hZhZZ7sL7SuTSARyCha0m5RAtLLqra/kLrbQGchtH1mLMEn2JwVa4NpWjuZ4mEIfvTJfGip7nGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497183; c=relaxed/simple;
	bh=O3fngnfCj5aOh0G0wwm8vha6G/YnqgOojLqiWw4NAZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdtlK1h1fBhfieUjmWV2iFUzvKLPB++BjzGA1nT/GKFXdV0rO0+0KH11qH80cyhEKHGlWaTcW9iH4bV1xAxRRqCwFNGg43EFOQrkh0VB+djfjOmlwr0c37qF/nL8DAeYrCBgQ63PWLY7HtWl3ww8h/o2RU0A+VqbEaYD9rskeLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzW5mZ/8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so159210466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 08:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707497179; x=1708101979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rUsxPQxs+K7iUQvdQghSAavfdmA0Tse73YII5128kk=;
        b=AzW5mZ/8ZFBq35Ddnp9g/1rcdVvg+J1VT/LIhL2LvGf633lrnQNG0B96mQmCDb+BjP
         k/bRgKxGhNdSVpfbky1GENCSLDi/4yg5foAeAE9hhHc4sVhPBhGBgcCIyr4EKt8DQ0bP
         RL9UbQ49j0Bt/TxjYRvoetEUyW4rGzfth/OzPzk9uqgTNhb6OcOQVLwf76QMAjx4jDDz
         waZFLGPELYf0vx4gmvYrb1Y0WLTRxbs1paSP0G/xUdbU1/TznGFwKfcx/7jdZHIoYihB
         hEuhV1gZhEpKtnX+kTAAsp++a1whgfyFOsS+MGlTuvz2z0lmwry9NW8D0RDOpvZywtHH
         Ilqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707497179; x=1708101979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rUsxPQxs+K7iUQvdQghSAavfdmA0Tse73YII5128kk=;
        b=whG+b9PskGKxX7zW2dPyojxnUouCowzTwSW+sphVZE2Z0vaeCKIFOA+igVSB20u6A+
         yvDtRaH7aBQfEq70oRQRIkWdps12OFC9uItCtmKkNfydFD9fud4SzsY6zJKgPCt1XkX5
         ttl6ClUgdMPddZ7TlkcNNEICopqAh9CDBkFf5Gef5KpMJ4ryRkbpzm6b7/+NSeLY6Gb/
         hrAMf5HMXBlud6tkx7vYZt66R0yF7aaBiBH8YowBIe3yuaxifqsu7hrLY9c17yO6rnG6
         wueAseT0VRzfsj71XgHneDSQkSp4qbAAB+gGIWWZLyWI3KD+/S3VZbY2ZqmJUdhmorYL
         d5FA==
X-Gm-Message-State: AOJu0Yz+kDHJbC0WVMTd/zMvz+rCgPyRnUx1MOb3xpbYihWYTSEBRq/V
	n5MCf50vE+Y408SNb45Elh1KozTRIXF/gb3JMIlwgLSGbcTIYD0fuvN6TpN7R4o=
X-Google-Smtp-Source: AGHT+IF+KoPD1FCogFq1g1HVZo9JDowlvJb+vv3Ik862H1eIqG6bGPcF3oBJaI8TiGYJ0NSxqzsavw==
X-Received: by 2002:a17:906:bfe3:b0:a37:bbe7:6002 with SMTP id vr3-20020a170906bfe300b00a37bbe76002mr1505111ejb.19.1707497179535;
        Fri, 09 Feb 2024 08:46:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxFJxB5SWe8jb932wdrFaVqu+jSrTbnro9C4RAlZu433iTqktEI+RNKnG607wh1mTeaHxzMRyHx+EAcBuuWprfTAG6hPujAcBMeSzfvk69kgxortfWEjtxOqdpEer7f+xkfcb2aCMuK8MeKv/2QAg+v5haS+oqeYgKWqbY+aBtPAKu8C4aFUnIGt0HFzEAlrK05QHzdEa7enkA13Nt+NYeHuWhN4FxuoOzv47U1otZ+EqfKgVJD/yKGYmpMo0CVWXJtCZhAGH/5bs/spIAqJQXuWYvxzHCugTpTfdKPXIKWnhRwtbWJBriOStv3mXtJagUrg==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id qw32-20020a1709066a2000b00a3c09f3aea8sm263632ejc.211.2024.02.09.08.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 08:46:18 -0800 (PST)
Message-ID: <7003e28a-c901-4def-be31-a68eb896adb8@linaro.org>
Date: Fri, 9 Feb 2024 17:46:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-6-quic_tdas@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240208062836.19767-6-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.02.2024 07:28, Taniya Das wrote:
> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
> thus require them to be marked protected.
> 
> Also disable the LPASS nodes which are not to be used.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

One patch per board, please

>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
>  2 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 03e97e27d16d..425e4b87490b 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> 
>  /dts-v1/;
> @@ -415,6 +415,58 @@
>  	};
>  };
> 
> +&gcc {
> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;

Why on earth are clocks such as USB sleep reserved? How does it work?

> +};
> +
> +&lpasscc {
> +	status = "disabled";
> +};
> +
> +&lpass_audiocc {
> +	qcom,adsp-skip-pll;
> +	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> +		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> +		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> +		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> +	/delete-property/ power-domains;
> +};

This literally disables all clocks that come out of this controller, why
not just set status = "reserved"?

> +
> +&lpass_aon {
> +	status = "disabled";
> +};
> +
> +&lpass_core {
> +	status = "disabled";
> +};
> +
> +&lpass_hm {
> +	status = "disabled";
> +};

These three are status = "reserved" by default already, so it's a NOP..

Konrad

