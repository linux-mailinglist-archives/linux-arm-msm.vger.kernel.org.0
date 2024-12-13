Return-Path: <linux-arm-msm+bounces-41870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B479F00BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2512858BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E90A33F3;
	Fri, 13 Dec 2024 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laxb/s81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3223BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734049115; cv=none; b=DkyvrmK1+zdQkKhOt5riMbIHfp66DXhjWemOkV9rTYSrHArIa3JQvneEIVOL654e8g2HOF5YAXsTu+1ybccipkXd1mCNM/sYuNsqLVKvKjdIobKjjsynX4+fnR21gJew+gXH5dJVwO9mkAx+rE65NGZcZV52T6AccI16UXtKT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734049115; c=relaxed/simple;
	bh=baRH6tcc0+6vgBvsDSbgP0uh0QG1T/57Mc3y9UTn9jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5BC+H/woCKhg+WlYLu/omFGNaraHCUwQBEH1jNoATNuaXx6Uxo7+hboLJhc70dUZHvbi/kszshzPfzkQC3HLoGFeYLjjG6YqZ9OZEMiWLKVD0qsz3snrnZI/k0zzIm9l8hnmqMHBcX+0Ql1/232emLr70XA5y4SmBeFD3SINYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laxb/s81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNj9fX028128
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnJPmrz0LeHN3qYUvxdboiVX678r8gqWXCFVwvYF50g=; b=laxb/s81I0HPC1cI
	dS97cmIsp9fAMYJIfu5n/BJPibeMyPNrRFx6Dsk+BF8tD0o5abj3CxyHbJr6tTri
	a2RHPaF7sXv/x/HHtU4g1lPbU2ixkY1br6atb1+iHfExuKqxZLOa2Ek2BrHdp5at
	rVywxUrvxN50MJjFLJlmZfDlEz7weCBmfORifvf5o+gAzo7rWkH/4z/uZRmOF42l
	hugZWdH0SjiYviDVtsUDlg7AZTV88ZYwUt845dTHZCc5F7uQCfj9L/sLkF5gy0kH
	8j5dzDGnE+Ip1b2FbuKc0Yx6dPyon4eQY+tfpL4no9mpz5CMPjV0GqfYnujCVw4L
	UO8lDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4svaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:18:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4678aa83043so3040121cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049112; x=1734653912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnJPmrz0LeHN3qYUvxdboiVX678r8gqWXCFVwvYF50g=;
        b=czXqU2hEjfM8RAWcSQhxq/BQnxVAG1Y0A7EMf6ZBZ/afsFugJQO9Jr+Hon9czBo6XN
         tZZEww8YQhSryG3YmRC+7wwLQ44ygw9BT41DtVJ8HnINA5302XNEUtIIX2G9iz5aEIUa
         2gf3I+7R5mJsgdoCoehXs/L1ar2v7yAiul+VLgAMKupG2IAUVRNJSlmVHZcVjxAE3JsF
         Ec3tfftm3YhUe+hdfFOmHe6cAQNpyvhSNKP2FLr+2Sc2uOO3rBvOnj9uGEkD+WOaaB79
         46kTU6dHFVDSLXazLNfabZ1+FiEGxaGbO5JAlXK79B8WGmm1eNS3m82k5KV+Z6m0But6
         h7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUEuAOz0Oxuf2pzkNAYW+LJcnNfm2rO8ht+pUp5HrmCDkAa7aMuYjX1aJmUsJBU1TVs+c++cTFi2zekIk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfr//BCa6ocFqi6WgVFbd2Lx4mCICDk8jRuorjzu5JZXkCrg14
	p8a14X7UBfhS7W7UrrxeHNZFy0/HryG4BjoKF/upyW+W3vkOHEcDYC5ioNovr9ntwuYgENAjAP3
	8ORhKoVNrIJ8LOZsphZ6CpQb3KgAyClZwco3ybv3tFxh6ntKmo6wGa2/pvTZNs2dq
X-Gm-Gg: ASbGncuM96pGTWJd4bbgjJZPdEZcoqP1LtzoF3z5Cb7cPhM2P8k/LADtozbhqEv2h4K
	O+Z2OfKdg0PyeGxAeNtMnV9UUu/8jsEQuU//jiVkyuN6B/D4p3Bw+Unv0xy3B5wYYnm0QD29369
	o2/s55wkLKHlIXa0V0LRT0vI5AkicWZ0u+jGecLZCQ4craNDmFxxYTzeWIbtWkFzDz/ZoPMbq3/
	x1Fx2mSMW7IS56IIdSR7wNO8QJgCvGWGaVyuzSeKVFIs1ppmEcTzWP0WGxqxuy68P2aTkSd2voK
	p8Llua4jlpVub90mlLvswF2dxWW/n+xFrzma
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr25644185a.7.1734049112272;
        Thu, 12 Dec 2024 16:18:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHESuoUw/QDmsrIP5AQDKgWxFZtU5J+bURwDqhfhD9dKJRI8vhhA3/GIlyoCinrIglwX+eP0Q==
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr25642585a.7.1734049111911;
        Thu, 12 Dec 2024 16:18:31 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671f14766sm769393466b.169.2024.12.12.16.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:18:31 -0800 (PST)
Message-ID: <e3dff1d0-989c-48db-9fd6-6b3c209d1452@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 01:18:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
 <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
 <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
 <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
 <30e5d714-2e52-4a0e-9dc8-b6cacf6ad382@quicinc.com>
 <e63af513-5fd8-40b0-a1b2-daa9821ebf5a@oss.qualcomm.com>
 <b3581663-8dc0-44d4-9395-df385316bb09@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3581663-8dc0-44d4-9395-df385316bb09@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kxIMGe_oStvgqDI_Es2XmRT7A1uw2e3c
X-Proofpoint-GUID: kxIMGe_oStvgqDI_Es2XmRT7A1uw2e3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130001

On 9.12.2024 5:23 AM, Raj Kumar Bhagat wrote:
> On 12/6/2024 4:19 PM, Konrad Dybcio wrote:
>> On 6.12.2024 5:34 AM, Raj Kumar Bhagat wrote:
>>> On 12/5/2024 11:12 PM, Konrad Dybcio wrote:
>>>> On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
>>>>> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>>>>>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>>>>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>>>>>> memory during QMI memory requests. This memory is part of the
>>>>>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>>>>>> hardware parameter and provide this memory address to the firmware
>>>>>>> during QMI memory requests.
>>>>>>
>>>>>> Sounds like something to put in the device tree, no?
>>>>>>
>>>>>
>>>>> This BDF memory address is the RAM offset. We did add this in device tree in
>>>>> version 1. This is removed from device tree in v2 based on the review comment that
>>>>> DT should not store RAM offset.
>>>>>
>>>>> refer below link:
>>>>> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/
>>>>
>>>> Right, I think this could be something under /reserved-memory instead
>>>>
>>>
>>> Thanks for the suggestion. However, the BDF_MEM_REGION_TYPE is already within the
>>> memory reserved for HOST_DDR_REGION_TYPE through /reserved-memory. Therefore, reserving
>>> the memory for BDF_MEM_REGION_TYPE again in the Device Tree (DT) will cause a warning
>>> for 'overlapping memory reservation'.
>>
>> Then you can grab a handle to it with of_reserved_mem_lookup()
>> and of_reserved_mem_device_init_by_idx()
>>
> 
> The memory HOST_DDR_REGION_TYPE is a bigger memory around 43MB, while the memory
> BDF_MEM_REGION_TYPE is smaller around 256KB within HOST_DDR_REGION_TYPE, Using the
> above mentioned API we still have to store the offset in ath12k to point at memory
> BDF_MEM_REGION_TYPE from the start of HOST_DDR_REGION_TYPE.

That's still way better than hardcoding platform specifics in the common
driver

Konrad

