Return-Path: <linux-arm-msm+bounces-40431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A39E4CED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 04:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22C1A1881A33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 03:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F0F191F91;
	Thu,  5 Dec 2024 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lHziGIX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE01917FB;
	Thu,  5 Dec 2024 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733371038; cv=none; b=hWNSRDQLVwMJqLXqz2rJfrHp6WMZI3peLt6PuryRxFLYcADxwHwxVDxIGgO07BLrTm6DF8YajhqgAiWuZs52As3wYrahkhVS8vaMO5si9ZDnhX9Ymni1zTXX8Dp/lsznOjrCxb8TvmrogQ0wE8lAMTInJzdWeXHK4gxGKZiMo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733371038; c=relaxed/simple;
	bh=OlxUVsBPdXqSK4ENJQR3epETUWGzKNKWZUByunGUU4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mlrALr8GKOPs+Ft8k7idlD+S0l+13rGS6Qphxu7ikZNvibHCVOalxfb87THs2kFU5ikEBLMSQuf0hpCHpm9Ik8NWp3MzmEgJW4xKYhg61+vrnUaRK7tgdHP4V5xXMJJsCQhgzUNw2odGnwneQo9IaoJ0nQRsxOinI3I5My5O0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lHziGIX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4LuqX4029886;
	Thu, 5 Dec 2024 03:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjyTsBPtNRgHy3Ss+UgLNDFc7KY1wwI0hRfezZB9nTc=; b=lHziGIX9mlY2Vz2a
	DYJD8brqfomob//FRTj62LJjbEE85BdzXztwbFY36mgD5/A7WMofhLeBxz+5IyoN
	/lQ+0R+s/WR3L8lnGBM/HAbKkEl0tIk+dSorRbqFlqPwNih3wOmQmprIVcEJmzlz
	ngsWf+c0DMyuKDyJRWebSFdWSHgIxu3XwQ00U9MlrGzdSEOu6cqJHbV7AaymiV9n
	/efxYRhirKLuH3d79q3em3Btagcw2G5vyfcJ3r0eM69WRNZcYjTf2EyUdk6CZtsV
	cUemkXX5DN95GPv6tJXs8/j8TZUTxRmg/1iQHUVuy4i0WD03VXDJrdOXe/n2X3Pf
	FbQHjg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayem8nmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 03:57:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B53v1AM014368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 03:57:01 GMT
Received: from [10.204.78.151] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 19:56:53 -0800
Message-ID: <6bb8fe59-a1fc-9813-4623-d27e74a1b882@quicinc.com>
Date: Thu, 5 Dec 2024 09:26:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: wcd937x-sdw: Add static channel
 mapping support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
 <20241126164300.3305903-3-quic_mohs@quicinc.com>
 <jnetmj5ibmmoiputq52vsvfqjz2auwjeqwt36g7sg4kjrrxyso@nrugsa6px4h7>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <jnetmj5ibmmoiputq52vsvfqjz2auwjeqwt36g7sg4kjrrxyso@nrugsa6px4h7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lA1pltpoWK67t-41P2m1ttB2EgpaoTGp
X-Proofpoint-ORIG-GUID: lA1pltpoWK67t-41P2m1ttB2EgpaoTGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050029

On 11/27/2024 1:38 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 26, 2024 at 10:12:57PM +0530, Mohammad Rafi Shaik wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> index d3cf8f59cb23..7893b1c1f80b 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> @@ -58,6 +58,44 @@ properties:
>>       items:
>>         enum: [1, 2, 3, 4, 5]
>>   
>> +  qcom,tx-channel-mapping:
>> +    description: |
>> +      Specifies static channel mapping between slave and master tx port
>> +      channels.
>> +      In the order of slave port channels which is adc1, adc2, adc3,
>> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
>> +      The channel map index values are fixed values.
>> +      SWRM_CH1 ==> 1
>> +      SWRM_CH2 ==> 2
>> +      SWRM_CH3 ==> 4
>> +      SWRM_CH4 ==> 8
> 
> I am surprised to see here again 1/2/4/8. My comments were not
> addressed. I think we agreed during our off-list talk that you will use
> 1, 2, 3 and 4.
> 
Ack,

Yes right,

Will add the change in next patch set.

will add the channel map values starting from 0 based on order of slave 
port channels which are starting from 0.

SWRM_CH1 ==> 0
SWRM_CH2 ==> 1
SWRM_CH3 ==> 2
SWRM_CH4 ==> 3

Thanks & Regards,
Rafi.

>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 12
>> +    maxItems: 12
>> +    additionalItems: false
>> +    items:
>> +      enum: [1, 2, 4, 8]
> 
> Best regards,
> Krzysztof
> 


