Return-Path: <linux-arm-msm+bounces-69207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D5B2643B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B2F5E21C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4D62EF66C;
	Thu, 14 Aug 2025 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxg8T1Ei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4FB2EBBB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170842; cv=none; b=SIFzBWQ3JRk3YBeEchDK2pcb0AAKf+Zj5cSE2PtBFJ95UgoRZYgAEprxjd7WyVgyTv0D+p2Nw+O0xRyobgW4rwW0JL0NTZ0/0TTwaNEosn/F1vV3jI1xNwGdu+6pv/RTN48CfUOWITDa88JpsHiT0aov3K2IL81MPwrxWimTfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170842; c=relaxed/simple;
	bh=48tAzMVD40mXj8PB2BiEi7B6j1poHkoi0f43NUhjxlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y08oTaQr1vtfwEAIcd97CufJfHQX2SZ5cK0J+UaAfwYo76xo9hl1JMjWiX2wn1K8Vgwm3WkpDExDdOEIYPVG/pEDwRGwC1+jB0mwsiqTvwRwBahqLW7p4lAIdDQ5xGaazNo7k9Sj6CIudg+Z35LKiwOtNgYZjIy74hxBkOcZDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxg8T1Ei; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8sdjm031964
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvsGtU8EQVIVsNLvkznVXlqh5U1/8tjeUVO97mEHdw8=; b=dxg8T1EiYL9OcJwS
	5mzMdXeaqv222a/hfOGO/LDSP2ifmAk2SRanZBzWs1waH5nr8tkRyukja7LjhrTx
	0iz1QgJuBRzfcDEySMoRDsHuIAMtYH8J+20fac5nyNGJyi7xs2kIO5j6ayicbgYV
	mY/Ic7p7/YB3YGosS263/N3J1AFNiOtPAEsC25NGLeENqJ+etLSzydaR3TxgtSXv
	Ofq5RlAvt7Ys5+GS197TyKy5bX8PIS/jGDp0D00USFk39nxVMB8H1Ig+iQZxch4d
	OdgWJxV/BfyRTfH9XmtihLfXkxqMLTB7yudFNlBD/tCAvkKoKTDtrG4fH7Ll+D+h
	zRHomQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4kety-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:27:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109af71a5so4155041cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 04:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170838; x=1755775638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvsGtU8EQVIVsNLvkznVXlqh5U1/8tjeUVO97mEHdw8=;
        b=ogCfiz1VjToIhOr7UA662V3dt+OaQ1IgKESgsvwX1cFTUtjBSm8m5BuOushex6VvnA
         5+Q+CueVeBPRKf1cG1yChLlgaYDluv7hxAGTnlDEFephgVUNC9iCXkwEizhIXuFQXAmM
         YmVd2ZmEBnWaWVe/Wo6Wv3cWx5mi8DAMxZC+dtpDdHbtqchSA3N5EBL/XhyUko3Y2wOb
         OQI/R12toz9aMw0jnkPoWLhFvG46D9afk6yM6gsyuf7IjBd6JksuDQLojF8nkzCgtEMv
         517v0EtYHUIiyDq9t0COsIUF6OgPzO9t0QYg4rnrYtLGxJdjyvNZJNkG2k5E4prL0BMO
         9c7A==
X-Forwarded-Encrypted: i=1; AJvYcCV5aQDMwPERac5yQR7OC3RMv+TPxgwFYM4sxezxQ4MjoStOxOsvBFx9Y9pGKedL+CwjKDYAkb/eFDxaDLlK@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdDywqPOC308W/ts6fTonGHYPzPcf8dGQYItmtZQkheeiMq+u
	1rmEfaNwQumRWJ5bM7LHWfbyCtVPRtRe/Esf6ZtMJ0hr3cl8fCGU4qbjvL0wciavF2Xxdq2Q8PT
	DCrwnQ2E/huWu3CRWynmliBoFoiqwj4WrfZfWUHcW8e45AWEF8/fvrgtXsUCujFqfzV7L
X-Gm-Gg: ASbGncsswY47R3P6rcr/HvdNmzJdgVkg4nzi6rpa7kzk48CF/2oakMN9lesjD79xHAY
	MafAx5GxNyRwyEh2Gw245YuS4N9BjPMK/zeofLBNjzgKL3/Wdsyd6rUmaeuFH4m1gODAWDOwn1j
	7KvKySdfaee+2jkqr6Wfo0zYn5N2MNZpMijXsy7bF7eJg2qxmT4iern65fbo4t7BidEvgADGEfJ
	VYoH1kVshJdWAMpo0FBDkNTr/0eV3hq5EOPFG3eRc8wg0zU5Eb1viWkRrwiu3K3tgYXntmACNO4
	13TJYHl2KTl0uIDlArFMN8f513ZH6NlaqZcmgPoQhuYBYB4f75LgMlSoC3+Xdo1DD+VrN9TOIpE
	xLA/ErDlgN/+loZxOmA==
X-Received: by 2002:a05:6214:62e:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70ae7011913mr17664146d6.3.1755170838177;
        Thu, 14 Aug 2025 04:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTu7SXRxQxpz8/MLVN48BYHvT9GmSmQ485QFVu7S13NXbeVoB0o9r138fw7Vr2LU4rtD2YLA==
X-Received: by 2002:a05:6214:62e:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70ae7011913mr17664016d6.3.1755170837694;
        Thu, 14 Aug 2025 04:27:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61850794509sm4720140a12.31.2025.08.14.04.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 04:27:16 -0700 (PDT)
Message-ID: <213ce041-733e-4e3e-87d5-db0b37c410b4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*()
 errors
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
 <e35ca54c-252f-45c4-bfdf-fd943f833bc4@oss.qualcomm.com>
 <f2400037-c39c-4266-9e77-b084bd5f9395@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2400037-c39c-4266-9e77-b084bd5f9395@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X0wNrMAimUdzZ9ONF8zukxMwNAnj-a4q
X-Proofpoint-ORIG-GUID: X0wNrMAimUdzZ9ONF8zukxMwNAnj-a4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXw4orUlzkfXBp
 dvott6/NxkeBmzlALbDZe2dOLb0JbyHrjnF1CcSgjofnoFZSqgtHCa/qbRUxALWZPJ6N0BQxnIl
 foSmVmrl3FlE2HXyQBFzHd9quL/jmSLwut5FwMa03xxLz5RC8t614dwPWK+UA/io0baHdT9CfAq
 LLokNLNTnB1UrXPikEx110pf9g9Nk0p3/UQNocMCd9E7bOyzP1NZfR6ccCT56emPCUt1dB9FXQ1
 jEFchGXTwPoLGDBoy6Dzh11KlGdlbCZioy+zE7Ff4R4xqS8K8chZN5qabg3Jpsfx3f79qKSVqOF
 FEs8udHSc7ILQzBwaI+L3XLSw0hGFUzYvRJfWlWoxbUXpvRPxJu3A34nRhY6LRYM/HzlIjjRwKX
 7RkW/Grd
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689dc817 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=Y1L1eU8S7K9_Pyojpb0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/14/25 1:25 PM, Krzysztof Kozlowski wrote:
> On 14/08/2025 11:15, Konrad Dybcio wrote:
>> On 8/14/25 8:32 AM, Krzysztof Kozlowski wrote:
>>> The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
>>> or ENODEV, and if that one fails with ERANGE, then it tries again with
>>> floor dev_pm_opp_find_bw_floor().
>>>
>>> Code misses error checks for two cases:
>>> 1. First dev_pm_opp_find_bw_ceil() failed with error different than
>>>    ERANGE,
>>> 2. Any error from second dev_pm_opp_find_bw_floor().
>>>
>>> In an unlikely case these error happened, the code would further
>>> dereference the ERR pointer.  Close that possibility and make the code
>>> more obvious that all errors are correctly handled.
>>>
>>> Reported by Smatch:
>>>   icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()
>>>
>>> Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
>>> Cc: <stable@vger.kernel.org>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Some unreleased smatch, though, because I cannot reproduce the warning,
>>> but I imagine Dan keeps the tastiests reports for later. :)
>>> ---
>>>  drivers/soc/qcom/icc-bwmon.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
>>> index 3dfa448bf8cf..597f9025e422 100644
>>> --- a/drivers/soc/qcom/icc-bwmon.c
>>> +++ b/drivers/soc/qcom/icc-bwmon.c
>>> @@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>>>  	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
>>>  		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
>>>  
>>> +	if (IS_ERR(target_opp))
>>> +		return IRQ_HANDLED;
>>
>> So the thunk above checks for a ceil freq relative to bw_kbps and then
>> if it doesn't exist, for a floor one
>>
>> Meaning essentially if we fall into this branch, there's no OPPs in the
>> table, which would have been caught in probe
> Yes, unless:
> 1. There is a bug in the opp code
> 2. Probe code is anyhow changed in the future
> 
> I think the code should be readable and obviouswithin the function, not
> depend on some pre-checks in the probe. But if you think that's
> defensive coding I can also add a comment to silence future Smatch
> complains.

I ultimately don't *really* mind either, just wanted to point out that
currently it's effectively a false positive

Konrad

