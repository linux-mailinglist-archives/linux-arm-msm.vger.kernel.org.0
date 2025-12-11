Return-Path: <linux-arm-msm+bounces-85040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4ACB5BB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F343D304C9EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F9730C360;
	Thu, 11 Dec 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXGALX8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG2ifIwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEF30BF7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453973; cv=none; b=sn/Z9rD4krIFZFvempTHY/Ox1b4vL7xydsCJQQRRozZ8owaZzp0BpEjgkLTbwhupvmHCJy2EL8+Dz6xMQBa+hZc4dY+aud7B8fmZIlUiaGAIKEhh6RR4JBWb+4aVEn4Ey5TVAd2bwVg7Fx0QLiUkFIm6aJUTUo5TVDn2EH8WWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453973; c=relaxed/simple;
	bh=MDjy8CoZSnGI0trjZDN7RR5zWMYpgjaxrmLm8IG2TjY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PvCgHEKUJG6+meB9wzoT5h02OQMbl/pSBcBOs8MmagWXKl8k57UomczOdmrF/FpGV7NqaMXtR0BEjrcbjktF8OVKJ4+0xHlbs2K4ign0jH869w0M80nsI3W4I0mATuTSqMDSVdatM1joGVfh0xX81qRK/C2eIXaxkURhq5gTc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXGALX8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG2ifIwR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXoHL1211788
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYeW9busX86La2oKvlYlFkOyAk2JyhjvYrKKb2CZJwQ=; b=eXGALX8sTQUHfgr1
	W/3ClXcYK2wmkDAXaeA67sLf2Yqi0Om0IOtuvn9F4m9F/vRf9WFhenlu9vJhqeWQ
	3BNUrYw+xqCVTZUGl7EKIGMu1ihenVp8wpruSGsEuFRpbg4nPQ+mhjXnbF5RjY5v
	4vCtY2mOV+dvapXEwJu3rPYGgqHhaMFHjpmcqj0IqEgyafY01QVtl3UZ1+G54M10
	btqi+FE90zh/hvptBJ+XyC2B+WbRhPNHqjOTf0mo2fxHDyXpI6RjVke5uC8fnjVV
	ig5JmLLy5oEQ7gcDuCaJOOFiVbBjoSJMPrwqXsNe82RbYeQ9ln/rwFhozavIcsq5
	9XAPig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0pte20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:52:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a49cc88dcso1322587a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765453970; x=1766058770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYeW9busX86La2oKvlYlFkOyAk2JyhjvYrKKb2CZJwQ=;
        b=LG2ifIwRt29FAsQ7MuGSpuQlReECSREHPtwrkSFt+OGti+rwJ7vRVuXz/bUN6B4gKE
         svgtW6W7E9tgNv/neVn8Qei+iYVLG2+JtH25eyFBidD7/1Xa+XrQmXBhgRh6SFKX0094
         KR3IPzu23896Nh2sg2EOsq6uOO2vci6z+XhBGFBAkWMz6WcAoI55TEmFFAQsFP1lOlAw
         7zUdn1q02qoGSReETTnPbp6YpukXo7kbWAQmnKOzrshKhymjlpI+bawK2N5gfAzk0e4U
         wVlaGWNMqiJGx2pnXafAEMVOl8ZxtRT1GxL974BYmnZAH8kw1IpPDYCLMQ0h9qn00mKo
         W0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453970; x=1766058770;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYeW9busX86La2oKvlYlFkOyAk2JyhjvYrKKb2CZJwQ=;
        b=Np/SNvFnQnfouaCTbZoT8OJvtNi59nwLx9aWobK/TJp7GzozItHp9Tz2uvWAhlvLtz
         ob0X7E7EcbuNcQ4i5bFXGUhbvanqRYHpXLd85LxKXXkgKiGXweUZZpAK4QX3PUVCK46a
         FCGPoThQ/uITc0grTcHXKKX9avYQxkgXwwuf9V+IuyvnBI8Mt5D4QT0uNXegSFD+gV4q
         Z50dFiic6B1mt3Eww87IDwFkBlHh2NUUv+0WWuGCbJy8HF/UG42m7GZbSEX8fLcEN8Ry
         cs22JNcMPLMe6NDTzI1IgcE91LSghwxX9exKnL7sYI6DC1IzId47PK5ABLLymPDKTAjj
         X8wg==
X-Forwarded-Encrypted: i=1; AJvYcCUyGF85O1/Ulyv3IhZX3YLQX1tiVk0obHFNYCkEJG0DU4Lkehx/hMI+VwjQqsWt1uzuK+L8FNiyR+TFyZJh@vger.kernel.org
X-Gm-Message-State: AOJu0YydbzP9T3YfhHB+NDParL7qdZab4o1HgwKhgEfFfPbjNpwN01KG
	5ayvSFK4BEJGhiR+S446DV8MMf/bWIbayDJ+/FDUUnpmfdP3DHRSTDpsKF0eBq+7xLqFQZvmf5G
	1NP/3HnvlzeFECq+YtCugmznNuPODsyPq5ebNpTlB5ah3fqLirOlO9YvbA3b0RGB8bx/b
X-Gm-Gg: AY/fxX6dGYfhQ/aJrVuhzOKp8yK68Vh2idUyfxbVeZJeZHWxp15869IWTAN+uSpg3of
	Km/MSDkCCSxgcuON8XPx2ZZj/56Gho+mAx/TkdesWq8I2sJHezgdcn7hjZEqIXUGItNWiF7XKBD
	JlfJUOD6y389YDBg6yimUvOUlFtiLKTndmGL6TcG5tj5U54bo8HkyeAqo4zIBa0lz7rGNx8sxP4
	uqmskV5R4YfWQZstw37XSv1CQXAlLm1D8+qq3O21P3rk30j5DtpWz9Gg6PF8SmlDXI/m4pPPrV0
	9m4MrXImr8IEYqsgWc+S1KWu1vBSUxj9H52yASW9F6pRnLtnNNzVY8Pa561PkvvAka+vve6vxwg
	N/mLpnw0N5oxi+YE8d0u+u0mj14PDZzvY
X-Received: by 2002:a17:902:f70b:b0:297:f0c3:32e0 with SMTP id d9443c01a7336-29eeeefe84bmr19593405ad.12.1765453969781;
        Thu, 11 Dec 2025 03:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJd//arf73TWCOacAWMvB2OIe32AEM2dS8B17eTP0Qnts6r0p4wYYaEE2JwQDFes26CzNWLw==
X-Received: by 2002:a17:902:f70b:b0:297:f0c3:32e0 with SMTP id d9443c01a7336-29eeeefe84bmr19592945ad.12.1765453969254;
        Thu, 11 Dec 2025 03:52:49 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d397b2sm22771485ad.41.2025.12.11.03.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 03:52:48 -0800 (PST)
Message-ID: <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 17:22:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jVSeuNyiFDxCjFUuJZC1VN45iyJIocDr
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693ab092 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=CcjbiXvC7xLhAd+qVKJczA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z5OntCrvQ4ZuVe3goJoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA5MSBTYWx0ZWRfX/arPUZoXmNhB
 4WDXrjftCPUptFJLBKK/aFWPOR1qQZDW364Rw7VXyig0DDPJSfxsLrc5GIZuRWinaveaFt7RaU2
 oABfj+xKMlC2CI03VXzJlTMBWXcGPDXNSHGWvnPd1l7iyBl0OrNxkDQrIk03vI8+uGiqW0Kmsc1
 RqXEV4JqH+n2xIUTWcbsGB23Ae6hKH3NipDq0NfFea+yHZqH0lZaBLmWizYlbWsqT/no87h7imP
 O+TWhJPdTo6DNaSkYFtDCy4KcGQVy/c4JRv/4bzoz2orKveN+QYt7EKrd5UsnjtRy3QkrXq9bcD
 gkKVDUocF9s0R4Fl2PBu3gRWdkzNAGB9zFJR9nIGQ+xjEO2l1AI/n3LEyeCjBN0Jgg1g9bXBKp6
 TtLFX4erOaxXjwn3/pa110ViOZ/5Dg==
X-Proofpoint-GUID: jVSeuNyiFDxCjFUuJZC1VN45iyJIocDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110091

On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>
>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>>> +
>>>>>>>>>> +				opp-845000000 {
>>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>>> +				};
>>>>>>>>>
>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>> or mobile parts specifically?
>>>>>>>>
>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>> here.
>>>>>>>
>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>
>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>
>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>> non-mobile platforms.
>>>>>
>>>>> We cannot assume that.
>>>>>
>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>> wise to use the configuration that is commercialized, especially when it
>>>>> is power related.
>>>>
>>>> How does it affect the speed bins? I'd really prefer if we:
>>>> - describe OPP tables and speed bins here
>>>> - remove speed bins cell for the Auto / IoT boards
>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>   declared in the GPU.
>>>>
>>>
>>> The frequency plan is different between mobile and IoT. Are you
>>> proposing to describe a union of OPP table from both mobile and IoT?
>>
>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>> has speed bins. How comes we don't have bins for the IoT variant?
>>
>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>> Auto bins:   0, 177,      156, 136, 105, 73
>>
>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>> starting from bit 21).
>>
>> Mobile freqs:
>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>> 156:             745M, 700M,       550M,       435M,       290M
>> 136:                         650M, 550M,       435M,       290M
>> 105:                                     500M, 435M,       290M
>> 73:                                                  350M, 290M
>>
>> Auto freqs:
>> 0:         845M, 745M, 650M, 500M, 435M
>> 177:       845M, 745M, 650M, 500M, 435M
>> 156:             745M, 650M, 500M, 435M
>> 136:                   650M, 500M, 435M
>> 105:                         500M, 435M
>> 73:                                      350M
>>
>> 290M was a part of the freq table, but later it was removed as "not
>> required", so probably it can be brought back, but I'm not sure how to
>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>
>> I'm a bit persistent here because I really want to avoid the situation
>> where we define a bin-less OPP table and later we face binned QCS615
>> chips (which is possible since both SM and SA were binned).
> 
> Why is that a problem as long as KMD can handle it without breaking
> backward compatibility?

I replied too soon. I see your point. Can't we keep separate OPP tables
when that happen? That is neat-er than complicating the driver, isn't it?

> 
>>
>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
>> value written in that fuse area?
>>
>>> Another wrinkle we need to address is that, so far, we have never had a
>>> dt binding where opp-supp-hw property exist without the speedbin cells.
>>> And that adds a bit of complexity on the driver side because, today, the
>>> KMD relies on the presence of speed bin cells to decide whether to
>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>>> combination (opp bins without speedbin cells) to help KMD detect that it
>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\

> If it is a soft fuse, it could fall into an unused region in qfprom. On
> other IoT chipsets like Lemans, Product teams preferred a soft fuse
> instead of the hard fuse. The downside of the hard fuse that it should
> be blown from factory and not flexible to update from software later in
> the program.

This response is for your comment above. Adding to that, the value for
the hard fuse is mostly likely to be '0' (unfused), but all internal
parts are always unfused. Maybe it is 'practically' harmless to use the
freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
mobile, Auto and IoT. I am not sure.

I am trying to play safe here as this is dt. We don't want to configure
the wrong thing now and later struggle to correct it. It is safe to
defer things which we don't know.

-Akhil.

> 
> -Akhil.
> 
>>
>> We already have "machine" as another axis in the GPU catalog. I'd
>> suggest defining separate speed bins for mobile and auto/IoT in the DT
>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
>> mapping those by the machine compat.
>>
> 


