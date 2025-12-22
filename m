Return-Path: <linux-arm-msm+bounces-86118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A781BCD4DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BEA13005080
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF908305E21;
	Mon, 22 Dec 2025 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gc5+dAAy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhHu9Y3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC47303C88
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387982; cv=none; b=j9X/sxRAKdpPqDJRfwTr0DOk7Lo9tGCqdpBNbnFt23zBWDiZDjjPpiQzK5TbCu0PtaNo3Rc8v00oRnizPNAG1MCrMbSPvCkgy7L2PoUWVKEgoOKx1l8KydGyVOVmW+fiLpmqF24vCCcRrP8A5YGh9c5vxAw+1GKfqMTuOvdkB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387982; c=relaxed/simple;
	bh=nlTABLDNrg2INNvgfH7Yf3zGKG+HGK3L+dhcBFI/kjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1rjXKZUS8wA1LyvY3dVW2Hu0t97KDN+c3j7j4a+wtOb5SJ389mM8oSzpZsW9E8FY+Fy4ejUHdCjivHVgWkj+ujP0IeIvaB4xWdxd+38IsR3LUrbra9a1Z7vtlIfvvYCXszd5msd6IDGbHLm0AoZPrl8256GcJY4KQ8NmuQEFrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gc5+dAAy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhHu9Y3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMa25m044089
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWDxNS47conOOss0/CFIrnX1i8mTlp5Yvb78GOJ3zVw=; b=gc5+dAAyO/3wqhRC
	5sN4Cx71td8epvNwchvCrhlLbRkpVl90waN1B5JgpmCXZ8gNgr9xHlXihTxAvKtG
	wphoA3fH0b1LXXYF+TVVXZWRaoi80YmqL6RyhHbkLhRkLeb8gUNfvxI3BQhTh22D
	4NAEgmGeXb+uJkluRZoYbRs6yMIiF2F6wPMZ0nU2+9RWWJ785rMiUAuBlhenSXAH
	WAsfQxNbaDtvIPH4brvybnfjirl5V8Iqa5tSHRBN3HMmAV/EA0Mbl8l2cRlgXSbW
	oMhHJIjQAZtUkkNYOfOzOsQ0/4CKLenvGBAunF/BxiKkWlJqaeM3w/7I/0Q48n9+
	Lz/wRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrac2b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:19:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso3563642a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 23:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766387978; x=1766992778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWDxNS47conOOss0/CFIrnX1i8mTlp5Yvb78GOJ3zVw=;
        b=GhHu9Y3/gE5sPiBcBkU/gTLWNf53VC6yGmqHJlp3pupJplDSspTeVRXvQRKRdoEkkl
         jJWavQskMu9tcrICfHYDS3Ujf+uHE6oRj5yQO9+ns/nEMq428a9sTpSKyetCJtfkPrpM
         Ns2ov0w0AJkklJom20yLf3c1GBEDM9+Wv7Q/xCGEMQgaeMqW903fvaKlSYd4/Co3so31
         tPJzD1LsSGHkkQBt94TGK/nzi98Wpl9qR0/n1Gu68bwmetXlIhyDyKno66yEnGczI72q
         Q90bTfKbJ8E5rrv2DK4QjvO50KLGHnOr2I2JRVLHaQuUCtFoKiK07OklFVOwjvq3Cxh2
         HW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766387978; x=1766992778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWDxNS47conOOss0/CFIrnX1i8mTlp5Yvb78GOJ3zVw=;
        b=qCx0qMl3ntAmlE4gC9uSmDG7Y97g07hi63PAZbOecEhJ5PUtsAWPK/dLjEMBpRGxpI
         E7Mt8Do8087QIl1nxcQ2tUYiyrMRsDwqtMHas0z8h+TbDF7juBjXrzrn3iZAS3AIYqPF
         c6DFxXWXn/NzJPU5VfRC5xdTC3a1BsCewQ7RgMrxmVNUZ5DntkbL5d1pEjgjt1viwjuJ
         gRrIAmdl3EfoQvIQEVMxSBwfbZCif+OEkUv6MLQyANLvsEetP4Db3UaJczJ4o9JnXtvb
         cAHfpi14h1Fwg6SUrHTS+OZ+3euiXdzhpZWLqBZZrpGwG0XZYKF3+NJvy1jnajSYs5/Q
         zx1A==
X-Forwarded-Encrypted: i=1; AJvYcCWxHt6bv5zBVh1BPa/Yz/+s/aASjb9UgG+OX36BTWBrFENL1o84/MmAnjjRJswjexnlnx2Vz6q3ZMsZMaTr@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjKdPfrxgptfvvN/ifb6XNGPYqvq9NlOLi3ptzJnEPrzfOniq
	cMo28J5cPRF11HnjQ+2D88/2wDmPBVmpJMTdtwixwNvvw+ZSFi0ajaSGmbhD5hnEH6xoGA5+gdX
	yuqtmQwxCxW5nqOYMhJBRB7/DlMlwTJ77fFXXgrLfF6DgBiSAxZ6EkK7RpUrg1vTDOL4r
X-Gm-Gg: AY/fxX5k/t0niCYDksEhzhbyJXddrFid7rBHD2I5RE74BW01JFZ/9GkZYgSE8N5RQRw
	N8gV9qvkwzWeOnt9ANvsUfvqL11P4mmvThe+0olYyscSMxufBqTshNL6L3iSdXzTGE4OZ4EzeaY
	LksEZxcjdUSM/PJ6dX458a2HMYeAwmQsFQR1eVr24x5H2rfYSqkRsBeCKBTGzz/tBa2HedDxnaH
	PGDF2me2pcAFsuJRYxgFC8NcviUAfAch8LHOjAU6FtsQGr+9mbx9WLy8BJ1QrGxQSNssNhx7HPX
	LxPUQuI26TZqiZk02dmpgwiG6JqY3DOaWDQyBBtujjK1jZvjKOKte9I6bjuJR/bxvxLVk/se1DY
	3SR6cllBrJpRCOmDnQFKQFOrMOc1BAyk8Bw==
X-Received: by 2002:a17:90a:d00c:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34e71e60b02mr11691286a91.17.1766387978195;
        Sun, 21 Dec 2025 23:19:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjc9qP5nQZu0ZBZvEo4H8h+xXIMmjM9VkJAa3uzSFXmEgTz7Y4dUsBcB1srqXOobKSybh4LA==
X-Received: by 2002:a17:90a:d00c:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34e71e60b02mr11691257a91.17.1766387977606;
        Sun, 21 Dec 2025 23:19:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbca5fsm12021229a91.11.2025.12.21.23.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 23:19:37 -0800 (PST)
Message-ID: <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 12:49:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
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
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KuewAfCnuMjOO1ToM0QME87DBwkKolYc
X-Proofpoint-GUID: KuewAfCnuMjOO1ToM0QME87DBwkKolYc
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6948f10b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=oy5nMm26i85I/VS19bmskg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Q_oL2FvY1pRdKVWsrjoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2NCBTYWx0ZWRfX2a8M4vWqR0t4
 ijxw8+YZ1tXkHB/8kbTZzJ0hDmO4lBHPJvBeeZ53RcN+xXbXUTBcfJ4lWkBNM+GDYXPLr19wFDR
 qG8QKeUe5c1vBDjh9kD42FtNxLFocxSHYW76KioE9VslFQvRdRu1G3xM4ewCrEKJq7dWFUKKBId
 esbfOLfzAXn3AvXOb8+xvoz/xJnLhhHsG6R6jecy/ykoCKDHEHP1u2ZcDKIBSg2r4Dy8NXopGlP
 vFjdcB30meEl3NsSH4nuxBJ2OoCZAY2b9lBGZtFhn66rTfEnZUxMqbcdxpvK9+F1o3KGUwRqGVL
 wOSfCPqrlAIaWPb3k2wbfaEIr8P0UTnk6fuC9FXQNgurizGnXh1keB6HAwZCbDIi/GLNCbglkH/
 VdfGXfMOfHX69JWAQTBeqwSJRK+eeb9Wpvk6H7bkN54bja01vZcNmG7UEEeEw7t06uDRvYR2UxK
 tFzF29lQC4iMen8qcOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220064

On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>
>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +				opp-845000000 {
>>>>>>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>>>>>>> +				};
>>>>>>>>>>>>>
>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>>>
>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>>>> here.
>>>>>>>>>>>
>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>>>
>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>>>
>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>>>> non-mobile platforms.
>>>>>>>>>
>>>>>>>>> We cannot assume that.
>>>>>>>>>
>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>>>> is power related.
>>>>>>>>
>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>>>> - describe OPP tables and speed bins here
>>>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>>>   declared in the GPU.
>>>>>>>>
>>>>>>>
>>>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>>>
>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>>>
>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>>>
>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>>>> starting from bit 21).
>>>>>>
>>>>>> Mobile freqs:
>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>>>> 136:                         650M, 550M,       435M,       290M
>>>>>> 105:                                     500M, 435M,       290M
>>>>>> 73:                                                  350M, 290M
>>>>>>
>>>>>> Auto freqs:
>>>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>>>> 156:             745M, 650M, 500M, 435M
>>>>>> 136:                   650M, 500M, 435M
>>>>>> 105:                         500M, 435M
>>>>>> 73:                                      350M
>>>>>>
>>>>>> 290M was a part of the freq table, but later it was removed as "not
>>>>>> required", so probably it can be brought back, but I'm not sure how to
>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>>>
>>>>>> I'm a bit persistent here because I really want to avoid the situation
>>>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>>>> chips (which is possible since both SM and SA were binned).
>>>>>
>>>>> Why is that a problem as long as KMD can handle it without breaking
>>>>> backward compatibility?
>>>>
>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
>>>> when that happen? That is neat-er than complicating the driver, isn't it?
>>>
>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
>>> as a max freq without speed bins. Later some of the chips shipped in
>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
>>> MHz. The users end up overclocking those chips, because the DTB doesn't
>>> make any difference.
>>
>> That is unlikely, because the characterization and other similiar
>> activities are completed and finalized before ramp up at foundries.
>> Nobody likes to RMA tons of chipsets.
>>
>> Anyway, this hypothetical scenarios is a problem even when we use the
>> hard fuse.
> 
> So, are you promising that while there were several characterization
> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> to the max freq?

I have cross checked with our Product team. I can confirm that for both
internal and external SKUs of Talos IoT currently, there is only a
single bin for GPU with Fmax 845Mhz.

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
>>>>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
>>>>>> value written in that fuse area?
>>>>>>
>>>>>>> Another wrinkle we need to address is that, so far, we have never had a
>>>>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
>>>>>>> And that adds a bit of complexity on the driver side because, today, the
>>>>>>> KMD relies on the presence of speed bin cells to decide whether to
>>>>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>>>>>>> combination (opp bins without speedbin cells) to help KMD detect that it
>>>>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
>>>>
>>>>> If it is a soft fuse, it could fall into an unused region in qfprom. On
>>>>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
>>>>> instead of the hard fuse. The downside of the hard fuse that it should
>>>>> be blown from factory and not flexible to update from software later in
>>>>> the program.
>>>>
>>>> This response is for your comment above. Adding to that, the value for
>>>> the hard fuse is mostly likely to be '0' (unfused), but all internal
>>>> parts are always unfused. Maybe it is 'practically' harmless to use the
>>>> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
>>>> mobile, Auto and IoT. I am not sure.
>>>>
>>>> I am trying to play safe here as this is dt. We don't want to configure
>>>> the wrong thing now and later struggle to correct it. It is safe to
>>>> defer things which we don't know.
>>>
>>> What is "soft fuse"? Why do we need an extra entity in addition to the
>>> one that was defined for auto / mobile units?
>>
>> The hard fuse (freq limiter one) has to be blown at a very early stage
>> in the chip manufacturing. Instead of that, a soft fuse region which is
>> updated by the firmware during the cold boot is used to provide a hint
>> to KMD about the supported GPU fmax. I was told that this provides
>> better operational flexibility to the Product team.
> 
> Do you have an upstream example by chance?

We use soft fuse for Lemans IoT.

-Akhil.

> 
>>
>> -Akhil
>>
>>>
>>>>
>>>> -Akhil.
>>>>
>>>>>
>>>>> -Akhil.
>>>>>
>>>>>>
>>>>>> We already have "machine" as another axis in the GPU catalog. I'd
>>>>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
>>>>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
>>>>>> mapping those by the machine compat.
>>>>>>
>>>>>
>>>>
>>>
>>
>>
> 


