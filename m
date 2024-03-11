Return-Path: <linux-arm-msm+bounces-13824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B121E8781A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 281FE1F212DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 14:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063F240BEF;
	Mon, 11 Mar 2024 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWtp2BR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5840BE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710167380; cv=none; b=YTyTpvK2r/4LNsfTWcRWdg3HBmME0hikbCeqNOVlzXztRT6ntOfdru5fJKy2vg/owmTy8Asq/x9O63XsnmrNQYHJD9gfhFN2LhwL0R6Likp9ah7YK8VmLzOlGTDzhLjlzZX24xqXjMUbbfLiKloyETz0ofTu5l2JIy8oZWqHlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710167380; c=relaxed/simple;
	bh=wLsyP2s7dcW/i7s8BacUw0NFCSZWu/IC3xOBjLp8MJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bplaXD1Iaaiffz7j8HMfjxXnuHOfgoyRFoK4vkWW7rp3LYKJl9N/LRlbtYQhwp+ZNR/8WDMW4TE/3+c+So0nl2XUqHf8nfnJLI6CL9ElN+jDgUTyfKmpPwhtY7Cl7bh6OuOEUZK7PIS+VlAHdMzljGVEfnHZhDM7jUWsV9WA2/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWtp2BR5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41329b6286bso5379915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710167377; x=1710772177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzsRMITadDLkW91FrisSwb25Cjz9P5y9WXj5tj/mP6Q=;
        b=CWtp2BR5DN4526CQyd6pA3zNLiD73D/xpKqPuiaf7QC1Bwg9AjS/rx3CSv6irjiEG5
         ICTBsb0sQvUADQs4D0XWYkO9jVpv8wntTefKAvh7p8cQzGtuWBdlCpr2EsPJmc6NGwij
         F0ARMSYd8X2tLx5TjiHn25bMNP70RpNyl5sfQNwBdFr7Z0deauBRT7hoJuhLlrBRbCoY
         +1UF/4fGSzitYEyeIMk2281qDkm62Grilm+M6I2psuhwMdct8QYt9fTxj4E5qDBaC4CU
         5YvqL2pj+a5z7H9D0gaR7jWmEdv3E6+6VQX278gR6CvJNVA8W4vgyg+hb6d3PC6cZQzv
         lCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710167377; x=1710772177;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mzsRMITadDLkW91FrisSwb25Cjz9P5y9WXj5tj/mP6Q=;
        b=eB3pHevYJUq3LSBCYceuayYUa2JvASuBPxV5rC53wHUwGJyxfujhMxg7koU1sPn1Ne
         quBPokskiwD2B1qLZFIsfvjgtL+5h4Zsd/pVWF0QtFkmQ+3NKE9iTixL9+Tf1Fe6RUkm
         gM2FYuuqOZDwTrvHTZ2MvA+wJeeZ/N07vFNiQ1MEg6GFyhWQXZFUF1YW+A5F/GuxKToz
         vOgt1UCjUIoGKVn6ffYrIzKDdiFmQRhNXF4aLG5Wh+4ioDasU8pQ8JjuvAL6ZI0xTN9i
         kBw6TjT9D5PbJkI0b4GBe3L4ywq2CFer5lMU+5z/U88i9zLlFiRjHZS30I//3wc/CDL2
         aj8g==
X-Gm-Message-State: AOJu0YxiDXAuxP+XsIM0BBCi33vEG3f43cW4eYUNceGT7JJ0mo/MdRyw
	fi4y6eQ7/b25lGIDj535jMnImbV5EQNeZFetBq8WCUoUDngGvSSxOsZZJXquqwI=
X-Google-Smtp-Source: AGHT+IH2GSgaLDsOKqTdq8uFhJ5NVLDJe/o2O2nOZFD2lCeDKtU4k0xvoLjGWtnMOjlgyRDjMnjHnQ==
X-Received: by 2002:a05:600c:45cf:b0:413:306f:b8f4 with SMTP id s15-20020a05600c45cf00b00413306fb8f4mr322588wmo.15.1710167377287;
        Mon, 11 Mar 2024 07:29:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402? ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b004130378fb77sm16030998wmo.6.2024.03.11.07.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:29:36 -0700 (PDT)
Message-ID: <0bbdb132-4cf4-4278-b887-28e06fa97b9f@linaro.org>
Date: Mon, 11 Mar 2024 15:29:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
Content-Language: en-US, fr
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org>
 <20240223-topic-sm8650-upstream-hdk-v1-3-ccca645cd901@linaro.org>
 <2aa5d81b-c7fe-14e0-40b8-80ef5ba364cb@linaro.org>
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
In-Reply-To: <2aa5d81b-c7fe-14e0-40b8-80ef5ba364cb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/03/2024 00:32, Vladimir Zapolskiy wrote:
> Hi Neil,
> 
> On 2/23/24 10:52, Neil Armstrong wrote:
>> With the SM8650-HDK, a Display Card kit can be connected to provide
>> a VTDR6130 display with Goodix Berlin Touch controller.
>>
>> In order to route the DSI lanes to the connector for the Display
>> Card kit, a switch must be changed on the board.
>>
>> The HDMI nodes are disabled since the DSI lanes are shared with
>> the DSI to HDMI transceiver.
>>
>> Add support for this card as an overlay and apply it it at
>> build-time to the sm8650-hdk dtb.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> <snip>
> 
>> +    mdp_vsync_active: mdp-vsync-active-state {
>> +        pins = "gpio86";
>> +        function = "mdp_vsync";
>> +        drive-strength = <2>;
>> +        bias-pull-down;
>> +    };
>> +
>> +    mdp_vsync_suspend: mdp-vsync-suspend-state {
>> +        pins = "gpio86";
>> +        function = "mdp_vsync";
>> +        drive-strength = <2>;
>> +        bias-pull-down;
>> +    };
> 
> If you have a single pin configuration for active and suspend states,
> then likely you may have only one device tree node here.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> I don't add my Tested-by tag, since I don't get a panel working on 6.8.0-rc6,
> while in runtime MSM and DSI are enabled, the panel driver is not initialized:
> 
>    panel-visionox-vtdr6130 ae94000.dsi.0: Failed to initialize panel: -22

This is unrelated to to the HDK, it requires this:
https://lore.kernel.org/all/20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com/
that has been applied fr next release.

Thanks,

Neil

> 
> -- 
> Best wishes,
> Vladimir


