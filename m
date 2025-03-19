Return-Path: <linux-arm-msm+bounces-51910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C9A68795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C50119C1634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162112528E2;
	Wed, 19 Mar 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9TdMLtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4052517BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375530; cv=none; b=d3h+vDi1uZAtkFXHC9uk3CqM81ejIevw9O1AbZWyCyKE4a0fOSHX/u5/GhvvCFJUoQtxCqktojbhFBWEAUwYtksmLjJzZJ0vPrGQ5I+UCbDxlwCe8EEX8kndCsy3Bk7KUmjs62Eulxc4Vrl1Y48uXzjcQTJPNDEmzuSVBZ5qrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375530; c=relaxed/simple;
	bh=AP6lor4HBvWILUQHIFbpycoHbOC/nPC6b3gWzsNVwC8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tnfJ2xGZQfty0c78Hz1NRYXoz+8hR6mcG1fwwxAQRe7GRFrjCZ89abDPxjprEGMCvcyx18gojbFNG+zvwWUdDc3uuCFce/THgVQHNg8PnOU+kV+LJXZI1foR24FzsQ2xScsZdHHso4zbqPGREPz/2S2xtQnbAvbZTDnu02+O+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9TdMLtq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5397530f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375526; x=1742980326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3wO0Es1m7WaTtYldTEIuT1McNAULewL4XYhxOb/1wY=;
        b=y9TdMLtqu5S+nbaGbFOv0ELUzLDs7RQUKYvzC6yst5EKHqiXHY3JwrkbXJfptHie5Q
         9dhjlZu0nkDwqzugmaxx2VEVufvB+ZH5Gx9hLScra4WR/HB/qDJpBfI5nWIb07r1byBq
         aQZ1wpvql/PZIvhgkr8y+QrrKTnh9JOpsxl/A2lWZ6VvGqJlBrPgv5TwxjndGR7jmbup
         QVrys9N+VgDKVMHDtQ6ixxCIGQKSQ90Y7OhQTy8M0IjFcfy5HX2oW03Majbce+VZHEer
         QG0P/pMcgo8bkicxfJq61lUaxr5I7uN1vn2vEbXharI+c4e42KtYxUX33/4oHcVlLRuv
         b0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375526; x=1742980326;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+3wO0Es1m7WaTtYldTEIuT1McNAULewL4XYhxOb/1wY=;
        b=qkwcN67q2U8oI7W9aE1FJyeueiur3EByRrAyRAO4jsR2vh67PZklgooDIKuKqvP31f
         3oeliMEwzuCHDeuw9iAh45+qU9zWdCZBE+by7qMAR7eDwwfKjrojyA92/Gz2cC1OhCAo
         bvAbmmlfL+KFFqe5JCg+bLkcG17ddekHluBJlzfTyioYLqNUpmbAhPxZbcZ1eeYD+fEt
         LovtpUOC7YlDDieT8Mhv7OOdV98FeItojX6bQcLSj+UgnDuq8/rUf3AZiePO2VI7+Wkx
         5KdnrqgRQdesHsnGJtUwaCq6ZXg3RmJezK0ORbyWW4N44yErqiQl2lH/5YMt/q26lbwY
         8T4A==
X-Forwarded-Encrypted: i=1; AJvYcCXzldTHQ6DARxUH5uN4ACCFyLCXySQRpJHEsYQ0mje60e4Gt03EWmGaKEtPpX6rsJHKRWh1kQDBnbb2/NtO@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbLIPg14Zlq3m0mIhysNWkKBGY3tRxK36cm57cdhQ/L2fsOE0
	NpalIsrmr0ljngNLtlnFhOLmkx51CYNRrICjivy4pY1AvMiB3b0mnzBknFsAXd8=
X-Gm-Gg: ASbGnctomz3KlKWp8N4q1rEt8MtqrnPaI+tion8WhH/3oRNQJzVTX4aOOVVCIPxOpTW
	V8YGUpAQM5C1zWfoBXXn66JMgWOhvAhZLfGnzzhtXdlABb9825J18pOxpub6/OrCU4oUPMrjS2X
	xYI8uk469U5jyJfILnauRwNoHNr5KJM+cNwIFBRoDfti3cEwh+SozhmfetKqAOBPCrFr5oxeJRB
	0+PK4agY5Ie1cxiqDpANW0poPFYWB1vivwHd8wyJc2hUJcqEpui9dkJUIZKb04HK97E+wugMqAw
	bjyJX7RVrKxBNCQHvptXq25HFJm3uI1uDYUnurgRmXV3pLiUoqQ0SxGftcjliBT3UULWTszYIUN
	MamCO+bOI1QCHAWcolRk8+g==
X-Google-Smtp-Source: AGHT+IHRqvrvyZIXOKuWDiE2L3Da8ittau1UvypiK1oVlIjMXp4re/twA8F0bWNH4I1IMwAp3EV8vQ==
X-Received: by 2002:a05:6000:400c:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39973b28597mr2187719f8f.53.1742375526010;
        Wed, 19 Mar 2025 02:12:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f407:ab81:b45a:93e8? ([2a01:e0a:3d9:2080:f407:ab81:b45a:93e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a8bsm20852881f8f.66.2025.03.19.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 02:12:05 -0700 (PDT)
Message-ID: <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
Date: Wed, 19 Mar 2025 10:12:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
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
In-Reply-To: <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
>> On 18/03/2025 17:35, Jeff Johnson wrote:
>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
>>>> the line:
>>>>     ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>>> was incorrectly updated to:
>>>>     ab->single_chip_mlo_supp = false;
>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
>>>>
>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
>>>> crashes on driver initialization with:
>>>>   ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>>>>   ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>>   ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
>>>>   ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
>>>>   ath12k_pci 0000:01:00.0: failed to start core: -110
>>>>   failed to send QMI message
>>>>   ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>>   ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off
>>>>
>>>> With ab->single_chip_mlo_supp set to True, firmware loads nominally.
>>>>
>>>> Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Bisect log for reference:
>>>> The bisect leaded to:
>>>> git bisect start 'v6.14-rc4' 'v6.12'
>>>> git bisect good 5757b31666277e2b177b406e48878dc48d587a46
>>>> git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
>>>> git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
>>>> git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
>>>> git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
>>>> git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
>>>> git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
>>>> git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
>>>> git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
>>>> git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
>>>> git bisect good 8c2143702d0719a0357600bca0236900781ffc78
>>>> git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
>>>> git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
>>>> git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
>>>> ---
>>>>   drivers/net/wireless/ath/ath12k/core.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>>>> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/core.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>>>> @@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>>>>       ab->dev = dev;
>>>>       ab->hif.bus = bus;
>>>>       ab->qmi.num_radios = U8_MAX;
>>>> -    ab->single_chip_mlo_supp = false;
>>>> +    ab->single_chip_mlo_supp = true;
>>>>       /* Device index used to identify the devices in a group.
>>>>        *
>>>>
>>>> ---
>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>
>>>> Best regards,
>>>
>>> NAK since this will break QCN
>>> There is a series under internal review to address MLO issues for WCN chipsets
>>
>> ???
>>
>> The original commit is wrong, this fixes the conversion, nothing else.
> 
> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
> Setting the mlo capability flag without having required driver changes
> for WCN chipset will likely result in firmware crash. So the recommendation
> is to enable MLO (in WCN) only when all the necessary driver changes
> (in development, public posting in near future) are in place.

Right, I understand clearly, _but_ before 46d16f7e1d14 the firmware
was _not_ crashing, and 46d16f7e1d14 causes a regression because
single_chip_mlo_supp was set to false instead of true.

So if you read the commit message, it clearly explains the regression,
and the reason of the patch.

This has nothing to do with enabling MLO, it fixes a regression
on mainline for current users.

#regzbot introduced: 46d16f7e1d14

Neil

> 
> Vasanth


