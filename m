Return-Path: <linux-arm-msm+bounces-52086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47CA6A5E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4E23A7CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C122221556;
	Thu, 20 Mar 2025 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vo6d9R3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE6221566
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472290; cv=none; b=NaPAcOlizBYPQVoyQmhkctIRUDzw48ttMdnG7+trYQ4dMECME52N33ANQLEessG5Rvt4qhvSYv1EExL6nInuXDnTEFmEjwSLsz9VeB5BeauuuDyrg9svIaWpoICJ36Fg+wcFMXR75FpV2dYWAnL1r2caZ5cN0CIlkjsZMQhvep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472290; c=relaxed/simple;
	bh=77R0+WDK+CiW222m2j6nCq925OkrZbkqCqIG552WaqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiN6weP1C2ly2vCb+mS8a/eKph0AP2zHEGp18EQPwQPD0N4Tb9zeu9hGqoQ7J9skN66fEiglq52m+LkAeFt8CljTMvHjUI46fQ82lfDxbpw7o4Xjue4eXzQeoouucNGYTafR7yjFXLAqAU9PT9kGJOhV0YzYnKQ5ARbney8t2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vo6d9R3x; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913958ebf2so556139f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742472286; x=1743077086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrGy4VeD8Ex7ajU9H0HLnGoiP3RQMZA4og2eM86qR5I=;
        b=vo6d9R3xMjGQrG5/uA5N752ONexv2ELy0nNHJTLVLUPB+2rm5UCSXG1Q1/gS9Sx8DR
         YdiWXpxKjfO8a9SreMbHwmZdsMlJTdEy7MCD25Jav+0tEMf9/GjSz8TQZxc596jOyID1
         /AwhLf/YFME2UtS7X3vQy+Mkpw2C2Y3K+KmCWhiUb4Mv0X7WVImgXuUPiu8gIBTDXqWJ
         RXK811oqqNcIeUBQHo9OhFA+ICi+j1XUc6SY1Hkdt4JEM5DowouufLEuXqa+6yWrosY4
         GLlcjZKkhnwQhMu5mU61Z4OVluS8fp3oI4+j+6aOqFctwjWasiSL6khQtzWL2uNgWOrf
         Nyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742472286; x=1743077086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrGy4VeD8Ex7ajU9H0HLnGoiP3RQMZA4og2eM86qR5I=;
        b=IlbctgoD4+5D1gK/MAavIJxoWDlImWpyv5hRNHBX+O3QAftsSmfdbYJP0uvNxLY8J/
         xPYjrg5dIyNBeNVM4C92VQ/EqD6qphI7ChYzXpS8HUklPRV+koO6odId/P8X7o/hflYW
         77DGuybRCf0yJklDQamLf+sZo2qWtpzzawGTYCcapw8tI7IK3xniO0gD2zZrX/382r8x
         1k70jmSmzflNbA6yyUrI7GI2034w7pQJ0h+0ItssP/gQJao/DIZPvanw25eTCt/LwUMc
         5UUCiRlQxcujFoEWbjz0zfaEhkh/G9S+aW6upsqwuqrcJwcwlmVwdWQn6dQgXu6ADIaR
         6d5w==
X-Forwarded-Encrypted: i=1; AJvYcCUa8eVN8jgVOCQDzj4QpzWBOi+qbLKx2bIOUd0Fhcs0iPardiwa7ytc/DSOHS0w21qi9FC8k2nf9ElCm9DP@vger.kernel.org
X-Gm-Message-State: AOJu0YxYG94yBkGP3o/mgX8q7so/3FoL7XS3RkS0aJ65lVECy5CNc4bX
	Kye4R2pQ0HuWfST3ltl4JcaRa+jd2CmBHudFg5M+KVJBRHEd9Sx7W5qD+qGoLEI=
X-Gm-Gg: ASbGnctPev8zmJicuGRNNIgyCH3i950UvxV3hz+qNQ6aRAs1tIzHipTvONSsbOmFXXW
	7WH/Ys8FKC1/XiphF5ZPsfIqLbIBc838c+dce/EdcCgONdYD6TOlA+ZP1cYkFRNI/dP2zth81OS
	F6gaflQZ1ynxAyXBK0jby7cnYQrHU9xo3UR7T1V/EQjbDbbCRitNVBSnIl+L2J6OSK287NeeJOd
	OBto/y82ud8eQft/hV9UnKBsbRKh9wq1MqMAcU/3Elnt8GqRtPKKNCEUpdB69B2SBSAG6SXSd0g
	zheJzcLm+eCPsfLwo4rGQZ+EQDYzwi2oNaqwd65jKtwxQzhYTKBuGSz5A+pZpyA=
X-Google-Smtp-Source: AGHT+IE9QxB+sJbY4sWMGNKOVwFQciuFplHZH1WkT8GnCUzXiGRLWi85+F6Q8dQwagRFnJerA8H6wg==
X-Received: by 2002:a05:6000:2a6:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-399739b484emr5671406f8f.6.1742472285604;
        Thu, 20 Mar 2025 05:04:45 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395c8975d65sm23981874f8f.56.2025.03.20.05.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:04:45 -0700 (PDT)
Message-ID: <647536bd-9c0e-41fa-9a63-86f290f49421@linaro.org>
Date: Thu, 20 Mar 2025 12:04:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-tuxedo-14: add sound support
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 ettore.chimenti@linaro.org, ggo@tuxedocomputers.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20250319143613.11177-1-srinivas.kandagatla@linaro.org>
 <AM7P189MB1009C6144E943460E1388832E3D82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <AM7P189MB1009C6144E943460E1388832E3D82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/03/2025 07:13, Maud Spierings wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> This patch adds sound support for this platform,
>> support includes
>>     - 2x Speakers.
>>     - 2x dmic
>>     - Headset
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>
>> This patch depends on
>> "arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1" patch
>>  https://lkml.org/lkml/2025/3/6/867
>>
>> ucm changes:
>> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/x1e80100-tuxedo
>>
>> tplg changes:
>> https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/tuxedo-elite-14
>>
>>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 190 ++++++++++++++++++
>>  1 file changed, 190 insertions(+)
> 
> <snip>
> 
>> +&smb2360_1_eusb2_repeater {
>> +    vdd18-supply = <&vreg_l3d_1p8>;
>> +    vdd3-supply = <&vreg_l14b_3p0>;
>> +};
> 
> This seems like it should be part of a different patch? Or should be 
> mentioned in the commit message.
> 
True, i thought I got rid of this before sending.
Thanks for spotting, will fix in next version.

--srini
>> +&swr0 {
>> +    status = "okay";
>> +
>> +    pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
>> +    pinctrl-names = "default";
>> +
>> +    /* WSA8845, Left Speaker */
>> +    left_spkr: speaker@0,0 {
>> +        compatible = "sdw20217020400";
>> +        reg = <0 0>;
>> +        reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +        #sound-dai-cells = <0>;
>> +        sound-name-prefix = "SpkrLeft";
>> +        vdd-1p8-supply = <&vreg_l15b_1p8>;
>> +        vdd-io-supply = <&vreg_l12b_1p2>;
>> +        qcom,port-mapping = <1 2 3 7 10 13>;
>> +    };
>> +
>> +    /* WSA8845, Right Speaker */
>> +    right_spkr: speaker@0,1 {
>> +        compatible = "sdw20217020400";
>> +        reg = <0 1>;
>> +        reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> +        #sound-dai-cells = <0>;
>> +        sound-name-prefix = "SpkrRight";
>> +        vdd-1p8-supply = <&vreg_l15b_1p8>;
>> +        vdd-io-supply = <&vreg_l12b_1p2>;
>> +        qcom,port-mapping = <4 5 6 7 11 13>;
>> +    };
>> +};
>> +
>> +&swr1 {
>> +    status = "okay";
>> +
>> +    /* WCD9385 RX */
>> +    wcd_rx: codec@0,4 {
>> +        compatible = "sdw20217010d00";
>> +        reg = <0 4>;
>> +        qcom,rx-port-mapping = <1 2 3 4 5>;
>> +    };
>> +};
>> +
>> +&swr2 {
>> +    status = "okay";
>> +
>> +    /* WCD9385 TX */
>> +    wcd_tx: codec@0,3 {
>> +        compatible = "sdw20217010d00";
>> +        reg = <0 3>;
>> +        qcom,tx-port-mapping = <2 2 3 4>;
>> +    };
>> +};
>> +
>>  &tlmm {
>>      gpio-reserved-ranges = <28 4>, /* Unused */
>>                     <44 4>, /* SPI (TPM) */
>> -- 
>> 2.39.5
> 
> Kind regards,
> Maud Spierings

