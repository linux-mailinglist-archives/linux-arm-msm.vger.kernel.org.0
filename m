Return-Path: <linux-arm-msm+bounces-90148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGoFHGXucWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:31:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABD64921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D1D04EE01E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C612138F922;
	Thu, 22 Jan 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehJnnwBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3F3803F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073932; cv=none; b=KiEbIDJ3z4Bwv5Oe1Nog6yGhNVT+JJRu2yMXxMV82r96Vcmkx7tEgKJapCtDGMAO6pvRKQapbzwk5q9nmBboLmXQqbfEAtXiFP5ERv3PpxQvMLNo33e8h1SYQMDO1hjJ8cdD8TiEwN86lqkIjd8Ndtx3xbaKLT4nQ5n9tYv6BFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073932; c=relaxed/simple;
	bh=IG01gYL4yyOWn3gh2nWit+q/HCd3/kni6PxfNbyS2g8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h24IeV0+WFahMFTHC3vmh2305CsyT9/ZxkRx5ptdU6HBrH/GTKm5O4stytVs2j42jz+ToOjKbVZa0k7ClriO8EtOcgc6bYlEZkjJizAZ75Qd+1d6S1He74XpIOOp5AEL6d7/aMdllKUdvxorvX3mJs/12dcYNfZC06looyW6IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehJnnwBo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so5505315e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769073926; x=1769678726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wh7yPBI+oxYltmzoz6sUaPuJ2ob9U5MNpZ+a6WNEGQ=;
        b=ehJnnwBotLC5aVGR9HNJA07t7x4QEuLm7fxQVQTUZp5ZAP1+29Ka5g8vrnGV6AkJc6
         2gSUt5qQcwAhYkCJtJa0xqjBY8g73Cqzq6791LMx2gGODfyRZo86JaN3byx6u59XoHgV
         rFkBtFsFPlT9C/nkFk7AaxSJXjGAVSlcDkw1omIWXSqT+KAmHkLzFgOciP2fo3t5scSE
         L0Sk6dceXqzWvp0DL3wkAeFQchpAbFP49w9c1h5QZSNMejngBRPu4nrMUWYSRRbY8NCI
         r+tsRfeT5bZlt6sTjduwkeP30xYn/lbW44pnBg1aI1zfPLn2F0wyOaKNwIQQ2SvX1tz2
         f5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073926; x=1769678726;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wh7yPBI+oxYltmzoz6sUaPuJ2ob9U5MNpZ+a6WNEGQ=;
        b=RAC2xTKhdG0MNam/weOO/7z3eD4h9yNLQ11QLysWdpHDccdm7CxaTipoCrclYRBJuC
         EVnh2rN20hDY6HsZTFiYEqFMizKwPBLAkYT1xX44DE71LSDoGko2z6tRjUUzVKVO3DvA
         LloEO1ReAI2XogdtD0ubwbPNl93RpzvmlYf6mn6mPll8EvS+pTX05+QEOYMUeAUizJ6q
         JssN5pJSHIzw7cLam+0PRA06/ldNwPcJTHe8nhK3BJtkb/djs3UzyYCbvNZQJjbGPc9n
         xDSmloMnH6RZMd9FKbTXIE/3sgvlb3Cxi8mt5+1TG1rc7s5r1pT/A6sl39jj2i4PtG7m
         f03w==
X-Forwarded-Encrypted: i=1; AJvYcCU/p45VGBHlvk4VSeIKtJ7uCeTWU1zlAgF09EMXdRK1I3ySV2CAToSkTftaBHuaQbqk+Hj7Td8WOxAvztAF@vger.kernel.org
X-Gm-Message-State: AOJu0YzTft/pTjC9WzZitgBswWCfA6z4oS0H+KajgZs+ZGRYDb1gEkiu
	aq2rnULWfDVzhZoEJvwxsqDNCY87yYiQkrHvUTUUDx1rDPYtg6IVlGkF8YCiMnSMeRA=
X-Gm-Gg: AZuq6aJUBmKQxjukNjq5sFwHP67EcEocB00x8sSaMZqFHWRf4OGKBYv/PhEvOZzGmxg
	iDG3OhmaH0Tx8PQaZDXUWIX19NzXwHKfPm36PTIqp7Wv/7YOEb0jmn54shMENDGvo1cEQBjH4YL
	1pVBGXQaL1n/xnSCGYvLOMzlSjn2yce/nGxIpaK4MhcjPCltwWvrlY4uZQeuikprwwQtpnlu1ra
	jg+yDzAl6OEcH+5T1DDz6gUl9VQ+5Xkawc6XwB7W29/kAfyyHrfZ6OkMa2UWRNWHggHYiXDaM5z
	Hkzz34jb3tMfwRhV/voGslQaRTPVmBnw34lMg3ozq9UY6gyCV5oM4spkiyrgElN6qGNrDFTWQCv
	Uq4LrnRRrFRwXjUIVfWJnos1ywRegh4lERhLoM7Q3pVAbtTqDsXTyTP9GHv4M1nf3+6VOQKOMKN
	pgwE3Iode1Dkz8zAViK5IEPccLuqEUXDjmAdqDsfe8xIWNtO7M/FN/B9szfIt1ODU=
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr298875535e9.9.1769073926248;
        Thu, 22 Jan 2026 01:25:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804705b277sm54563365e9.12.2026.01.22.01.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 01:25:25 -0800 (PST)
Message-ID: <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Date: Thu, 22 Jan 2026 10:25:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
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
In-Reply-To: <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-90148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,0.0.0.0:email,outlook.com:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: CDABD64921
X-Rspamd-Action: no action

On 1/22/26 10:15, Konrad Dybcio wrote:
> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>> From: KancyJoe <kancy2333@outlook.com>
>>
>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>
>> The design is similar to a phone wihout the modem, the game control
>> is handled via a standalone controller connected to a PCIe USB
>> controller.
>>
>> Display support will be added in a second time.
>>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +	fan: pwm-fan {
> 
> I'd call it fan {} but gray/grey
> 
>> +		status = "okay";
> 
> You can drop this line (nothing disables it)

Oops will remove

> 
>> +		compatible = "pwm-fan";
>> +
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> 
> interrupts-extended looks neater

Ack

> 
>> +
>> +		pinctrl-0 = <&fan_pwr_active>,
>> +			    <&pwm_fan_ctrl_default>,
>> +			    <&fan_int_active>;
>> +		pinctrl-1 = <&fan_pwr_sleep>;
> 
> fan-pwr looks like an EN pin of a GPIO-controlled regulator

Probably, will model it as a regulator

> 
>> +		pinctrl-names = "default",
>> +				"sleep";
>> +
>> +		pwms = <&pm8550_pwm 3 50000>;
>> +
>> +		#cooling-cells = <2>;
>> +		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
> 
> Does this come from a preexisting map?

Kancy ?

> 
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&volume_up_n>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,sm8650-pmic-glink",
>> +			     "qcom,sm8550-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +			self-powered;
> 
> Is this property interpreted at all by our setup?

Kancy did add self-powered, but it does charging so it should be dropped.

> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		model = "SM8650-APS2";
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"DMIC1", "MIC BIAS1",
>> +				"DMIC2", "MIC BIAS2",
>> +				"AMIC2", "MIC BIAS2",
>> +				"TX SWR_INPUT1", "ADC2_OUTPUT",
>> +				"TX SWR_INPUT7", "DMIC1_OUTPUT",
>> +				"TX SWR_INPUT8", "DMIC2_OUTPUT";
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&wcd939x 0>,
>> +					    <&swr1 0>,
>> +					    <&lpass_rxmacro 0>;
>> +			};
> 
> 'co'dec < 'cp'u
> 
> [...]
> 
>> +	wcd939x: audio-codec {
> 
> 'a'udio-codec should be way higher

ack

> 
> [...]
> 
>> +	thermal-zones {
>> +		cpu2-top-thermal {
>> +			trips {
>> +				cpu2_active: cpu2-active {
>> +					temperature = <38000>;
>> +					hysteresis = <2000>;
>> +					type = "active";
> 
> This is shaky.. let's perhaps reference each thermal zone that you want
> to extend with a label.. Or maybe a pair of labels for trips/cooling-maps
> per zone?

Yep, will clean that by adding labels


> 
> [...]
> 
>> +&pcieport1 {
>> +	pinctrl-0 = <&upd720201_active>;
> 
> Is this a regulator?

There's s 3 gpios, the 3 are required to have the controller to show up,
it could be 3 regulators and a reset line, I don't know. The controller
needs 1.05v and 3.3v plus a reset signal, but I don't know which one
is which and if it's really regulators...

> 
>> +	pinctrl-names = "default";
>> +
>> +	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
> 
> DON'T SCREAM! :P
> 
>> +	usb-controller@0 {
>> +		compatible = "pci1912,0014";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		pinctrl-0 = <&gamepad_pwr_en>;
>> +		pinctrl-names = "default";
> 
> Is there a hub connected to it? Or does it go directly to the
> aforementioned (game) controller?

Directly connected

> 
> [...]
> 
>> +&pm8550_pwm {
>> +	status = "okay";
>> +
>> +	multi-led {
>> +		color = <LED_COLOR_ID_RGB>;
>> +		function = LED_FUNCTION_STATUS;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> Would a label="xyz" be useful here?

Probably yes

> 
> [...]
> 
>> +&tlmm {
>> +	/* Reserved I/Os for NFC */
>> +	gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;
> 
> double space
> 
> Are they all for NFC, are they all required?

They are reserved, usually for NFC to be used by the secure enclave,
but we don't have nfc but they are still reserved...

> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 07ae74851621..fcd5a1a45803 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>>   				};
>>   			};
>>   
>> -			pcie@0 {
>> +			pcieport1: pcie@0 {
> 
> pcie1_port0, please

Ack

> 
> Konrad

Thanks,
Neil

