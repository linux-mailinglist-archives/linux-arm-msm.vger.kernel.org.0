Return-Path: <linux-arm-msm+bounces-71957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA68B42EB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 03:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B4417ACBFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 01:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238D21922F6;
	Thu,  4 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPimfGms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715B18B12
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756948348; cv=none; b=Ia6Kni95v6T8GJ37geUnfh2t7nn1PLdN8U9MSa6totGFTl2Lc279YTT2PZebANLzet5RPdqg4MxhlC3vkTgSX28obeY2ZUajreb7U5UbcFdOR8c6Iluxv/r6FjQYqQK0s6TJSvqEBkL23bPaLMLT2NAJRxrz1obsx6I/KAmNhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756948348; c=relaxed/simple;
	bh=99CdkSrlewbo0LGOH4D7+p7iVei0kL0ATm/0HpkyhKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRosrBZreFNeNk7IX6DDJJmjV2uKB0sF1jpDofUCEwdwIVP2Ipib3KacqMa6rNNfawW1odpzFJVvTURfrGgUtebg8LV/eOqhygw9U++L+aUy9igKfwjrMH0Bh2Lha4OtQvx6RAE97hT4jb+o/MfzNt6xbcBdjK40cmPH1+eWDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPimfGms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqVh016615
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 01:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4UlpG8f8qlhFUnHW3S/D2my3ldPT+l0SoxGKdP3InE=; b=aPimfGmsnQkejr9f
	ZqlGJ3q2HQBGtf0RXrzSel2OHyKkFC+5GHwFiMDJCbx84oN6T4vIbwzZylut/UEh
	EtI8JX+3ClI/Ka1L0mFQAdOzfGJaTZPfxMkwAh46kwVZgaAkulJWDDhK6J7cngYl
	cJVIF4XR03X7MrD5WcezVT8JWEaO85xtDiCYoOSUCWRe3c7Vwq8CVuhY623hn0VJ
	tlcKC9bOU4qGdbvHqAR8zLqqdeu3K4kxgbxz+S3/oxyou7VyIPm1zQRtjFR1gJa6
	YU+j4VehNKXOBI5jD92T7oebXKKjEjWapSlDZLby4QGHB3L/4dnye+ypyrmL9MXS
	FpkS1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj2819-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:12:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4e9b55baceso716988a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 18:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948345; x=1757553145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4UlpG8f8qlhFUnHW3S/D2my3ldPT+l0SoxGKdP3InE=;
        b=bKNpFQ7/l14eL9Z6LoQWaJKAAuOuhCLU/cVLJ3/VGm7u4pHVPJcHKCHucbt+ZVRWT+
         y41FzF4SX5jPN1NnppA8G6nXfe28BT6NKbIKn7knzStIM9E93S5azZN72ikwuOEjuFcr
         RboWz9qq0iGqBs1sZoUH0hnglltmV+etoVPFKxlOMnRNttrhKEKalGYydhJ450QPGvuu
         w9RWbyReQb+grSVevJ3x6KRjEgP59ExuenLZg+4i3It7FBNqd4hi6cUdsPy9R3H5/my4
         Sw/0m2GXOM/SSMEmnDTM97FWYtkkVUuMuOfJgQBRjTPjkByH4MFYZscw4NXKHh4fJd4r
         NEXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfRZYEEpMnIfyRktIWvkv/RIZ/bcC18Iyx7A6OHYsEPkDLPG9i4vaxt7ufl4FZrd4dGH/tbabMsGu1EtaB@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCNkP4AKslkCT89LNYnUs6yS5ZviUP6lZBbNX5b+YxKx/HEv+
	qgld7KToM2EZuC+YGPSQyWBrvpNL6MTrMnPPHAy0l5PYRJnhhZi2bt/37/l2DWXRQTxLCU7VJ1I
	VueAbzzQCOpnZAX6U0jZ6P3NJgjSiUugGl+tOw9YX9dWlEOb+ZvDZS77IcOpC/kF3VvbR
X-Gm-Gg: ASbGncs3I0xO/CaUKMaRVT7pIPJ6jI5BVQkH0bVmbp5oShkMBau2zbdimPq5eWC0tpN
	Tq7MaKTcaUuuLsOixl5mmAd91kIlO3IhhAwh0Tp5fyrN8AIoxmzXiDVFAYbk6wfeiexaRMyA6nN
	KyoNnFHtzZtkfk6JvqF4jeV5IH5AHpkPClTpI47ilVcnEItWTzE3K5acXj64u0878GsoaMlawHK
	uddZmEpKwJUmj3io3NlTTqCbWYl7RiaBmQMSl3vaVlSONmokWqnlzpmwxwjrHfASUA46UqEvMpJ
	aI0G/9XKQwHPNImlvcW53fkBRO0oP7QqlkoUaIaWT+SNrRFauCFAh2eCLcBWsWqXN6si2/RC02l
	R1G7GW2hWmZ6yvCEZem0Q9vojvnEp
X-Received: by 2002:a17:903:2f8c:b0:249:37b2:8630 with SMTP id d9443c01a7336-2493ee070bcmr241542445ad.5.1756948344533;
        Wed, 03 Sep 2025 18:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9czfEhRl9hye4C8gtNxqDVYJf3M5iT4GyatmB+ImJck7rp2ujuN2+s56plaoGT8AWoaCKRg==
X-Received: by 2002:a17:903:2f8c:b0:249:37b2:8630 with SMTP id d9443c01a7336-2493ee070bcmr241542015ad.5.1756948343958;
        Wed, 03 Sep 2025 18:12:23 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b7eesm29677115ad.102.2025.09.03.18.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 18:12:23 -0700 (PDT)
Message-ID: <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 09:12:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
 <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX0rKBV5VGX/zF
 67/Ph7mwfLW1yco9GXIoGge8BsYPpUT3pc3HG2tl6mHywwZzsyopxzKEeQdeFd8bCzU65dKY4hU
 59cqAOydKolkJis0y+a3sqd6lO/BymTZQThkUJGh9mc8DhjYhYiGJKm6efPw7t/OtKIVa6MEgkU
 4iBCthTJARj2y67ASe3NddAE4cXdu45LvOVc/5sz7yAoHnHo0mD56yrDzF7LVuKN58hJfKBtTto
 jBzUbu0YiBTtp6rIV3R/fu1KaKNzi/CeiWMhUjcTcCrrGa+kgoIXt8qm7u+TPQ2qAdFpMEQ1kin
 JBoG90ff2dLft7onx3jj9wIaHTwQOJK/RWDPiIRTVbZp85iWxK+Zs1nRjC3YjKOWwfLaL2y38mW
 owNm/FPf
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b8e779 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7yWgPBNy7Zp0T3bZPJgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: n6szjsy7wTdCbtbyVRAiTuLN3lDqFDlG
X-Proofpoint-ORIG-GUID: n6szjsy7wTdCbtbyVRAiTuLN3lDqFDlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117



On 9/3/2025 5:45 PM, Jie Gan wrote:
> 
> 
> On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
>> On 06/08/2025 09:09, Jie Gan wrote:
>>> Some TPDM devices support both CMB and DSB datasets, requiring
>>> the system to enable the port with both corresponding element sizes.
>>>
>>> Currently, the logic treats tpdm_read_element_size as successful if
>>> the CMB element size is retrieved correctly, regardless of whether
>>> the DSB element size is obtained. This behavior causes issues
>>> when parsing data from TPDM devices that depend on both element sizes.
>>>
>>> To address this, the function should explicitly fail if the DSB
>>> element size cannot be read correctly.
>>
>> But what is the device only has CMB ? Back when this was originally 
> 
> We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.
> 
>> merged, we raised this question and the answer was, "Only one is 
>> supported, not both." But this sounds like that is wrong.
> 
> I think we may not answer the previous question clearly. But it 
> definitely has issue here.
> 
>> Could we defer the "Warning" to the caller. i.e., Let the caller
>> figure out the if the DSB size is found and predicate that on the
>> DSB support on the TPDM.
> 
> Understood, below codes will be added in the caller to check the error:
> if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
>      (tpdm_data->cmb && !drvdata->cmb_esize))
>      goto err;
> 
> Thanks,
> Jie
> 

Hi Suzuki,

I've reviewed the logic here. It's not feasible for the caller to 
perform the check, since we first retrieve TPDM's drvdata, which adds 
complexity to the code. I believe it's better to handle this within the 
function itself.

We are expecting the element_size for cmb if the condition is true, as 
well as dsb:
if (tpdm_data->dsb)
...
should obtain a valid element size for dsb.
...

if (tpdm_data->cmb)
...
should obtain a valid element size for cmb.
...

Thanks,
Jie

>>
>> Suzuki
>>
>>>
>>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>>> element")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 0633f04beb24..333b3cb23685 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>>> tpda_drvdata *drvdata,
>>>       if (tpdm_data->dsb) {
>>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>> +        if (rc)
>>> +            goto out;
>>>       }
>>>       if (tpdm_data->cmb) {
>>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>>> tpda_drvdata *drvdata,
>>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>>       }
>>> +out:
>>>       if (rc)
>>>           dev_warn_once(&csdev->dev,
>>>               "Failed to read TPDM Element size: %d\n", rc);
>>
>>
> 


