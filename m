Return-Path: <linux-arm-msm+bounces-58203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A424AB9AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5C15021B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352A9288DA;
	Fri, 16 May 2025 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9dlIQuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852C226177
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394290; cv=none; b=Z0WrYEAozv1sjnvmLWV660skjgWyT9Nt1tn7kXUvPxIONQYH7vwfAsQ7T4TLDYMMGfuZwNK6DF4Swm7p9jzzJJMYgqnKQllBD4bh3i+fCRbJh8fMfRCqtLDGoYa34TwQkyy3S7gXM2/fUD/MjgbCdHw8AgnrgllAKc86Z0jtYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394290; c=relaxed/simple;
	bh=2j5qkobccot9LL1RM0m5iDEPEb8bSMGKA6Syb6/7mEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJXiIJ//7+eCD7o8kYqr5TqNbjNUSgAlJoSgaiwQQQKUd05cvO8LnwKYgdGoESC8GM/Gk1MioN4NhF3r3fZuLTfihcXjU+htbHfZaYwYI9T2TAJnn9qqdQFxFUdjzBXKT08dB5RXn6PRCx70Ps9eRUIRD9rZP/NylL/tKspX/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9dlIQuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4MowU014086
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3I2uY5YtBknRZgs8vRXNey7xsxmE+I1qZE/v1ysmnR8=; b=G9dlIQuWI1U5kXYF
	bfOSZgrRVn7CQZW7eBn5Z/2HgDKBRXwiHibG0WUNAAmj7pZ6Rw+BDKjfp0M8HoMI
	BqSApYwq88Uq7Aiba2k5ujcYI+56peCzsPl4bSmXc1TVIvcZTGwOGH4FNfoiTR0y
	GEOahr+90WUdNaqGtwgCjqtW2hCm1coUVzp0EUWFae4AuGMd8tfuRGGv18i4rX0h
	g4IHY7sURdf20ijRqFJC3Q2vL9vReNSuDXOseAjQgAWBSdGaQshQKgw4yroRwDat
	Zl5Xb3UbwrwhRfgInxtvd89Y+/S6sBo4ZAVNwwJoHMcNwO2xaoYU1ZKGDt+Ksu1G
	Ak65lw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9js630-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:18:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b297c78aso1804916d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 04:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747394285; x=1747999085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3I2uY5YtBknRZgs8vRXNey7xsxmE+I1qZE/v1ysmnR8=;
        b=Ng954eJxmOO6qj1YMWCo18ATLKOJ148r8wqygv7qgzCmyTeOOO5SPXwmZdyfgchxhh
         CJGyogUejbcCPTxOFjVZSbj6FW0TM9hdz+GdNSxszlPwwpvz/ksY1Ac4IhGBhwkHrFIE
         34OfYK9yKHDqpREar1IoPC1LgFtqlN/V5eaqZSEyV24SdEdUbA/alAi64i+JKMoNoDfk
         k8eoL7c4OBGVgcbpn9KdtUJwrmlSnHc9gm5HFqZu+hHYzz/HY9pC6lu6xcixUtaa+VSF
         MJrZHgi000UZOx4OhIV4zvAujbYk5Hmgjas+O+t5Rr9BPG/wR9j8gBTAw05QN/iJP9nq
         +wCg==
X-Gm-Message-State: AOJu0YxWPlQSL8exsYyhtln6uYxkXFyg+OVNJ8rG491Ye4MfjOhV52WU
	3mgp0YBvOEX0UXi4Q+E7zpuJWdAqZPIx8q722AaFZyMrHn03tlBjfLPUPSnbTb/ElZFDUyxbHK/
	NY03sUfzzKU6nLOKPmSVgXe25UGH1AUxljgYaZkATQ/BwblgN2EsTm2WyMI2QgerpRaj+
X-Gm-Gg: ASbGncu/i2EqrvUcx94jqhxXEDeiJgjXe4seYKqoa1NYHfq5RYcUPV0cxrBemOt/c0y
	qeb5APB3LdSoJo4WrAmG3NuP/r+aRSrrc5HUYDZZKF80yEHZtguS3Zs2dnfUVNB/diQvr89cCAA
	lwe+Qez+VTCt3WKmdvB0uX+AqWOeGaG9PCbRrV3NfXaBV+hJ2jZXTajayK97Llf40meFaGATebL
	n2n/kNRdxy0LQ9lds7IRBM9DxmgIaFSDlCcFRZrX3h2dtuK4BV5b0VI6yDx0nY7RNE9nNHCBzJ/
	mEvRALGrBWjyQoKryUuYEZvXCJ9p26g524wWoPXlmJIsQIQztOdeWfmovv7iH2eLCQ==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr20320746d6.1.1747394284652;
        Fri, 16 May 2025 04:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYedXsXWaYRFu3TMFMA0Ooxjh8cjz2T+AoU7nKygC1w6HBVJRE7mCkn7yTavhKYax2hXyneQ==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr20320616d6.1.1747394284092;
        Fri, 16 May 2025 04:18:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502b03sm1287390a12.29.2025.05.16.04.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:18:03 -0700 (PDT)
Message-ID: <6274641a-7366-41cd-a0a7-a9e9cc41b8e6@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:18:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
 <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
 <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V-DiDNYsCwOrfUCua3O33bVVsJVFEtR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNyBTYWx0ZWRfX4JkWK2s9R9QW
 hX8TGXJ9tGVQgyHoUyQHWQ8uitUjzHAwcTfOn7PUGJDbkTgLNvIEl1hBpsyxgsw2OJ48AWB6Xa6
 w++GGrJeqFp2OyHqoigm3HoSebAi5wGCNuy2pxre6kZX5JH0JhO+Bn4XG/nNJt0gmcAxlZIsDTL
 osWI52oCuBJ24wPFBrDWRDHXQeGwBUJzWVcFZfJaQfDA2DaCKDWdLLi05m3fOuCeNwtX2wLPTHC
 L/H3SUxY5NZ5RqXeZHWeMVjrnI/h71WmPPafIH0rEwfohO5a4O8RPBr9FDfNuKo8SiqwOd7eG4+
 zZRv5uRjardi8/Znri/59KzQC+iNpcm1WYgsDojvkFsuQxY6pHjJpymhzMGg6EnajBcLJlMd6gY
 ZlJ6EtT4lHXRlCHnRtP83Aqe3WKQHthpIlgUoj7AQXcUgzfvBMiWegyCylV0LIN5ayP+CVqq
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=68271eef cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IBNWLNMZBAz7KTYeBUwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: V-DiDNYsCwOrfUCua3O33bVVsJVFEtR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160107

On 5/14/25 3:15 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>
>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>> +{
>>>>>> +    struct regmap *imem;
>>>>>> +    unsigned int val;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>
>>>>> That way all platform specifics will live in the DT, requiring no
>>>>> hardcode-y driver changes on similar platforms
>>>>
>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>
>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>
>>>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>
>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>> Let's call the property qcom,restart-reason and only pass the register value
>>>
>>> Because we may have any number of crazy combinations of various restart
>>> reasons, we can go two paths:
>>>
>>> 1. promise really really really hard we won't be too crazy with the number
>>>     of possible values and put them in the driver
>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>> `bootstatus-fanfault` etc.
>>
>>
>> Thanks Konrad for the suggestions and the offline discussions.
>>
>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>
>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
> 
> 
> Konrad / Guenter,
> 
> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
> 
> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
> 
> imem,phandle = <&phandle <imem_offset> <value>>;

the part before the comma is a vendor prefix, so that must be qcom,xyz

what are your plans for the other reboot reasons? are we scrapping them?

Konrad

