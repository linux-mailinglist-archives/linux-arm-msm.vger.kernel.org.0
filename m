Return-Path: <linux-arm-msm+bounces-87120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097FCEC226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E92130069A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 15:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A122749C9;
	Wed, 31 Dec 2025 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAOPOTct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VosMBU5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16B2494FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193454; cv=none; b=nZcQPtgaZcLkOuvnr1UID7JdsJai7bq4OoIrcYwtHOiJyl3bvexHVJt4hFwe75GNMxFhzhnK5+JhmcOj9XD4A+tzWHsL6tb3qLkGIWazZSJaar0mwcQ+F1tb9CRYCowc08G5SUmIT3RnQKZsPHS6T9xRQa5RwepV+kLexcQzKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193454; c=relaxed/simple;
	bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thg5FNAtN6g3uqPZr+nCupGfjZOe1ZmAhlVPDll3hCBPQMVSBJ+hkAsi7BZG9xHmSuQQsa/0M1K30O3VlVb83QhA05e+dzRBgMfMCqLiy4E5LhK5ILR1eF1nlqrblBfljLcTmMg3UxXSSXeA61wLUHZRyiQjf2OM3HrotsRm95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAOPOTct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VosMBU5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAjDAq3368818
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=; b=EAOPOTctdPz7f4gD
	uzKPZdaB1B7kBNOGKCGCGk/l0zPiIiOeKV1W/BFwopiBeV9QBzQseAP55tVda5TJ
	kX2NrfwaWGjRvDrzxShh/V8fc7Y5s0FA2URouPcp7Q1W189jHekPQgvLEhUpveco
	4FXTrHsJLcQDWBA+A+QFXlYYwJ4L3tLHO93XORvEf6fu8u4ntrP2oe1Ts0RL8tzI
	iF6NXkpw6V06II9Rm3ZmuQoGppfPPrOYxh42qk+ljEUVR76C7ulkmYpubAtpw65w
	pI3+2/1I845dcCB7jKs9hqe+04gheYmIIaEmt++PbukJfRupMAgAJsN5fHoVnvkG
	4gLtyw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb0c9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:04:11 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-645527c5474so2602629d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767193451; x=1767798251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
        b=VosMBU5lU4RjdY9QmUogN36lrnZehhBq043SJ+4//HE9pU46MBi+MkSvtHMosT5r+0
         MKFWEN9e9oeCBOzaEayrSndgsqzDmI8OS90N/I+gKkrgBxgSxrOJ/ANkODvwAeHrIMtV
         VkuHbqp137yuVSj5Iu0ePdDAQzFWYoThTLSXEYfvvue0oaHtq7+D0/HeeqqKLr8oiayz
         4GpOFcYx6PbKdHeKtow5uZ+0g9ejn+So3/Yud13hziFV7LktBpqceUjx+F68bjSCodOO
         Zd7nuUFFt1lQb5uCCnFu4ph4tl6ZP5AmPcL0qWKszljnhUa0mmA1YiUOfvOTWHsV4VyQ
         3xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767193451; x=1767798251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
        b=tj6DNhvOITVtgpRJ49BwpiHh9AEgRusAnHWoZX8A3INljBbvdb9B9qYvWxIOpqPTNE
         u5aGVrm3egBnfqu6DnKkVqUUg0FOgNA6nVlM7wgTvmVRM2f7xMv2OpcjwiuhtYvQQozu
         OSOCuO0zOY3w4dGafGAz77qycAh5zqT2ySczRemTvODTkDlrRVJJ5Mf9Hujw/RhBvz9d
         qBiwPDVKtuM2AIw+T78mLJ7F8pfGWKnf0vJW058s5BBtdo+sRzSVcOXiKrtbePrvXTUX
         ah6rR8z91y3X/qcERWPIKsjLkp/+eGsIlArHVaOlg0oXxmnB0pLQSglDtaELPeyuhXmg
         vJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrSi0p2GI2UzwcpcsLNYnBzYabv81r8ob2f811YgPj6RxhjRHzN73m6DAYyN7Lg/3wVFl43oY5k7Ptixm6@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4ufEMDq8qMthJVwHIi/u9aXqWJKswYDhP+DUke3vhYgbXUMm
	ae3HehDDlUAZItBavcVE5dBntNr3YB4XH+RRJ39nZOHmHd1qfRg+GKxZKQDfBvj99OtlLrlNSVG
	0ka5DeoR4KplFB0rJRimzpHlAy08BRk9oBdomt2uOSw0KjmgWHoJo1co38qfVkTFipG5q
X-Gm-Gg: AY/fxX4P3hahQUqgIDXuNQq2HlR54NhPnPPvfsfUmysY55oJ0fkzpoaBKjrgOR5sOl+
	5GYee9N6oV/edx2pNy0n51qsNLbrHsgfoMBPmv3E4eZD+brvZca3QstBJ/C2HSF44UhFPWHWHdz
	QyTSFnuovGcKHAnFPVsdRS2ULz7mxdG+hSzrTbQOvMrUO0Q2Iermkxlw9FAnIg4zsuvmVfLLBXU
	1MGEC/jos7ztvxQNJqQ7dA9dS/8MqgyOYuidBE8FR/kqhuAzyAsX6BvEEdQ+TJI8YdoGL/1bLC4
	Ze8kq/gJGTD/hcJ3YxC+mZRLDPoyDnupj7VPtTJm143b9tBPL+pibH3weHL5KNeB5dBoEIK4zQG
	ERBEeE8MvIdsEBP5StoOkklLPLVGSuI5Ni8f27Ng6WnVGyYzUS6dbjfTc3PVeSy69qw==
X-Received: by 2002:a05:690c:fd2:b0:78f:cbac:51f4 with SMTP id 00721157ae682-78fcbac5d51mr228668957b3.2.1767193451133;
        Wed, 31 Dec 2025 07:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZD0JhovC3u04T9aejPVSNFPquL2HuV0SmdMjnlpa/Rn6qMkTE3WoEauL2oZuBHYl8loIfEg==
X-Received: by 2002:a05:690c:fd2:b0:78f:cbac:51f4 with SMTP id 00721157ae682-78fcbac5d51mr228668537b3.2.1767193450561;
        Wed, 31 Dec 2025 07:04:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdf3sm3998770966b.12.2025.12.31.07.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 07:04:10 -0800 (PST)
Message-ID: <482fcafe-240f-458b-af56-eed1b19ad19e@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
 <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
 <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
 <12650361d3a0e0444e9e10e26c5d5597@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12650361d3a0e0444e9e10e26c5d5597@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rgC2FW5yYylOy6MyaNG6XBw9HwdssHhi
X-Proofpoint-ORIG-GUID: rgC2FW5yYylOy6MyaNG6XBw9HwdssHhi
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69553b6b cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=j8Cu_9a8AAAA:8
 a=8VC0GeoxRXGp83daypMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzMiBTYWx0ZWRfX3uXsROJ944fK
 nRWcqUUQ+2yTXaJ2tgVs5OSF80yiM10svH8JaQ07F7xo/Qglq4KekUoDDR23IdcQHPLYC1ePwXT
 nIg4Cupu/z5wVyQUU48afYtQCGdni/EhJnTCIdg7nx7Ru16iGH3Yr7QW1XpLSm3XYW1AB6UR04m
 GjDv8Dn1LWC90wU6IyGxEUohm6GAm9DO/rsWn4BWmEqHmpu9zspHBtW/Zmh78GsviMCkjscA7ON
 a131YVJn4GhkaqIPcTLTUqozmbMIgeJw90YluQFdYHPi7QBAgCv9PFbppSzlOB+ayHBYhSXvcd6
 1EUQmGDXQQkEadIrpvdkO98v9JE6D+tk52galBcXzCUeCRB+gbTAWVC/EdCRkMfOsu90SsTjPbY
 /5FJ7FQPss6YPmoBTKE1NsDHXYlJIDKZ/N9FAFPvJCs+9w9ads7/pE0LMumVuhP4Ay677Ri8CVj
 7aiemTa61Pd8wKjzupg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310132

On 12/31/25 3:50 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-12-31 13:27, Konrad Dybcio wrote:
>> On 12/31/25 3:29 AM, Barnabás Czémán wrote:
>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>
>>> Add support for MDM9607 MSS it have different ACC settings
>>> and it needs mitigation for inrush current issue.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> [Reword the commit, add has_ext_bhs_reg]
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>>              val = readl(qproc->reg_base + mem_pwr_ctl);
>>> -            for (; i >= 0; i--) {
>>> +            for (; i >= reverse; i--) {
>>>                  val |= BIT(i);
>>>                  writel(val, qproc->reg_base + mem_pwr_ctl);
>>>                  /*
>>> @@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>                  val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>                  udelay(1);
>>>              }
>>> +            for (i = 0; i < reverse; i++) {
>>> +                val |= BIT(i);
>>> +                writel(val, qproc->reg_base + mem_pwr_ctl);
>>> +                val |= readl(qproc->reg_base + mem_pwr_ctl);
>>
>> Downstream doesn't do val |= readl() in the inrush-current-mitigation
>> case
> I have checked you are right, thanks. 1_8 reset sequence have it but 1_8_inrush_current have not.
> As i understanding from downstream it should be handled in both for loop, i could add an if for
> handle this or implement 1_8_inrush_current reset separately. Which one would be the preferred?

Let's do the latter - there's enough nested 'if's in here already

Konrad

