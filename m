Return-Path: <linux-arm-msm+bounces-40813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1959E749F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0610818826B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4449B20D50E;
	Fri,  6 Dec 2024 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iodd1Hx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E131FC7CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499735; cv=none; b=pr+2lNSuu7CHUbAdT9B/EkfxrySchxhwTLQYLcsbJzX0aOn10G2k5Y/IE36RWHMBzuar5H4ksIUgWHOLzz4jCI9AIbNiTCm3gxogY9xXUaerhpVijqvop/p+IhbE2aAgVZEuXbVLljy2qW36qJY2CmAXSOHnjAvB8z8rfzlXrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499735; c=relaxed/simple;
	bh=mp3mPV4BMVGFBSgVaXaMh6hOqFJlGpHMexzEQC4AIBU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RJYL0AkCYhW7v1cXGt6ssMxGMt4y+V+EoP3ADDrNJS/nhLOzvv+la6hqqBxpa5HLppyUbG7zbyLsfB54FTVz8geDyn9AAteOkJT8QyC1CX1Lu9UDRvZBk8o4cX/B5LYwLyfXzF6Ah5IsTbm+Zv4iXu1HBYHnRXMtpL+iDXOHZ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iodd1Hx3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a90fed23so15060655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499731; x=1734104531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV/PtxYwjvAPCi6eP7K4g5S2BdnmUC8VCRSgVObs9DM=;
        b=iodd1Hx3UGWV6mMYWnaQ/scnlC04mnD+dwIHECC/owadpTw7ygkspVu45MoxRzzTrS
         jo2kkDP0mo97OeJNmBkiGmpuY7oitNSM5Asy/DErbZFsOL1QQYqlVRI5WSanecVIFIth
         rXQ0pND4ds4aIUyeJY7ZqebKh/kAZ5wcHClnkP2ONdwAiQJ5b1DV1mJ9EG+E1u4uHpTI
         +INm6lR3nbSz1u5XYSRoF3JoJ2E+sLyFi0Y5JmZuhMUHR1N5fRs5xvm3kSNYLCxwF7dd
         WzajVwvANAXX0XSDEO0il+pEmr8sBuXXIMZ12910nSTRteuSAAv5LRQ9Oi+1JvD4vRnq
         +zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499731; x=1734104531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eV/PtxYwjvAPCi6eP7K4g5S2BdnmUC8VCRSgVObs9DM=;
        b=uCyJw0SWogeuzAq2b2n5ZInP1RKA0RTbzqbMPavzRs9rda0aNGQF7VgQlyxqWOLhgl
         KO4YuCatl3dHjAzKChitiNVxaGSgw2niwBpUEbJInENaC5vKbC+eeR0THKEuzZ7rPLom
         WHFOIL7Lk/5RlTfwbrn+lsqqJm7URXU/M7UeLG0jHjhLr9dudslYMRHQ9KxYoYPhjpKf
         g4n9kvS49RT4zJAJ9mixlceXE7inWBOTTsILBuKH6w0XGk4E+E4raBh+NvGHLmW/Ohf+
         VETI+oKzFMmbW5npR/Pl3wFlCfAESb3DyxN1bXN7Z3JF/CwDIcQe40jvaNdEz+4f/Wvp
         2oxw==
X-Gm-Message-State: AOJu0YzXJosS0irgDaBtTWI8RBdNK+tk9HnkbeIx/BLVhmBBPPCpSgsB
	IS4bsbD0NIKd3e2plsrR6i+hgMKn1gOgB9bKTgDFfMWftAiE0F7sjwZlcyY2vAo=
X-Gm-Gg: ASbGncvjJw5fEYlihOsu3qNQBBWu3YLnKi7xdkgIWNKvXFlfvXFtcXSFrx7pzqLWcm5
	Q82mYkJfxWeVX5jREojTJTrjL/8cC3gLeZfy6oRQUHeNCaSJN8+lkIC9jEcejJqs7jUmi6R1EJk
	TRtGNQoYnYSElh/XdNKOR85e90KCK9bNJYXUFS8zb924MFBnFVPJse2LLkU6h/r9POFT414wzJf
	jIuzQAJlBLLLxfJSM3Z79pHRx+eHGi+IF7OdOvpyTNVG/5BZha1JTnySRStImzmucNXFngYEXIB
	eZ0vjlDUn9u1nn53SYn1ACtlVv8=
X-Google-Smtp-Source: AGHT+IH0672VCIqwk56Kepgs4nn3XP2GO2/5WyLoNL+77GgPi2BAZEAAikp4jN9rlT+EOPqoYOb7cg==
X-Received: by 2002:a05:600c:3c9c:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-434ddeabbe3mr32186655e9.9.1733499731628;
        Fri, 06 Dec 2024 07:42:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889? ([2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0980ddsm60006215e9.0.2024.12.06.07.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:42:11 -0800 (PST)
Message-ID: <82927e0b-d048-4be6-9206-38d4222ea6fd@linaro.org>
Date: Fri, 6 Dec 2024 16:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH PATCH RFT 11/19] arm64: dts: qcom: sm8650: Fix CDSP memory
 length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-11-2f349e4d5a63@linaro.org>
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
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-11-2f349e4d5a63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 16:32, Krzysztof Kozlowski wrote:
> The address space in CDSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
> copied from older DTS, but it does not look accurate at all.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 95ec82bce3162bce4a3da6122a41fee37118740e..1d935bcdcb2eee7b56e0a1f71c303a54d870e672 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5481,7 +5481,7 @@ nsp_noc: interconnect@320c0000 {
>   
>   		remoteproc_cdsp: remoteproc@32300000 {
>   			compatible = "qcom,sm8650-cdsp-pas";
> -			reg = <0 0x32300000 0 0x1400000>;
> +			reg = <0x0 0x32300000 0x0 0x10000>;

I tried to have an unified style in sm8650.dtsi by using 0 instead of 0x0,
maybe you should keep the current style, as you prefer.

>   
>   			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

