Return-Path: <linux-arm-msm+bounces-66171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE7B0E871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 04:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D237A3B62C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 02:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041331A08DB;
	Wed, 23 Jul 2025 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjT97HU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD6197A76
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753236165; cv=none; b=XI7hFM3b2OUmkEk2da8u1fRvOPDaDqSFj+i8I0WaFpl7A83c+5OIY4rwi3GoCIPCbxJbTvwRvuU+RYtoqf4936n7BJLBwE7Ky4BcS7vXpG16U8xTVlIJCVP+74kexyK/Lt0iuQcBxFOgrEtlRU5/vMbtc9/nl713i9uXUnO+oAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753236165; c=relaxed/simple;
	bh=6F3hhhDXHFYRN2PO7y3xC+W2D4Dq5tArMSG1+f373rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u72p2UdeV9wiVBVIo41QjCv+6WS/5ofup1B8POBYBbLQA6SQ9XWeGja2OQSGJQOREqbLzKrTfTmexl7oUoI4dyPy2VD6SG/r9pd/cSuZbeDKmdmBPva5368d/7qS6nJUghDoeaOGnrw6LYc967uiYj4LHQ00RvadMlM456oldDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjT97HU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOKj1022829
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 02:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvE3JK53Y0Xx+2JHZiTEwGbmVHErfebjgQfHhe4H/Q0=; b=pjT97HU7CwM9GBzk
	teS0SC8m4jPfoWz/Sh54Oq+T+xR1hhyE4+Tlxp6+dPypaQrgjAUnNKTkauhdRFlt
	uHnCTOQPEAFcFqrnHkPUp8NOqns1BLYgilKmS3YRxVLDjfB7sJtTCrcriUJN8smS
	7rU+FtIg8tDJJAvgpmMaNfBvsvAYc54P46bqMnp5qBI8AqDyDsX0hz02YvdCCv2D
	SyQyzYEuwAE+TqTTohoaWQQjqHlJCGHccbsWLaomk0/uWxJNrZCaHcKMQDqOeo1Z
	vdBzxpv1HoWc6Yqt6p/3alGlpm2lMMfjzXoD4felKY5kLiv24krADClpfFlxU5VS
	w8NMcg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3ep8mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 02:02:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso5212116b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753236162; x=1753840962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvE3JK53Y0Xx+2JHZiTEwGbmVHErfebjgQfHhe4H/Q0=;
        b=cYSG8il8+Y29np1wFLzxBsOaHD59+HvqmtAOdFGXDQjeJd/+ZuU2Mv/K+VuKRi3CpE
         tHnk6wPemIPmIF/N42ZTotzYru9CO4iwz9S8NpifNK3UXvB2LNdLDnKy5CJZP/SmXx6z
         yEOI98+KNOc/717Ti615iX7mbNfqM1xUk3bBpUPMAL/6S3xnIcHfBdCQzCKqAscXfipf
         dzv/IsnhgG3vAX/HayPHlWvfn/ygHPBHoADOAzOGJsr1ZaygQkVGbYannng3k97GyK6H
         lmbTJz4KGJC3p73CmljW1JFfBjYupHz8tRmDk4OCAf5ziI899DfJj8f77j4qDLFT2QBN
         ppuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJoY0VhD2T0i6lpozt9UExxUZp70CNs3p3ulA5D7Z+/wDmqtiVTRePfHXUGXGAfqtLAScfO1B3g+QmhmxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/20F8EA36dZsvDbKF0SJj73YQuXg+YNJYSiUArxqxE7OZgGi
	+p2rqw84A6udKnOkesG+llsvZ4Z4k0LdFANb1y7uW35wtH6Pmi0tRYzz/ARqV+JMMwGiIowPfL9
	NogFskSf5k7tLzsquIXoL+JPwmjvy5Cr0ngJuoW2b4ohO34ch0Sxvig+KJSUClOEUVxth
X-Gm-Gg: ASbGnctnWGA5dimZe+cqdqCiPnsawWrVgfTgz+IzrlOqZk1uxYBz2dF3w6aHFc/ET/e
	nbrAsYveO7my1DmbF8PlAuUnie6AvcIGFUjogCpndSz0xpSCRTwZ8naQtjA9/KUP1dT+n+u4SxK
	addo9hs2G6VIT089Pg5+xYz4rDKe8zSCJfCKqu/dp3ZO2QNPxkkQNG4y2uwyeOzgFJUFw4unsWQ
	lbJEIVV4h+Zc2nYq8Ezd+A5lzDjrSM1XvoF2LJJvEcfyccxEOIB5Hs66GHJOyM5mQDCtGkPIND/
	FgBg/o3HGAaB39jX0nKYPnehMinXDvi3YOrrQjqOAjrmCJe+gaQeChJMJ4vcm7+uIqiBY45fIFU
	b5RgLKQo8EmIm0fKZ
X-Received: by 2002:a05:6a00:b88:b0:74e:b9fd:4a3f with SMTP id d2e1a72fcca58-760348fd155mr1772421b3a.10.1753236162452;
        Tue, 22 Jul 2025 19:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz6Z/xfTkR7LVib4gNFjxlAUfzNLNwWomRsnZ+ul5/oJgVXhvsA7nk1F/qXuxTLMJb+eDqOQ==
X-Received: by 2002:a05:6a00:b88:b0:74e:b9fd:4a3f with SMTP id d2e1a72fcca58-760348fd155mr1772380b3a.10.1753236161938;
        Tue, 22 Jul 2025 19:02:41 -0700 (PDT)
Received: from [10.110.52.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb15698dsm8617323b3a.89.2025.07.22.19.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 19:02:41 -0700 (PDT)
Message-ID: <469e2e9c-b950-4ecc-bfa9-82aa9178b65d@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 10:02:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
 <20250707-615-v4-2-1a2f74d167d7@oss.qualcomm.com>
 <smnw6whsw5todddsoveeanohcaesfip27udzkbw5wk5dwlztzz@ic3xemwrbjwg>
 <a63cab56-2d32-4d38-83f9-911561807e9d@oss.qualcomm.com>
 <7117b159-6743-4db3-9ae5-1cf4ae051601@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <7117b159-6743-4db3-9ae5-1cf4ae051601@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eGRed2g4AA1Cvj9nAV75Hq5jY9_NJbEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxNiBTYWx0ZWRfX5Phl/XOkN545
 dwZHqM+p8dwI6tsVpWc+EsSBndSFiHOZJWIQ5b4YdhgpVpqA/ZrE8yMsLW5dnPmzIp0WTQezssI
 QHIKEwph+uFKK/ttIAIjt7vYWaNBM8CayyQyIXdFXQc4teTKiXjX9rlpwzA2nxvPRgsMjtuzQsE
 P51sOaChB2SO0PA/X6Fd/l4EUExVZLMhzM9/bVBwbW64EB/Keh82z1fv860rLm2YdTqXVt2LDtn
 5exrDpols7R9osY+rIQdtinjku474NlNQmo42tk6oJ3DOJp7ddnJcLvlIfz/A3QWVGjJC9YjlC6
 Fql864SStwqlW1LeiLpLW+SDeGSQkCJnUH6Hevm0x16wwJlXFOZhib2pxgG5HgUDjQR85cRfQ16
 T9iyBxGqAvc2WVqex8mxwCOXrOofJ3LrxYIrxxzyV/RsYCW7XHHdaqy4Q98O4jnTK2F2duZu
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688042c3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5zsccHoAccC9vreTiY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: eGRed2g4AA1Cvj9nAV75Hq5jY9_NJbEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230016



On 7/23/2025 1:36 AM, Dmitry Baryshkov wrote:
> On 22/07/2025 18:58, Yu Zhang(Yuriy) wrote:
>>
>>
>> On 7/19/2025 6:13 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 07, 2025 at 10:51:06AM +0800, Yu Zhang(Yuriy) wrote:
>>>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>>
>>>
>>> What is "existing WiFI/BT module"? There is no module in the DT. Not to
>>> mention that PMU is a part of the WCN6855.
>>>
>>>>
>>>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++ 
>>>> + +++++++++++
>>>>   1 file changed, 135 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/ 
>>>> boot/dts/qcom/qcs615-ride.dts
>>>> index 
>>>> 011f8ae077c256f079ce1b07720374a9bf721488..2df8e7e3c1d3b6d6353a6753b8387c7411edd927 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -18,6 +18,7 @@ aliases {
>>>>           mmc0 = &sdhc_1;
>>>>           mmc1 = &sdhc_2;
>>>>           serial0 = &uart0;
>>>> +        serial1 = &uart7;
>>>>       };
>>>>       chosen {
>>>> @@ -47,6 +48,85 @@ regulator-usb2-vbus {
>>>>           enable-active-high;
>>>>           regulator-always-on;
>>>>       };
>>>> +
>>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>>
>>> No improvement. Please try again.
>>>
>> you mean should be "vreg_conn_1p8: vreg-conn-1p8",right? I'll update it, 
> 
> What is the node name for the previous regulator device? Anything 
> preventing you from following the pattern?
> 
Do you mean the prefix 'regulator'?
I just want to keep 'vreg_conn_1p8' and 'vreg_conn_pa' the same as in 
sa8775p-ride.dtsi, because they're using the same module.

>> thanks.>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_1p8";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    vreg_conn_pa: vreg_conn_pa {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_pa";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>
>>
> 
> 


