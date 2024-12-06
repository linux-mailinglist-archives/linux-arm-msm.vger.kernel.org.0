Return-Path: <linux-arm-msm+bounces-40818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C99E74BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46332874F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6027F20E6EA;
	Fri,  6 Dec 2024 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpkBmqsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAFF20E320
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499801; cv=none; b=lHwNT55i4bHGuDFKlQXEUOC3+Vp/+NjUo8MGZAXhEkj8d/fYdpPAgV+Sr5Hz+mtHXJAe1hzZeNtDTm+J3IMc4xTGHAm1JxqyxjRAcO1xVPcamxZo4CYRfg0xb3gswNhWFd1pbx3aUPUvNoExIjmy6IUg6AzZyuQiWFMwK1iEjz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499801; c=relaxed/simple;
	bh=2SCu5Dc59QVB7Yy1Nj3qGKogylh6JGmmZ/3wsMntFBU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DUBDqrIMXROpAUaH9j1BDtGT6VnuR9qz4/gVeWAMHZls0RwiB3BBXAdb5gL3EQaU53HzBuKlHUDIhzzHv/d5HurlIhXdNp4K4NowObmWvITmMCRwmuxRrV9dmf438xLY1MjgnTmfW2T8mdTOyOoAkdd1wreui26ynUX79Pe5Nzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpkBmqsU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so21079545e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499798; x=1734104598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qh3ZZ2fep2QXCuPEU1qwdEB8bt4198r3fZQbc6yeKM=;
        b=JpkBmqsUXqqJMARIUW/Uv1Ei3PwURizNnOAGY0kxoXtKR0Q9XTQIOS57AMHZJ+wY+I
         Tfsk7R2TcoRUg3QWhpW4vFCPqnAtBnY/QLB8nzOsin+lZfP2ELJJzKsEcOI7rUmhNTQs
         Sy+UG/oVyp+zndH9/mQbd8/YEB6DzRc45I2el7MaEAOFW5eo5X5wmqCA0rFik/yJF7Jz
         wa+DTdZqyRpdzbD9it6G/7XttqdzIMqEt0xhj6L36gdQuVtBk3EK9d3lo4cDRk08aVJE
         jma26KhswvgSNyGHgSAk8RuXn6pe7yUmFREeGeqt2M3upTxYuzVnmU7+4jZFa03OkrOb
         U82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499798; x=1734104598;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Qh3ZZ2fep2QXCuPEU1qwdEB8bt4198r3fZQbc6yeKM=;
        b=OkNxnwPZIEIPHwcaa5JFaYkwusXCEZwgjCwHwxVYyX5qL9ZstmvjEZPUss95yxm6f8
         TWRMuBubEqRLJpwsHbTHSIuOQ72vgYWd7gjspBqte/jX8jGYaJb8Y9RZ5vLbDN5BCsXV
         H8X7xBEHLbmqXUQgCKsKqiEG6EbD7BOsO2y/sN6DW4P7hn08R87nWHQhOvL9Uu9dog+S
         iQ+YQU2m5Y3n2PwQ0zaJnRmKGWlswBq4i7Tx/SZQz2xZ32fq2iS2rC3NJg0KiLipc8uZ
         6XSqAiNK+pX+UnC8B7dDH37H+iGrl64fCf0SvJgfeCHcY8mkJxt3tfW4qIS6nJKKkhNE
         BDpQ==
X-Gm-Message-State: AOJu0YwO6GpmUZIIjxmhmzlgPH+KdMvKMDof61iBoap4nHRg4lzhUXUo
	wapTCWV0Jl2QUEDiMvNDAnWwtOBExuzJgQhhfoZV0QkK32tSeLgbpnPHhcS48ts=
X-Gm-Gg: ASbGnct8tMy7L6HdsV6FkW94mdtCFNyzAuTwlPFOzTpsQXYyqTWR0a2wBU8k3Da7ozC
	PwMwdp+J9sTd3U1sRHjxH8bxC+MRtgt0GWp4wsuLU0FPRfE9sbD5Xzsj8P2CsAApoO6sl2b+Urg
	xZJo3wLUB6mHzYKjAOZmGaUQxpvz0Sl3y8znGOIS6rXww1Q7fNPS/qMKhM+mvdGpa81haDGaW9i
	FeKCQdsr4rZ+LGWehy9v30jPRBwJltjUzAx/TrCETiIt/LGAINDI8LFjFCc4qsjIYvkj6x0dLrB
	fqTqczFDPMuigBGe9ZJaQDXGL2k=
X-Google-Smtp-Source: AGHT+IEU95QYx5vzC/il/OD/ONTwiotPIKFZqo0+vB3bflgQedQ/UnUKm0ae/7LQOjxXRT3YoGKZBA==
X-Received: by 2002:a05:600c:3488:b0:434:da26:e2e2 with SMTP id 5b1f17b1804b1-434ddeddc0cmr27922575e9.32.1733499797896;
        Fri, 06 Dec 2024 07:43:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889? ([2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dabf7sm59352955e9.24.2024.12.06.07.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:43:17 -0800 (PST)
Message-ID: <f96e1810-3d88-4fa4-9bbd-ae60eb7ea03c@linaro.org>
Date: Fri, 6 Dec 2024 16:43:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/19] arm64: dts: qcom: sm8450: Fix MPSS memory length
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
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-6-2f349e4d5a63@linaro.org>
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
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-6-2f349e4d5a63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 16:32, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: 1172729576fb ("arm64: dts: qcom: sm8450: Add remoteproc enablers and instances")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7a3bf847b0b9eae2094b0a8f48f6900a31b28ae4..6df110f3ec21dd8efe0bf5e93621b2cabb77fd17 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2907,7 +2907,7 @@ compute-cb@8 {
>   
>   		remoteproc_mpss: remoteproc@4080000 {
>   			compatible = "qcom,sm8450-mpss-pas";
> -			reg = <0x0 0x04080000 0x0 0x4040>;
> +			reg = <0x0 0x04080000 0x0 0x10000>;
>   
>   			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

