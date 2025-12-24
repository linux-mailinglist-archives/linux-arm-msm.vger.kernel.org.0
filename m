Return-Path: <linux-arm-msm+bounces-86551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E2CDBFE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7937F3014AEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758963164B7;
	Wed, 24 Dec 2025 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnPhX05j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+dp0b0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD03148B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572202; cv=none; b=epWgxhhtDLZYseEmcCbqyK2QA3Z0kB+X+g5+nU9h7+VO7AynWQ1rNapvTgFKp5M9BYb+x0+puAut80nGGM+SAv6h8PNEKewTqCZwsMH8f7/ZtNa0JIU09jtgCF9NQYzBpRFb0YG5boZPdSrW/FqifKay6txFfnAHg8GCkfWMQ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572202; c=relaxed/simple;
	bh=/+k13JGaSOlrhmQP0Hn+99RygXxIUW0fKZ7CtedcWc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM79VXW8S5eo+gNDevCKXpwzuSqOIRzTkoLzRFiffds6L2g4T/2+ox11JdNhdouc9xK3k8v0V3Wl0ZoDEx5guHoPn1REcZt51oz5SWyiIcSF+9WUFM3NiJXP3bVMDD8zKCp/6mtbkdlDIZhmW8zbi3XCQwtvVdwqWCmbgKTHwqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnPhX05j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+dp0b0S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8ard3722153
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=; b=UnPhX05jPfsLQzm+
	lKDrs89n1+MDZV1F/VC4H7WcHH+6W/iQCm7P0wra0e4A28C7uAq7M//QpBijaChy
	vaF1jZVHiUT+t3np77frb1pQEZDGe+FWDsHu2TnBSFV6HXgyr/qzxuV7+0oQkCAk
	3JqHXQda0cq9/3E+TtAXS334/MkLQFeagz057OjTX4SKsyS0NI4LpS3DlbOUd0ek
	x/glCRURjaYyfZWSZ17UPWqzlHl+CGhS7NseckSr9Wo5toFExryQrDfK5MbXxaaN
	SwU46qdhaFEK7+kg5Cqx7pb/ypNd7ebp2L7oiwPKzKxMRLCzxtulEn4UEvlyO6A6
	Q/ZLoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9xux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:29:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6a9c80038so545632885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766572193; x=1767176993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=;
        b=g+dp0b0S+hSWdVoFlubpzvc4FhLRzTEJwiTFdkXOdN/Wf8bbt7sVfpR1ht24kJnXza
         tIy186z6miEmPvZd09raFwwWulqXkZ5FofQVTlK4ZIBjknfhLZwmiHygSGO9zf137zMr
         XtGYOlhIWrDGiJYMJucEgfr0CcmJqGD2vDw/t8YAoBpFNokeRA1o8fmOV/DLTHbGegeP
         NfxBSuGzhg9h4hByV7DzdJ0qhHh9tUbWMt/VL1lIbHIPW7PPR85gLfivGRjYe+vubA1y
         NPYGlBo9sctJA6DxaSY2Z9RJZBxZr06wRBmu/NAjq2x0iTWiXBjiyff1soqA58ZwdjQP
         7pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572193; x=1767176993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=;
        b=GwXuh34B5D+e2yBYYW2AG/dVb0ZZHvxta75+S4PT8R4y+tpuT5t1Isn9CKFUntXquf
         cyYKk48ktHUuldEubVSZ+miJTDbzE8sGoiGXxt5lafGDvVt6M1ic2neOrEiaDjO36dN7
         U7Ii7TElXiAz+nOSoyBpIgnA2oE/nyME59+PV43Oc399xAZSf8hwFy6LxgVKiD9uEgYK
         KMW4vkukqEYbEZ8cxlM7fg4IEdWB44goOK40rS5GNFQ6XP0780AvmXMoHk5s0vlY7R36
         8hB7eCJWvQfHvgzy2lek1PEvB1e7hfARCFiDQErk5KfUNoQbC8GJRR//V4BO+cc13WuH
         cv+A==
X-Forwarded-Encrypted: i=1; AJvYcCUm3U4td7t15j2duM0Crb9zMXeBiLwksiQqRG0orqkyIfARvARJD61+U9FRLxJhNwNycQSA+I/ALhpkTYpK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54MLH3o1N+KH3VVppXjbvQ0fBfgbDnm7Y1P4oTSw+vLiRK8K0
	mCmZ4Qy0/B4qQZf2oErTMEo7412h32koigU4zuiD94evvqHCdRK00milHY5/0i+5OGZTt3jM4y2
	tQMIh/uYxK4Lb8kEKW23+oQEWtAwxexDpg/SPNVpB756Jrtfq79SbWqWxFFSkmnbLZnx6ghgdGx
	3Y7xw=
X-Gm-Gg: AY/fxX6MLb6LvhF8Sy1Sif2Zquf1SNA7BAB3jJ7AKncKsMCdZqJdz4zfTt3dkmDuVOg
	hCZaf5m12PXzOgInaQZUdT7kNhhuwrwFzR7NdoZWP6JXI0L6TjvJeNDUCqG6sLWfE5s0YR8hk3R
	IV0rKhpaETKDV3RoJrsM1SGMmHSoGI/3ofJy3/WMhNslIR+EAZlrp7fDUCDs7meo8m0gqFZcQO0
	yrKHgBpcHKSzsr1R7lHokzl6yDBY7L/Hf1GTJF4TAPQya7TDSBEpYWuKR8A+yt76Y0wR7CdWRpr
	neYaQ4wcEcX+tveWthZXbAa5DFHxkMIhTu5ocO9CU5nbKhclF85iv/c1MQup8maHrT5PkqlGh6g
	G3QkgwKx4KRCmAxIZ1o6GUCa9m+vWuFzK+4C7Ev9TXBbHwEDjg8rGQtMcRlMJfCaKi0xaabB5PQ
	==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6606:edaf with SMTP id af79cd13be357-8c08fbf7f2dmr2855546085a.37.1766572192395;
        Wed, 24 Dec 2025 02:29:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW+h21Zk7sUDpprNUnHCEjqXSluWJX2J/e0882MWNU2L6qw2LGYFE7e4/gozjPINDiczEISg==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6606:edaf with SMTP id af79cd13be357-8c08fbf7f2dmr2855543985a.37.1766572191921;
        Wed, 24 Dec 2025 02:29:51 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e314sm123903666d6.49.2025.12.24.02.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 02:29:51 -0800 (PST)
Message-ID: <9edc9c94-762a-4688-b2ca-95900149bad9@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 18:29:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
 <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
 <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
 <3342fv43qdkmm66jgc63hho2kd3xn65p2fv3tyk3573izlxf7i@hgjsp2kwqyuh>
 <26536725-19fe-4aa6-8a33-8e2e39261cd4@oss.qualcomm.com>
 <03a398f2-6108-49c6-aae0-77701fb066ea@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <03a398f2-6108-49c6-aae0-77701fb066ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bc0a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Drdvf8unfrF7i_Y29A0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KFmYdZ9TJo_Xo2BDOnrFO6ylsnnMFkiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MCBTYWx0ZWRfX8gXx59Bg7viO
 mQ0KDjhXYKEUcIOurqhdIOgKt7OwNxvpL9ulOWxqhIVFBjOiuW0chYHmx2jMR1oUx1T6UrV48aR
 RHKhdFxS/lrh7ilv0t/30kG31ZCmWTu76H+EEqm69NA0SL1/HpTLXg2Jzzr53+wJ00a9JBxIKHL
 Jxxi6jS2cmV7fu6c856LRLp6zwmXDY19l/N9f6KEOIYXhWNoAREN1fq9xcHIWZ6EGW3E5qlH5sT
 MnB92oDdHM9Oy53NJxedKQNVt8Gykrg+DfiHdM4b1Q5dGSrYofMn6lo4b1nX43afyoR5i6i2keN
 mbkbaWVImbKI9JnOuXkRE3eyou5d3Be4eD9GPSJf7VXNYBtKq7zqAyo3r6U1otNvA7uQFzVyHvv
 tzOOzCYXA+lsQ5j4Xhp2KWESZE8JyUF3/DePnN5dQbd53UUP79CdEAeFvL+FROnASOJVxzhmNwE
 JUZw32JFDMY4FvSN7bg==
X-Proofpoint-ORIG-GUID: KFmYdZ9TJo_Xo2BDOnrFO6ylsnnMFkiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240090



On 12/24/2025 5:46 PM, Krzysztof Kozlowski wrote:
> On 24/12/2025 06:36, Wenmeng Liu wrote:
>>
>>
>> On 12/24/2025 1:03 PM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 24, 2025 at 12:31:33PM +0800, Wenmeng Liu wrote:
>>>>
>>>>
>>>> On 12/24/2025 12:21 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
>>>>>>
>>>>>>
>>>>>> On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>>>>>>>> +  interconnects:
>>>>>>>> +    maxItems: 4
>>>>>>>> +
>>>>>>>> +  interconnect-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: ahb
>>>>>>>> +      - const: hf0_mnoc
>>>>>>>> +      - const: hf1_mnoc
>>>>>>>
>>>>>>> Same comments as before, do not invent names.
>>>>>>
>>>>>> <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
>>>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>> <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
>>>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>>
>>>>>> This platform(qcs615) is different from others. It has two types of sf,
>>>>>> namely sf0 and sf1.
>>>>>> The same as it is:
>>>>>> sc7180 sc8180x sdm670 sdm845 sm8150
>>>>>> Do you have any suggestions about this?
>>>>>
>>>>> Which _names_ are used on other platforms? This question is quite clear
>>>>> from Krzysztof's comment.
>>>>
>>>> The platform mentioned above either has no camss ICC node or no support for
>>>> CAMSS on the upstream, so this is a new one.
>>>
>>> I did a quick look for you.
>>>
>>> kodiak, lemans, monaco: ahb, hf_0
>>>
>>> x1e80100: ahb, hf_mnoc, sf_mnoc, sf_icp_mnoc
>>> sm8650: ahb, hf_mnoc
>>> agatti: ahb, hf_mnoc, sf_mnoc
>>> sm8550: ahb, hf_0_mnoc
>>>
>>> sc8280xp: cam_ahb, cam_hf_mnoc, cam_sf_mnoc, cam_sf_icp_mnoc
>>> sm8250: cam_ahb, cam_hf_0_mnoc, cam_sf_0_mnoc, cam_sf_icp_mnoc
>>> sdm660: vfe-mem
>>>
>>> I'd obviously hope for some unification here. Other than that, we have
>>> two clean winners: KLM and X Elite+SM8650+Agatti. Yours proposal is
>>> different from either of the options. In fact, none of the platforms
>>> have the same _approach_ as yours. Why?
>>>
>>
>> Yes, you're right.
>> But none of the above cases involved having two hf_mnoc simultaneously,
>> so do you have any good suggestions for handling such a situation?
> 
> And this is your answer to use completely different style? This makes no
> sense.
> 
> This is your logic:
> 1. If there is one HF, I will add underscore.
> 2. If there is more than one HF, I will remove underscore.
> 
> This makes absolutely NO SENSE.
> 

Would it make sense to use hf_0_mnoc and hf_1_mnoc to differentiate the 
two paths?

Thanks,
Wenmeng



