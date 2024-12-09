Return-Path: <linux-arm-msm+bounces-41032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D93EB9E92B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56BF1881AFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8F3218580;
	Mon,  9 Dec 2024 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EKQoQe/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891321F931;
	Mon,  9 Dec 2024 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744832; cv=none; b=r9PAOVLy3kQDOT7l6Beq7F+wIBXkzYEVhQ+nPgFjtRZaK67zU9ANrlTqU/9gMe7rHhth263ID7vW0x2Kui8ea59TlmUq3uHyCeEMTrm1CitfUAdmbjjsnzuIUP+1FN5gHNa5OJohy1UynLLEfrNedo1G2f2ZUzkUtYNyeGPbu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744832; c=relaxed/simple;
	bh=UIjErGmqfqU1Sd/W91SEMmcgWCt4YKrvAVeLp7upHjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dvmOo5+QWDiXrYcAGGfseHaBRlc8MCzdzxOnA+Yk3JslplNrhWmgbdEf0aLpi8EHojWPO3KSPWlYPSxfGnW7cCssD4KCiVtSUai2MKBAVh/BMltSTAt+aU65XIdyljcFdiz60cVir/KerKBBPKwKMP4npDi9salVXD9k8v6QH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EKQoQe/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9ADOe5007595;
	Mon, 9 Dec 2024 11:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdPw/W6LeGcWVMLio8NyLtLxoHG6Pis1h/7WcJzxaDY=; b=EKQoQe/MEmgVmKbS
	+wUtB/96D8F476YM3nv39zqIPRlcDSO+MgNaWMVOdC8LY7garhyaGhBhXQzJmoqb
	QdEjlgRqmT/axpuOritaDCipl/j6JLAC9sF6/lVzTpPiL0xW42XHPxLswt9R5Iv1
	3ZB7tuB2hUwh7vAyl5AVCGlXttvgaSpUgFVI3FLA9C5bKQTU7NZW9rqOFoAdCEKN
	Hd18LbPScFuUpaoST7EjGq/rv1M7YG1DojPsNr/hxBCRPKRpQYp4NXQtTBeSyb+l
	fqdON4lp2QCrAeIjPEo0JmnGyTbYHHAsVX0EQTtF4IsY2M9AeBhZqGE13AazZMcU
	DCi9CA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6cpue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 11:46:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Bkt9E027017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 11:46:55 GMT
Received: from [10.216.1.80] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 03:46:48 -0800
Message-ID: <44496510-0dfc-aa14-7793-93abd614fc37@quicinc.com>
Date: Mon, 9 Dec 2024 17:16:45 +0530
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
 <6bb8fe59-a1fc-9813-4623-d27e74a1b882@quicinc.com>
 <2517ef0e-4d13-4c51-b479-863229783223@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <2517ef0e-4d13-4c51-b479-863229783223@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2vVXxcrrBXQAvSz_CVtLjVu91yy0-gYM
X-Proofpoint-GUID: 2vVXxcrrBXQAvSz_CVtLjVu91yy0-gYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090093

On 12/5/2024 12:52 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 04:56, Mohammad Rafi Shaik wrote:
>> On 11/27/2024 1:38 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 26, 2024 at 10:12:57PM +0530, Mohammad Rafi Shaik wrote:
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>>>> index d3cf8f59cb23..7893b1c1f80b 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>>>> @@ -58,6 +58,44 @@ properties:
>>>>        items:
>>>>          enum: [1, 2, 3, 4, 5]
>>>>    
>>>> +  qcom,tx-channel-mapping:
>>>> +    description: |
>>>> +      Specifies static channel mapping between slave and master tx port
>>>> +      channels.
>>>> +      In the order of slave port channels which is adc1, adc2, adc3,
>>>> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
>>>> +      The channel map index values are fixed values.
>>>> +      SWRM_CH1 ==> 1
>>>> +      SWRM_CH2 ==> 2
>>>> +      SWRM_CH3 ==> 4
>>>> +      SWRM_CH4 ==> 8
>>>
>>> I am surprised to see here again 1/2/4/8. My comments were not
>>> addressed. I think we agreed during our off-list talk that you will use
>>> 1, 2, 3 and 4.
>>>
>> Ack,
>>
>> Yes right,
>>
>> Will add the change in next patch set.
>>
>> will add the channel map values starting from 0 based on order of slave
>> port channels which are starting from 0.
>>
>> SWRM_CH1 ==> 0
>> SWRM_CH2 ==> 1
>> SWRM_CH3 ==> 2
>> SWRM_CH4 ==> 3
> These are supposed to be channels, so 1=1, 2=2 not 1=0.
> 

Thanks for comment.

Ack,

i somehow missed this V3 patch mail comment and posted V4 patch set.

will address the comment and update change in v5 patch set

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof


