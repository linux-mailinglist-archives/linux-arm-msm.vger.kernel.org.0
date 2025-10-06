Return-Path: <linux-arm-msm+bounces-76057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B1BBDF6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B017334B0D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44B51FF1BF;
	Mon,  6 Oct 2025 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmRt41tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0427990C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752541; cv=none; b=ZW3ZQ+7w9QQ19042hDzdM3TV9TDrYRG4sDbOibmEndTHCRDKuDi5Ewv9qS6D5lmamDQYbIyPkhzDVY9kr9NC86vnLDa+Htyy5JRhI1plAToXNMviJ+tveyP2I9O1WtEA0SIn5EPeGVI/5jwFbKHWUPRNfIiTPt4EAl7py9IDZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752541; c=relaxed/simple;
	bh=hrqK/XFzvEiAZUlds01NLi1j42ROedVIuEKHM25cYJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMpX1F7SlBncNSTxl9eVvA2TEDx3V6AyefIqr8+Ywxw9NrY5n+1bLIezgv8WAxgbhHFu8b0bCi9TOSpVtEzWX/Njp4UbLM6/uTdY8qoPTrBXawmGyndK/nBXfnxH74lF4vKIVok+s9dsOPiF6dI3wvckob2rW+OqM0SreGN+zX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmRt41tv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595KUTER006173
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 12:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNgg2RXM9k9KELLP5e9ztNxYJsbYYa1dg1GbAma4nx4=; b=EmRt41tvImqz4VUv
	355WGeyN0Gb4/ActV7Oxhv+/xm+uUOypwaqvoVmPKy3IiXT2Htol6RbIU7i7u9q2
	iOWLsMh+gJNLYoPFAURdBMUOPnVaZToYFyzD3dbn7I0zr6z65yst6uerMhIayNpk
	m3j/3jQ2KriXVc2R8keIynL9H1JKuO2qqQaH3lr3pHKOkEnJ+3ttYjYhf+NB8vKU
	sCbLV7TzT6zsjK6DTSi3WEQyhK0usLwJfDY+sPf7BkhglMkTZt29t5qGrzRuU+8x
	QspsoMgH2UTBS0bf6k1t/TXoW4PFAYTJVuCq6JwZxEHh52V5r2KOL2nK03hbznoe
	lN3wMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6uugq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 12:08:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso17666371cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 05:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752538; x=1760357338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNgg2RXM9k9KELLP5e9ztNxYJsbYYa1dg1GbAma4nx4=;
        b=dniViwCR3CfsWAvA7EsrIu1kqowQjB8Sj5Kf/F6YpXJFRdSHYa1qiQ2vJhgghJ+eVh
         /tuNAXjbzOvhttzG36oj9zwsYLvK5V6BUgBmDUlABMDvXGn5VCChXsOmP4uBM2m+N+Tu
         9/PokN31wZIPKo//MHPcm+WHM4Bv4xtfQbabJAIYDTzuPfA5fg2uk95CsXsWDipvtPF4
         5KXlVdih+5rlky9NdDILifskhAf42RCJdBhF9m3VYH1rpyjV8W5V+oka5GqNXkG0ja7s
         mbWBYR6P3/j7Y67Xvfha0/NT5Q5bvZvKGQzPQujFqSoUAarTYvUg90vi3wQb8KmtPgp/
         5oLw==
X-Forwarded-Encrypted: i=1; AJvYcCXT3XmBnPGqmQ24xMTVzG57xbzwwkeizmfeEHbEXyX1Vzyg31pRuqgH19zP+WBR4Zqpw3rK4fcV5XYIVs4L@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbXhTETeQu9sUUzsN1YhZQhD12z62UxT3PDL/TXDFXc1wwEt+
	VnLdmI9YmjMwulLmV/JvzZ2/xksSbij7Fp/F4fBFK2l5hNUrdaQXGiPv01yQCHW52hVgDIMeMsq
	T44pwedY1ttv9UW/ewL6U8ueSBsQeXDurshHZiZqSkugR4+Ydk47okCIbUAqJKO8CAXK1
X-Gm-Gg: ASbGnctxdgmVQR/GoMSP8vMHbmFYWP94ygIfE5+8MuMgjVQ3GOpdv75NthS9YMewBuL
	eUG7BBl6Q7gcIH7+ns2ZO78exKUtG+rpzCEXUCjRYCaR0TL+5jIeGL+kF58S3+BQvSU7JZXqhaB
	7ePiYSUNDsskhncvN71T28/Brgx9uef2N5IJ+kqOOeK1o/oN3dRixAfsHLFvxXJnsGt8fCtszuC
	fGiFTyqneGHbtal9N69nhnMjbqoFfbKq4xYNNf80K++fm6b1fVtZP3qdNqhre+uGlb3ykU2spOH
	eFVQ+2CtE0hLlvthD3W3nNxnx0EvLF4MJSK5syX8hBwcip+3emo++uKPe9x3OfTMbP6KMULOofc
	vdTGa39F9nyQaYjWIgZAtfjRWwG4=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr107262001cf.10.1759752537625;
        Mon, 06 Oct 2025 05:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8bowU3R1TIDKe1GmveF4bSNUeYIkMMrOzWhLy75q+bqmvRg7vOQ3n7jj9olpyE3GwUkaAtg==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr107261611cf.10.1759752536958;
        Mon, 06 Oct 2025 05:08:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83c85sm1134746866b.27.2025.10.06.05.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:08:56 -0700 (PDT)
Message-ID: <7875ad35-366d-4480-979f-426f5760aa2a@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:08:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-6-ghatto404@gmail.com>
 <f032db60-d625-4814-a5c9-0610618b7351@oss.qualcomm.com>
 <97CA26D8-2CB5-4F90-A4C8-BCD81C688F35@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97CA26D8-2CB5-4F90-A4C8-BCD81C688F35@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX9Ef9KmcYHo+Q
 EsBQv2bOGQaUZple9YQjNDo52uCFzyBfilgMsD4nWUVvNxulxlHZuMftFs1WzyeqQ96REiKxNwJ
 M4LOLOBm+ZJu+mclpO3p0Xec1/gKAPRzKCVU9UWiZ+x2eSrH6Ldzk0ZYWTJhJmhOT1C+Mq1zu0q
 wYGb/8h2iQMot1z+mICmnm5rGnrPQov8EgVfeqHkP7sb30dWpqiPsQteDwVK+G/9GwJootPs/1K
 gLP8vpBH9o4JGMU9CoNcFBYmq1mXSUEWeVbsnk3lzD1IB1fnA19auLG+XZNY/iegwme2s17uKsg
 B85Dq7FlOVDFqH1LJqOUyeWZR/+6PjMSMkyeZtEsTOt57GTm8H2EG0ZBbLpDtKG+97uLdRxvct8
 TKXKMKv136gackzDrTxBTmzoBL3k3w==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e3b15a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=55atk-L8scUrgOgygXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jfjPYQPNgKSj9Q_GSGtw6ockx7xCrfC5
X-Proofpoint-ORIG-GUID: jfjPYQPNgKSj9Q_GSGtw6ockx7xCrfC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/25/25 11:37 PM, Eric Gonçalves wrote:
> 
> 
> On September 25, 2025 10:07:31 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 9/20/25 3:46 AM, Eric Gonçalves wrote:
>>> Enable UFS internal storage of the Samsung Galaxy S22.
>>>
>>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
>>> ---
>>>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 39 +++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> index c088f1acf6ea..0a55ce952f93 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> @@ -146,6 +146,24 @@ vreg_l5b_0p88: ldo5 {
>>>  			regulator-max-microvolt = <888000>;
>>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>  		};
>>> +
>>> +		vreg_l6b_1p2: ldo6 {
>>> +			regulator-min-microvolt = <1200000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>> +
>>> +		vreg_l7b_2p5: ldo7 {
>>> +			regulator-min-microvolt = <2504000>;
>>> +			regulator-max-microvolt = <2504000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>> +
>>> +		vreg_l9b_1p2: ldo9 {
>>> +			regulator-min-microvolt = <1200000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>>  	};
>>>  
>>>  	regulators-1 {
>>> @@ -370,6 +388,27 @@ tsp_int_sleep: tsp_int_sleep_state {
>>>  	};
>>>  };
>>>  
>>> +&ufs_mem_hc {
>>> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
>>> +
>>> +	vcc-supply = <&vreg_l7b_2p5>;
>>> +	vcc-max-microamp = <1100000>;
>>
>> because you set this, you should also set regulator-allow-set-mode and
>> regulator-allowed-modes
>>
>> Konrad
> Why is that necessary?

Because that is then translated into the mode selection, based on
the aggregated usage

That said, you may also choose to omit this if you want to run all
regulators at high-power mode (less efficient at idle), which forcefully
ensures you're not hitting any current limits 

Konrad

