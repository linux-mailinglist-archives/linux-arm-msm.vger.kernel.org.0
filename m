Return-Path: <linux-arm-msm+bounces-38073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FA9CF45B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 19:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FF42834C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 18:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3321D9663;
	Fri, 15 Nov 2024 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="S/Hyl0PH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB91D435C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731696808; cv=none; b=rRrmMmLcoaRheHcHDol7VK7fK4M+9JfEy0nhdlvitRzcAen9MH9JUQ+cOHMzlO45AAvbEA0/L9P0MGesosYNKs+rFqplrTFT2TYtSmUviCl8graYpEeH92iEdWZ4gmac+1mvt65RqZQ4FGKM2yEPaWuVBLYYdjE5mNO3LJGJSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731696808; c=relaxed/simple;
	bh=GQ4Qs0p8XMC/WMNPSORrd93CRSeBC/fXwGJrkwfWQFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6/MbxSA1wy5wdI+SIpBE3SIQxcrXOxLVpVoQqhGS3Qq64izZfdczgs2Mlwg7hM0sRL06xUXRrL5kRIVUku26UoAjJ82Xp2AcN3v6Dt7YOcr3pTaOKY5MmR6zC36JmHEYOOuGdpU0/rI2drgT1gb+Bn78AUniIVQ0vnyKd6yqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=S/Hyl0PH; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cbf340fccaso16950996d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731696806; x=1732301606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5elQBFEHbJlxFLK/U8geAkzp/tbJO8V9jLQWafGrL4=;
        b=S/Hyl0PHR7oLcnx+hcpZjhUOZM63QAvA5qXEa4/NIXHXqinMNHpLNW+/owoj9/QpjS
         BGFLBKJzYKrkVydWlW5CTdH2QXnVrgOZb5rVAvOGV66woxCjJj17P5G6iHvvsZBL6mJn
         Z1BpwE05dnb2qdWl6fAqYuMkQYexqP33RTV60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731696806; x=1732301606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5elQBFEHbJlxFLK/U8geAkzp/tbJO8V9jLQWafGrL4=;
        b=AXGg1zJTHIhG/a81Xvr/8LhysJx4sHdIA61EtSX57pzT4f+H5TJ+kwTCnkaEO31TFM
         xD6Zm04dU6dohGtTaiXdqBkVnDTD/zn5SwNPtqsbLYH0DpRig1qwAS4NvquOv9uuh0K/
         a9ul8uRQo6QqabVm3Gxz290Xd1W5kdUYObA30dsZXTvjkDsW2pPp1/wevsFLVT7ZeJUH
         w6HvrFXnheKHkZt+9tOKuQj8TpXdFts56Jm6DmuBnLRfh1kQU7R0F6H4QwNpRLC9JasG
         b4Oynx66kHMgs7bD3Xh+42t4UqvF8gu7zcrHUy2aevn/KD640zHuEpOdQ20ZAMKRUuJu
         0KNg==
X-Forwarded-Encrypted: i=1; AJvYcCXsRQ+XvrMT0e27yNBx0fuISmEG24xTRJj82fn7rMYg6L4i6dSleebjoQSIkAKtIpreqGz1IYNLTmi77C6g@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3C5HFC75qWlgTGf31CsZ+V2Pcav02+mVLR+c8riNr4UwKviP
	vNq07aJB1vB6MuA10udfFvdyJwmhqQ6tCvegoh9lmU2oy4cntfClV6pBMLl7qA==
X-Google-Smtp-Source: AGHT+IENzcn3L8l6GMiTpIvz1WW2qSAUSbXEx7SiZS3NLUHADjwn+UVn3VsP/poiLGJW1U8cFqG/Aw==
X-Received: by 2002:a05:6214:4988:b0:6d3:8e50:65cf with SMTP id 6a1803df08f44-6d3fac951d6mr67538556d6.20.1731696806055;
        Fri, 15 Nov 2024 10:53:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee773205sm20958426d6.16.2024.11.15.10.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 10:53:25 -0800 (PST)
Message-ID: <3cd75897-df45-4938-9d19-60df062a5b9b@broadcom.com>
Date: Fri, 15 Nov 2024 10:53:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Elliot Berman <quic_eberman@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Yan <andy.yan@rock-chips.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
 <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
 <ZzdOOP0KuMMdo64W@lpieralisi>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <ZzdOOP0KuMMdo64W@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/24 05:35, Lorenzo Pieralisi wrote:
> On Wed, Oct 23, 2024 at 09:30:21AM -0700, Elliot Berman wrote:
>> On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
>>> Quoting Elliot Berman (2024-10-18 12:39:48)
>>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>>> index 2328ca58bba6..60bc285622ce 100644
>>>> --- a/drivers/firmware/psci/psci.c
>>>> +++ b/drivers/firmware/psci/psci.c
>>>> @@ -29,6 +29,8 @@
>>>>   #include <asm/smp_plat.h>
>>>>   #include <asm/suspend.h>
>>>>
>>>> +#define REBOOT_PREFIX "mode-"
>>>
>>> Maybe move this near the function that uses it.
>>>
>>>> +
>>>>   /*
>>>>    * While a 64-bit OS can make calls with SMC32 calling conventions, for some
>>>>    * calls it is necessary to use SMC64 to pass or return 64-bit values.
>>>> @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
>>>>          return 0;
>>>>   }
>>>>
>>>> +static void psci_vendor_sys_reset2(unsigned long action, void *data)
>>>> +{
>>>> +       const char *cmd = data;
>>>> +       unsigned long ret;
>>>> +       size_t i;
>>>> +
>>>> +       for (i = 0; i < num_psci_reset_params; i++) {
>>>> +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
>>>> +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
>>>> +                                            psci_reset_params[i].reset_type,
>>>> +                                            psci_reset_params[i].cookie, 0);
>>>> +                       pr_err("failed to perform reset \"%s\": %ld\n",
>>>> +                               cmd, (long)ret);
>>>
>>> Do this intentionally return? Should it be some other function that's
>>> __noreturn instead and a while (1) if the firmware returns back to the
>>> kernel?
>>>
>>
>> Yes, I think it's best to make sure we fall back to the architectural
>> reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
>> since device would reboot then.
> 
> Well, that's one of the doubts I have about enabling this code. From
> userspace we are requesting a reboot (I don't even think that user
> space knows which reboot modes are actually implemented (?)) and we may
> end up issuing one with completely different semantics ?
> 
> Are these "reset types" exported to user space ?

AFAICT, they are not, but arguably you already need custom user space 
which is capable of doing:

syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
LINUX_REBOOT_CMD_RESTART2, reboot_cmd);

in order to utilize the custom reboot mode. I could imagine that with a 
discovery mechanism, a wrapper could be written to check that the 
specified command is actually supported before issuing the system call, 
or even have the system call do that under the hood.

I don't personally feel like this is very important in the sense that as 
long as a fallback exists for an unsupported reboot command specified, 
the system does reboot.
-- 
Florian

