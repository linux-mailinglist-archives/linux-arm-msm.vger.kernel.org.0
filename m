Return-Path: <linux-arm-msm+bounces-35665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BBA9ADECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25E631F2388F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB61B218F;
	Thu, 24 Oct 2024 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Axtoj8Yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176491AB6CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757694; cv=none; b=FGm5e5iy0f57Ki/TCsao2wtzUw/MY4i75EgslX1YA7BMFM9hvOcesIk9gqKXlxXKY8vbKN5DPWF/mNDTMpPULdt9ZZtgq0XPw90PHWKRRDMXGnBRVO4eRQ3ubCVH+91/nO9lmlUiYg26cCdjVAB5LXxzm6UPQ93cNaTcQ+ZL1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757694; c=relaxed/simple;
	bh=lJltGDlNoIj7PRD57EZBWRK+uCtdjxhygbrM/Rjrr0s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GoHHtUjmSodwPn4dTqQjsOgF0JudnlMVeuMWQBhlGbKtZsPmZvpBbJHyI3HlVRVO7wL1zFeYNrtR4HlxzmHNp3HA6pS8aRyGoAPUOO+e0JzEKUO5fcuTj5HDCCPJwOS09rfYqhez95ZP66mLz6mMtHeo8rXzj5AYi/BLkGlFoDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Axtoj8Yy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43159c9f617so6069355e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729757690; x=1730362490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccPoXNx98DT2qy/9DNLY10I68wfGewmWvOOPtjIiyLo=;
        b=Axtoj8YyHCgHwPqz+K4lVH5/AI+YBqR4F8xhXvD9HdBJ9irpkEyXCvv97FaMtx2M90
         PCJ/LnLECF8cwKRk6uw6qQ5cpS8iVKIJRM1PYjadOJayF8J4n78Q3dHjowBW7Czvt6Qp
         Puht7zKV6Xr/gTAOgF/dATCj0dkuXz7kPDcQ4Bxb92WDpTHqFLbBv9FrZLV+OiILcjZo
         ITJ1nyNch18A/NKM6F65BGQO8SfKDkcZmwlF5EiUrHuSA6hxXIEzcjfLhv2p1xgEQcR4
         /neKxuL5ycGXC9Eh7qpU92PmPftoZnGBDtwqxoEFpjpi5WwrAJ3J0Lsd7cywie1bsZE5
         dfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757690; x=1730362490;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ccPoXNx98DT2qy/9DNLY10I68wfGewmWvOOPtjIiyLo=;
        b=STF2bSNhxmO8OVpqjhKkgEAp7OZ7FyMUtkRIomoWePp9Sr88aLfa/SFNEDsdZferYp
         hNyL6yGnouOUBdWjw6mZd3G7C6NALT549ETH6yXnqjo0LhSpn16maCmLn5VsgqYbHx6D
         I1n9d36qmyNlrNPIH5EX/6IW7oZRshTsfTBMfy+57GbrM5DEuqWcylvg03TtXpl9xBun
         77fRJpX5IsCoXhuOPMCDjsD9PwkOatKheO6/gyDJDJ/cZGQy9TvDS8XfwlvC5zK9uOHp
         WiRzr8JXIiehH8dSPic5zHaPcU/4lUQW58NZR5207b3YseecoBIAlmdnXyOGqjHOh52N
         /Jlw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8BouAPbOCbUbDKidcGZyIiiepvnfJQvj8aPEPxevRKSPvxS79N03yQ5M3S4p6QEukr3fr0H2IU/DEV5X@vger.kernel.org
X-Gm-Message-State: AOJu0YyE37VNpQSdrlwoZWTy1GQLwIMPp71qXB3/ni6CCKt3oJ207s7V
	srqN37J5A/ABUcVAf0aXP6Lwo/lbacZWoCJZqlfY3zI1sLoEinsUDkqD5LYV/PE=
X-Google-Smtp-Source: AGHT+IGwc+CsBuzyUeWwqgLNAC36h6mZY0W50CPNMxAcYFKjjDsEytFfdHHjXSXbazkn2g9xInmyoA==
X-Received: by 2002:a05:6000:dd1:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-3803ac848b0mr909376f8f.5.1729757690447;
        Thu, 24 Oct 2024 01:14:50 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:137f:ece6:fb3d:24cb:df87:1352? ([2a0d:e487:137f:ece6:fb3d:24cb:df87:1352])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37935sm10743978f8f.17.2024.10.24.01.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 01:14:50 -0700 (PDT)
Message-ID: <f512138b-f9ac-4554-9b45-567079ac9605@linaro.org>
Date: Thu, 24 Oct 2024 10:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org,
 srinivas.kandagatla@linaro.org
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
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
In-Reply-To: <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/10/2024 13:05, Sibi Sankar wrote:
> 
> 
> On 9/11/24 13:03, Sibi Sankar wrote:
>> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
>> is the speed binned variant of X1E80100 that supports turbo boost up to
>> 4.3 Ghz. The initial support includes the following:
>>
>> -DSPs
>> -Ethernet (RTL8125BG) over the pcie 5 instance.
>> -NVme
>> -Wifi
>> -USB-C ports
>>
> 
> Hi All,
> 
> With the X1E Devkit cancelled and with no firmware updates promised for
> it perpetually, please chime in and let me know if you still want to get
> this series and rest (external-dp, usb-A ports, sd card slot and 3.5 mm
> Jack) merged and have it supported upstream for the folks who already
> received it!

As there's some people owning this kit in the wild, yes please make sure the
current patchset goes into mainline and I assume the community will add the
missing bits in the future.

Thanks,
Neil

> 
> -Sibi
> 
>> Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago
>>
>> Sibi Sankar (2):
>>    dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>>    arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
>>
>>   .../devicetree/bindings/arm/qcom.yaml         |   6 +
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 813 ++++++++++++++++++
>>   3 files changed, 820 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>>
> 


