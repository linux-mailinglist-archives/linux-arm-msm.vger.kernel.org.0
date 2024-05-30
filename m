Return-Path: <linux-arm-msm+bounces-21043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A18D42B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 03:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936912855D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E1914286;
	Thu, 30 May 2024 01:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YPUh2iPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D41078B;
	Thu, 30 May 2024 01:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031327; cv=none; b=Vorrdb1S0y997tU4o6LhkS59OxWanhG6R//uraJXR/5iEP97n4guCygCsUY4kfOtkLJBOlfQg/M2MQFbkfAKEAUi05uMAtAEO5iYKOBscmBFgBG3Piof6CBYCU18XWwuxnttXWjRPIwrfQgOYkTXmaeLMgp291ojFsd/R/cqcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031327; c=relaxed/simple;
	bh=3VlTLqsQVm6iSTDVvT95FlD++RiRDgu8Ko2m63i99zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lREKLe1FWtDtJyGadAHqGRzL+y+uSPHRCw2KspTX6DThk0SaOkHl4bIks/aTYylpWDb4qd11wt5uDrj2H5gSBHbVVF5ZR63Zgxfb8TOx2itLO5Ho7qocrs9Y+Ng86kfouJ8Su8pg7L2p7NXaUbuBfg09kBYkKLgh0qKa2PNAlho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YPUh2iPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44THXe2C016548;
	Thu, 30 May 2024 01:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvZ4XTVDVCaZhfImf+3FaKuLeqMNhF7XyUNgMzqoemw=; b=YPUh2iPeLL/4AU6L
	FMwKKORTovQG/NP4fVyeUfoBs9gASNbVeQjIBgOohUUr9R0MdQrJftNikUwphh97
	V1gy+AojeT93i8VIJ89UkpWPRzBEKTj1cIRhgZcJdN8nO07yZ4uRfHNvGCjgVuOw
	DVcnJWkg9UNMp7v8phpgmWpdYyivTa6EjbvQaicl6CI01OGd/ekP1oIhCe0jsLeR
	wLfWzddAYBlTJCkblF5Nt8NJLlOzbFYZLiB9rQCSFBqzrQJLxaVMJ6CJRumVJgZ8
	7ZXe4kNaB3yhx+EyGHLnqYj5XYVki5kRL7evG2vbfK644Nu78ax1ikJr4yA00HjN
	6jGiRw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws2c27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 01:08:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U18S25009392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 01:08:28 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 18:08:23 -0700
Message-ID: <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
Date: Wed, 29 May 2024 18:08:21 -0700
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
Content-Language: en-US
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
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HOC8uy6-FnhRjVDyNdU2_V5J3phIKM4E
X-Proofpoint-GUID: HOC8uy6-FnhRjVDyNdU2_V5J3phIKM4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300006



On 5/29/2024 5:02 PM, Dmitry Baryshkov wrote:
> On Thu, 30 May 2024 at 00:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/23/2024 2:58 AM, Dmitry Baryshkov wrote:
>>> On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
>>>>>>> Command mode panels provide TE signal back to the DSI host to signal
>>>>>>> that the frame display has completed and update of the image will not
>>>>>>> cause tearing. Usually it is connected to the first GPIO with the
>>>>>>> mdp_vsync function, which is the default. In such case the property can
>>>>>>> be skipped.
>>>>>>>
>>>>>>
>>>>>> This is a good addition overall. Some comments below.
>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>>>>>>>      1 file changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>>>> index 1fa28e976559..c1771c69b247 100644
>>>>>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>>>>>> @@ -162,6 +162,21 @@ properties:
>>>>>>>                      items:
>>>>>>>                        enum: [ 0, 1, 2, 3 ]
>>>>>>>
>>>>>>> +              qcom,te-source:
>>>>>>> +                $ref: /schemas/types.yaml#/definitions/string
>>>>>>> +                description:
>>>>>>> +                  Specifies the source of vsync signal from the panel used for
>>>>>>> +                  tearing elimination. The default is mdp_gpio0.
>>>>>>
>>>>>> panel --> command mode panel?
>>>>>>
>>>>>>> +                enum:
>>>>>>> +                  - mdp_gpio0
>>>>>>> +                  - mdp_gpio1
>>>>>>> +                  - mdp_gpio2
>>>>>>
>>>>>> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
>>>>>> sources?
>>>>>
>>>>> No idea, unfortunately. They are gpioN or just mdp_vsync all over the
>>>>> place. For the reference, in case of the SDM845 and Pixel3 the signal
>>>>> is routed through SoC GPIO12.
>>>>>
>>>>
>>>> GPIO12 on sdm845 is mdp_vsync_e.
>>>>
>>>> Thats why I think its better we use mdp_vsync_p/s/e instead of mdp_gpio0/1/2
>>>
>>> Sure. This matches pins description. Are you fine with changing
>>> defines in DPU driver to VSYNC_P / _S / _E too ?
>>>
>>
>> Sorry for the delay in responding.
>>
>> As per the software docs, the registers still use GPIO0/1/2.
>>
>> Only the pin descriptions use vsync_p/s/e.
>>
>> Hence I think we can make DPU driver to use 0/1/2.
> 
> OK, what about the DT? I like the vsync_p/_s/_e idea.
> 

Yes, vsync_p/_s/_e for DT is fine with me.

My comment was only for driver.

So driver would do:

vsync_p -> gpio0
vsync_s -> gpio1
vsync_e -> gpio2

>>
>>>>
>>>>>> In that case wouldnt it be better to name it like that?
>>>>>>
>>>>>>> +                  - timer0
>>>>>>> +                  - timer1
>>>>>>> +                  - timer2
>>>>>>> +                  - timer3
>>>>>>> +                  - timer4
>>>>>>> +
>>>>>>
>>>>>> These are indicating watchdog timer sources right?
>>>>>
>>>>> Yes.
>>>>>
>>
>> ack.
>>
>>>>>>
>>>>>>>          required:
>>>>>>>            - port@0
>>>>>>>            - port@1
>>>>>>> @@ -452,6 +467,7 @@ examples:
>>>>>>>                                dsi0_out: endpoint {
>>>>>>>                                         remote-endpoint = <&sn65dsi86_in>;
>>>>>>>                                         data-lanes = <0 1 2 3>;
>>>>>>> +                                   qcom,te-source = "mdp_gpio2";
>>>>>>
>>>>>> I have a basic doubt on this. Should te-source should be in the input
>>>>>> port or the output one for the controller? Because TE is an input to the
>>>>>> DSI. And if the source is watchdog timer then it aligns even more as a
>>>>>> property of the input endpoint.
>>>>>
>>>>> I don't really want to split this. Both data-lanes and te-source are
>>>>> properties of the link between the DSI and panel. You can not really
>>>>> say which side has which property.
>>>>>
>>>>
>>>> TE is an input to the DSI from the panel. Between input and output port,
>>>> I think it belongs more to the input port.
>>>
>>> Technically we don't have in/out ports. There are two ports which
>>> define a link between two instances. For example, if the panel
>>> supports getting information through DCS commands, then "panel input"
>>> also becomes "panel output".
>>>
>>
>> The ports are labeled dsi0_in and dsi0_out. Putting te source in
>> dsi0_out really looks very confusing to me.
> 
> dsi0_in is a port that connects DSI and DPU, so we should not be
> putting panel-related data there.
> 

Yes, true. But here we are using the "out" port which like you mentioned 
is not logical either. Thats why I am not convinced or not sure if this 
is the right way to model this.

> I see two ports: mdss_dsi0_out and panel_in. Neither of them is
> logical from this point of view. The TE source likewise isn't an input
> to the panel, so we should not be using the panel_in port.
> 

>>
>>>>
>>>> I didnt follow why this is a link property. Sorry , I didnt follow the
>>>> split part.
>>>
>>> There is a link between the DSI host and the panel. I don't want to
>>> end up in a situation when the properties of the link are split
>>> between two different nodes.
>>>
>>
>> It really depends on what the property denotes. I do not think this
>> should be the reason to do it this way.
> 
> It denotes how the panel signals DPU that it finished processing the
> data (please excuse me for possibly inaccurate description). However
> there is no direct link between the panel and the DPU. So we should be
> using a link between DSI host and the panel.
>

Yes, I totally agree that we should be using a link between DSI host and 
the panel.

My question from the beginning has been why the output port?

It looks like to me we need to have another input port to the controller 
then?

One from DPU and the other from panel?

>>
>>>>
>>>> If we are unsure about input vs output port, do you think its better we
>>>> make it a property of the main dsi node instead?
>>>
>>> No, it's not a property of the DSI node at all. If the vendor rewires
>>> the panel GPIOs or (just for example regulators), it has nothing to do
>>> with the DSI host.
>>
>> Ack to this.
>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 

