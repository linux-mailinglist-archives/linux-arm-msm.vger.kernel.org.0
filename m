Return-Path: <linux-arm-msm+bounces-70380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278DB3160D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555971D03473
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889F62C029E;
	Fri, 22 Aug 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8DfVnKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD92283C9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860581; cv=none; b=W/wHQvcU/w4KwLe2uQVHQfAm0nCRwjAoOehr2klA3kdRJ20SuWjMGwbebhZdI74v6xQp9EKwHHChAPd4I7Er85R5rVniTDhen3oA7rY+5Ta7h+77lGS44FxnL3C+b+6SPANchuDM0VUekn0fEV2mx97YCy7QfyJ7KFdtSs4hOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860581; c=relaxed/simple;
	bh=wEg0i8ljpxKTk+ox+KSaAg2bJ9cNagorHHhQEBmrDtU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fR6QHBnXVhywXLqH5iMX1qjJSuulNk/5BTCnJ6zeBT6AubsdD2L+Z3hW4fueIwXa201/LjqtPIXwMsI6VgmRUCY+tKPNc2UwdUygpT3NzwbYlAKjVM3pD67AwP0mosBffDYxKfo9KLnvA86m8HW/kFZVx9z/z0cDgd+1mVyLGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8DfVnKr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b4d892175so8522605e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755860577; x=1756465377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSPNDRQEXSByP3k9ud61Mdrc8MbERDVLg0jj88ZjWgE=;
        b=d8DfVnKrAvg6QVFmg9IlUIrbXthKUUTiQSyIbp9xRyNDyv97l5hEPKm2bUY1RahPTu
         tvCr/IMMLskmrkIMBC5z4kKcv4MqwH1QPgnAHtdHQNCdkXKVunDqobsqpkf3CETLDnnw
         mR6VKBNbMSHeKhyZl4PVQw0fh1NZbOEKLUj9TiM2NAvwTLPk6CkUIduRn99xYk1l+SNS
         +sCVcFdLZZs4zXd1DCWoHxrvMBPaH4BXecD5KsOpGHGd54iUybngpC7FLGh9OqfjCkZZ
         HpQ0p9TGeJkefyHd06FOYZk0mh31V8/I+BhKkX1F7HKn0xGzATyteVcvK4YAFk5JZW2+
         Cg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860577; x=1756465377;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cSPNDRQEXSByP3k9ud61Mdrc8MbERDVLg0jj88ZjWgE=;
        b=Pu0p4wRlwJRlaf9hgZcHwcGl4wbQmmSy4D6GT40lfL63prZrCjCiLSn8EAzA0Nnxj3
         /U0uD0Shpuo/uX5XvsRt5jjynYVEh1tY9tSbtvkh1M7ZXkyy0WBRyhfmhzgmWq7IJEec
         ZWoNYZfmY3Wq00qTDHCrhLSFg7EYkFWLn6Axha/YrRuVIuVqGk8OCw0kXVGjH55fVjII
         xWY5M9+KjpWB59m2U4IJda6XqHZACJxbXqQl1i+kBLKREySREVTMv6PF5d+hVf9DE7zQ
         vELe6AYiA+v8AKP9XP11Y5Cia5Z+Uj0rf+XAoEofPjuxFI+/eWGonlBQjfJxilSiI1Wr
         zdEw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/a7I4KixOPjC0wvgrWUxE9Kh4eU+uChh+Z2a4g3XsotgnyJVLELzTjcyTiatOLc+JRi/39CQvym3p+9e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ioIC3Hgt5NmAIgTF+111Fe4visYedQZfz6gKOztJ+HmXGQKI
	/jmZ8Am/pY4Zjk3G4BrsZYYE3649KJcLvxK2f0/ImsW1MUN57HsDF6FiFIi9aOm7pIc=
X-Gm-Gg: ASbGncs9ONYIYVnRGH3LXKbmldqEuU4uiQbQgJ1Ic+KtvpfIxka+voBKtRhncvoETqb
	vQXzubRyscpWdaBrKOP4vr3glZpNPcbHgX2PSr3TDgAdW18baJ/2YuAMXxs7zTL2RyYY50GCVkd
	mDewk8nshqwcPH7CblB0GJhwV7mdL4KZz3LoavOvt8DsYDnsVkxR80hOzofIJbG4RvBO77rKJ3b
	Y7t12OHpIHsBzTVxV/5HkDcELzTH6IU+B7B7CVeHYWFv3Pv5wkIDatFnQkEn8t9JU+o28DZOXFW
	GRg4W6yz34b8lJxSfV42KrXoYWQaTK8NYq9/OyPWFRr6w8coaZzTt9Lwy7hdrJkVKeDL4O9DAGZ
	3lW/cidX3lNOQ55Yy3EHGyNIM3FO19VXTGRRmkfsPolgoTVPPSZBksUHSCiiNphHxvfNrpcs5RW
	w=
X-Google-Smtp-Source: AGHT+IE9PTwlyQ2HBsXoeltYN2/3zplP7/7veKdqNUYfYAOzMFeQKW/6u0My0eAnWH9Eypu5kHR5qw==
X-Received: by 2002:a05:600c:3b22:b0:458:c002:6888 with SMTP id 5b1f17b1804b1-45b517d9ef7mr18067295e9.32.1755860576998;
        Fri, 22 Aug 2025 04:02:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e3a587sm35232305e9.18.2025.08.22.04.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 04:02:56 -0700 (PDT)
Message-ID: <431de5f8-2dca-4ec0-9b94-fcc12480e8c9@linaro.org>
Date: Fri, 22 Aug 2025 13:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
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
In-Reply-To: <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2025 13:01, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 03:53:28PM +0200, Neil Armstrong wrote:
>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
>> connected to the third QMP Combo PHY 4 lanes.
>>
>> Add all the data routing, disable mode switching and specify the
>> QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
>> the underlying DP phy.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -62,6 +62,20 @@ switch-lid {
>>   		};
>>   	};
>>   
>> +
>> +	hdmi-connector {
>> +		compatible = "hdmi-connector";
>> +		type = "a";
>> +		pinctrl-0 = <&hdmi_hpd_default>;
>> +		pinctrl-names = "default";
> 
> If this is a DP HPD signal, it should be a part of the DP device.
> 
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> 
> Please describe the transparent bridge too. It can be covered by the
> simple-bridge.yaml / simple-bridge.c

Ack, indeed it could take the pinctrl thing.

Neil

> 
> 
>> +			};
>> +		};
>> +	};
>> +
>>   	pmic-glink {
>>   		compatible = "qcom,x1e80100-pmic-glink",
>>   			     "qcom,sm8550-pmic-glink",
>> @@ -1007,6 +1021,14 @@ &mdss_dp1_out {
>>   	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>   };
>>   
>> +&mdss_dp2 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>>   &mdss_dp3 {
>>   	/delete-property/ #sound-dai-cells;
>>   
>> @@ -1263,6 +1285,12 @@ &tlmm {
>>   			       <72 2>, /* Secure EC I2C connection (?) */
>>   			       <238 1>; /* UFS Reset */
>>   
>> +	hdmi_hpd_default: hdmi-hpd-default-state {
>> +		pins = "gpio126";
>> +		function = "usb2_dp";
>> +		bias-disable;
>> +	};
>> +
>>   	eusb3_reset_n: eusb3-reset-n-state {
>>   		pins = "gpio6";
>>   		function = "gpio";
>> @@ -1486,6 +1514,22 @@ &usb_1_ss0_qmpphy_out {
>>   	remote-endpoint = <&retimer_ss0_ss_in>;
>>   };
>>   
>> +&usb_1_ss2_qmpphy {
>> +	vdda-phy-supply = <&vreg_l2j_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p9>;
>> +
>> +	qcom,combo-initial-mode = "dp";
>> +
>> +	/delete-property/ mode-switch;
>> +	/delete-property/ orientation-switch;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss2_qmpphy_out {
>> +	remote-endpoint = <&hdmi_con>;
>> +};
>> +
>>   &usb_1_ss1_hsphy {
>>   	vdd-supply = <&vreg_l3j_0p8>;
>>   	vdda12-supply = <&vreg_l2j_1p2>;
>>
>> -- 
>> 2.34.1
>>
> 


