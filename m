Return-Path: <linux-arm-msm+bounces-72545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502AB4894A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C803AEE80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3038D2F2910;
	Mon,  8 Sep 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eG4sBqPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9351F09B3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325621; cv=none; b=Qx6yVVbe91pgLAdevnKvFw71kH/0OBsiWt+tFTTOnCfyXfPts7IkYtL1ZOzofqLXZfU/RIG8PL1qkkgIY25w/zkL9pOV4zBu1SwrtPdPMleD3AzuASTkwwoRSuZBB7BRcIVbPmKI2Ov82T+GYoRC4Ntc0iqovqi1RAEUxayhI20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325621; c=relaxed/simple;
	bh=r/waWgH8iFc4NM8oyhtNDxdNdtdlFuFW9vf2HRoSosM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTtxppv4O4EnDsrUHuGKjqmgFDBrMXkkqSnzb88UrjERPCu3tYkuDvsnSdJrtdUZqyFA6E85FRyaUovWTJ7XysDVAi386niO2Nzq+b08keVVvwArDM2HyN1kBsoAebVgl2uE6+rX431Tk4+VvV3+GmnKXSd/Qc8Dps2watIpSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eG4sBqPT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886gQ3C006157
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 10:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtUukMnNWAAQi+BBVchgSoNXaZOrt4o1HkYE4SHkE2I=; b=eG4sBqPTWzYBRCbA
	dDNrzwa9pRYTxloO5rahsbNAwP660TgzsnSZaZLET4gW7JQPwMUEqtVV+4w38AEq
	EN4TgJdoh7QL7cBvX/mp15qeQUbhO8QT2FxCbe9CArGaKEJqQbvZ9W+zvSBlPZjW
	XpJyzgGJn2fQ+CB1HLkiI1lNKZ0cCp6EFdSD+rLN2owA00pc7LEQIm5UH1akDbEP
	fTxnrw6ikvhZD8YSUrx1FbgmJg/J0Ji7gbXYqZ+HjbzILgaCcKGaU0rLVacH+l/q
	sobvTLDsEvii8hf8z4jnf5q80o8gJGssdB/4CURXlUkOrlfhA0OIAcI/3svA8BX3
	NSlXLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37rn7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 10:00:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5a43b6so12005046d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 03:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325617; x=1757930417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtUukMnNWAAQi+BBVchgSoNXaZOrt4o1HkYE4SHkE2I=;
        b=D4QgcfEOgwprIEUVoOUgIgM2Hlrt3No/Lh+85+QFtMpxb8YzMw47SrRqhC5D5kXOpz
         6aiFK0CEGtjprDIgzsSJg8iMuZzynAjMAvrSLQC0ZVZ4uSUODdMphoiFA7ihs4/8R03h
         PwIWoSEomQUun2cs3tuRBUh25aconWkl9FQy58MFXna2OwsW5tPbs+8D/gquHuoFgykj
         Wk3tF58xwcpUfRHTxERTp8E22m4nW6f3Vob/NyKmZBTGTip0IW+mrMZNdHLgG4sPreYF
         ZATdI4LejwhJ8+THpxlb4y9yQ+SS2zRo9OcJ+HLVwrslUM6hax6NDxxThNjzxRbkR//u
         yt8w==
X-Forwarded-Encrypted: i=1; AJvYcCVK+ZHmW5D5iI/p73gB5/5L7OqmII/a9CZ5robQVVox/kF2py7zgD8XH8C5BKPDbiAEA0nvNSS5J5NqGAMR@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbYlXX0CzM8iMvu6xBU/7O2SD8TayBqBcI6iDyM0JZUJC8DvF
	roEFiijLq8Hm6W/zQN+hPq9865PI7V9paip6IH9/fOADOgb4AsNT5jxcv58tdlorjzm9gDUy+9C
	xPbbUbELK/iTuTpx9WPE6/fusZcIrz4WR3Pbhx6Q3hC4++sTJRQnHjSF8cK11rserAMnb
X-Gm-Gg: ASbGncsq/ZSzYYASslA5hGqS119LlG1LPAjnGwHhPO6KHBAjbd95vGSxyg+W5fkXvDo
	43AsxGjJST182/BnHP2krVag/TciUNnjhy3JUVE4xbYb34z9sk6w40z/ynGFU2E38kVFMa1K5eh
	BKifWTDmACsYhCrerelxHzfthCgZ6SXRBtIN1n9VKQGOc7AfKm4LruTcqkHxjKpqnnT5LFPes4+
	5mAhJAjhFM5NlbAuefs7ufM2oA0MoAmSwt1N85gWR6vE3Riysnmt07fi51XDexvsDfE7n8J58GE
	rci8ECmM9jbQNBe98uefHR78TmyNZ4yS4fFy4J5SDadU1wlAxKpHiXN1tInyjjCWMQSi//i2j08
	wq6vFQ2OVzUqHm8xdKf270g==
X-Received: by 2002:a05:6214:2627:b0:70d:bcbe:4e79 with SMTP id 6a1803df08f44-739464ee140mr51773686d6.6.1757325616685;
        Mon, 08 Sep 2025 03:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE47Hk/U9dhX2DbPG1Fqipq+98Vftq1E+WXGEt5z7yn0rJYJRaa3YNN05gx4rx6HhQF6gkiSQ==
X-Received: by 2002:a05:6214:2627:b0:70d:bcbe:4e79 with SMTP id 6a1803df08f44-739464ee140mr51773366d6.6.1757325616007;
        Mon, 08 Sep 2025 03:00:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01af44a01fsm2168466866b.23.2025.09.08.03.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:00:15 -0700 (PDT)
Message-ID: <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 12:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
 <aL6nZdJCKmnWcswB@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aL6nZdJCKmnWcswB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: syqQvxth9oKNKETOS2B7Y65kGd8PDxI8
X-Proofpoint-GUID: syqQvxth9oKNKETOS2B7Y65kGd8PDxI8
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bea932 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dID3koFHavZth2WqiVAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXylRql668ZoGD
 OoCkORIm5bZKNaGcNkuHgrukb+GEFXjb3a22tv9MQfUdG8yctCu3THDMOmu/jkG0No6jyXRD1wv
 1CfKP/ur670n9nqadZQEikmVY7/WXU2oEkHn6IQLoagTRR8Sp1lMeGuQH3UNIEvdaamAdbWepSL
 rLhZnOS62f2moph2W/i25CoMdfRa0AlyUtMB8tEhL0WGBcLCLa/v406qoOwan7ph6aHiOr7Aeyu
 MgMi/XtwFvxLI73pzPyS/7liShlvavJ/NtRpEruDwgyuL9VdE0j0TRYOqy/7X5MJZA66zNPxWjg
 AWo2r72peQju2cWfJPEfqxhdCFyMyC5QFsd28sVyF31QCBCjyhMDDdCwKpIwoDpxGwgY7Y4J7po
 eoOCCZQ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/8/25 11:57 AM, Stephan Gerhold wrote:
> On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
>> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
>>> On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
>>>> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
>>>>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The CCI clock has voltage requirements, which need to be described
>>>>>> through an OPP table.
>>>>>>
>>>>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
>>>>>> (which is a value common across all SoCs), since it's not possible to
>>>>>> reach the required timings with the default 19.2 MHz rate.
>>>>>>
>>>>>> Address both issues by introducing an OPP table and using it to vote
>>>>>> for the faster rate.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> Using an OPP table for a single static rate that remains the same over
>>>>> the whole lifetime of the driver feels like overkill to me. Couldn't you
>>>>> just put the "required-opps" directly into the device node so that it is
>>>>> automatically applied when the device goes in/out of runtime suspend?
>>>>>
>>>>> And since you need to make DT additions anyway, couldn't you just use
>>>>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
>>>>> use that for e.g. USB clocks as well.
>>>>
>>>> This is futureproofing, in case someone invents FastMode++ with a higher
>>>> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
>>>> clock which would (marginally) decrease power consumption
>>>>
>>>
>>> If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
>>> then I would expect a separate entry for 19.2 MHz in the OPP table of
>>> PATCH 5/5? The DT is unrelated to what functionality you implement in
>>> the driver, and that would make the OPP table look less useless. :-)
>>
>> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
>>
>> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
>> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
>>
> 
> The 37.5 MHz rate still exists on X1E I presume, or are you saying we
> need more changes to support those odd 30 MHz?

Yes, any corner over lowsvs_d1 is 37.5, sourced from cam_pll0

> Personally, I'm not fully convinced there is ever going to be a use case
> of someone using a "non-standard" frequency. Even if "FastMode++" is
> invented most devices will probably want to use it.

Not really, there's no reason to make your i2c bus go fastfastfast if
the devices on the other end can't cope with it

> And the voltage
> requirements we're currently talking about here like "low svs" during
> camera use cases are kind of negligible compared to others too.

Again, this is an I2C controller that seems to be associated with
cameras.. No image data has to actually be processed for the
communications to take place and you can attach any odd device

Konrad

> 
> But I'm fine with either solution, just wanted to mention it. :D
> 
> Thanks,
> Stephan

