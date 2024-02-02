Return-Path: <linux-arm-msm+bounces-9486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A533C846A14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA0D11C29D71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 08:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D621804E;
	Fri,  2 Feb 2024 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmN4zUCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770617C96
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860998; cv=none; b=YToHuZlRNL71xszzqCbWV2a4oSzSnGySKqzkagamo0typAXfn7eVRfnvJisn5WhJ/J+0uk/2E6LNuNMJ8MmnxQkDHLZLR+rDlNL99Tq3+jXmMmhKy1IuDFAeHuofVgInt8FIR6/fBI5PT4IlUItxFu0IKP33CWRkrcXXAN0yuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860998; c=relaxed/simple;
	bh=u1j/FQG3r7UnfjaAFghDYZBL8vZoKi0GU5L7uMw+bew=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ak9kx/8oPZbyx+eFEVKPTEnMN3vAFBsVcVXKzqCb+mG+7Z3F7EXsDRSVmKVx4MoHALCgJN9gs+uyR6cJ/beBSeMFdS6mJdioYUdG4CiD6HtIP/bCghgTc0p8tAz+02FBCZ8qF1R2oYckH0r1isWJqp9nYRHbIEunHhwPw/m7mBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CmN4zUCg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51121637524so2687818e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706860994; x=1707465794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB4XVOF8NhiViTXxA6Zl1yFXZ6IHetiibAxn6ek+TKk=;
        b=CmN4zUCgK3o7elWFEoi0dxGHXbgJiaoTdANsDTw9xvpfjvEX//RZDrNfEIWR/QblbN
         wOGhvmq+yRsZmWbFRnlQXwdi9IBrjG2nwEjYKT0kIrDeC8A+YDLz3xE6n9rx1URTkhgI
         BJQYnN+Elb4UvSKJUHRwU5bQ6sPVNNNkPl+rycinr3EWPubnDzR4NS241Wzcs2QZ5agE
         ZnfK3mppuWxOtlXs7gqiFJ2V7ILBSJMUzIVMxf1EHIYyrGJt8ABXkikSXlg7IB9wqFEd
         Cu45t3edi5D4EaYdGgsm6r4moF7sg+AGVUAzZI2EzIqz8RsVzYOIpC83CMpDFw6H4teO
         fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860994; x=1707465794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KB4XVOF8NhiViTXxA6Zl1yFXZ6IHetiibAxn6ek+TKk=;
        b=cP22E6VpyfnpmLEBFdD73JZa0xwZ4y9O4haJKhQhJqD0QRmMpmtywz5oF/x9Ugs3p6
         vSbUV0E/BAP6L7oS5Td2SDzSIUfeG6tY7nGQYKQKyFiUzU/KJ+VEt8BKazwmKJBCQIth
         pwczS1np9jqX0PxiLJ1HEcm4zdNDYymtN98pY5AWR3CMj2MpUsNj+77zoUu7SmIyYZXk
         daHuBdUkwXGYa4Ns6kZAXhOSRpqi8qw3slkDjKMdxrM5kdPj9gsBxJPP9FMxja4Pqw0H
         akMAOb64ZIqCjy0W4r5joq3SyZ5t6yfR+2rcSdZX0Gp1Bn9poCAYyeH98DIcJpovOu5f
         u03w==
X-Gm-Message-State: AOJu0YyaZIhVqGOom+5ih9j25Yx2okhbq/bknJqztd3/ynKIF0Kl1qE4
	lfAy0rMy0suzC6CiSnmoTmMJ3Un5rZq93MvMhRlh96MYpsWjPoflBNgkFAz9h98=
X-Google-Smtp-Source: AGHT+IFB6mce1oI/LW8EsnQI5aFAYQIU3ugIJ/la2J1AO+yeZB2NnZvwehyFGNprWrWK9PoqB0i5PQ==
X-Received: by 2002:a05:6512:3c90:b0:511:e7f:3ae8 with SMTP id h16-20020a0565123c9000b005110e7f3ae8mr4373685lfv.48.1706860994134;
        Fri, 02 Feb 2024 00:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX3IJUnmoWf05B7dBJebuIeWUyfOgVD5AP05f1K1Dd2L0TxvxqkwUXGSWOBIdhiPm5wCFeWnrz8TDeggLN2+OHAaY+qlhTDsY/4qR3AGvL0Efim75BItajmUrdHZX4aK7bgi6sVF6RuPREhy9JA7bdeKLyWB4rU+KJdBZDGS/MfvtdKpN35YDvtc36SvcHenFHV6gCFodF8kyg4BiIDCeQSs/KZj6MQKHKBHkNtGBsVRFLwZRo7/W4Kv9bCI1GbG64p2Ldlb2d4NluM
Received: from ?IPV6:2a01:e0a:982:cbb0:560a:f70f:7627:2c48? ([2a01:e0a:982:cbb0:560a:f70f:7627:2c48])
        by smtp.gmail.com with ESMTPSA id w13-20020a05600c474d00b0040ec66021a7sm1870497wmo.1.2024.02.02.00.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 00:03:13 -0800 (PST)
Message-ID: <6f89dd4f-aae5-4221-9a0a-bebbef862229@linaro.org>
Date: Fri, 2 Feb 2024 09:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-topic-sm8650-upstream-pcie-its-v1-1-cb506deeb43e@linaro.org>
 <0cf69024-a3e6-4be2-89ce-017ae521721d@linaro.org>
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
In-Reply-To: <0cf69024-a3e6-4be2-89ce-017ae521721d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2024 20:59, Konrad Dybcio wrote:
> On 25.01.2024 17:55, Neil Armstrong wrote:
>> Both PCIe0 and PCIe1 controllers are capable of signalling the MSIs
>> received from endpoint devices to the CPU using GIC-ITS MSI controller.
>> Add support for it.
>>
>> The GIC-ITS MSI implementation provides an advantage over internal MSI
>> implementation using Locality-specific Peripheral Interrupts (LPI) that
>> would allow MSIs to be targeted for each CPU core.
>>
>> Like SM8450 & SM8550, the IDs are swapped, but works fine on PCIe0 and PCIe1.
>>
>> WiFi PCIe Device on SM8650-QRD using GIC-ITS:
>> 159:          0          0          0          0          0          0          0          0   ITS-MSI   0 Edge      PCIe PME, aerdrv
>> 167:          0          4          0          0          0          0          0          0   ITS-MSI 524288 Edge      bhi
>> 168:          0          0          4          0          0          0          0          0   ITS-MSI 524289 Edge      mhi
>> 169:          0          0          0         34          0          0          0          0   ITS-MSI 524290 Edge      mhi
>> 170:          0          0          0          0          3          0          0          0   ITS-MSI 524291 Edge      ce0
>> 171:          0          0          0          0          0          2          0          0   ITS-MSI 524292 Edge      ce1
>> 172:          0          0          0          0          0          0        806          0   ITS-MSI 524293 Edge      ce2
>> 173:          0          0          0          0          0          0          0         76   ITS-MSI 524294 Edge      ce3
>> 174:          0          0          0          0          0          0          0          0   ITS-MSI 524295 Edge      ce5
>> 175:          0         13          0          0          0          0          0          0   ITS-MSI 524296 Edge      DP_EXT_IRQ
>> 176:          0          0          0          0          0          0          0          0   ITS-MSI 524297 Edge      DP_EXT_IRQ
> 
> Is it by chance that this one never fired?

Yeah I only associated to an SSID and did a simple iperf, not enough to trigger all MSIs

Neil

> 
> (lgtm otherwise)
> 
> Konrad


