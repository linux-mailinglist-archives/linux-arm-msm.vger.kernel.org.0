Return-Path: <linux-arm-msm+bounces-60569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABBAD1B29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0569E18890AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 10:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215C422AE75;
	Mon,  9 Jun 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am9FiKPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB72512FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463389; cv=none; b=oEvNhWk0nPZPiCvexlZStHJ7A2zRlMEzB4g3UcXmAnnFr6URz/cECzN+Ioju2AnmxyEa56r5w2bwk6NrLpHWy/o73FKs4H5GxKRF3MVaVLflC3wyXSyVbTN4/B5F0FLoNrAeXaU6rY9tTkdne49hOqTA7EGZvEabtBdP3yfwqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463389; c=relaxed/simple;
	bh=4m9MirB1WKJwy1ogvo/XpNABXqeFGF+vxFRGeYxvcf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjGAV/MchMS+g5rt7Y9HskTL55HednYtii/HTQ4/zeFfA9xLxGzjvJuLLkznBn24vt0/jzKdFlYLYhOT/4cPA3G00XsAeu0Ai3cm7csMeiGk3+edh0X3cgIQHtPgk5oLGkcAPMNRcMlGR7pRmGFX71TrlxVPwaLkunoKWYyThoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am9FiKPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599GkjR016292
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 10:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUOMLPIIJhzhRpown5yTsE7gvs4GZtO1HXjc6bWnF74=; b=am9FiKPaMOuHPg85
	wMUi6kqZezXRjeKsYbHyUfVfwR9wwJYHlP6JTzXKGxc3HVaASoihyk2ciR26oaFg
	Moqe+Lht3EC9+u24lLoKPsNoTMNGc0THpzfQeut44878M9IEzcqJ6szIcLiD1I6b
	jCg2tk51iiRAZHRqCKgdy+0vxcHRm4klrES86CcVkorUP6nPdM4Bim70uBmAoZgk
	m2KaqafT4n/2IWdd198fDpv1r1aS1Bf/HQzkvlunbhguKCzBcMrKFRSDlWsdONKR
	YfxRH2kXBAl1DYIK6pQcpkRi5ZhUQv6uQyMSUQGnhv1LSHjEIBXVlzvcO2XK2JbB
	gU9hqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75swn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:03:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so644774785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463385; x=1750068185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUOMLPIIJhzhRpown5yTsE7gvs4GZtO1HXjc6bWnF74=;
        b=QKX05cN96NaV9Tpl4IiFxPCkq22cd2hfevPGXK1SpKA4sI1KmWN33Cdyhh7HkSVxBD
         RnZHWnEAHvYKybfqBKd8lsNAncrb9XOxsFq+nAO9ZrzqCloEzAHRNRjgwq/JR78VAwii
         Fbts2uh3kFDnruB+uQRdTr2VgALO6mddj8hiYckhKeOG4m0KPzU9JcIl/i0+SNcd5ais
         2GOVFinL1+xUUGui7NHCYcL5ri3jl9NztlDwAwYCFBFMmz/BNi8n72+sRuPHQals7e0A
         ZgmCeucuNx79j1Q0/0B4jBwKHsF7fJacrmjtDQC3UfbIV2ub7/uGSAvmCBM1cdlPc6lY
         mLiw==
X-Forwarded-Encrypted: i=1; AJvYcCXs5K3nNQ3eqq1yVZVmo33LioOMB9ZbraURkxFfjPJIRX8KHJK2vkkvHfNKPPrwgb8mvs4vpmSNTcJd1pvS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3e4ozWQS9Sxl811KOsgllso8XOcFt2yL2IgVHn9gZUmvO+5s6
	HUoe/T7FSye6Ttgn0O9weOGJzlwwJHhdZCYh2nUPWrVJw+48IEFQL2WSHVYfqHbjdrFFPQifzH0
	Ky//v9JvpXdbVT2cb7NGvdX0M17/D2LFgXEfh8wSpEowvzwvVhaFPUvuQs9OHH92QKVc/
X-Gm-Gg: ASbGncu1Ltvt65PATylgDWeIDunnuVFc4af0nTy5+wnN8o+Hs7jUYQZPam4+12qK4Vy
	c0Dy+X4kOZ1RaLM6KcI18gCZXx/vaR2sudieHmWLAlZMlh74odr/cvAeVOLNFgc8lMuviMKO1nw
	0YN4vuMNRhqjYcvkZp1RR+dm45gR1ssCsfxN6GN/1SvAVaei9sXOwvbL65ZRgRdqS+qzi8hm/vu
	u1xcLv3QvWC20Lq4fmZupekI+41p8IW+R+0sTRdARA/b35PBFA0dW5hsAHGVTOfAFPfr8xY+RZS
	zsWQ2bCC1lnCCs1R1C+5eA52bRGspy7Dja5y5iI/xmJJV/awTzTik7gj+fxyLHQ/ZyIKN+Fyt9t
	oivrKQnRwG7WziNcLuqGXJsEJ
X-Received: by 2002:a05:620a:8521:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d38a1aa689mr701637785a.14.1749463384634;
        Mon, 09 Jun 2025 03:03:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPkrUgLaqtG161AtBPKmUTkw1bGzRfqAuamGIwciZ+5ygYaF/PqxwQ4YTspHzWz2F+rW9D4w==
X-Received: by 2002:a05:620a:8521:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d38a1aa689mr701634385a.14.1749463384212;
        Mon, 09 Jun 2025 03:03:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a817sm1063648e87.171.2025.06.09.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:03:03 -0700 (PDT)
Message-ID: <84f4dedd-fe3a-452f-93f7-b20e0bda9951@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 13:03:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
 <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
 <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RAuQAWaOWxzPu-7B9dO-CUbvp9wmQUGN
X-Proofpoint-ORIG-GUID: RAuQAWaOWxzPu-7B9dO-CUbvp9wmQUGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3NiBTYWx0ZWRfX9Sm3LVVtVFFl
 mNP6po5W2Gg9RgVP319Do6bcMMyt8lHsqimHkOic9XPW5AuEnqojTQwJws4Ln+redAfjbx/AKxo
 /mxo7eQ0SE/+VaIW5nQmJnUcJGtrlGdamw4TR4c59HauYn3CibBI1mF9/oQArizeSdvqXTX9q8y
 wYjWKJnZJ3FoW15j9sMK5lLiEPA0DqFvLXU+L7gxXdFi0V66kjbEynG0C17ezHdAjW6+9hRLd5L
 ncHaR16B5SayQf8XKJIzkdaNrxF+hgnsg+8DO17SCveFZBsGeeIeaZCF5tnyP3c+/HjpzB60DWS
 cJi252JmM3R4Wa35kmbVIhSUhVcmuNTZLMV18zUeel5J9TpxQWn96i2vG8inxaYzUmTJjxvqrTf
 2SXcU/rR468pSyeLqPhSP6EivJI0a5ADjtpE/+sV0Hm70Crk//b8XN/4cYfKA6AREX2OHq0N
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846b159 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=RL8EPRIwvXipj7ok6woA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090076

On 09/06/2025 12:54, Wasim Nazir wrote:
> On Sat, Jun 07, 2025 at 11:22:39PM +0300, Dmitry Baryshkov wrote:
>> On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
>>> On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
>>>> On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
>>>>>> On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
>>>>>>> On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
>>>>>>>> From: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>>>
>>>>>>>> SA8775P has a memory map which caters to the auto specific requirements.
>>>>>>>
>>>>>>> I thought SA8775P was the IoT platform and SA8255P was the automotive
>>>>>>> one. Has this changed?
>>>>>>
>>>>>> Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
>>>>>> the later one is SCMI based chip.
>>>>>>
>>>>>> Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
>>>>>>
>>>>>>>
>>>>>>>> QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
>>>>>>>> inherit the memory map of SA8775P require a slightly different memory
>>>>>>>> map as compared to SA8775P auto parts.
>>>>>>>> This new memory map is applicable for all the IoT boards which inherit
>>>>>>>> the initial SA8775P memory map. This is not applicable for non-IoT
>>>>>>>
>>>>>>> Is there are platform out there that actually uses the "initial SA8775P
>>>>>>> memory map"?
>>>>>>
>>>>>> Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
>>>>>> map.
>>>>>>
>>>>>>>
>>>>>>>> boards.
>>>>>>>>
>>>>>>>> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
>>>>>>>> introduced as part of firmware updates for IoT. The size and base address
>>>>>>>> have been updated for video PIL carveout compared to SA8775P since it is
>>>>>>>> being brought up for the first time on IoT boards. The base addresses
>>>>>>>> of the rest of the PIL carveouts have been updated to accommodate the
>>>>>>>> change in size of video since PIL regions are relocatable and their
>>>>>>>> functionality is not impacted due to this change. The size of camera
>>>>>>>> pil has also been increased without breaking any feature.
>>>>>>>>
>>>>>>>> The size of trusted apps carveout has also been reduced since it is
>>>>>>>> sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
>>>>>>>> carveout and its corresponding scm reference has been removed as these
>>>>>>>> are not required for IoT parts.
>>>>>>>>
>>>>>>>> Incorporate these changes in the updated memory map.
>>>>>>>>
>>>>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>>> Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
>>>>>>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>>>>>>> ---
>>>>>>>>   .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
>>>>>>>>   1 file changed, 113 insertions(+)
>>>>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..ff2600eb5e3d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>
>>>>>>> The naming convention is <soc>-<something>.dtsi and I don't see any
>>>>>>> other uses of the "iq9" naming.
>>>>>>
>>>>>> As this new memory map is common for IQ9 series of SoC (QCS9100 &
>>>>>> QCS9075), so we have used its common name.
>>>>>
>>>>> IQ9 name is not known or visible outside of this commit.
>>>>
>>>> Are you referring to add the same in cover-letter?
>>>>
>>>>>
>>>>>> Once the DT structure for QCS9100 is refactored, we would update this
>>>>>> common file there.
>>>>>
>>>>> Can you refactor it first?
>>>>
>>>> This refactoring involves changes in all the ride/ride-r3 boards which
>>>> are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
>>>> need to conclude on the final structure. Since, ethernet is broken in upstream,
>>>> we are working on its fix before sending another series.
>>>>
>>>> Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
>>>> finalized, we can use the memory-map there.
>>>>
>>>> But to avoid this dependency and to proceed with iq9075-evk alone,
>>>> I can rename it to qcs9075-reserved-memory.dtsi.
>>>>
>>>> Let me know if that works here.
>>>>
>>>> [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
>>>
>>> Hi Dmitry,
>>>
>>> Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
>>> other suggestion that we should discuss?
>>>
>>> Aparently, this series is for qcs9075 only so using exact (not common)
>>> name also aligns the naming format.
>>
>> Squash it into qcs9075.dtsi.
> 
> We don't have qcs9075.dtsi.
> Is it ok to squash it into qcs9075-som.dtsi ?

Is the memory map specific to SoM or to the SoC?

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>>>
>>>> Regards,
>>>> Wasim
>>>
>>> -- 
>>> Regards,
>>> Wasim
>>
>> -- 
>> With best wishes
>> Dmitry
> 


-- 
With best wishes
Dmitry

