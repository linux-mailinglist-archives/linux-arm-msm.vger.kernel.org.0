Return-Path: <linux-arm-msm+bounces-40819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F09169E74C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796F31882505
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ACE20E701;
	Fri,  6 Dec 2024 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdmqmEZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0220E6F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499806; cv=none; b=JBzDyZUBcH+qttLMNrcYbaztwpM7F+h41sEflRbj+LHbowhQTpI3WcJvQxFzOXHtEuWQV/Iy06Z6TONg2S1amR7Nc2ajBn9MSNeltFXr8vkW7pOJpC2VRY7sdWZdZw1IviPnAIi8xeJJHsrLr3D6Kh/4GoOCpRQFGy2R80u2cR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499806; c=relaxed/simple;
	bh=eT8sxQyQgKkZ5waMUZ5/NUU9rZoIf0dlDaJ3IU5TQwo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fQIyrBsKx6QldrIlACP8DuOURnhGbkJosUbcHjpEJr5As4etpQfxE3WxwV4l+DOoCXUXJ0H/wA+B0Bu8VQFax5fiYIvWFtiUY+MNq8qMHbu3zQRy/gsimB1kG8nM8eIDUKSXKD5pN0stTttGci02G00MKlB4q73C4zvkvkttY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdmqmEZx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so15130785e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499802; x=1734104602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDN3TK5hfgT8qBjsEymaikXo7QwlWf3nzkE76VwOudg=;
        b=NdmqmEZxRHu6gczotujF6/FVVbNGTzX1GZ4TnkqXZR2GP8RfW084Zn/bHumLcqV+41
         LEw8m357e3IreFuxNXZRelX/y3T2FdmzEW/xZZMgDOXYjx9V055E5WS7n2xSGDSPnubM
         yGnX0hdKPaME3u52MCE6ahMAC0H8Q8vqIjlyg9vbNl0H7lkRmmDMUaRkHc4Hj+YefdDl
         ycQ3khhcapDnSlgEGAL/A2GhyyKuLASO38mof+IWFYUj7vu1eKbidDjN4sxt9LriKOuo
         HSsSrnRxa76KuQOzAxd9T11mUl+ponApYV8JkHTAoSb9dzZTXYh9jIzaums4XN7Alasw
         6hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499802; x=1734104602;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDN3TK5hfgT8qBjsEymaikXo7QwlWf3nzkE76VwOudg=;
        b=XeyELnMCHE/PRTOTqaiGy05OrOfFjwHoCL0lk8bUoqAXwBS3dHry50NsHewMYAzMGq
         6GkyZhtwWsPSXvtHG3YbNLQof6RE+U8vxMKZEn5cujJgLSn3NS77ZUzH9gYCf2FSl7GQ
         pwh31kItkLuNy7wxYiHMDX/5+e7zBiujQKiPOY8THeBIv/R9DRgZ7P0KPteHnwZA9G5f
         bGYoZgrfBEtNsdUwSY1BAgjCtc5Re2JtdY73aoKPLEmHpXNIm6TywMlVFfDd2wsMusXF
         2EYezkOrGCTpMSxpXwQA27akTHRLo4BS569TKk8vNSex2sATQkNuEZg5SU5bqXylsBfq
         4HNw==
X-Gm-Message-State: AOJu0YxeNVDn6/ZIBAP06GFxKzBBzp/2lLpN7kvrVmhDSbTB4QbYdp11
	W3UAlBXlluDFZYct2xw6rw/DWNwKLpLP1t+uDuGevg0NS9s4YaI40EtZ6tQ0QGY=
X-Gm-Gg: ASbGnct9MeeqgVt2ZrxCK1fUPZ7TR8LVZhx99SimYe1eogq85gmP6gzPYpYAa2TqZEF
	GIYTBUEfPzqczAsPd23UUpVSzv6yBwHWltLiPRTK88BAChjAjX8mkKPF0rWvMHZCDivDctGK1dV
	VQyjO8OmtA/9JQzBGbCSQDKt90othqL3bUapLhl2jyoqiDBRtfPFVS2h1LkQHCa37ZVY3c1Uwnu
	lttf5zj8iQGhIVEFmXEd5j1j1uTWskSTbm8+PZBOwJHsLypT+7X7OA2mRBMullGKYGMNX5eo3O2
	4SZdIubqX3FFZa4od/GPAHKbV2g=
X-Google-Smtp-Source: AGHT+IH6Rokh4wuDHcii8jWDl/Umin0Jzs4M3mKKaqcDM/ORD41WlN3QtCkfzJNh8wWXnrl7AhcX6A==
X-Received: by 2002:a05:600c:1c1c:b0:434:a7b6:10e0 with SMTP id 5b1f17b1804b1-434ddeb43cbmr33086765e9.18.1733499802580;
        Fri, 06 Dec 2024 07:43:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889? ([2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dabf7sm59352955e9.24.2024.12.06.07.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:43:22 -0800 (PST)
Message-ID: <354e457b-07f1-40bf-b071-d218a46a47e8@linaro.org>
Date: Fri, 6 Dec 2024 16:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 05/19] arm64: dts: qcom: sm8450: Fix CDSP memory length
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
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-5-2f349e4d5a63@linaro.org>
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
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-5-2f349e4d5a63@linaro.org>
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
> Fixes: 1172729576fb ("arm64: dts: qcom: sm8450: Add remoteproc enablers and instances")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d028079c11bdc2dd2b254f7f7d85e315a86f79bc..7a3bf847b0b9eae2094b0a8f48f6900a31b28ae4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2800,7 +2800,7 @@ vamacro: codec@33f0000 {
>   
>   		remoteproc_cdsp: remoteproc@32300000 {
>   			compatible = "qcom,sm8450-cdsp-pas";
> -			reg = <0 0x32300000 0 0x1400000>;
> +			reg = <0 0x32300000 0 0x10000>;
>   
>   			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

