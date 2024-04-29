Return-Path: <linux-arm-msm+bounces-18799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2B8B5924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23C451C20FB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C1771B47;
	Mon, 29 Apr 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTB5iHV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95954FAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714395106; cv=none; b=TEG06HEzH1t8APWLXgJWBrU5JBhgTYGHDi1A+7Q7CRGFptugJkVDdLV8QVGjeTuLch9/3QA/JmI02FWN0cBLfiKPDcqy3/R4eUNX/8c8QfvcLLWzefGK3b1RRA3jDNvirQ7lprWfRXjtAUoSQ9ZVwi3Wui+33HTqMse3kaqHWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714395106; c=relaxed/simple;
	bh=qqwGQi68EVY5RX0H0R8vNiawzg9y+DRdgcn9cG5wVsA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BNbRL3HJ9O8R9knD18+znObGLATBBo9EVEzuPTQIjXu6s15s3fEdmTOAVZYtB+mp47Kfu/D039cQoOB531/TNrUEUj0gD4AZhQCOEjKO78b3vRKMSEIhDk0IJd6IbmycZbMYiwedEK9ZPz/MWEAg4bKr/Lf3qogB5VBfhpUbFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTB5iHV2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343e46ec237so3757694f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714395102; x=1714999902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYI4k9pCItW5lrimx9sxd2j1r+nQpXwV3dgJ6rGtekI=;
        b=fTB5iHV2SOeu2kZI1NjeRycQ4DR+eMhRSypjYtRzLuZfWdig90J6qNWU/YyuwjNm+P
         vClM9rGT7rkL/wjSbTFyuOxOup1FgMiX4leYaJTCe02tnwBaJwqdxq/ZXQBjWv++SR+o
         MPwzulbms53nQMY+bbMZTuz5mpmi/Be9/00KrMVwJyvhFmW6mV6eLsUb+Cxx1r/WyP+w
         n71VO8nB6+wU+SJ10IZQNmLwk6Z99HxpHh6v+0sjCeshw5lhe7lpgaC//42yC6e2P4nT
         RVWK8W3kWGm4CUnRZcU+pQhwnv0XYEcF4Jng03Ff7nHmlwNw+9hEM8S6dEWZVWXAZlSa
         ihTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395102; x=1714999902;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oYI4k9pCItW5lrimx9sxd2j1r+nQpXwV3dgJ6rGtekI=;
        b=d3CAKKunPB6mUhAp6g2Cf8wafH6ZOwNlZpAk36FPIcREHfRHOVJ3LijV4hvo/Xc+l9
         HaXcxI0gi4WrklsWnmpy5+YpUksQQ0RVl2nebqoQ8m4W9faJil4WAjH+KtK/eR5asgq7
         Jaou9AwmsBK4cfCNy3sq2wRKJf0W6hwnL3A3nj85Bga61sNkTxaHjomnFw+oUwTedbxD
         PwWLm1HETZ/CkLqUbPf2gOIjnPQJ9G4slRL//WMxU0lQeb8UAl1Kd1F2yovvICFAS7A5
         IIdZTrEGy+jCsaHs/QTOnbBUkL4Ggl4+jwYE3NVX1BjC4AExZ8U8itZmRQjDoIVfV2Py
         7SmA==
X-Gm-Message-State: AOJu0YyOCcVDzGOPyFEvNJycPWd1Uwdz+a0BYTUZf3WQDMkIULUISaEI
	BJS3IRbEjmQOc15QnZPC7snwuO6lLkBOeeP1dAND0WVwRwRtsUdTZAorBuVeOaU=
X-Google-Smtp-Source: AGHT+IFnTUke6Z0EtJwvJogtHF0lsKSXib3C+tvYJm5AkYh0EOABQUQIgEXPicDk5lq1YO84VySmTw==
X-Received: by 2002:a05:6000:712:b0:34c:d816:6a82 with SMTP id bs18-20020a056000071200b0034cd8166a82mr4467141wrb.47.1714395102060;
        Mon, 29 Apr 2024 05:51:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d72:4b40:65fa:89e6? ([2a01:e0a:cad:2140:d72:4b40:65fa:89e6])
        by smtp.gmail.com with ESMTPSA id f15-20020a5d4dcf000000b0034ccf959d6asm4541218wru.74.2024.04.29.05.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 05:51:41 -0700 (PDT)
Message-ID: <81ecfb4f-fd65-4448-b342-372ae25a0e0b@linaro.org>
Date: Mon, 29 Apr 2024 14:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/12] arm64: dts: qcom: sm8450: move USB graph to the SoC
 dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-3-87c341b55cdf@linaro.org>
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
In-Reply-To: <20240429-usb-link-dtsi-v1-3-87c341b55cdf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 14:43, Dmitry Baryshkov wrote:
> Move the graph connection between USB host, USB SS PHY and DP port to
> the SoC dtsi file. They are linked in hardware in this way.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 25 +++----------------------
>   arch/arm64/boot/dts/qcom/sm8450.dtsi    | 11 +++++++++++
>   2 files changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 3be46b56c723..9926294e4f84 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -674,17 +674,10 @@ &mdss_dsi0_phy {
>   
>   &mdss_dp0 {
>   	status = "okay";
> +};
>   
> -	ports {
> -		port@1 {
> -			reg = <1>;
> -
> -			mdss_dp0_out: endpoint {
> -				data-lanes = <0 1>;
> -				remote-endpoint = <&usb_1_qmpphy_dp_in>;
> -			};
> -		};
> -	};
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
>   };
>   
>   &pcie0 {
> @@ -1114,10 +1107,6 @@ &usb_1_dwc3_hs {
>   	remote-endpoint = <&pmic_glink_hs_in>;
>   };
>   
> -&usb_1_dwc3_ss {
> -	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
> -};
> -
>   &usb_1_hsphy {
>   	status = "okay";
>   
> @@ -1135,18 +1124,10 @@ &usb_1_qmpphy {
>   	orientation-switch;
>   };
>   
> -&usb_1_qmpphy_dp_in {
> -	remote-endpoint = <&mdss_dp0_out>;
> -};
> -
>   &usb_1_qmpphy_out {
>   	remote-endpoint = <&pmic_glink_ss_in>;
>   };
>   
> -&usb_1_qmpphy_usb_ss_in {
> -	remote-endpoint = <&usb_1_dwc3_ss>;
> -};
> -
>   &vamacro {
>   	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
>   	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 616461fcbab9..d138b90bb280 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2321,6 +2321,7 @@ port@1 {
>   					reg = <1>;
>   
>   					usb_1_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
>   					};
>   				};
>   
> @@ -2328,6 +2329,7 @@ port@2 {
>   					reg = <2>;
>   
>   					usb_1_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp0_out>;
>   					};
>   				};
>   			};
> @@ -3119,6 +3121,14 @@ mdss_dp0_in: endpoint {
>   							remote-endpoint = <&dpu_intf0_out>;
>   						};
>   					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +							remote-endpoint = <&usb_1_qmpphy_dp_in>;
> +						};
> +		};
>   				};
>   
>   				dp_opp_table: opp-table {
> @@ -4584,6 +4594,7 @@ port@1 {
>   						reg = <1>;
>   
>   						usb_1_dwc3_ss: endpoint {
> +							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
>   						};
>   					};
>   				};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

