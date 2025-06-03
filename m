Return-Path: <linux-arm-msm+bounces-60084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25ADACBFAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA047A30D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3675202C52;
	Tue,  3 Jun 2025 05:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgKMG7p0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B71F4165
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 05:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929428; cv=none; b=DweYNgjiRMVfY2Xp3Wxi0q67IYHDJ9Z40y3WgkA23nVTYwZUSYEWx5HYQpP8acmJ1mPFCIRVWPNv0rmDOLqka/nvzR+NNvOz8a9HDydXbpSPXObglUwE1YPv6uTDoIHMKGlbC8ldiN86XZiDm+P0fQSgbwguLDzJ2PYWN7r9bdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929428; c=relaxed/simple;
	bh=I0L1ordB0NyTYxUFKSr84HMgfAD0Tj2Sb0s/30fdfsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSXZSfe9l4LVFlpN7wsfNgLkLKaUC666pwUaejq6/nBPD2dfNuP7fw/xrD7rEtGKv3XWfYwrrIKXqGieNPFPWtmgKsElY+DU5K/DpVjJIIIKnwwk+AUJbO+L2PFQ4rZx0AdHJz66qRezRHLsMvyBw4WkcmAgjImyMnsh1UMmzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgKMG7p0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552Jio6d021213
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMkQCc6kd/Z8GvZdB6DQV4yES+KskITqFMg1CNz2J6s=; b=JgKMG7p0JtJHYxFM
	LN5Xxvf//frtQy4BpufwPk1kRnlVwmfkmWdZuy79VyTtXNdUSRQllqChCNZeSWHL
	V66VY51ycgC+6+qp87jodr7djTPT7jZt4yaI2doXOo4QY6/yoplt+VsrTYXzEure
	YfPhJaAqwUDwgIlDFGzBTbpaGWFwbUrQat2C0kbG4UP0uYO/3H/P/u0Cr+0C6EUI
	+A0Sw/hVkM1rkXoTNMCkQUX6QLxQpVv7vwjZC/i3cQjQFDFfqstjmrheOFAcB3L7
	B7UqLEd8PcDXhIeLgy/LMqY/p2JzNtEGYYQcYX/ae39SKeOqtRxHiB2J0oSY9tF1
	McDIZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t9f68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 05:43:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-312f0d0161eso109575a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 22:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929424; x=1749534224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMkQCc6kd/Z8GvZdB6DQV4yES+KskITqFMg1CNz2J6s=;
        b=dzbVVZHR2by4r0g+3zHhDbZh/n9r0IlX4BPk0uoIKr2OgKt1NJ0OuK0c6VqzWxapL/
         tVBk/ojob7h/Q8ZCca0KU+VJ0mzw0wX1w0xaZK7lxR+mez8z61+XEZIr/+UhAkaHnWtK
         t0O90pMCIbVZzIDDAs/1LF8QR1PLjuL82fqWaG23Uv7+wn0qld11MQfFMIgZfOE77t/O
         Bia1izFEbRv9XEMKhtyF9gZCFoQpuZixLNcjixSPBFcNxS+2LuJOEGZFfAu3xXBNnHKw
         c3o8qQ6FNgbiOgxDa8CmLDOxSmY+k6/If/9rEWL3pOZezZKFASWYm4a8jh3ROUTNPpNv
         91qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9g+ncH1EFiHuYwV3hCBXj2dy6Lzl+qP3Xqv7NPmTMiqAiEJoVkATdbyWligfRVM5vnfSEE9Nj3Mc28afk@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYPo3iWx0R82Uuo5Zefgm65N+X8QdHXfEgy2W0vZ+JwxCgbhH
	dvaS5VxwJEh4BvfNGH2kWhmzKyW3zuwCEZt2A09zTDhnO4bIa8qoE/LYqPOvIDTjxRY3j1gLVnz
	AQyaA25AsN3xqLeLxw6hLbPwrZZnD1/KDLVylPd88enQS7X9TmBctDnxDEun0UI+0mGx5hjaXw5
	8j1lY=
X-Gm-Gg: ASbGncsuyYMdASCckv8HjV902GjbP5VeIaksg00ftSz1rzBQ7GYJDmQHQNBey+7m9rR
	quRRPmPOPIKrDGq/jYytvx3KJ/HTh4YUHHZdPMk04SBJNXRNGHFYKb2ossFsPWkOsju6m6xtkOr
	5XD7afP4q257DHbq/ZIFYuUxPxdwlSf2QZ4W/ECqUPdUb8jB2zz1JAb+HUGO9zyim2QRMxjvee8
	jMM97tr91Kz41nh9p2tPhOvFY1mJ69A/nwTuaTyPkfeVdcYNpGq2oMJghZZFi1VvGxsIdkXJ+kW
	PoFFlLK9+Cu2kPJj1K4Nvraj4Uc7fpGKx9idKv8Icp/fYcb8mBdYHT9LVFfYaulCtMtW5KlUuFA
	5pLJb84M6uDs=
X-Received: by 2002:a17:90b:2243:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-3124153299amr28110444a91.14.1748929423828;
        Mon, 02 Jun 2025 22:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqrUK36nWAa0tXd5rZY9CM8Gq+srPpqCQF/N7nyUSwu6N0NuNi1OGDl2lBXN27RT9K5Hmzpw==
X-Received: by 2002:a17:90b:2243:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-3124153299amr28110414a91.14.1748929423354;
        Mon, 02 Jun 2025 22:43:43 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312db4a4de5sm1208445a91.38.2025.06.02.22.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 22:43:42 -0700 (PDT)
Message-ID: <c967c22a-b891-4722-9180-75431137a263@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:43:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <497BF3hThnrmYe-YHKmdOyZwdjP3ivm1hFYDDy3-HkSOvkCOMVSkokyhb859mcTarGb55Go5nJLfgsc553u7ZA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <8b396edf-e344-47e9-b497-3f7fb35783ed@linaro.org>
 <spfJeVsefz_dTMqOG1lKaUye4O8Jz-RSdLCGtvPIrDMwKC9rxNNY_zKkBFVhdrPMheNf2WMkPsv7ElI4uhBfxg==@protonmail.internalid>
 <3df56548-49ea-498c-9ee3-b7e1d2d85d2e@oss.qualcomm.com>
 <7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7f001134-e099-492d-8ce5-4122d83a3de3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA0NiBTYWx0ZWRfX024RRmM4iefw
 dEfmfLbT+1k4Fx7WLTo/cZjvH1IW4oqr7CGAowH24Op7nYEOjMUtzvS/2PReWK0b4nPS5FPm/42
 F3TUiKHjlL4zXo3qZFMdZKzwskXhNGlvBQuICY0bi+jpRRDcGznRLeOGuCgKOcqytvYdUtQgQNY
 fb382xlKToEAMNBzNjfrPK7DP11EXGwX785iHlEVkxa2NOeD1W0uCoYB24GGMPo/77XCuCpcI9L
 +aTrDk8t0Oh7YLJO4S55pjTGzy7QPZyUEwX5qHeHx91AClVh+3Q4CMMY25Urg6EmzA4+i87grG0
 2uvHCQ74MqdcNVLrxlB3vMn1YsyfP3Q7+OJJYGQoba9gqaXLWFzrKUeTtlKSE7ntPWm+x/GWIhF
 w1Nx+idO3cintx88rwLcBM9izO5TsE9jiLRcL7bMOYmDvc+cocsDhrijNgbPucEq9CYByYKB
X-Proofpoint-ORIG-GUID: YnE7X2ZCuNJWsISPwdceCbvpsGQp4PTt
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683e8b91 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=qdlZ5SUtxolC3sdHW0AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YnE7X2ZCuNJWsISPwdceCbvpsGQp4PTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030046


On 5/30/2025 6:11 PM, Bryan O'Donoghue wrote:
> On 30/05/2025 10:37, Fenglin Wu wrote:
>> Thanks for reviewing the change!
>>
>> On 5/30/2025 4:48 PM, Bryan O'Donoghue wrote:
>>> On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Add charge control support for SM8550 and X1E80100. It's supported
>>>> with below two power supply properties:
>>>>
>>>> charge_control_end_threshold: SOC threshold at which the charging
>>>> should be terminated.
>>>>
>>>> charge_control_start_threshold: SOC threshold at which the charging
>>>> should be resumed.
>>>
>>> Maybe this is very obvious to battery charger experts but what does
>>> SOC mean here ?
>>>
>>> Reading your patch you pass a "int soc" and compare it to a threshold
>>> value, without 'soc' having an obvious meaning.
>>>
>>> Its a threshold right ? Why not just call it threshold ?
>>>
>> "SOC" stands for battery State of Charge, I will rephrase the commit
>> text for better explanation.
>>>>
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/power/supply/qcom_battmgr.c | 256
>>>> ++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 248 insertions(+), 8 deletions(-)
>>>>
>>>> -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>
>>> Please run your series through checkpatch
>>>
>> I actually did that before sending the patches out. I run checkpatch
>> with below two commands and I saw no issues:
>>
>> git format -1 xxxx --stdtout | ./script/checkpatch.pl -
>>
>> b4 prep --check
>>
>> Can you let me know what specific command that you ran with it?
>
> do $KERNELPATH/scripts/checkpatch.pl --strict $file;
> codespell $file;
>
Thanks, I will run the commands to check before sending next patch


>>
>>> 0004-power-supply-qcom_battmgr-Add-state_of_health-proper.patch has no
>>> obvious style problems and is ready for submission.
>>> CHECK: Alignment should match open parenthesis
>>> #95: FILE: drivers/power/supply/qcom_battmgr.c:521:
>>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>
>>>>
>>>> +static int qcom_battmgr_set_charge_start_threshold(struct
>>>> qcom_battmgr *battmgr, int soc)
>>>> +{
>>>> +    u32 target_soc, delta_soc;
>>>> +    int ret;
>>>> +
>>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>>> +        dev_err(battmgr->dev, "charge control start threshold exceed
>>>> range: [%u - %u]\n",
>>>> +                CHARGE_CTRL_START_THR_MIN, 
>>>> CHARGE_CTRL_START_THR_MAX);
>>>> +        return -EINVAL;
>>>> +    }
>>>
>>> 'soc' is what - a threshold as far as I can tell.
>>
>> I will update it with a more meaningful name
>>
>>>>
>>>>        if (opcode == BATTMGR_NOTIFICATION)
>>>>            qcom_battmgr_notification(battmgr, data, len);
>>>> -    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>>>> +    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>>>> +            battmgr->variant == QCOM_BATTMGR_X1E80100)
>>>>            qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>>>>        else
>>>>            qcom_battmgr_sm8350_callback(battmgr, data, len);
>>>> @@ -1333,7 +1560,8 @@ static void qcom_battmgr_pdr_notify(void *priv,
>>>> int state)
>>>>    static const struct of_device_id qcom_battmgr_of_variants[] = {
>>>>        { .compatible = "qcom,sc8180x-pmic-glink", .data = (void
>>>> *)QCOM_BATTMGR_SC8280XP },
>>>>        { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void
>>>> *)QCOM_BATTMGR_SC8280XP },
>>>> -    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>>> *)QCOM_BATTMGR_SC8280XP },
>>>> +    { .compatible = "qcom,x1e80100-pmic-glink", .data = (void
>>>> *)QCOM_BATTMGR_X1E80100 },
>>>> +    { .compatible = "qcom,sm8550-pmic-glink", .data = (void
>>>> *)QCOM_BATTMGR_SM8550 },
>>>
>>> Please separate compat string addition from functional changes.
>>>
>> The compatible string "qcom,sm8550-pmic-glink" has been present in the
>> binding for a while and it was added as a fallback of "qcom,pmic-glink".
>> The battmgr function has been also supported well on SM8550 for a while.
>> The change here is only specifying a different match data for SM8550 so
>> the driver can handle some new features differently. Does it also need
>> to add it in a separate change? If so,  this change would be split into
>> following 3 patches I think:
>>
>> 1) add QCOM_BATTMGR_SM8550/X1E80100 variants definition in
>> qcom_battmgr_variant.
>>
>> 2) add compatible string with corresponding match data for SM8550.
>>
>> 3) add the charge control function support.
>
> For preference compats and functional change should be disjoined IMO.

I understand that adding a new compatible will have to be done in a 
separate change. However, when updating match data of an existing 
compatible due to a new feature, isn't it better to include it within 
the new feature?

let me know if you think that having 3 separate changes above is more 
appropriate.

Thanks

>
> ---
> bod

