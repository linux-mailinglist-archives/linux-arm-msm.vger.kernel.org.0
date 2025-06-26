Return-Path: <linux-arm-msm+bounces-62646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D000AE9F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692855A179E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578102E718D;
	Thu, 26 Jun 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xn+dBHrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2952E762B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945780; cv=none; b=ENzpLg5kuHW1MAhNk+snptOO7wCyZ2/RynSPlD534dH4/GeglIGdTCkf6zpVhCkc1nLdjqN+Rxhi2pCCqJcC2Tfuhre25WENkjEeby/0CeMUEQXwmsKUo4PZAalKnnS8AkJDx5zz8MY7/RGcKIgkvkd9cfPR+P4s995HzFCZ9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945780; c=relaxed/simple;
	bh=7soQAPGLWq1wxtwbCSjjPgm0cssslz7RgCt8zlMExqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbdmcGA0J4wixq48+v+HpwlO8mjrYcHw4pvaugkb5VZtaqEVSBektILTQsHql+fPSLlbE7vk8XiE6aIBgO8WeoW2pzCXY8IAoqLEK49VeoSH9xrUZ3C9e9LbeqFe9McMAZKpxfeHQMwBbxW4xSojP6Qkz2H4GnTIIGjhL25XdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xn+dBHrN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xofO031195
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKzdM9fMZXWLUOkRuS4r8lfC3OfMj540spQyqtt5veg=; b=Xn+dBHrN5VKvXc0D
	Uel7/VLxwftzvNcg9Eh+UXA2oDIDPpCMUrSFrToVuR/GTtxbE6cIaM6uB2Py1laP
	nxcMhFb9KNHBVokxxOa67AfuKG74utUlMGRlw4//o/kc5UvfBtYoezg6vpD1UoaB
	WqauyTTAPfuEVu9UMgd6nzlYj4/jq50NGJGxvyZI/UWnn05tJOh3E4cL4fvUsxCQ
	CXOaB+HaksjOHqBrFUZX16ZSs/oCBbfPgDQGmjyNKpOm23EajMWnHOahiUPXI+gF
	AbM4Vr0SAZMY+6UrVka8bOOBDDE9qxdoTJOwvYjPQh+z+HMyKEs4rRjgn9NnsPU7
	LL17ag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b43cva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:49:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso3196771cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945776; x=1751550576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKzdM9fMZXWLUOkRuS4r8lfC3OfMj540spQyqtt5veg=;
        b=u3atWFsx+UvMM3QJFeyFwa8z0m+/l7qh4iaQLbbRTlXCClEEfiIB0xRsgFtRo2NLMZ
         AOLUQKTMSSfgWj0pDn2ju5bOvrMZ709SHd5cPI5skuTLptw0HJo0FwJzuEqkHgr3DR1H
         qndyNdf+shhCqVOsAB3jA0jWiD4DfS8niF59+0T0+FjE1HVee+yje8xCRbxj0n/ph7uM
         jCfv+l+Sl7vofSxuFGa6barcpUcLfb/IfABii6l6JDPW1WkMe6wEE3NqOfLe/OP7zyXH
         Ji7wInh7qa0qpX1HFE3lICduZPbMBSdAEwMHdWfRnpSizCcT2IyadRYx4tor01eUU+c6
         CAFw==
X-Forwarded-Encrypted: i=1; AJvYcCWOLb7dydrUmLZzwN+VW0nCFHdZIAwn0JKqj/Cbh5cRkCJeViz0tqLtGMudSfYy1QnZ+9SvzS8jY6lEmVCU@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3kqgjX94QNT/vHUsXNz0pW0tx3zIHDibWzNOzRKDiqR+oLzB
	IgDy59b7gMmf+22znu0pRbWBavxE6s48FrWs1w3xREeeXk2aGD+XGgqIfXe/Qvci2xpHZzac+VX
	2Bd6a6EBnc2QC9UF4Lonmqi+qd2jqGVrkObfJb7nPCrDNJhHe8D4abytyhe0Wa6n41m/q
X-Gm-Gg: ASbGncsbIMwUv2lCn7JY3+eud+jbxsbW0+h34/2JLJpqd5gPAWHYk+mxOgPKV8pMGos
	rKNN/QPiu9SPI19GOde3ufO9WkPStLTVX1TLXkSwLCcSXk02857xh7ZHUvuFrq2lPJGu1Tg0drD
	YxJqyZO1OdGnILLRJlqxBaIPeaMVnz3dpDrQQyzV2tjshxLsKSwGxqTtibRUH1LvQztE4qf7Zyy
	DazmhXLxiRdsbQ70YYsD1BRe3cjc4Y0uGIiFZjUwm0i9RXT0IU8Yz7BQJEdpXgDdOW+jakepU8U
	dr/VHolI8sRc/0qVq3ZdxvViGDrw0lqY8uQ3IN7Kc8s2M+oYPIZWxn/ATPr6UCFrVI+89yO4BU8
	d5gw=
X-Received: by 2002:ac8:5cd2:0:b0:4a6:f7dc:d0ba with SMTP id d75a77b69052e-4a7c08a54ddmr40139521cf.3.1750945776237;
        Thu, 26 Jun 2025 06:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEytgFicUwxVtuRipp+MGkdKAo/DZIZy/PYmxSSSPftdTFihChTHOMq2r7K5wZn4pDMiN9TDw==
X-Received: by 2002:ac8:5cd2:0:b0:4a6:f7dc:d0ba with SMTP id d75a77b69052e-4a7c08a54ddmr40139271cf.3.1750945775648;
        Thu, 26 Jun 2025 06:49:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d8ee1sm2146366b.91.2025.06.26.06.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:49:35 -0700 (PDT)
Message-ID: <cae5bfbe-9537-4b9d-b026-170063054b35@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 15:49:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
 <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
 <aF1Hhs0JAS747SVi@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aF1Hhs0JAS747SVi@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExNiBTYWx0ZWRfX1FtwWN3tDA0P
 WvvQxg0MWOUHPgYwXBA0PSF4C/YffYjLlSOmBNrMQt++D5bQq7OTi4kymfjO8By+lYleYiWqmSW
 bLNIV46q+gzw3jeawO4EvrNoQQZZimKCy25iOsvvOMPEowmXaIQ4Acl+/gxAPtA6X5xMF7ypHyU
 t1MzM2G2vImLbP92YJBYzmDL78dpnBw5Rsi8zJIjzXHj9fXskp6UeuEao9HOUPwq0Hfjy7Os8Kd
 871HfD3Foomx1uOq/kSNYakYd2OAzI50vM6YAcIpc/ET2CN2bkMm/mCv+CQ+W1b2ycsZJa+JKQb
 aUtK7ekdtnRiID32fPU6c0YcAK9U5fOvdymwyJLeVCdWyAKGW61unHOZoms+afF4OlDGVzNKEb/
 IBWQVyM+YvrFP9Egpo+j5qdLTu8JJkZyvyKuM5GlwJpIDWfY+XtqhSARYmftS/h6dDuLcv45
X-Proofpoint-ORIG-GUID: CJEij4Z5s8PsmD837pTYveDuV5j6Yy2i
X-Proofpoint-GUID: CJEij4Z5s8PsmD837pTYveDuV5j6Yy2i
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685d4ff1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=S-ZiAtxHWdWJY4AEpg4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260116

On 6/26/25 3:13 PM, Johan Hovold wrote:
> On Thu, Jun 26, 2025 at 02:15:26PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jun 26, 2025 at 11:42:50AM +0200, Johan Hovold wrote:
>>> On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
>>>>> On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
>>>
>>>>>> Also not sure how useful it is to only be able to read variables,
>>>>>> including for the RTC where you'll end up with an RTC that's always
>>>>>> slightly off due to drift (even if you can set it when booting into
>>>>>> Windows or possibly from the UEFI setup).
>>>>>>
>>>>>> Don't you have any SDAM blocks in the PMICs that you can use instead for
>>>>>> a proper functioning RTC on these machines?
>>>>
>>>> I'd rather not poke into an SDAM, especially since we don't have docs
>>>> which SDAM blocks are used and which are not.
>>>
>>> You're with Qualcomm now so you should be able to dig up this
>>> information like we did for the X13s (even if I'm quite aware that it
>>> may still be easier said than done).
>>
>> I'd rather try to find information on how to update UEFI vars on the
>> storage.
> 
> You can do both, especially if it turns out you won't be able to have
> persistent variables on these machines.

The danger here is that we only know what Qualcomm uses these cells
for, not necessarily what the vendors with a similar idea could
have come up with.

This is especially important since (unfortunately without going into
detail), you *really* don't want to mess up some existing values in
there.

Konrad

