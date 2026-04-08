Return-Path: <linux-arm-msm+bounces-102322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCLbLT5N1mm8DQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 14:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D053BC537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 14:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2F3B303B4DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 12:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F06526ED33;
	Wed,  8 Apr 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBWmzG8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AED17A309
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651726; cv=none; b=G/xk/YtYv6HFkU9O0eAoqb24gcQoAqral5CQLBhS3IZpV+Nfn5rp2Ubv3nqQztIDO8m5HHdWQtxdxf3XkU6OD1KXSTvRe5Gy7h3em/aCyf5AP7dyPp9p0dJHCoJrFqz2su3tFd+yTzkgLWsp8rd1NpzXPHmX8vhnJApuxgSJX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651726; c=relaxed/simple;
	bh=EHqwwEs0oQ3acMu+Bc7QiycwTMkZYIh2NFGn4+7elVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0fCzLE28NJyMPV52C29Wvn1oB2FQFPEyuQWnrvfpsqLpAd26JwvGCgTIfPLgtxC4TtfuOBGGOGipA7aQxRx/Jd4ofvlFM8bMjl6NSJ1+qaDoJcOVQLoEp6Fpsakuqi2ZEq2ECej6IyYSJeqS7mljacxi9q6mAIpHzd7fCIdu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBWmzG8P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4888375f735so58565905e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775651723; x=1776256523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loonFF9GPLQNzWQCTTaNxJcZBKqDsglfRlm8YRkwXf4=;
        b=oBWmzG8POs14Jt3IeGZlPQXNZNLRf4YL1Nsg4e2X22mxbeb3qwSo6D0KeoEz2CcmPf
         U4iFHduU7/k0QGZXxbPhzh/MV/BYYQxM/AFFXb4aoOAi/jGg5ttf37bypXcQIshjmJYp
         /apgfyf+jplv5DHgsiDdeSeMl2Fp/keO/R5XkwEu8PTzX3blUfnJyFFAKonnvB4xN7N9
         V6yu2ZfPUphbKucJUBMCWxqWrJlQvuKhFTcnCAxndRidF2Ood2G2CdJhuKG5KDChOx8R
         WrC6TaWoDQlB3zxfVMfvF5q6uLwiRZZs/89xReUpDcyJYN1Hm85B35hpmkqEV7cfMB8i
         TlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651723; x=1776256523;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loonFF9GPLQNzWQCTTaNxJcZBKqDsglfRlm8YRkwXf4=;
        b=nrJrCIo5tYggkcrXllPQX8l6If7O9BuThM8yj0+PbdQebJIYI/om4P2LXXD2WpGRGq
         cmiW1lahqBAcxZ+YACRCRj2pIkzUNs12whghq2tq5YdmrCvA34w4gRQo6I/oGuqbHsxj
         oVHlTU8jOupRCkh91mxI22lXRJz4R8ULoOycxug0xGRljaZJvMSABDiRTztrj329trzG
         k4JRsHL3CaJ2o0Ns4/CyAs6mjvLbLeO++EXIe1q582WNMrvvepqltAL4IdrdPpjSuE6Q
         6pnF8Q98cRLNT/OkpPIF+G5HDKx6/Os5dH6wRLDs6vujP4bUD5GGqWr0sYmY+wx8wBG1
         gb1w==
X-Gm-Message-State: AOJu0YzL9POGYHJ367iUTbfzMV7W0B0QcCtKeh+XTm967g2Yrru4HheB
	ZGYyk2sLdqxysDuVf44n59AyD1tA+bMzytfFrWmenvJF7CDzLhYfvceg1NSH4lfFcFY=
X-Gm-Gg: AeBDiesmZtUaA0bQun52vM2TBx351Ufy+3uFuY/BajOWKgN+cMA46KLUsmVo93EObdS
	XJA+BLkNnN0xYBl5it4D6u02PQviOx8VkQWBGw5qwYipM1vxYkxytdcE5ajRUZQhe5ig7I1IAEp
	D90tbqt9RrgEpckxZQ0/kNLps/dFfYxHhHu+uMYwS1pBI7D5TKsVj8jy1vSY7S1NflzORlmn1xM
	qiBoWSGWulVNFlHeMQWQNevo8opV6uOSTtLmWES/AxJvWKC3PB4aGG0BBiKWm00ExZRBRjuC+yK
	oOj6+15PZhssKaPL086s3zyEs366iD+mOaNycBamJ8nahdfNUTuzQrU82Y3Vfy2G0NFcn1h78WP
	J13hGm7qYqzYs85GavBVfdwgset19jGwsPNuA+AgdPf8h1b9BUkVGB0R5Wx73f7HMgTme2MR5Vo
	1RFL1KpV1RdC1bcH24ycidP7f3OGdH+K0HM4b78CFT49tjLv0EgCiTi4uq1AlXyTFQY1ilm45gv
	vxt7ME=
X-Received: by 2002:a05:600c:c0d7:b0:488:a950:4f6d with SMTP id 5b1f17b1804b1-488a9504ffbmr145572005e9.1.1775651723096;
        Wed, 08 Apr 2026 05:35:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d6d6:c397:9229:b35c? ([2a01:e0a:106d:1080:d6d6:c397:9229:b35c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a72baa8sm495589675e9.15.2026.04.08.05.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:35:22 -0700 (PDT)
Message-ID: <ce9061ea-8961-4d5a-bbb0-b4f50b7e6d29@linaro.org>
Date: Wed, 8 Apr 2026 14:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, jsandom@axon.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-102322-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 36D053BC537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 11:57, Konrad Dybcio wrote:
> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
>> From: Joe Sandom <jsandom@axon.com>
>>
>> The RB5gen2 is an embedded development platform for the
>> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> [...]
> 
> 
>> +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
>> +	/* Workaround is to use bit-banged I2C */
> 
> Interesting.. I was under the impression that it was only an issue on
> RB1 and RB2 boards.. perhaps we're missing some magic register write..

On the SM8650-HDK, the HDMI i2c is shared with the battmgr in ADSP, causing a lot
of issues... the only solution is [1] to declare the bus shared and use GPI DMA.
I assume it's the same here.

Sharing the same bus between APPS and ADSP is a weird feat... It seems that having
26 i2c busses and 212 gpios available on the system is not enough.

[1] https://lore.kernel.org/all/20241129144357.2008465-1-quic_msavaliy@quicinc.com/

> 
> 
> [...]
> 
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&sw_ctrl_default>,
>> +			    <&pmk8550_sleep_clk>;
> 
> nit: let's keep the order of
> 
> property-n
> property-names
> 
> file-wide
> 
> [...]
> 
>> +&sdhc_2 {
>> +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
>> +
>> +	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
>> +	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	vmmc-supply = <&vreg_l9b_2p9>;
>> +	vqmmc-supply = <&vreg_l8b_1p8>;
>> +
>> +	max-sd-hs-hz = <37000000>;
> 
> Are you sure you want to overwrite that? The value in the SoC DTSI is
> set to half a MHz higher
> 
> 
>> +
>> +	no-sdio;
>> +	no-mmc;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&sleep_clk {
>> +	clock-frequency = <32764>;
>> +};
>> +
>> +&spi11 {
>> +	status = "okay";
>> +
>> +	can@0 {
>> +		compatible = "microchip,mcp2518fd";
>> +		reg = <0>;
>> +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
>> +		clocks = <&clk40m>;
>> +		spi-max-frequency = <10000000>;
>> +		vdd-supply = <&vreg_l14b_3p2>;
>> +		xceiver-supply = <&vreg_l14b_3p2>;
> 
> It may be that for this chip to actually be able to communiate with devices
> on the bus, you need to set the new 'microchip,xstbyen' property
> 
> see:
> 
> https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/
> 
> [...]
> 
>> +&tlmm {
>> +	gpio-reserved-ranges = <32 8>;
> 
> Would you happen to know what these pins are connected to, and if
> so, add a comment (like in arch/arm64/boot/dts/qcom/x1-crd.dtsi)?
> 
> 
> 
>> +
>> +	bt_default: bt-default-state {
>> +		pins = "gpio81";
> 
> It would be best to keep these entries ordered by pin idx
> 
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +	};
>> +
>> +	sw_ctrl_default: sw-ctrl-default-state {
>> +		pins = "gpio82";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +	};
>> +
>> +	lt9611_irq_pin: lt9611-irq-state {
>> +		pins = "gpio40";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	lt9611_rst_pin: lt9611-rst-state {
>> +		pins = "gpio7";
>> +		function = "gpio";
>> +		output-high;
> 
> You shouldn't need to assert the GPIO state in the pin entry node
> - the driver should take care of that
> 
>   
>> +	};
>> +
>> +	ntn0_en: ntn0-en-state {
>> +		pins = "gpio67";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	ntn1_en: ntn1-en-state {
>> +		pins = "gpio42";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	upd_1p05_en: upd-1p05-en-state {
>> +		pins = "gpio179";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
> 
> I don't know if pulling up an active-high pin is what you want
> (there's some more occurences)
> 
> Konrad


