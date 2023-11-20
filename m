Return-Path: <linux-arm-msm+bounces-1103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993147F0D3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78951C210F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4EEDDB1;
	Mon, 20 Nov 2023 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBqgxhA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E677E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:12:53 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40859dee28cso15597985e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700467972; x=1701072772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhDE2L7lEf7iSrI5yGHsZcxUh03VSqymUutwpX7Pffk=;
        b=cBqgxhA9sQEAskr3kHAocMz7SBrgnXarU+8VPRLcuMLPXWZxbWixRiANW81GcEitnB
         fnddjIsokQmdPbSkoMUxSIzfjObQpu+6S5S1C820Q4fASVnTPIBCmqJzlfewLwv1kWj+
         qQHDzEQSVPRnfBX6Eo+RVOMzOmFO0zeSslg0UEFie4K6fM+3KvZNBDwiluiRNo5Fenl8
         Re3+WNaoElcIyNSkSZDaSZGTCafBEjcpog2QNP7hESdUhdtemujr4LROENvicLz7XGR4
         pEAFPr7JM2HQMJP8jMQHn3NRQD68EMccfzmxh12pfV9Wz7/V36IjBr3jzxal0KlQ1H5P
         emZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700467972; x=1701072772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JhDE2L7lEf7iSrI5yGHsZcxUh03VSqymUutwpX7Pffk=;
        b=i/pEDWPbp+jSvAURIcB9vjw5kQO/WuPpWpiSJ8WFSsUzy3stqkqvKZJdNRH0KqARHz
         Kp3lGw/Yln0eCmgUYqwwcSb18mnJZ/nS8a/1CBrfPMe97g85FoLlEh2i75UV7QxVJLQ0
         YCmgLvxfbLAcvvAnP2kFGEPnA88wvIf8XgLwW7W+EV6lpq4MX+PZkHbXU6GG+ixyZhIX
         71r7e/poscBOXS3aT7ZDw0znwq/+ihpp2AbUjC1yiCNGtDNMax4vE4wzJym15t9xvr7F
         WixbYw95gWL9Cn4F5AQQlMBd+lhIbivcusJ9l+Pi/MFH6DD9jE0gCILlwZEGFZm46hil
         a+Yg==
X-Gm-Message-State: AOJu0YxfwGcMED81YmZV1kY1scC2+9jVqUMI5jGpwugH0u27U/f7OZaT
	cgIUorNKDDb1jGJbsWaBc9F5Og==
X-Google-Smtp-Source: AGHT+IHrq0UjXRbJljBpwtb0lzEnceeWLnHCRAYZRW1u9snHLGAYKYqf2iuRy7o2NGzzgKNs7DQf4w==
X-Received: by 2002:a05:600c:470a:b0:405:4a78:a892 with SMTP id v10-20020a05600c470a00b004054a78a892mr4497234wmo.9.1700467971857;
        Mon, 20 Nov 2023 00:12:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06? ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b0040841e79715sm12714341wmq.27.2023.11.20.00.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 00:12:51 -0800 (PST)
Message-ID: <46bcf9fe-d896-4a8d-90da-1f86711fd736@linaro.org>
Date: Mon, 20 Nov 2023 09:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: add initial SM8650 dtsi
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231106-topic-sm8650-upstream-dt-v2-0-44d6f9710fa7@linaro.org>
 <20231106-topic-sm8650-upstream-dt-v2-2-44d6f9710fa7@linaro.org>
 <5b1d2eff-d328-4bb2-b255-b5913e1700f5@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <5b1d2eff-d328-4bb2-b255-b5913e1700f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2023 01:21, Konrad Dybcio wrote:
> On 6.11.2023 09:39, Neil Armstrong wrote:
>> Add initial DTSI for the Qualcomm SM8650 platform,
>> only contains nodes which doesn't depend on interconnect.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Just a couple nits
> 
> [...]
> 
>> +		cpu2-bottom-thermal {
>> +			polling-delay-passive = <0>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&tsens0 6>;
>> +
>> +			trips {
>> +				trip-point0 {
>> +					temperature = <90000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip-point1 {
>> +					temperature = <95000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				 cpu-critical {
> indentation
> 
>> +					temperature = <110000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
> [...]
>> +
>> +		nsphmx-0-thermal {
>> +			polling-delay-passive = <10>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&tsens2 8>;
>> +
>> +			trips {
>> +				thermal-engine-config {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				thermal-hal-config {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
> The two above nodes (which are repeated under many tzones) sound made up
> just to be consumed by a bunch of android binaries
> 
> Or at least the second one, maybe "thermal engine" is some hw/fw part?
> 
>> +
>> +				reset-mon-config {
> "reset mon" is not a very enticing name either..
> 
>> +					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
>> +
>> +				junction-config {
> ...which leads me to believe only this one is meaningful
> 
> same goes for all tzones that have a similar mess :/
>> +					temperature = <95000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};

I already did a big cleanep, will clean even further!

Thx,
Neil

> 
> Konrad


