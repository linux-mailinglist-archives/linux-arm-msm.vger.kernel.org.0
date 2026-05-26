Return-Path: <linux-arm-msm+bounces-109772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILyHHvp7FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:54:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E25405D4714
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 675533038D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2953DDDC7;
	Tue, 26 May 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmwL3f5m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uqb0emVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF63DE422
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792833; cv=none; b=ntSZqSjr0HOGUgg3PAADaAtw9ROPgOW/PL0C8A+KjE/g0WxDwY8HVzAA/d/8LniolpnNpp+BhUNGMSAbMmSs6g8qN+ai6j/vilBmXEdUcKyyuH6NXuHsrJombWWY0FRt6F56qInXBJhQLfWSZlUnJCcqbIyNwJDZCLFlJA9Yzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792833; c=relaxed/simple;
	bh=eRFI++GY0h29Oj/z1eOEYeAN0omCshxCgUg60gOKDYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdvsenulqQDjs6oXwayAtFJQmXjQD97hZfkvIaUU1l3IP1qHMWlcno/Ip/9s0K5AqNRfqeoHyxLfUVy92gLEOREeQFu8yOXBtusQpTy0Katr8kNHyNSKk5szjRVpPY/MbJAu/qeWnb/igzNEgbix3pHt6XMB2R3l3Wl4ehhujxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmwL3f5m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uqb0emVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5igaw079361
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJTrqXlFYEY9B3t+nASH9FO5EeUSK4buZxILBrl96ow=; b=RmwL3f5mJSVj/kMR
	yfgSsGb1x2Rcqoy94GpyJnxCTrAYJDJSK8t7jNrw1x1dlphWO09XUsuG6LwvE1ID
	JQ/VAo+XPlXNiE6De+rl8s5Mcakpfmb9u1VwQb107CWEABzIveHNWh8qvXcNMrFX
	LNEZT5sxZatOuvUW2iJyA4O4Zi3kMc8xhLvL6AfRnLOvkdoSkNeHYl2qIhmObHg8
	6RMSTJK+0Q6ZKcDIiOCRZzl9DTsbhXy8AhzYTMjC7xphQMMchvUH60npcHnCL1s7
	TEy0dd9NWWrcAVQstkS21I4y9wjoWflblaSZjhE5vuO6dAeAf5JyoaEL5/akHmTL
	x6raEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmacanf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:53:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso105601485ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792829; x=1780397629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJTrqXlFYEY9B3t+nASH9FO5EeUSK4buZxILBrl96ow=;
        b=Uqb0emVQ/3kExVuMJOCG8pmLJ9zXhMgDJ+iltvfaj5rcJa38MC3YRUZyMg786AxKBx
         /oW7VIL/pmdKObdAKC37LqBP4p1BZI1X86WGIT3i3cKEsvV2tUQPpU8ar01J3+YkyniX
         ALkLVgkc4VJqWtBoqbXSKjx00J/beVhjjs78QHBNjjCzKQI+n+giutv9ObnNpA164+ob
         wM7n0SiCax/o6bO4g1A6WNSAesaSnpyPkMxI6swEsGWCCq+ekVo7PGNJ9ZoMyWdF1QLN
         O3Y1Tc03RsDkDFOKSrDvI609pPc29IvUTE8ubhTmzs9EppH+oASLV+ySoXFJfiU+CgfN
         R2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792829; x=1780397629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJTrqXlFYEY9B3t+nASH9FO5EeUSK4buZxILBrl96ow=;
        b=pEedQexd02Ds8McxO823cbwmr/4KA4l7V2DG4d86e1a/KNGAklePXVMfTgP2sW+ZkD
         EJxg2LFgLkvaQY1DZZwaOVbdio/6DCj4iocPT8s0uIoU6L92+KlvxkOynfxmv0lOR1az
         fzYByOefyB6rE5/Tzvoxbox0+68XRhLTesk8BWSjmenGIK34KgvO+NFpNaBvfEOxQetP
         DmwsdEbVhtAifDJHVh+CPBIMvS0FQKlTysXJ3X2xhZk3K+bm4zYQsIoLn96wC3G5V/Lt
         MVV2Q64ShZpvRAoT/6wEQQMsCcKc6o7KoVAY6K7eDQoB6Wk4NgEuSRKsaJ8qfhehmRiR
         LBIg==
X-Forwarded-Encrypted: i=1; AFNElJ9ePoCjGItn3yhPovv3gYroI7f7ZJg0VPHyTNMkkf9aHFXjGJwgaCW+xDi9okPutw5zvp7XO8s1WOeEwrof@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7k7pAZYPcOKUemWTnP3OroUC7GYAbCEubuZEmlFov3ei4EJU
	bSH9LmWavXdWB/otC7doxRWIdgqhMPf8i6/Tyz6N17+3/G/+SjVrjhQAo5g5KIheh8rjITrV1t6
	h9uca7LdWoITc0RHug7lxdq5cjwIKGtyoL4CgtXoH+4jnawm3RZEV4wMHDly/gWcYvmqa
X-Gm-Gg: Acq92OGx15Tn3hiB3Cpx1WWE5l7T/mgg204OE+F4dq2b98Nwbb4U7Jg2WD8NULc57fJ
	nXNiB/MP25ELRiQzqwzJBebkuAKuxwDyaYMKBabSG/TvHEbrqEjo16yRIVaRMKT6UqmVWjdkJp/
	TJDY8cdpPBFW6ObXIppqwmlaA8oHqDKmUUtWhHFuytSrONTJ6IInI1kQL/sKfInOJ1lNuDoOjC3
	iIgEBkbqpQRZ6i2Mt5LHtdoneMZOGfbMJai1v5bnRCw+JFqbBEXAQ0QHhlZoN3AaHi4otGyYAsB
	fZ5ljRSkk6BvDq2lI2wUBXsLu4Rk2OnQUc8nsLWcJEinDRCsmB/jyYd0UiYNO3lzEmWyny/8uAV
	+Co6HOEdq0Pfvx/smAEVKYwjVoVQkLQR64/HyfsjWJ91OunlAAaE=
X-Received: by 2002:a17:903:1a0d:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2beb06354bcmr199316965ad.18.1779792829070;
        Tue, 26 May 2026 03:53:49 -0700 (PDT)
X-Received: by 2002:a17:903:1a0d:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2beb06354bcmr199316535ad.18.1779792828529;
        Tue, 26 May 2026 03:53:48 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3cb3sm123368905ad.40.2026.05.26.03.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:53:48 -0700 (PDT)
Message-ID: <e954c647-397b-499b-ba47-ebfc9a65c2b4@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:23:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
 <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
 <20260515145450.3b1e9c3d@jic23-huawei>
 <6c876a92-e572-4cb9-8c31-bbf681a4770b@oss.qualcomm.com>
 <20260522114722.49b6055e@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260522114722.49b6055e@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a157bbd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XFE9V2JDpLeksAh3blAA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: v_A_Z558O02w_S9p-E0yzDOiPl7bjqOe
X-Proofpoint-GUID: v_A_Z558O02w_S9p-E0yzDOiPl7bjqOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX6vP54N+Sfdwl
 a1/bIka0AHBqhWNVWaEziLVzv3jbXLpVBLDdFpj0Ctnvv4HGN21UXywbAg35n2c++jdpyugXf6x
 200xljjwnxZjFuKgtVeUCdPiTT7aySzf54iVqhDCTQPWh5N2Aj3QzXo4d9wq5M10ciOBiOmB3HX
 PT7zio4rghVlWOiR+UAThZy28rbQnaIK6G/KhEX33lTxaC0k9r/LEJ7Hc7dTWDe0reZZFhuxOjL
 DPoTmBGGDFCKFwU6QVBwrThqDwtiDzBmcOxkxqykDBxNzspNLoFiKeQZ7R3wkI2YdYYcHci5+l6
 zap19+GuQO+4k7eCBKTSh9vMcV7jMOgX57JXzfiV/DLxKbFFqP0VYVFfHH9IaeiYA51NNQY1QNQ
 88VKjj+CrvO1G7YQfp36eAATWq30ukjK07MICqFAqL8yC5d4fdgPzg1vDzpKBO0hDq/oVWXqIm/
 jUEnDMnxTK5HnL5g5Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-109772-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E25405D4714
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jonathan,

On 5/22/2026 4:17 PM, Jonathan Cameron wrote:
> On Thu, 21 May 2026 16:16:17 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Hi Jonathan,
>>
>> On 5/15/2026 7:24 PM, Jonathan Cameron wrote:
>>> On Fri, 15 May 2026 14:23:44 +0530
>>> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
>>>   

...

>>>> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
>>>> index f8168a14b907..a819c3e627a0 100644
>>>> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
>>>> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c  
>>>   
>>>>  static int adc5_gen3_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct device *dev = &pdev->dev;
>>>> @@ -818,7 +782,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
>>>>  	}
>>>>  
>>>>  	ret = devm_request_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
>>>> -			       adc5_gen3_isr, 0,
>>>> +			       adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,  
>>>
>>> Sashikio points out that IRQF_ONESHOT is never correct for a non threaded
>>> interrupt.  The point of that flag is to ensure we don't handle another interrupt
>>> until the thread is done. If there isn't a thread then it doesn't do anything
>>> (other than omit a warning!)  
>>
>> I tried at first keeping only the IRQF_SHARED flag here, but it seems that
>> shared interrupts need to agree on the ONESHOT flag configuration, else the
>> second interrupt's IRQ request call fails.
>>
>> And the ADC_TM interrupt needs to be ONESHOT, since we don't want that interrupt to
>> be rearmed before we have notified the thermal framework from the threaded
>> part of the handler. So I had to add the IRQF_ONESHOT here too, though it is
>> not useful here.
> That's an interesting corner case.  Maybe the warning needs to be more refined?
> (I don't think it checks for shared?)

Yes, at the point Sashiko indicated, it looks like there is no check for shared IRQ,
although it is checked later in the same function (__setup_irq).

> 
>>
>> I think it's best to use a threaded IRQ handler in this driver too. I don't really
>> see any meaningful way to split the actions in the interrupt handler here into a primary
>> handler and a threaded handler, so is it fine if I just make the primary handler NULL
>> and move all the ISR functionality into the threaded handler part ?
> 
> That's fine by me.  Just add some comments on why.

Thanks for confirming, I'll push again with a comment explaining this change.

Thanks,
Jishnu

> 
> J
>>
>> Thanks,
>> Jishnu
>>
>>
>>>   
>>>>  			       adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
>>>>  			       adc);
>>>>  	if (ret)
>>>> diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
>>>> index 6303eaa6640b..39cbfcbdb101 100644
>>>> --- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
>>>> +++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
>>>> @@ -205,7 +205,5 @@ int adc5_gen3_get_scaled_reading(struct device *dev,
>>>>  int adc5_gen3_therm_code_to_temp(struct device *dev,
>>>>  				 struct adc5_channel_common_prop *common_props,
>>>>  				 u16 code, int *val);
>>>> -void adc5_gen3_register_tm_event_notifier(struct device *dev,
>>>> -					  void (*handler)(struct auxiliary_device *));
>>>>  
>>>>  #endif /* QCOM_ADC5_GEN3_COMMON_H */
>>>>  
>>>   
>>
> 


