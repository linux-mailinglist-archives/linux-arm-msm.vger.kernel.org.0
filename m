Return-Path: <linux-arm-msm+bounces-8238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF983C089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 12:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E66381C226C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715422EAEA;
	Thu, 25 Jan 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMq//pwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EF50A96
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706180891; cv=none; b=rL7mHHxyh8c7FoDSn31/S/J5oqtTCqEeGh/shcdimMhTb0C6LmwWwTOdihGrANY8EkPGdyH9TQrr+Z6MBdLTEqWzwsxMcJ2OLDCtfYd0texqrDrRHd7Sj3+ceXdvyBTgUsHXl7dubv7Thp4UBN4DI+2e3P4Dg0MH0g9e6ubRMCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706180891; c=relaxed/simple;
	bh=OXF4CCNwN7MFURfmPr5WAKq/3GKPFepxulJn7BECNSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oj8nLVtt2fzwIgj7fVA40vBMZ69o1H9lduz6exMK7xN845GNndHI68LbDbTP+0/kiKk0DGb+hEy7AHHZOZIECFN0O3NI8tZx2h2MfUFEnkvRedQbaSuW54oVlfX4KRed5mVq+iJfTXKkUNEpkMxoLCCEVpSBaqO+a9cTnv6es3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMq//pwD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso2962806e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706180887; x=1706785687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lENeQVE9Bv2rk1ViR2R2CP4axbEYZgu2pD0QISWuHM=;
        b=UMq//pwDJZIhfl1PxWcY33JTolADQWXVt1dkloHimjwpkwl2U0W9WV1Oh46lVhuYJX
         7cUlwvObovwNjvprEg3gFWiubJp8aSnqBo07kmtzRSTE5yvIQaS99luzJkKhq/qNdJZ3
         8qx9+Y+k8LXsblw2VmvUyLdRzg3HG4Y7HCm/0eK3xlTJL49wFYKyZghZr/UXOUPs7y9o
         s7XPSGiVRvuJYgDol6BSKGNeO5beicBhXWchG3kQVzxHFcXEoMy0cH/UQe5VkAtVgH2V
         tCvGKoBLBfnmK5OAuQw0n/Uu3wmnOAJ4eGnU6PpKj0bJpHqFG9Am24OfP8Vl0Ix4TbdZ
         rWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706180887; x=1706785687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lENeQVE9Bv2rk1ViR2R2CP4axbEYZgu2pD0QISWuHM=;
        b=rG63tDw6sc4nk0Ij4KAzKUNmJrjMhRP5A2dnRWGC9rx3PVDpbkSsDFZY15oMHQ+4qk
         /70FSBIHzaB7lwPC9H61Gp+4010dJDn8aF6Abr8eAcnoeuPrzd8Yak5Cq0Aq/I6YVJiX
         SFHineo4mEbQmZbNF3u1NTvrp4pHug06ekZkOvBQyt/fFKXuLKGeWdgi0lpQrsgK6EWy
         ia24l35jH0IDnN6hJZVSzEcXL+HtvOMC8f2OjvlmmDVrpFETUmT7WYPx9H/5PQvtKwoh
         p6V59yP0Zspa3XEt8a//VT4Arzi+PhuC7dbuOOi2A0hM5KKjN29Aib3rF/qyeP1dAGh/
         aRQA==
X-Gm-Message-State: AOJu0YylT0PDN8X1ZESZov+YuNY9F2bHdHy4QH5udUXu9sxZxPyXx0Rl
	MtZcl2E4rXrtuNaxNc2d7MoYA9J0a6gKKhlwuDkO31QUFuyAy2ATbNpj2qQHPcY=
X-Google-Smtp-Source: AGHT+IF1SKkZsDhmiAU0ddYoWXOT3/212iNyF8V8TpY5qe4Q2Hb2/WQC1bm94pc/Je2t2pfpioC7aA==
X-Received: by 2002:ac2:59dd:0:b0:510:ffd:31be with SMTP id x29-20020ac259dd000000b005100ffd31bemr192437lfn.42.1706180887536;
        Thu, 25 Jan 2024 03:08:07 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m16-20020a0565120a9000b0050eb207ab58sm2836949lfu.74.2024.01.25.03.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 03:08:07 -0800 (PST)
Message-ID: <b5ea1c8c-c35d-45e3-9b90-d3dc480f4463@linaro.org>
Date: Thu, 25 Jan 2024 12:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/tsens: Add suspend to RAM support for
 tsens
Content-Language: en-US
To: Priyansh Jain <quic_priyjain@quicinc.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_manafm@quicinc.com
References: <20240122100726.16993-1-quic_priyjain@quicinc.com>
 <548e2f24-a51e-4593-9463-09506488c70e@linaro.org>
 <f415a8cd-4cae-d7c3-60fc-674b3e660f6b@quicinc.com>
 <aeae2e69-8407-4d90-9d16-27798e2f3248@linaro.org>
 <be69e0a6-fdc8-c24b-9beb-adaac4a97776@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <be69e0a6-fdc8-c24b-9beb-adaac4a97776@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 16:25, Priyansh Jain wrote:
> 
> 
> On 1/24/2024 6:04 PM, Konrad Dybcio wrote:
>>
>>
>> On 1/24/24 11:42, Priyansh Jain wrote:
>>>
>>>
>>> On 1/22/2024 8:02 PM, Konrad Dybcio wrote:
>>>> On 22.01.2024 11:07, Priyansh Jain wrote:
>>>>> Add suspend callback support for tsens which disables tsens interrupts
>>>>> in suspend to RAM callback.
>>>>
>>>> Would it not be preferrable to have the "critical overheat", wakeup-
>>>> capable interrupts be enabled, even if the system is suspended?
>>>>
>>>
>>>
>>> As part of suspend to RAM, tsens hardware will be turned off and it cannot generate any interrupt.Also system doesn't want to abort suspend to RAM due to tsens interrupts since system is already going into lowest
>>> power state. Hence disabling tsens interrupt during suspend to RAM callback.
>>
>> Is that a hardware limitation, or a software design choice? I'm not
>> sure I want my phone to have thermal notifications disabled when
>> it's suspended.
> 
>> Konrad
> 
> As part of suspend to RAM , entire SOC will be off,

What do you mean by "entire SOC[sic] will be off"? Surely the memory
controller must be on to keep refreshing the memory? Are you thinking
of suspend-to-disk (hibernation), by chance?

> this mode (suspend to RAM) is not intended for Mobile product. Tsens interrupts are not
> disabled as part of suspend to idle(suspend mode for mobile).

That's clearly untrue, e.g. the PSCI firmware on SM8550 implements
PSCI_SYSTEM_SUSPEND, which does S2R.

Konrad

