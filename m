Return-Path: <linux-arm-msm+bounces-8122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8283A9AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6896C1C20B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79256310C;
	Wed, 24 Jan 2024 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKp1+q5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D7199B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099201; cv=none; b=u71/qY+3+w/nCf6R9mO4G0KPXxk3jAQaKLX/Jnm7+vRnBQHBRhI+iUuyxFtr/kkE+NfqvL44a/tdgFWxFMddK6+SXYTjxlyKnCGExxOpOLJq8zJTKRt/t4UQSEbusVbTRAc6JTkeJaRHh/LV3P4WsdERv8vorCNurI75+jfxEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099201; c=relaxed/simple;
	bh=Xe9QImb25vctXjuR9M9SP1j7VHWxYeFa28Qhb2bu6ss=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RycyaKSSdIuSIhyE4/jUM3Qs7Ya3ho9g/0NqXN4W38hPj5ToU0MatmdHI9V5LRhw9ZVFzwGnugIizfHk0a34CxTJ0EafXLPbmwgeCMAbqgJCMaobf5YH/RVL2qY1CcYJk09SDIoogkoD1mZZOdEBc09g35G1TSXepiOWDePsOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKp1+q5E; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3367a304091so5719749f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099198; x=1706703998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFDRjvoN8YUq/pq6hUZ63ynjSng3YxXBPPeOWs+bSxE=;
        b=PKp1+q5EhrT2QETn8+ZSNc8cTH9JG0QN2rHSQ7vKahOsv/covyuw5/O+UTgwi4F7tl
         sw9nwtBebkLoiE/XxhbuP/tEREGc7duG8SFR30M0Ky7+iglaFin0QUwi9SqM9Wc8VVEa
         t6z4bpt9xK1cDeR8WBnrkJEctdTzpN6fES0eN1EmUmxdiVYl50eKZWVH/5eqsvyMdaGp
         AvHT5O2TigGTcTBxhJbH1/4a/9asDWzOPoun05coteDEkoj7yxfCfkIetu/8O2LmdMIP
         8uqe8RPx2aR3bM5LeQCRsOMCNW4kmzSslE6z2PbzFu/fIwSOMPbUZ//PMnAYN7bIUOsU
         aJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099198; x=1706703998;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tFDRjvoN8YUq/pq6hUZ63ynjSng3YxXBPPeOWs+bSxE=;
        b=tHEexGI5TSe84lcyU9SD9PW14ZYqcyNZvNqJFs8L0sJ9M2NoRX86iNBgvdqqu1WfEk
         os9p0YkH0VYDxkDZbhFAVH6cvoao0fyo14aGmSRhLm6PtnEI6A9Zkn2wRKHazjjyKBrZ
         mfIh1IqCe7nEH/LlWhXUYLvw0tv7P1L0Bbvm9BJQT8CB11QN+SumtB2sHgK7+C1bCQrb
         IRGqfvvgWaEb68CaSuES+4cZzG9yF9GM2yGvjrw0VXk6rWvS3JLYwZgvWaJyerIQOJv6
         CinXlm7NQnrgG1dIP6uZQ5Scpcf5ThHn9ZBlrP0gExYOhcxhekB2WwMhJ5Li0RcsRfel
         Zqog==
X-Gm-Message-State: AOJu0YzobhPvFehZQfcAS+FzNyBt/OORleX+fv+K2Lxyt0rdMc65Z/Ls
	MbGCetbyMNIWov2lzNKjBQ6D05qDE6DJavdLzS5GlOfAunjEPcUNKVQGwjGrmIM=
X-Google-Smtp-Source: AGHT+IE2Wk5jwnLRHwiM16HLhu2l98agOIICE42oHDb18g+iN9MYGcHSnQcG19pFbjpFAhCugnWtEg==
X-Received: by 2002:a5d:6750:0:b0:337:bdae:c557 with SMTP id l16-20020a5d6750000000b00337bdaec557mr332892wrw.10.1706099198620;
        Wed, 24 Jan 2024 04:26:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654? ([2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d6ac9000000b00337d392c6c3sm15889124wrw.13.2024.01.24.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:26:38 -0800 (PST)
Message-ID: <047a59f6-7c6b-4854-8985-2306abbaa0a8@linaro.org>
Date: Wed, 24 Jan 2024 13:26:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sm8550: Drop PCIE_AUX_CLK from
 pcie_phy node
Content-Language: en-US, fr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
 <20240124-pcie-aux-clk-fix-v1-12-d8a4852b6ba6@linaro.org>
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
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-12-d8a4852b6ba6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/01/2024 08:36, Manivannan Sadhasivam wrote:
> PCIe PHY hw doesn't require PCIE_AUX_CLK for functioning. This clock is
> only required by the PCIe controller. Hence drop it from pcie_phy node.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ee1ba5a8c8fc..f074683f7940 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1760,13 +1760,11 @@ pcie0_phy: phy@1c06000 {
>   			compatible = "qcom,sm8550-qmp-gen3x2-pcie-phy";
>   			reg = <0 0x01c06000 0 0x2000>;
>   
> -			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> -				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>   				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
>   				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
>   				 <&gcc GCC_PCIE_0_PIPE_CLK>;
> -			clock-names = "aux", "cfg_ahb", "ref", "rchng",
> -				      "pipe";
> +			clock-names = "cfg_ahb", "ref", "rchng", "pipe";
>   
>   			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
>   			reset-names = "phy";
> 


Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

