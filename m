Return-Path: <linux-arm-msm+bounces-26296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3B9322FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6439C1C219D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2063D1974F4;
	Tue, 16 Jul 2024 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPqw5Stc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432C196C7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122820; cv=none; b=QKUAR2WzruXP4pDX598dB2IIZmqmuEeeqpR5Blw+dlO9RKnUs9n0rJCmKL44K5PbBcxGWVBOOIoxLMkw9JjOMPSWzfNMSvDYIKiedRYup5VzPSj1GQAD+hJbhees41T1LgKv/2LXpgWMs+VLfh8Thl2nQnZflUjT32anKCyPSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122820; c=relaxed/simple;
	bh=Yz6weDiPardgtsfKrAhEEw32tolr/Zmr4mxIYT2xDfo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Itj8Y4RRNNFz8muqqx9VR2JcrzHFk+rEAfkSWVp9nBOKzlxkQ54qV954seEFzHlf5zgluO5KdOogL8YCrqfRoqzT4hKU/ceg3uSpnNwGegPZhom6Go6wN6Lf/9mc7gblBkfdkLkHvMnqWfwU+vdiHVn4IFemoi/swVTyPHIQFSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPqw5Stc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367a183df54so3571396f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721122816; x=1721727616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uC4G2iZkZ7rivx5AWjBLPvuJHPT6w3aeN8UNztFpm8=;
        b=FPqw5StcIt+qEfNJIGlfu9UZqRx4sgi9p/d9Cd7pv7AiSlOnrgLCPEshHv+R7QguJs
         im5cPVAYMwv1mGnygqLepT9iwP9ZrgqpcT2kn1JhJeCX8OVezgeA+r60+yBGN9eA2bE2
         XUE5hxa9c3mY/6I7XbgFBS8FANyv1mMwYmXVTXKHv2lrBgVHPCht3stUDTdx5Q51+ApN
         hiJF/vgcQFWfzIIX1s4/m6tLd81y/ya7jBRyOdN/i8GeJ9bAe35ph/9zvX6XOgW7xCYR
         PTJMu3kskU2HIwXBoPEQpYxvUejAnWElCTP1qbNuzuc8CeGTKDPu7yEmqzxuPgkwiDAD
         iUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122816; x=1721727616;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2uC4G2iZkZ7rivx5AWjBLPvuJHPT6w3aeN8UNztFpm8=;
        b=btfVktuqEEc8KCQ3isM1Ra3z0ACcE/a7JBIT6VB38r4F5NHWya2et9PE5IspWeqKVn
         57RaEjwMqqTUGZ00oEPhbgU4Mq1or0KOkJ+Xc6tvHT2P/GlpNOjVDEEkb7PpgDie2wgE
         1TSoZkewPRRezMhp76ReacZSLyoJXeDewnJZiEVWy7/EQp5PERoXCoEpJNY53mYLAlyE
         GboJYSody/GOFYqYrIQW23LpgI9nbgSXLSBO/lMRROI4QRnJtgr5Ttaa3DUc7rH8Wj6O
         nl9BpcEZX+WHhmlitx4YsftMbElk1dnbmv6ZeViQK1dM25Mbc5eENTSBNbFeJt33qtbd
         MJdg==
X-Forwarded-Encrypted: i=1; AJvYcCWU9p5hT27pR5GrE9/rtOMFQKi2lh7aecqx+y8FRZWVZktgzaPiBxCURAoXX08rXutNpln7NKkyaEAKivqTe9zoz9Ib6nwZJpg7aYzSzg==
X-Gm-Message-State: AOJu0YwUuCLxNjU9sQs5hVikgOjHf1e6A/7NJ7hiusTO9YuRj25u3sms
	ryfEOIzO8m2NorZKAErZOAS73ppuPRQkcxRdR0Dl9f/leN8Uao6Qhsn3e86a31E=
X-Google-Smtp-Source: AGHT+IEbHrZnwhrgVVk1jY59doNN/afF7lpjn01IM3RFuLKF8ytPrfrhh5b9YgNfl6w/M/oLDeR1DQ==
X-Received: by 2002:adf:f6c2:0:b0:367:9978:7ff with SMTP id ffacd0b85a97d-368260a2001mr1029548f8f.18.1721122816177;
        Tue, 16 Jul 2024 02:40:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197? ([2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db048a8sm8467124f8f.111.2024.07.16.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:40:15 -0700 (PDT)
Message-ID: <d3416be5-b97f-4db6-a779-9c436e41dd72@linaro.org>
Date: Tue, 16 Jul 2024 11:40:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-hdk: add the Wifi node
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20240702091655.278974-1-amit.pundir@linaro.org>
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
In-Reply-To: <20240702091655.278974-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/07/2024 11:16, Amit Pundir wrote:
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
> Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add the Wifi node").
> 
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 97 +++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 12d60a0ee095..c453d081a2df 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -279,6 +279,68 @@ platform {
>   			};
>   		};
>   	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
> +
> +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * TODO Add bt-enable-gpios once the Bluetooth driver is
> +		 * converted to using the power sequencer.
> +		 */

<snip>

Now [1] driver & bindings changes were merged, could you resend with the following squashed:

[1] https://lore.kernel.org/all/20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org/

====><=====================================
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 0fa0b79de741..01c921602605 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -284,13 +284,10 @@ wcn7850-pmu {
  		compatible = "qcom,wcn7850-pmu";

  		pinctrl-names = "default";
-		pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
+		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;

  		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
-		/*
-		 * TODO Add bt-enable-gpios once the Bluetooth driver is
-		 * converted to using the power sequencer.
-		 */
+		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;

  		vdd-supply = <&vreg_s5g_0p85>;
  		vddio-supply = <&vreg_l15b_1p8>;
@@ -1312,20 +1309,15 @@ &uart14 {
  	bluetooth {
  		compatible = "qcom,wcn7850-bt";

-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_s4e_0p95>;
-		vdddig-supply = <&vreg_s4e_0p95>;
-		vddrfa0p8-supply = <&vreg_s4e_0p95>;
-		vddrfa1p2-supply = <&vreg_s4g_1p25>;
-		vddrfa1p9-supply = <&vreg_s6g_1p86>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;

  		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
  	};
  };
====><=====================================

Thanks,
Neil

