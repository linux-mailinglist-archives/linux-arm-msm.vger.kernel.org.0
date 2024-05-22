Return-Path: <linux-arm-msm+bounces-20275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7948CC9F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 01:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 712511F20986
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4806214C59C;
	Wed, 22 May 2024 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VgfF8yeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10902E631;
	Wed, 22 May 2024 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422268; cv=none; b=KYmODcnX6BhZ3fqfnIinOCQjjuX4MfxDFwFdCz/k7CNV/8bxiZBrafLYZC3BLNv3ErBzE7mx9iZw6Ex25T2F1gX+lgex/5yvNlbhEYw6tTC8vLEsHmVeX5DfkwJ0LgbcNxxb1+n2OqyblGCoZJMAUIZ/7kdgfKswaVTQaDOEgXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422268; c=relaxed/simple;
	bh=ideO7ZDR8MOIg5Et5qRMtec7y/ifvezISzhYwHksrtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ErCevK4Nbdz79llm/ucVomJDc+Eof6Dtd+NVOyjKYse1R7OQK9rHuR8eXSlpRA8CjZoewfZ9gesSGWn7APsJfBBzbIHH6rA14HkwRo7+riLDja8twyIUkf9f1UvANioOhzU6+SNpPgL3vACCpd7B5y59Tqn9UW8NSxcnsUyLXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VgfF8yeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MNJohL006697;
	Wed, 22 May 2024 23:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AYZGCc3cZ3DfQGqviY0X8oETS5JE+bxwgo0qkzoXtP8=; b=Vg
	fF8yeSv83dNXf6Gto2yyFTiqsnW+5XEHA0mGZxvlhWpsk3K5DSQh9zLrwM7M5jdU
	YpZO6wVmQkriOA9DvopIjhUJMSrUJhzPjYrB5uBYuWUjg7XzLSR/WxlYCCeQlo6q
	bV8UU+1SZMY2i1FyRj3YDfANaOIoqyjbCvHZ84X2cM7OmXat7kWG/acsbwwgQhhD
	GDxAm51J0RNxxsgEDtA9lTPLTH6b7fC+7otUbOhQWrY0O9lAdVcqq+A8Ny8cle+n
	KfJPCOM3XZw41eq74cQsL46DlhJrA7eodn4DY6uyhmMRzjQYLgipAdRGFjjgljvZ
	UUo4ve+3vN+YEhTrHarg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3wawwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MNvSrG017610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:28 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 16:57:27 -0700
Message-ID: <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
Date: Wed, 22 May 2024 16:57:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CwxwTUw5E0juH24AULeH1T4LZAuYu4SU
X-Proofpoint-GUID: CwxwTUw5E0juH24AULeH1T4LZAuYu4SU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_13,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220166



On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
>>> Command mode panels provide TE signal back to the DSI host to signal
>>> that the frame display has completed and update of the image will not
>>> cause tearing. Usually it is connected to the first GPIO with the
>>> mdp_vsync function, which is the default. In such case the property can
>>> be skipped.
>>>
>>
>> This is a good addition overall. Some comments below.
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> index 1fa28e976559..c1771c69b247 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> @@ -162,6 +162,21 @@ properties:
>>>                    items:
>>>                      enum: [ 0, 1, 2, 3 ]
>>>
>>> +              qcom,te-source:
>>> +                $ref: /schemas/types.yaml#/definitions/string
>>> +                description:
>>> +                  Specifies the source of vsync signal from the panel used for
>>> +                  tearing elimination. The default is mdp_gpio0.
>>
>> panel --> command mode panel?
>>
>>> +                enum:
>>> +                  - mdp_gpio0
>>> +                  - mdp_gpio1
>>> +                  - mdp_gpio2
>>
>> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
>> sources?
> 
> No idea, unfortunately. They are gpioN or just mdp_vsync all over the
> place. For the reference, in case of the SDM845 and Pixel3 the signal
> is routed through SoC GPIO12.
> 

GPIO12 on sdm845 is mdp_vsync_e.

Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2

>> In that case wouldnt it be better to name it like that?
>>
>>> +                  - timer0
>>> +                  - timer1
>>> +                  - timer2
>>> +                  - timer3
>>> +                  - timer4
>>> +
>>
>> These are indicating watchdog timer sources right?
> 
> Yes.
> 
>>
>>>        required:
>>>          - port@0
>>>          - port@1
>>> @@ -452,6 +467,7 @@ examples:
>>>                              dsi0_out: endpoint {
>>>                                       remote-endpoint = <&sn65dsi86_in>;
>>>                                       data-lanes = <0 1 2 3>;
>>> +                                   qcom,te-source = "mdp_gpio2";
>>
>> I have a basic doubt on this. Should te-source should be in the input
>> port or the output one for the controller? Because TE is an input to the
>> DSI. And if the source is watchdog timer then it aligns even more as a
>> property of the input endpoint.
> 
> I don't really want to split this. Both data-lanes and te-source are
> properties of the link between the DSI and panel. You can not really
> say which side has which property.
> 

TE is an input to the DSI from the panel. Between input and output port, 
I think it belongs more to the input port.

I didnt follow why this is a link property. Sorry , I didnt follow the 
split part.

If we are unsure about input vs output port, do you think its better we 
make it a property of the main dsi node instead?

>>>                              };
>>>                      };
>>>               };
>>>
> 

