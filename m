Return-Path: <linux-arm-msm+bounces-30421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D2968BA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396D12839A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7F31A3029;
	Mon,  2 Sep 2024 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fkNtgEiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B881A302E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293365; cv=none; b=ICt1ZbXp5E9J4r9efBJrFK8EFzB9n8jdHuWj3UoYVYyfc6WqOJulZyy0XyM+J3zQbv2HbRGsf2pmdYKFDrYGoUnf4BtfvOzt1oWC+9i+H6FqHerY4xLoBaYxl9mFTQn7xvGHhHLCb/DZ5kT52VGqWvi/M8CyWkNsf/qz0q5388Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293365; c=relaxed/simple;
	bh=vZ0hcu0WdCXigcKyq1CEUHRpBRn1lmg8WfyHLp3O+6A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SA2MqWWAmjfuZAF1ijD2eIznoN+ZTl+40MZ6A31WG3egFjyO4zpblZ+YmmW6cZAtI3DpBrC4TYcwzaayAevLu+E6mHVJ4FUGzE3CKxTmQ+80y6a9w0aiVLsJjt3aKPZJjq3J4jqhWUZFqAqihUFe2opO5VXzLOdQXw+tnR8lQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fkNtgEiX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e1915e18so36799005e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725293362; x=1725898162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBT6lkn8ZK8Bhla+c4LRfo8zJd8uqrdVz88guMjqgyg=;
        b=fkNtgEiX9wXNDnci52robCBTz0Mx/epMzE8zagSQ0STFgpNhEpQNqvnQbMocjdZ8Do
         Qq1Zt7iEoNfru+aX9jE3HUoXj7ztkL6kdxMym1yoUHMLAkJcIzc8voMUUVg4WqT+6WxJ
         k53xPpSxjSF85mkGXovgxDPx36dRctuK7axBcPs6yBAt8ZWK5WEahC5EZprcYN13kSos
         EyGrJNmyUgSM19wZosIQ6wa2dphTq+6XWhCwYcYhr+6Q6Mj3Kg8jpC24a9EvzjLGnSlG
         21NPoF+86QlF9dffnvktgUddbcoJuRINWsqE1f89p1mqwb9xzvR1lJ6pOBOeiPrt97m/
         sAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293362; x=1725898162;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CBT6lkn8ZK8Bhla+c4LRfo8zJd8uqrdVz88guMjqgyg=;
        b=A5cbvm33DVBlIk14Dvrw8pU6KH/2wGPbwGpk0ffU9yMmg9E3oAL2vq2njFYXCOQ+tD
         NlrM0nYcAGsMGYN3Dj45/xi7HL/yNMdbtuFpd0XBpdJZp6d4tTotpj5heElWAURNCL6V
         Ofsx2hTqJWUQj8uOII8VtcqtrNQiMZ4Q5D9JZkY2LnheDiHIBIfbCMFxSAcMxYqUOn2x
         iRx/I0w5xeOPvuEsSXvuRr5IZLx/HqctVr1tQ3/NVKxLcvp3H9a8hgTlPxA5AbDyp7vJ
         VRTDf6rLhRBkzv53xjTvSoFKcO9xH/jTcMEfIZYFOFegAuBFDgXesxF7TKUNCQrUDEMO
         L1yw==
X-Forwarded-Encrypted: i=1; AJvYcCVl9caT/SaGMqCIcCXP+MPoMNzTey0w/c3tBDxToUkSDUyhV6/G7QSmu5S5LnhGmXUcfjkUquDOwXo/qlk/@vger.kernel.org
X-Gm-Message-State: AOJu0YwHULaeZglIv9HRCNByFovFSa3azyPhmQ4Nyb01u+RXU6nTNAjd
	J3ufc3+ShE3UaR48lEi1TIl0a0afsneguVFUfRGKck/hPFnPsFxCgLXfeg0YSbwdzejAeqN5Kts
	p
X-Google-Smtp-Source: AGHT+IG4KtZkxzTrDxxtmyN/G73pYEBB6VJdn7Ut4aMFJaWdA93xOcKmSIQpZLe2W1FntJDprgaIZw==
X-Received: by 2002:a05:600c:c13:b0:428:abd:1df1 with SMTP id 5b1f17b1804b1-42c7b5a8d28mr46717395e9.9.1725293361172;
        Mon, 02 Sep 2024 09:09:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa? ([2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e36626sm142355315e9.47.2024.09.02.09.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:09:20 -0700 (PDT)
Message-ID: <7762a199-9091-46d7-a172-5cccc51a26e9@linaro.org>
Date: Mon, 2 Sep 2024 18:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB
 Multiport controller
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>,
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
 <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
 <925061d3-9894-4332-8c2a-e494ad22c66b@linaro.org>
 <eb17ba5c-d7b4-4463-a0a3-95ab584988f6@kernel.org>
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
In-Reply-To: <eb17ba5c-d7b4-4463-a0a3-95ab584988f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2024 18:07, Konrad Dybcio wrote:
> On 2.09.2024 6:01 PM, neil.armstrong@linaro.org wrote:
>> On 02/09/2024 16:50, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>>
>>> The USB MP controller is wired up to the USB-A port on the left side
>>> and to the Surface Connector on the right side. Configure it.
>>>
>>> While at it, remove a stray double \n.
>>>
>>> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>> ---
>>>    .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 59 +++++++++++++++++++++-
>>>    1 file changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>>> index 5419d0b02785..ac2acf949b70 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>>> @@ -572,7 +572,17 @@ &i2c5 {
>>>          status = "okay";
>>>    -    /* Something @4f */
>>> +    ptn3222: redriver@4f {
>>> +        compatible = "nxp,ptn3222";
>>> +        reg = <0x4f>;
>>> +
>>> +        reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
>>> +
>>> +        vdd3v3-supply = <&vreg_l13b>;
>>> +        vdd1v8-supply = <&vreg_l4b>;
>>> +
>>> +        #phy-cells = <0>;
>>
>> It's unrelated to mutiport USB-A, should go in a separate change,
>> and also probably in a bigger change enabling usb-c features using
>> the retimer.
> 
> No, this chip converts between eUSB on the PHY and USB on the port

Oh my bad, indeed, sorry for the confusion

Neil

> 
> Konrad


