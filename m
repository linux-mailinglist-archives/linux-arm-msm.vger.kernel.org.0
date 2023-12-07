Return-Path: <linux-arm-msm+bounces-3773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE88091DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B981C208AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 19:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C934F8A1;
	Thu,  7 Dec 2023 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qq/jp4K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D1D10F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 11:48:40 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50be58a751cso1353674e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701978519; x=1702583319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhvAcona8JE9mqSkyUEEifprTp821EbSPpKf2QS4sas=;
        b=qq/jp4K7FJfea1xWaARo38MG9sUZU/uAAm8AKrkjxkXf93WIsiI0oFhQ2Qi/ucpS6q
         teo8qy4x7OL51Do099gKlFMHh1IL322kVU0xeZ/b4wwSnzmeouQd93fDox0cOpOOKUoT
         3ykavSn/rftmjsBhF9xI6krR1X0Fdoo+7gUh5ZOSfomAoqA7i1gu3UDsI7jHDb7yHPZU
         q3kqs/xMK/h5iqHE1s9a3urF79fjj8FdpVRqtg2sHO9Bl+KvYRznvIxKSkbYORWPRkEk
         Xtih3wIB2NggOwTQ5lsOjCbJCmFQxRIViawuGu+G4m7WAvVwwiXcW3mL5W5jRfGLxppH
         OSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701978519; x=1702583319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhvAcona8JE9mqSkyUEEifprTp821EbSPpKf2QS4sas=;
        b=TKrYFJFKD2E5Y8NtHtHaWGRGsqjKU5e7mzPcMfsYDkY7NQ4Y2Nxve6OD07LrbNzImx
         dQkfnjmwq9b9sT48whguacg+qj3jKjNr/xQTQydv9Hs3LL6yxMTVxeyVNrZnWqmTaGX7
         DpRvykBeaocsHrMB2vSGOHHZzMjreKhfOUdVFSY9VyEh27JC+wRtvbSC19YeQipXQQlc
         wp+GUr6ONPsrUQall1IJRmAnTfvbqJwk2FZQJvNzWJesL04RvEFiE0hqzoci+GIML5mm
         aMk4blky539gQ1gZ9WceCQdCK6+3JiJ5RdQ2dBIDpeMNS2dd4Fb7CKIHdk17qU2sJU0c
         MDlA==
X-Gm-Message-State: AOJu0Yx3NH/fdQffgEvgS9ApYS0sPjiP+jR3+Ion2j+aHQOiA1MTJhhR
	erzh2F7PCDR10YhHoagLKxwrSQ==
X-Google-Smtp-Source: AGHT+IFljctdvuyZS7CVZkeukvmHRNSLUGo+jsvHFsItAp5VfL6Nc6kSd4dOhvsJ3yfP3i4ct2webg==
X-Received: by 2002:a05:6512:4cf:b0:50b:ee7f:a0be with SMTP id w15-20020a05651204cf00b0050bee7fa0bemr1615515lfq.5.1701978519021;
        Thu, 07 Dec 2023 11:48:39 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i38-20020a0565123e2600b0050bf789f501sm29324lfv.11.2023.12.07.11.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 11:48:38 -0800 (PST)
Message-ID: <d830f067-7037-4303-aad7-82b9a1cc660e@linaro.org>
Date: Thu, 7 Dec 2023 20:48:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, johan+linaro@kernel.org,
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
 <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
 <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
 <f76637f9-8242-4258-932e-b879145a5cfd@linaro.org>
 <99ffd03f-b888-4222-939b-603c10f2307b@jiaxyga.com>
 <n3y5vfgznufdzdkyv6ygtohkepat5ayrpklearjw6jin57ussu@6uds6wtgaeaq>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <n3y5vfgznufdzdkyv6ygtohkepat5ayrpklearjw6jin57ussu@6uds6wtgaeaq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/7/23 20:46, Akhil P Oommen wrote:
> On Thu, Nov 23, 2023 at 12:03:56AM +0300, Danila Tikhonov wrote:
>>
>> sc7180/sm7125 (atoll) expects speedbins from atoll.dtsi:
>> And has a parameter: /delete-property/ qcom,gpu-speed-bin;
>> 107 for 504Mhz max freq, pwrlevel 4
>> 130 for 610Mhz max freq, pwrlevel 3
>> 159 for 750Mhz max freq, pwrlevel 5
>> 169 for 800Mhz max freq, pwrlevel 2
>> 174 for 825Mhz max freq, pwrlevel 1 (Downstream says 172, but thats probably
>> typo)
> A bit confused. where do you see 172 in downstream code? It is 174 in the downstream
> code when I checked.
>> For rest of the speed bins, speed-bin value is calulated as
>> FMAX/4.8MHz + 2 round up to zero decimal places.
>>
>> sm7150 (sdmmagpie) expects speedbins from sdmmagpie-gpu.dtsi:
>> 128 for 610Mhz max freq, pwrlevel 3
>> 146 for 700Mhz max freq, pwrlevel 2
>> 167 for 800Mhz max freq, pwrlevel 4
>> 172 for 504Mhz max freq, pwrlevel 1
>> For rest of the speed bins, speed-bin value is calulated as
>> FMAX/4.8 MHz round up to zero decimal places.
>>
>> Creating a new entry does not make much sense.
>> I can suggest expanding the standard entry:
>>
>> .speedbins = ADRENO_SPEEDBINS(
>>      { 0, 0 },
>>      /* sc7180/sm7125 */
>>      { 107, 3 },
>>      { 130, 4 },
>>      { 159, 5 },
>>      { 168, 1 }, has already
>>      { 174, 2 }, has already
>>      /* sm7150 */
>>      { 128, 1 },
>>      { 146, 2 },
>>      { 167, 3 },
>>      { 172, 4 }, ),
>>
> 
> A difference I see between atoll and sdmmagpie is that the former
> doesn't support 180Mhz. If you want to do the same, then you need to use
> a new bit in the supported-hw bitfield instead of reusing an existing one.
> Generally it is better to stick to exactly what downstream does.
OK I take my doubts back, let's go with adding a new one.

Konrad

