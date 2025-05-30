Return-Path: <linux-arm-msm+bounces-59872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D9AC8BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB29A7ADD19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E812222C3;
	Fri, 30 May 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MEXI23nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04442221732
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599882; cv=none; b=BvobgoRI9zfc+1PiqWgx00HXdmVnS8nJlXA2AVePcHKEae0fBeb5Fv0Ku9haYdCnTU3UXMkWHBAcTpUhFfz/8ZFL8y4O3XT6JNdwEQ+2YKiATqrislG/We7R9g5OLmexi2LS+JXlMcf3lw/MNRPMm20qMhysquiRcqmql47lxJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599882; c=relaxed/simple;
	bh=BtgiWbtyObg4xFKH7C8Tduzp8RP6HRLtefwrW+i2WLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZyKHxth40r2B8NIeexFywTlwNa/lcapnBb6d9ozgmsxSGej94VIrZLnAoSsDBnJYYghSMlljdMsTKK2Xz+Lp20yFBAzUrujyrckzuGTtagevMOm8oPdgeAq9AqJPh36sRFKnxaIJUvwo9enfuDZLzxdZSloDp4vKi9+h16oIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MEXI23nf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a37d24e607so1789448f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748599878; x=1749204678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=MEXI23nfGNOhAh4nJzWlci373SRWGwDGVyPXdMJxwL/Ug+KO78CEkPVilIyDSlnlF5
         sVQb8jplnd9SxGYWx+FhMCO/2e9jUZYhhnWk6V/7bq5FignpBE9uX+Wtzvz6PhSmJujr
         heFblOgB4L6DosbBoUap/t7RECiKKHSjw1idHg+MNY/oODXqAdngmgkZVsIHVHSchvXG
         DJvoC8A8zaL0stufC75yQ5nE2/MjswI2QfcgVI35/7pOJDprR6Ir9Y9i3tttN9q5GdgV
         QnDfm5iiaepyaaLshzp71BAsnmPuO67/mOVEhXAIltyjlgaY5fBetGeK5VkF1Mt4HqSi
         gLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748599878; x=1749204678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2uvJQQDga9gpIshIa1ROf0lj+l2p+xM+9sY9IixreE=;
        b=J8kASraUIi6UUwnoeS2rPCfK9DvmswEWk0z8K6bQzUlL6mWivTMknvw4Qaz4GImNoz
         oyO7no2TgsCf4iYyawmcx3Fn2E6M1wyx11EeiqCK9hgRARHHDR1hl29h//Xx5bKxs8/J
         gd898I6LgHx21HI6ciHOHeRhcFw+/1maSleaRJRIUDrisQBzapZ5G+5GLy/C0AzoHaLk
         0mY2p/dVq+OqKCROXl8HWn5rRNqXUavKXiWgvRuF1kKs6kL+Dl9Bot6pN23GqhHdqk75
         PPuVZVvJmJb10z+MnHemt6byvvfswHK2aabgBnxHe9/EgxGLhYGlgiyikye9Z8SYKx0Q
         exFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDF9I5st35R5wTa4M6RtMJ0W7NvlbRujuwOTDA48sVzA0XcVapSNZABQble0ZlVSmtKVYNXiuHOl68y+Ad@vger.kernel.org
X-Gm-Message-State: AOJu0YzkIpipvxVDuclz7DlEM930mxtPDmuWo6ab49C98Sm7WQfFck4+
	pCSfu2aniRknEgNXoyqAfQtaPVsQKlnVZWVVTblst3mxya/H/kjmmUe6J+ZxOcFizFI=
X-Gm-Gg: ASbGncsOCEYyTz6Y8Z6kuMtpyN1Qnd8NPdohEB71fjys2f4eKD50ZhMqEmZfBsEvdpS
	bJ6Rq5c5/rruhfXxVQ6iqx5jtQOPDreJzFxvpF2Ee5ixQRr+WsRyAhJbJg9sNgIDjlNgMxNCP22
	lxQwHT8Ix4iJ5fBc3fRwZeU0BJKQxMXINcuMRTNXJrQ+oAM8oW6FfQjOuFlM7XFUU+FVBNBXt8n
	BOqJls/KK7dFP7I1xlutQ5o8TZHbsu9usOrNWGcJ6KgTddjgM+CKbj2Ecxgm4LEIv+fSXF/OFv2
	wcu8FmBxguv/XgGZFpRO9x67VdsTaWlYTFQV0KPfruphL8Euy+R9vkNgr9NxUAXoGSm+HODVVWl
	XRMis9d5cNaRTH6Wk
X-Google-Smtp-Source: AGHT+IEGpK9wxifZBoINj4a9WAqhHPQBuG6oOIYEnwaBOMGLx5F2IGQmU5aCTNH4ODtjQn5uXNaecw==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b8b0:43ff with SMTP id ffacd0b85a97d-3a4f89a7a30mr1169064f8f.14.1748599878104;
        Fri, 30 May 2025 03:11:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8ed27sm13971185e9.2.2025.05.30.03.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:11:17 -0700 (PDT)
Message-ID: <7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org>
Date: Fri, 30 May 2025 11:11:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <497BF3hThnrmYe-YHKmdOyZwdjP3ivm1hFYDDy3-HkSOvkCOMVSkokyhb859mcTarGb55Go5nJLfgsc553u7ZA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <8b396edf-e344-47e9-b497-3f7fb35783ed@linaro.org>
 <spfJeVsefz_dTMqOG1lKaUye4O8Jz-RSdLCGtvPIrDMwKC9rxNNY_zKkBFVhdrPMheNf2WMkPsv7ElI4uhBfxg==@protonmail.internalid>
 <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/05/2025 10:37, Fenglin Wu wrote:
> Thanks for reviewing the change!
> 
> On 5/30/2025 4:48 PM, Bryan O'Donoghue wrote:
>> On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>
>>> Add charge control support for SM8550 and X1E80100. It's supported
>>> with below two power supply properties:
>>>
>>> charge_control_end_threshold: SOC threshold at which the charging
>>> should be terminated.
>>>
>>> charge_control_start_threshold: SOC threshold at which the charging
>>> should be resumed.
>>
>> Maybe this is very obvious to battery charger experts but what does
>> SOC mean here ?
>>
>> Reading your patch you pass a "int soc" and compare it to a threshold
>> value, without 'soc' having an obvious meaning.
>>
>> Its a threshold right ? Why not just call it threshold ?
>>
> "SOC" stands for battery State of Charge, I will rephrase the commit
> text for better explanation.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>    drivers/power/supply/qcom_battmgr.c | 256
>>> ++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 248 insertions(+), 8 deletions(-)
>>>
>>> -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>> Please run your series through checkpatch
>>
> I actually did that before sending the patches out. I run checkpatch
> with below two commands and I saw no issues:
> 
> git format -1 xxxx --stdtout | ./script/checkpatch.pl -
> 
> b4 prep --check
> 
> Can you let me know what specific command that you ran with it?

do $KERNELPATH/scripts/checkpatch.pl --strict $file;
codespell $file;

> 
>> 0004-power-supply-qcom_battmgr-Add-state_of_health-proper.patch has no
>> obvious style problems and is ready for submission.
>> CHECK: Alignment should match open parenthesis
>> #95: FILE: drivers/power/supply/qcom_battmgr.c:521:
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>
>>>
>>> +static int qcom_battmgr_set_charge_start_threshold(struct
>>> qcom_battmgr *battmgr, int soc)
>>> +{
>>> +    u32 target_soc, delta_soc;
>>> +    int ret;
>>> +
>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>> +        dev_err(battmgr->dev, "charge control start threshold exceed
>>> range: [%u - %u]\n",
>>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>>> +        return -EINVAL;
>>> +    }
>>
>> 'soc' is what - a threshold as far as I can tell.
> 
> I will update it with a more meaningful name
> 
>>>
>>>        if (opcode == BATTMGR_NOTIFICATION)
>>>            qcom_battmgr_notification(battmgr, data, len);
>>> -    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>> +    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>            qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>>>        else
>>>            qcom_battmgr_sm8350_callback(battmgr, data, len);
>>> @@ -1333,7 +1560,8 @@ static void qcom_battmgr_pdr_notify(void *priv,
>>> int state)
>>>    static const struct of_device_id qcom_battmgr_of_variants[] = {
>>>        { .compatible = "qcom,sc8180x-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>>        { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> -    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SC8280XP },
>>> +    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_X1E80100 },
>>> +    { .compatible = "qcom,sm8550-pmic-glink", .data = (void
>>> *)QCOM_BATTMGR_SM8550 },
>>
>> Please separate compat string addition from functional changes.
>>
> The compatible string "qcom,sm8550-pmic-glink" has been present in the
> binding for a while and it was added as a fallback of "qcom,pmic-glink".
> The battmgr function has been also supported well on SM8550 for a while.
> The change here is only specifying a different match data for SM8550 so
> the driver can handle some new features differently. Does it also need
> to add it in a separate change? If so,  this change would be split into
> following 3 patches I think:
> 
> 1) add QCOM_BATTMGR_SM8550/X1E80100 variants definition in
> qcom_battmgr_variant.
> 
> 2) add compatible string with corresponding match data for SM8550.
> 
> 3) add the charge control function support.

For preference compats and functional change should be disjoined IMO.

---
bod

