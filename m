Return-Path: <linux-arm-msm+bounces-16202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE098964B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 08:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01BC2B22336
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 06:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBAA24B23;
	Wed,  3 Apr 2024 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtwN+Rot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACA14006
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712126694; cv=none; b=nPv88s09Mc09GledTIm0rFW5kgPSg6mte8HadAToNKdotb5gMKvA5sZLIMdBFx2pUAZRYVbkDGKpbhEHzRe2+FPMX4rwAslkdu/FPQK+ihXZCN8rBaVG2iMqxx4wHdxpfRxY4RR9qA9YHyfuNpOK4xR6y5BgphMAVpe2JcuTEKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712126694; c=relaxed/simple;
	bh=us7MqpjHfnTc7dW6DdJb/B6eLXrrOlR+YDgMN07W/hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiOS9Tbs7Z5r0V6F0r1Fq4UWoS/Boh6mJH2IM1ouqsM0SkNw98JxNCnqdsGZvAbVkhuGGCTXm0zRbPs6VWRvWmOgl6TKVGzcNqFTNsbgP6zfNpXr8X7CY5tMTdTbOOFaPqcuhf2WqL4T1oPuoe87hUVVoWzgrpOAK0gD1ov8aTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtwN+Rot; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4e34d138f9so604919566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712126691; x=1712731491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mqzG+GVTYlLCvJp4qtTWcyIY70wgO0A+rDrRVUSez5Q=;
        b=JtwN+RotWS1ET9lvdOxlcBxdLAw4ux5P3Jzxsf6uy8/FFJZLwLZyhPZplNQyWqqeKa
         mwlyYiEcOvHwRlBleVoI9Fsb/gCHtqVXQj0f9x9Yn9sGCz7O7Jy7p0iwRqH8UTyyTfUc
         FTwh9QK8gBiU6s1PwbcFujmV6wLw/gW3oJQ5aRuQymgo3t60XLSy2bdehkGZ8rPrY6iv
         sYZ6YdcTNX5yNiW12/SbvGovwH+Qw/yaGPpZebfYV4vcNO8FkIkI0YF055qpoF39oqtc
         OT5XkOULGr+D4fxgx5u4VSSuGaJgTmSDcyEawI36xthOLHD7bN6s8Ivo7HGui78k0opM
         j+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712126691; x=1712731491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqzG+GVTYlLCvJp4qtTWcyIY70wgO0A+rDrRVUSez5Q=;
        b=VzTuqYIDuPrfDQWBzxNtg8J5BGbysKU8f5aeWRLLBHhZ57xstU3ZttOB73zg9VL/CW
         rwBdAhs0hRC6xuvGy+JumywqNxV8e2ct5AHPECNAeRGZvsHs7u/61JZTCCbAzI4FIij2
         zOgGIyqTnPgDkW6wrThy06a8c7OBf77wIIed0nhsxX8RMneCW+th8s5U4JZlPruVjRuo
         NlndAvh/nwddQy4ca5/rJ4qQw8yDRoc93seD9H6HPFTHCQlsaQpLMOS7CwsGn1PiL0LC
         CiEmJTVtd9GH8KK2uufuaoM4VfzLCuJN9RD6UPOHoM0f4MsPCz9NjuZaYCCwP2K+DsVm
         38Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU2DwRhwhR/0Vcy0dryTQMusV+rN05DZpLKdMEqx5JLf5cQSmGhv1YcVoYjEPmh2NOHjyTeJ9GXK7DPMoWPEfK5DFk9AC/Qrp3UJMQp2g==
X-Gm-Message-State: AOJu0Yylow5Rn8r1rY50oTOgOpD3WCigG3pZ1OluV+aet3Pzz6E+TUZ2
	Quhzj3rfeyNqBOW+UgRMQImjXzKiyGm+llMI/AcWxvvSQkQdEQIhWwdciU1W8YU=
X-Google-Smtp-Source: AGHT+IF1uLL1pPHXISWPCfPmatN0dRkigzOt05swpo3k6uWmGxqKf1SISJl1Y7/Pj0xYoM/BIfIN0Q==
X-Received: by 2002:a17:906:f6d1:b0:a4e:1b02:81d6 with SMTP id jo17-20020a170906f6d100b00a4e1b0281d6mr1123667ejb.10.1712126690625;
        Tue, 02 Apr 2024 23:44:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709061d0c00b00a4da28f42f1sm7459338ejh.177.2024.04.02.23.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 23:44:49 -0700 (PDT)
Message-ID: <1a9de041-8d17-42eb-85c5-9e8f280a1985@linaro.org>
Date: Wed, 3 Apr 2024 08:44:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <84f20fb5-5d48-419c-8eff-d7044afb81c0@freebox.fr>
 <72c162cc-45e0-48b6-8d90-d59fac299375@linaro.org>
 <6bd3db0f-2e18-4ad1-abc2-f59c6acc8037@linaro.org>
 <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ea18f91a-710a-4eac-903d-90928caa3090@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2024 23:04, Marc Gonzalez wrote:
> On 30/03/2024 19:23, Krzysztof Kozlowski wrote:
> 
>> On 30/03/2024 19:20, Krzysztof Kozlowski wrote:
>>
>>> On 28/03/2024 18:36, Marc Gonzalez wrote:
>>>
>>>> The ath10k driver waits for an "MSA_READY" indicator
>>>> to complete initialization. If the indicator is not
>>>> received, then the device remains unusable.
>>>>
>>>> cf. ath10k_qmi_driver_event_work()
>>>>
>>>> Several msm8998-based devices are affected by this issue.
>>>> Oddly, it seems safe to NOT wait for the indicator, and
>>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>
>>> This is v2, so where is the changelog?
>>
>> Expecting reviewer to dig previous discussions will not help your case.
>> It helps reviewers if you provide necessary information, like resolution
>> of previous discussion in the changelog.
>>
>> I dig the previous discussion, since you did not mention it here, and it
>> seems you entirely ignored its outcome. That's not a DT property.
>>
>> NAK, sorry. Please go back to v1 and read the comments you got there.
> 
> My apologies for omitting the changelog.
> 
> And I don't blame you for missing the thread's resolution,
> since I made a bit of a mess of it with my various messages.
> 
> The firmware-5.bin approach was deemed DOA since these files
> are parsed too late with respect to the required work-around.
> Thus, we went back to either DT or a to-be-written system used
> in the vendor driver.

Then please mention it briefly in the commit msg. Explain there why such
implementation is the correct way to solve your problem.

Best regards,
Krzysztof


