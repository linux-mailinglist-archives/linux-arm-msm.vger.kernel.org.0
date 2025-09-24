Return-Path: <linux-arm-msm+bounces-74552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94554B97F56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 03:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98D6819C0C23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 01:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392111DF965;
	Wed, 24 Sep 2025 01:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdADJHtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B51E5B88
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758675611; cv=none; b=hyYJ7ViQFvF9ozhP32f32ss9Qj51rfXiwXKnouUhSCtYnZrxbFnBuUc28riBdA0By8fRsOGZjJAQ4P4tXSnEjhKvAQyCasBTSU+P6vHHTuAAgmcPlP6kWRGXVnFesLgiDgnys5/6L7PkQ3x7jBUsCCDGVY1aGJ2TdgLdDuK3aIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758675611; c=relaxed/simple;
	bh=aPg0UmtWDWWN4/58XT6GxNp1y+uyLy8yBlL0KKGR5cQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PZToihODexsvlhS0YFJJ6r7km6pi/7s6MgVAIblhIci6ifEi4RXCZpeJ1Y0flUjRi2rOCpwSZf1vlQK7ccba7P58e8xgLPIk3sIEm4viqd/orxN5FigeiyRp2HoDaPKGMSj0LtWrSnUcmyFvUwxx8OiSt/BaLITIU1B76lcHj1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdADJHtk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFNw8N004484
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 01:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2zvsIx0xpsseLnuqD3wgD1uVrKng7sqp3Iah6620cQ=; b=fdADJHtkDZluEdxf
	dWy2qaD1z6tiE0NDephEw64aP6tE4TUKhFxUpOnASzJfCsajURWkEQgWLmCSSA4o
	+SmlVg7B+MVPs/l/omMhm8Mf9EYVjUAqNNnzkVpXhexxfcJp+yYoRK4L2EXQyXkJ
	ragWJMOYEpGZ4R7sC0r1R5mUTuEw7uqvT4sBodFaG0IITK4ourkDoVXPAT9U+P/w
	7p5IUliSUv0Vo3SZh7pU15QAVON0Oe13AfYqYUV2crBIzWJWLTzzu/IUCmI2sOCw
	vaDZFybNnROri0cEDaIdbrsqbRA4atH/kIh4lSTSXSzPCLcSSMTaXTQv3gXmfoX6
	0nWlJA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmntuvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 01:00:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f68c697d3so184652b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758675607; x=1759280407;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2zvsIx0xpsseLnuqD3wgD1uVrKng7sqp3Iah6620cQ=;
        b=W7MeCc4ROzVg6Q/4lVw21KxUCwIGsc8FtrPBWLBpdjsJyrHibQhbi+AXXkIFAV+PdN
         ZaXyG0JnhuvGkNmv5GtjWuVr6OjCRBgO54FbPF46VsEQpG+XMjG6FLsiJzBweNDJpv4S
         TgITffJigoCBB92BPjURd5MB2pgmxER4/Pk/cKj/tPAqFmypqU/X+1C/NEIniJCFH4IO
         BkSGVeQFRfgENxrE7SzvJtsXz8ug6YTuyTH4Q9jNSTjUKvYNse5FMev7vGuDNss41nxy
         IN5sbON9u6kuYyjCWHHJBbUIR6/71V4PLA0kv7o3ZQNYsFobLPYMo0B0DBeQw4NkgY8x
         xG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0SaVm4SBHFC5DsBPnj/Y598MqJb3OHyMWycFgovTa4FHgkdJCgQt85s6kYg3HNOX0z3f+l704uhaBMeZP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ce8s6DPDNsVu60H0ziDTMeJ73S9xoAP011dNvXJ0HUkRE249
	nge3mmNaBOMCiXUzsoKG9q0rwlk9u2ikSTLgIMFOVsOO5c5rEE7b8SpvIjSnWXi/L3uxb7g/Zq2
	bF1JmDMJEwChxgHA3b1eypiJz4H2IQe/ptyDgq9wKn3ZmCJy0W3JkQqX5t4eEEuAQ6oHD
X-Gm-Gg: ASbGnctkstXgsuLUMNYIVFc9mDDpvP0wRa/lexXrvXfg177ieNEAPfpCibtzZk7v1/E
	6sszCbr4JYHBo8OJhm6ieGwj0tO+TxXsddy0/mRse9bqiUUJ4NROP4ycTOR+L6H8EaVIFYTPZTc
	6LMgEL1InnFFfhjpo2p+GQrnLdmcFL/7XVDSQ/zeMESngbsNCdGyS/NPrYD+uWDl1ZqA6EM0KCH
	/xfUEVv7ac2dXqnhyJYeRTxLD/wHMeiC+8Js3iGqXxvzFOwGSa+0WzBOXi2ApfqoSugpATaCYif
	YnDw8K29ANQ8vojowOQy2w/9N+x+2SbA+44UVhhzlkKWYw8X422Ov2yvIty5OQ6+t/5fSw2N1NQ
	NMm3JEg==
X-Received: by 2002:a05:6a20:3d87:b0:252:2bfe:b65d with SMTP id adf61e73a8af0-2cfddc6a137mr6516267637.2.1758675606622;
        Tue, 23 Sep 2025 18:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0NAzGMlXuVw5j4OF/iTpNasadjCiM+4Mz3TJZj0Y3pZnZIJg5KRsof0hAuREl2zzoKFq8fw==
X-Received: by 2002:a05:6a20:3d87:b0:252:2bfe:b65d with SMTP id adf61e73a8af0-2cfddc6a137mr6516229637.2.1758675606142;
        Tue, 23 Sep 2025 18:00:06 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77eee36c2b2sm12958795b3a.78.2025.09.23.18.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 18:00:05 -0700 (PDT)
Message-ID: <31f61f93-2e9d-565a-cd5e-4f668ed7d6c0@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 18:00:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur
 compatible
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>
 <20250922201449.GA1235521-robh@kernel.org>
 <554cd2ce-a617-9387-7379-a3c2b9de843c@oss.qualcomm.com>
In-Reply-To: <554cd2ce-a617-9387-7379-a3c2b9de843c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d34298 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1x5KiYs_k_UboVqHg6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: z0jI1BMDvcc68YsrthGDoguaWJuq0P99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXyhWUDk9TR9rp
 8NRFsjIXsn0NSFPd//Tpv8Rq7+oSWIOv8JfKav3QPLW1wN0HVUstqrCsshq76aKhpI0zvWBTWma
 z/zamZvAtoppEX8if5gLUPA9utPDeG/oeHNJTMaV+fu9JXe3vueMlEI5F/90PD2MLuYW6a4dJdI
 sUwm7qbZ9jvIFuRhN3P+hr4a3+6fl9t35DQkPmBWnrDTVodvK0+QzNq5ZsH9kFr2Xwk1iFnxkel
 CyBXbyqP+YRwpQBAh5ddChXdmrOU/bR8+aEyuLSiwwTWXUcditg/VJ0U+V17+mhaR6CVupAHmc5
 BE32pMtnSzKIqEKE0/aV5A4LVK9k6UaKLkiuq6vd9/EDdX9Jw82iItE6JN06r3tyOnFkjv8P+9b
 f26Tq4Tx
X-Proofpoint-GUID: z0jI1BMDvcc68YsrthGDoguaWJuq0P99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000



On 9/22/2025 6:02 PM, Wesley Cheng wrote:
> 
> 
> On 9/22/2025 1:14 PM, Rob Herring wrote:
>> On Fri, Sep 19, 2025 at 08:21:02PM -0700, Wesley Cheng wrote:
>>> Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
>>> the fallback.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml   | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml 
>>> b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> index c84c62d0e8cb..b96b1ee80257 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> @@ -15,9 +15,12 @@ description:
>>>   properties:
>>>     compatible:
>>> -    items:
>>> -      - enum:
>>> -          - qcom,sm8750-m31-eusb2-phy
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,glymur-m31-eusb2-phy
>>> +          - const: qcom,sm8750-m31-eusb2-phy
>>> +      - const: qcom,sm8750-m31-eusb2-phy
>>>     reg:
>>>       maxItems: 1
>>> @@ -53,8 +56,6 @@ required:
>>>     - compatible
>>>     - reg
>>>     - "#phy-cells"
>>> -  - clocks
>>> -  - clock-names
>>
>> How is it compatible if clocks aren't required now? And clocks are
>> suddenly no longer required on sm8750?
>>
> 
> Hi Rob,
> 
> It depends on the clock subsystem.  On SM8750, we still need the clock 
> entry, because we need to control the output of our CXO/reference clock 
> to our HS PHY.  However, on chipsets like Glymur, some HS PHYs in our 
> USB subsystem doesn't have this refclk output control.
> 

I've updated the bindings to keep it required for SM8750 and optional on 
Glymur.

Thanks
Wesley Cheng

> Thanks
> Wesley Cheng
> 
>>>     - resets
>>>     - vdd-supply
>>>     - vdda12-supply

