Return-Path: <linux-arm-msm+bounces-61787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FBADFD3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C419D3AA3C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 05:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C4D239E8D;
	Thu, 19 Jun 2025 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npWxBd4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C169F242D7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312107; cv=none; b=oEsQ6IeDrI1e9MCuewbO+3Hl6AR5Pv/p8FR/neM+ouoL5rwOCibWzJPqMYfoulNA8ETeH4/PhKTN98frnjR60bj0WnSecU2EUHTsfx9ymOb2x74fTimyLcHSOzEC7mACEsHn3boH6XDaA/yS5nNlBJCi3Zo7BQpZOc8EfJOFN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312107; c=relaxed/simple;
	bh=s3/gZi7BvAKq0izTDcQE28ZeRUR7J1PrwtDNYqPUSgA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RmYruVOG1cBpvm90TVU4sfw3PZlNd6e7Cg/VwhwAWnuK2xytTiU/HdJFUb3Qbrev5s6U91b3IdIrlCHFqIdfwpitd2QDPDz/kitIZkE6TqLDMTMY6La8vPfSghKmn5LRWIaPJHPTG6l2kUHfNFYr3gPNvRKCmKMmTJMJj6wfCMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npWxBd4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55II21TL010987
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	++vri0wmuq+S4bVhSg02YGKQx2ZXW1B1U4mXepw29zU=; b=npWxBd4MayFb4nAN
	/pTreu4gx5S0HwfUjofGFdRcg7PWZ/IdNwJy/t6r1VKU8ZJPKUrJt8WIcg5gbOxE
	2KNkun+XRJ7Km/7GNvHyF5z8IrQC8sJgY6wP5W6nDB32RiHHO/MdcqWKhyUG1jDB
	OJbv7f8oFZYMpxBte8aESWlPzx0D7fRdZwDfhj/zFMOAo+llYuGjtv8iu/3T68Ac
	sNZjZfevBJyNgV0tGuxkC2BOppFQU4H6sozS3M87b8ivK9jX26kPT0km5z26PAgi
	65725JXp3LyS4E16qHsWSpIjC5lfnNDzCG1N2okQPSXgm2z3COimE/2cf9wx2iEQ
	xiaIKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5wang-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 05:48:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso580389b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 22:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312104; x=1750916904;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++vri0wmuq+S4bVhSg02YGKQx2ZXW1B1U4mXepw29zU=;
        b=ZAew8unO4SIwd47qIEnQRoFXWeHTp6ku0/GhjLRfMS81uInaVQbigSUwbfBCrI3RJ+
         2QbP4GKjpGZVMICJ5ZJEKcjnIHzWwLGA6LVt1Z+9+GZugAYNapn9/SpJ4qsNbmWFJMXU
         ao307iZxfShXzFEbqImBsshZ5HEW0SN9hWKms2zxDoLwAUdwaMbo0HD4gaE+KO77FKBs
         Gzo764pn78ZZOZ5wJVm77uinx/6gcFUcrkn/EMBsIqANRMdEWCixj1pTkTlRqnFk3vx+
         zzJzDD2rIe3g4+1rrWqbsjeyiZyubQME6adm3ZYTZrdSp/+SdCoRY043NlZzx3KNmZls
         LnwA==
X-Forwarded-Encrypted: i=1; AJvYcCWl/6TeZyGrhKS+a1bc3riFZ9KMWYzdw53I7bn1Tn/SZ3FL17U9UQTXtTiuFopOLQSArF9gVVqlXgQk53hc@vger.kernel.org
X-Gm-Message-State: AOJu0YygeoLobEDMWk5TfXT3vWodij3Rw35fiA/7MMyZ02oAkEHRUD4H
	/+WNa5pSF9fh7qf6yKZNDKX4P59P12rTC4g0K8KGrt6L06M57lS+L82njz5mWdomFL6T+iUJ405
	TAURKokOXrKlZaIlxr9zfrl8QOiFzdtva4+ysTSr+Aciu+KIT0fsTh0KCpZj1Jf38Msb6
X-Gm-Gg: ASbGnct0Avn8tzDuHMQYWky/LNLcg1RinfMWq1q3Uhtvd2y+m4v/k2m1meMcF4DIrQW
	5goTQM5NY4CEiDVzwYS8X0nHNe2rzQvIqmBxO7B6E1ETjKE+1hOcXTLFRxNucustp3tRiKhT+u6
	BE/grh/dhK3WWLXz0Mg+/RDXw135F8EQtuO7UQXPuSq3nRIZw+bNuuoBkzZemiR3N7RZqp/LzWo
	mFWvN3Fp6ZXPekDzR5Ja/eVaA6BWhPNo5y0jBr/36jwEC+pSQEbe9U8NrXDJm40/pKbNYi77HFY
	O5Vo5Nm18xuCVEPljDcRpxKyAsxc2Nl4wGDSSUBFHMTq42LqGKY2szHs2Xww7UU=
X-Received: by 2002:a05:6a00:10cf:b0:748:e585:3c42 with SMTP id d2e1a72fcca58-748e5853f7amr7330822b3a.15.1750312103693;
        Wed, 18 Jun 2025 22:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxbSYLcz+kWJraK0awdmVZZ0F++vhAr9IPxIQoqQJlXVvdgdCjVBs460bnIYuvcegcI88ww==
X-Received: by 2002:a05:6a00:10cf:b0:748:e585:3c42 with SMTP id d2e1a72fcca58-748e5853f7amr7330796b3a.15.1750312103305;
        Wed, 18 Jun 2025 22:48:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccfcsm12279470b3a.4.2025.06.18.22.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:48:22 -0700 (PDT)
Message-ID: <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 11:18:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
 <20250610180345.GA2382213-robh@kernel.org>
 <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
In-Reply-To: <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CoTC-6iMx9pZ8v_0iaRBOPq5gWOheq3W
X-Proofpoint-ORIG-GUID: CoTC-6iMx9pZ8v_0iaRBOPq5gWOheq3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0NyBTYWx0ZWRfX1B8M383AslgM
 fz1bW5n0hu11hXrwgVFAhc3BaZiQd103TSkdqxfMrAR6EekLUcm4l4h84wz+r74M7r+6iXF3sBL
 Nz70NgaU96Cz6HIxefloLv0mM5uZYFEfhq8QiWMl0iDoud0Ym6d7pJ3TqPt1RUsaaugGth4cq4a
 4glhX08eve13s/R1iaZJRsjhLMvLYkQqp+37ym6axe0STwnvQ2oGYKMsE3A9pBTBUryOpLaBqZk
 aq9vCSDPZUucAZ7ZUN4sMrYLyMJK0z5INH8qDNMcMljzkkcghtEfX/dyO6eT9N42ZQzrEDb0txY
 tx4Yxvl6OVlZOMilk986ykQc0575p4hNEC7AE6s+49isdvk0WYEWKOEt1b9DUu61NZNCl8xeZcV
 erBLQWkPuZq3UdhTYpNvALxdXj4wi0tHFduAuW/Ofb7/2Hm7IY/gfMegMZ87ePow5xAfA34k
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6853a4a8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NzB-Z5k-UKuyH_SqCfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190047


On 6/16/2025 10:48 AM, Kathiravan Thirumoorthy wrote:
> Thanks Rob for the review comments!
>
> On 6/10/2025 11:33 PM, Rob Herring wrote:
>> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>>> Document the "sram" property for the watchdog device on Qualcomm
>>> IPQ platforms. Use this property to extract the restart reason from
>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>> entry with this information, when the system reboots due to a watchdog
>>> timeout.
>>>
>>> Describe this property for the IPQ5424 watchdog device and extend 
>>> support
>>> to other targets subsequently.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>> Changes in v5:
>>>     - Rename the property 'qcom,imem' to 'sram'
>>> Changes in v4:
>>>     - New patch
>>> ---
>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 
>>> ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml 
>>> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> index 
>>> 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 
>>> 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> @@ -81,6 +81,16 @@ properties:
>>>       minItems: 1
>>>       maxItems: 5
>>>   +  sram:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description:
>>> +      phandle to the IMEM syscon node that exposes the system 
>>> restart reason
>>> +    items:
>>> +      - items:
>>> +          - description: phandle of IMEM syscon
>>> +          - description: offset of restart reason region
>>> +          - description: value indicate that the watchdog timeout 
>>> has occurred
>> A 'sram' property points to an SRAM region (see mmio-sram binding), not
>> a syscon and offset.
>>
>> The 'value' should be a separate property or implied by the compatible.
>
> Sorry for the delay. It was a long weekend here!
>
> Let me start with the requirement (Please feel free to skip it). When 
> the system goes for reboot, Xtensible Boot loader (XBL) find the cause 
> and update the particular offset (in this case it is 0x7b0) in the 
> IMEM region with the known values. On the next boot, if the system is 
> rebooted due to  watchdog timeout, watchdog's bootstatus is updated 
> accordingly, which this series tries to address it.
>
> Based on the previous review comments / discussions [1], it is decided 
> to go with the above approach, i.e., name the property to 'sram' and 
> let it points to the syscon region (IMEM) along with the offset to 
> read and what value to expect. So that we don't have to touch the 
> driver if either of the offset or the value changes across the platforms.
>
> Currently, IMEM region (which is a on-chip SRAM) in the most of the 
> QCOM platforms are modeled as 'syscon' [2]. So I have followed the 
> same approach here as well. Should I describe the IMEM region as 
> "sram" (mmio-sram)  instead of the "syscon" (existing approach) and 
> retrieve the offset and desired value from the compatible? or stick 
> with existing approach and name the property to something else? Could 
> you guide me here to proceed further?
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t
>
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml

Konrad,

The bootloader team confirmed that the IMEM offset and restart reason 
value are fixed for the SoC's lifetime. Based on Rob’s suggestion, let’s 
pull these values from the device data using the compatible string. Let 
me know your thoughts.

Kathiravan T.

>
>
> Thanks,
>
> Kathiravan T.
>
>>
>> Rob

