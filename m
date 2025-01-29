Return-Path: <linux-arm-msm+bounces-46513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A743A21EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBECB161AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516C02114;
	Wed, 29 Jan 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrAY/R+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420313BAE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160392; cv=none; b=Q0CY0gMgRoMBFtX21wO9wTekQaTToXGIkztwHQf/YofoAJKhSAkVHJ3xRit65CfF9c9wGBi/AMmaDFzbGZ318GYPgZnUPHtfsX6ToSvs1d5N+B3vNVNzCd+vcUmMKn+mANGAxFVwK5fNQu1VJfH65kZ+/L3x4XjHSd3friQEHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160392; c=relaxed/simple;
	bh=GbMQsn6f1MC9o8VysCSV6IsYO9q1ZfEqJn64kT3F9JY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mWFL0vLR/vK6QLAJ1tfflQUd1BMb5OGbDjXCcaF3eIlp37FjQfH59FWq32zYlhWLyzIGNGyhEOdR3dOQXdtNAVR0LF1w2AsCYstNu4CIKmpOYUvZu9gICB56iW2JyjwYkqodpipHw/BqUQU1wMWr1f/IE7N5v02WLsmM/HPn5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrAY/R+Y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so3672163f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738160388; x=1738765188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNkXY/Z9afVp7P31w960TY/rx2CirLfuJn7N45XT28A=;
        b=VrAY/R+Yg0vwGBlxOTjclJ/uwqgxaOU3hI0EgjoBMHs6eKpjrEHic353mglxL/4nkm
         JJk+05Rje2djUkuKS9F3wTfD4Z64R5EpSrl7o78dNwrZuKCCY8213wtgKCfLckJ8dkEH
         KI86ngTyVUG1rIaQ8Q/DQnYBpWH8d7LE1QfEhtAVHD9h8rIVRLuOay9ODyYWS/zto/a6
         XiCG9WyLPw49z1nOdp6CSX3Xur0BdMCK4sVHaoIq4WmprbghhGrZLzPaMWrdkLwJd+Ub
         vVPa3vC/tcm6CL5c3Edga3FkW4IGoSd90Jzv61nEFAyXuE45D0BVZYkT7zGXBwDc0b82
         9Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160388; x=1738765188;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VNkXY/Z9afVp7P31w960TY/rx2CirLfuJn7N45XT28A=;
        b=f1kEFKYp3vpYqzqRJLUxLoMX8xxxkTOBwEA/uaSVxSLHU+weftaOv8iZ5qB8nbiqxD
         2K0m9gogJU8Si+eBKIbRbLzDR1kLHdT1DUk4cGuguVmW4uHUrUMyFsqZqcBDKQofpvbg
         bp72hXxrbHzQzE/3+PKDRwaeaLWn68kfqc6sDCgwSEJtWFmgWQI/8nh9ZeKQUOgJ4QPa
         D0jXAc2OEl0A9TYLz3w/xu9fcYAGoBHg7uap5zc6CfHxTz91X9awhIeo8I5nQIaVBsOf
         YJpvCsbg+QbvtXlV1P7Kox5lEX99Q36/DPDwomzO0v1C5awfyQVtITUjCJ/aApwZp2tI
         3zDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3xopBwyWOXHtxCqFjm7hVIxQl3wPMyVB9tq04BbwAWwC9sWnWGU/guEMtSPVC8GQczm9I4FMvV69PQX/v@vger.kernel.org
X-Gm-Message-State: AOJu0YzV8pkP8sRZOyx7rE7E0U9GKaH6+9OuLHlC7uxoxoVlnBO+m21N
	HpaVHXU1oiuCI7VQCHQCW1cKA/HzNSCONwjCqR0+R36YJlTBuVfmPCExFMsmLIA=
X-Gm-Gg: ASbGncsG44K7vXWDuJZpt+bBTJnZhRL7kajwfIsk+3x+5FQw46OHSllkG+LGrAMGY8C
	Vv3Zcwnq90y4uOzUc74oQEgg+lF8kBZW9fzXSbApEFuf7O+hjcZsIgqZjOQVtRBPJKB369gdaH7
	soJ/pD/Vwt02e2SgRx47G53gOAPoVq024nJLqPc1GHwR2UhJkO1EtHUSXVlM3sD7uaN3Fkt6Bes
	V+RIEL2Vp6RWtQxv+XpbWQiAp2EedhWm3XEnNr+i205PV43zxJOD5FakGTLUYCyA7eIKsSPStXL
	V989WQ3uV3mvTqrk5Q4Wp/Ld6PyKNd3zDEz+SrkI1dxiZ/T3a/0A8vZxr9LxXuoSDlrj
X-Google-Smtp-Source: AGHT+IFT4IjQXt/DQ9q9I2HHCXNkkUwuSMn9d1HV3Tr7TQI1A0DqK2XOk+03beC7sPfdknUnenKicA==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id ffacd0b85a97d-38c51952173mr2830648f8f.20.1738160388344;
        Wed, 29 Jan 2025 06:19:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1ca723sm17085908f8f.101.2025.01.29.06.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:19:47 -0800 (PST)
Message-ID: <d36b497e-4717-4c25-8090-a20efd09f782@linaro.org>
Date: Wed, 29 Jan 2025 15:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
 <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
 <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
 <d928e662-07ac-4255-8d6f-adeaefb3db46@oss.qualcomm.com>
 <9d489930-9d2d-4b71-9b21-9c7918257b7c@linaro.org>
 <aaf02ae5-4ae8-4571-934f-2c95de9d7e4f@oss.qualcomm.com>
Content-Language: en-US
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
In-Reply-To: <aaf02ae5-4ae8-4571-934f-2c95de9d7e4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 14:55, Konrad Dybcio wrote:
> On 29.01.2025 2:41 PM, neil.armstrong@linaro.org wrote:
>> On 29/01/2025 12:29, Konrad Dybcio wrote:
>>> On 29.01.2025 9:29 AM, neil.armstrong@linaro.org wrote:
>>>> On 25/01/2025 14:10, Konrad Dybcio wrote:
>>>>> On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
>>>>>> + Mayank (with whom I discussed this topic internally)
>>>>>>
>>>>>> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>>>>>>
>>>>>>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>>>>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>>>>
>>>>>>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>>>>>>> be reset but PHY registers will be retained,
>>>>>>>>>> I'm sorry, I can't parse this.
>>>>>>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>>>>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>>>>>>> are programed. After Linux boot up, the registers will not be reset but
>>>>>>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>>>>>>> skip phy setting.
>>>>>>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>>>>>>> similar text to the commit message.
>>>>>>>>
>>>>>>>>>>> which means PHY setting can
>>>>>>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>>>>>>> no_csr is toggled after that.
>>>>>>>>>>>
>>>>>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>>>>>>> established with no_csr reset only.
>>>>>>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>>>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>>>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>>>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>>>>>>> programming tables, the kernel will get them earlier than the
>>>>>>>>>> bootloader.
>>>>>
>>>>> We're assuming that if a product has shipped, the sequences used to power up
>>>>> the PHY in the bootloader (e.g. for NVMe) are already good.
>>>>>
>>>>> If some tragedy happens and an erratum is needed, we can always introduce a
>>>>> small override with the existing driver infrastructure (i.e. adding a new
>>>>> entry with a couple registers worth of programming sequence, leaving the other
>>>>> values in tact)
>>>>
>>>> Assuming Linux will be always ran directly after the bootloader is a wild assumption.
>>>
>>> Situations like
>>>
>>> [normal boot chain] -> [... (resets the PHY and doesn't reprogram it)] -> Linux
>>>
>>> are both so unlikely and so intentional-by-the-user that it doesn't seem
>>> worth considering really.
>>
>> In embedded/mobile/edge world, definitely, in compute/PC-like market, not really.
>>
>> You'll have people add some custom bootloaders, hypervisors, who knows what...
> 
> I see, however you actually have to intentionally assert the non-NO_CSR PHY
> reset from said custom bootloaders, hypervisors and whoknowswhats for the
> programmed sequence to be erased. So I have no idea what the issue is here.

I won't argue further, but you know as I do that relying on the bootloader state
is a dangerous game, and we already rely a lot for dsp stuff and we have
a lot lot of issue related to the UEFI implementation already on production
devices.

I'm not against the nocsr stuff, which can be a big win for boot time, but
honestly not adding a few registers in table seems risky enough, and we should
probably delay this experiment until we are sure the nocsr stuff works fine.

Neil

> 
> Konrad
> 
>>
>>>
>>> If whatever sits in the middle *must* hard-reset the phy, it can save the
>>> register state beforehand and restore them after the reset
>>>
>>>> Yes, we should make use the noscr if the PHY is always programmed, but we should be
>>>> always able to reprogram the PHY entirely to recover a faulty programmation.
>>>
>>> We aren't considering any possibility of faulty programming - it's either
>>> programmed, or not. And if the values configured by the bootloader are wrong,
>>> the device's firmware is considered faulty.
>>>
>>> Most devices probably follow the exact same magic values as our reference
>>> boards (though these values relate to analog characteristics, so perhaps not
>>> *all* of them, which is another argument for keeping the BL state) and these
>>> are extensively tested internally before any production devices make it out
>>> the door. Any updates deep into the product life are most likely just "nice
>>> to have"s and not anything critical, and as I've mentioned, we can still have
>>> overrides with the current logic inside this driver.
>>>
>>> Konrad
>>


