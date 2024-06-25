Return-Path: <linux-arm-msm+bounces-24087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE19160F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 10:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC31AB20DF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 08:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66AA1482E8;
	Tue, 25 Jun 2024 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWr0MtSV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB3145FFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303706; cv=none; b=E8ofmjaF6xJJhh8zpbuHWU5vLqDKWzFLdn5rfJSoopHKk4dBpjRVALcErdLX2asXo4iOEvR4lbHVRNx8eAPiSTq20PyUDB7azlvuKgzttuav1yOAEy5ayylSaiLPksBqu4fULA9uRElLdk4L/jH3nxtLC/C1hGdI5Y66ZK9qu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303706; c=relaxed/simple;
	bh=8fdYpifoH7MISmyJ1LeOkrXFX+w2ss/RM+drVhexxPI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JkI4S93ubp6Jj2OWJGAx6MQoyXO/O+XTbKJ7VhvCfzzRCmVQYX9VLGmcK7yOw6XXZb0NbSlLYHyHh82RtVVo0Uz5ciLMa7e0Lx73LU3DSsTFZB/nCAhr9bv+pdvw2mXx3Ev64trpbLX9DjsdAFwf3LzJ0RFeYqnlKY5LiRcIZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWr0MtSV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so3002467f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719303703; x=1719908503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHljokV6js5u7kZiekWYaDWZmX+eJYHcK+byzC6TyyQ=;
        b=jWr0MtSVq9T2z1gdE5G6uuXZNdl2i9r97sGPGnv8RT4Mba0jO6mABhNJkLu+pAzlqA
         zWOylOtFEO6T6/JNRQgrocgu9aBXFtKbptMXynkKXyNxG0dpmpb+C2qVCESAFFET0r9U
         e+E5ucN6zZlJeWthUls2d/b52de4gcGK+YJ+TIax6ul/7VZx/mnw250NfuoC94osnKQA
         zrYSMLjXALAEYQR1yqahZVTA3Ei9v/p4PwH4zdQP43Zx1/HDcD28yEUPfguc7xyVwEkg
         CSBMe2EQxmEmkfZmPB2L1Gmhtf1DJKScyIaxrW9k92Dqe2s/orRi+gXBCpt2S/9Q5JCJ
         ss4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303703; x=1719908503;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rHljokV6js5u7kZiekWYaDWZmX+eJYHcK+byzC6TyyQ=;
        b=sGIJVEQnbnNruAQsta2j1LGQanImJDeZrc9CX3frntXIPeU9phfDq/GFdWPwMd03WD
         RkoQWvifMapm5pVECkdFAdGzfMRb06m584KLgnj61TJNIVHDEIdGsP8SS33MOs3DPLcf
         0ybSKSfOW9Yzf/BTNhjEovrzkRuDfxWEWNoY4yUQ3Hdhl8La+8tl7A7tRTzLrAPghr3Q
         OJl49HZA6nLbWZ0ZEyuDozm/AvqB8WS0kMy9xxh8HZxvMmk0C4z3sXAiPW2d7h81AxTX
         HS5EYJL3I3N+hIxqVAqEhBYnK/VOe8aBR43E6TsxgsihqQMR5TvAIQho9YCpovHfUDL0
         EChQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJaITvjbqFCBoHOqnY3fJxS92BhEawepJIic01XyIvuK7ECbJjcnAwGAFFq8OcE9YRhpLzKJ3hapTGkabtIkrbgCuMP1emXQwk1dBsjA==
X-Gm-Message-State: AOJu0YwomY9FEIZpycHH5g/TUwLupkm/JHi+a0E0OhWhOn40/wOnNNaY
	PswroJ3E8c2Fm5Uvw7F9FwlKIKapmfuQySXu7ACvFMQsCqpISm0NG9gvNUBATi4=
X-Google-Smtp-Source: AGHT+IH/IVsvOtTsHG/wAzpccT88ZSlDiIbt48tZxOGREXwFbgKTe3K62Q4bjjbzEFPZSzNeUwO/wQ==
X-Received: by 2002:adf:f806:0:b0:362:56c2:adb4 with SMTP id ffacd0b85a97d-366e3294403mr6175737f8f.18.1719303702915;
        Tue, 25 Jun 2024 01:21:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a? ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910f91sm161628415e9.38.2024.06.25.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 01:21:42 -0700 (PDT)
Message-ID: <2d5b8ca1-419a-408d-ad94-019c36de0045@linaro.org>
Date: Tue, 25 Jun 2024 10:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
To: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Gaurav Kashyap <gaurkash@qti.qualcomm.com>
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 kernel <kernel@quicinc.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
 "Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>,
 "bartosz.golaszewski" <bartosz.golaszewski@linaro.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Prasad Sodagudi <psodagud@quicinc.com>, Sonal Gupta <sonalg@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
 <20240621160144.GB2081@sol.localdomain>
 <efc0d71d27854a3bbe008fffc666d638@quicinc.com>
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
In-Reply-To: <efc0d71d27854a3bbe008fffc666d638@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 06:58, Gaurav Kashyap (QUIC) wrote:
> 
> Hey Eric
> 
> On 06/21/2024, 9:02 AM PDT, Eric Biggers wrote:
>> On Fri, Jun 21, 2024 at 03:35:40PM +0000, Gaurav Kashyap wrote:
>>> Hello Eric
>>>
>>> On 06/20/2024, 9:48 PM PDT, Eric Biggers wrote:
>>>> On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>
>>>>>>>>> Is it possible to use both kind of keys when working on
>>>>>>>>> standard
>>>> mode?
>>>>>>>>> If not, it should be the user who selects what type of
>>>>>>>>> keys to be
>>>> used.
>>>>>>>>> Enforcing this via DT is not a way to go.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Unfortunately, that support is not there yet. When you say
>>>>>>>> user, do you mean to have it as a filesystem mount option?
>>>>>>>
>>>>>>> During cryptsetup time. When running e.g. cryptsetup I, as a
>>>>>>> user, would like to be able to use either a hardware-wrapped
>>>>>>> key or a
>>>> standard key.
>>>>>>>
>>>>>>
>>>>>> What we are looking for with these patches is for
>>>>>> per-file/folder
>>>> encryption using fscrypt policies.
>>>>>> Cryptsetup to my understanding supports only full-disk , and
>>>>>> does not support FBE (File-Based)
>>>>>
>>>>> I must admit, I mostly used dm-crypt beforehand, so I had to look
>>>>> at fscrypt now. Some of my previous comments might not be fully
>>>>> applicable.
>>>>>
>>>>>> Hence the idea here is that we mount an unencrypted device (with
>>>>>> the inlinecrypt option that indicates inline encryption is
>>>>>> supported) And
>>>> specify policies (links to keys) for different folders.
>>>>>>
>>>>>>>> The way the UFS/EMMC crypto layer is designed currently is
>>>>>>>> that, this information is needed when the modules are loaded.
>>>>>>>>
>>>>>>>> https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@
>>>>>>>> kern el.org /#Z31drivers:ufs:core:ufshcd-crypto.c
>>>>>>>
>>>>>>> I see that the driver lists capabilities here. E.g. that it
>>>>>>> supports HW-wrapped keys. But the line doesn't specify that
>>>>>>> standard
>>>> keys are not supported.
>>>>>>>
>>>>>>
>>>>>> Those are capabilities that are read from the storage controller.
>>>>>> However, wrapped keys Are not a standard in the ICE JEDEC
>>>>>> specification, and in most cases, is a value add coming from the SoC.
>>>>>>
>>>>>> QCOM SOC and firmware currently does not support both kinds of
>>>>>> keys in
>>>> the HWKM mode.
>>>>>> That is something we are internally working on, but not available yet.
>>>>>
>>>>> I'd say this is a significant obstacle, at least from my point of
>>>>> view. I understand that the default might be to use hw-wrapped
>>>>> keys, but it should be possible for the user to select non-HW keys
>>>>> if the ability to recover the data is considered to be important.
>>>>> Note, I'm really pointing to the user here, not to the system
>>>>> integrator. So using DT property or specifying kernel arguments to
>>>>> switch between these modes is not really an option.
>>>>>
>>>>> But I'd really love to hear some feedback from linux-security
>>>>> and/or linux-fscrypt here.
>>>>>
>>>>> In my humble opinion the user should be able to specify that the
>>>>> key is wrapped using the hardware KMK. Then if the hardware has
>>>>> already started using the other kind of keys, it should be able to
>>>>> respond with -EINVAL / whatever else. Then the user can evict
>>>>> previously programmed key and program a desired one.
>>>>>
>>>>>>> Also, I'd have expected that hw-wrapped keys are handled using
>>>>>>> trusted keys mechanism (see security/keys/trusted-keys/).
>>>>>>> Could you please point out why that's not the case?
>>>>>>>
>>>>>>
>>>>>> I will evaluate this.
>>>>>> But my initial response is that we currently cannot communicate
>>>>>> to our TPM directly from HLOS, but goes through QTEE, and I
>>>>>> don't think our qtee currently interfaces with the open source
>>>>>> tee driver. The
>>>> interface is through QCOM SCM driver.
>>>>>
>>>>> Note, this is just an API interface, see how it is implemented for
>>>>> the CAAM hardware.
>>>>>
>>>>
>>>> The problem is that this patchset was sent out without the patches
>>>> that add the block and filesystem-level framework for
>>>> hardware-wrapped inline encryption keys, which it depends on.  So
>>>> it's lacking context.  The proposed framework can be found at
>>>> https://lore.kernel.org/linux-
>>>> block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
>>>>
>>>
>>> I have only been adding the fscryp patch link as part of the cover letter - as
>> a dependency.
>>> https://lore.kernel.org/all/20240617005825.1443206-1-quic_gaurkash@qui
>>> cinc.com/ If you would like me to include it in the patch series
>>> itself, I can do that as well.
>>>
>>
>> I think including all prerequisite patches would be helpful for reviewers.
> 
> Noted. I'll do that for the next patch.
> 
>>
>> Thanks for continuing to work on this!
>>
>> I still need to get ahold of a sm8650 based device and test this out.  Is the
>> SM8650 HDK the only option, or is there a sm8650 based phone with
>> upstream support yet?

Yes you should be able to buy the SM8650 HDK from lantronix:
https://www.lantronix.com/products/snapdragon-8-gen-3-mobile-hardware-development-kit/

It should be supported in v6.11

Neil

> 
> There are some devices released with SM8650 (Snapdragon 8 Gen 3). Sorry, I have
> not kept track of which. I know the S24s were released with that. But there should be
> more in the market.
> 
>>
>> - Eric


