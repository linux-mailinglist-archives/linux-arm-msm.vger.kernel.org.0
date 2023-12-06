Return-Path: <linux-arm-msm+bounces-3583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546C807692
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51CFF281F79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 17:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDDC63DF8;
	Wed,  6 Dec 2023 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hPWreFpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D86CC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 09:26:07 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B6FR9gY028872;
	Wed, 6 Dec 2023 17:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tuG2z+nXVzkDdG4hxWToy86zuTi7p41qp9hxkSQEr58=;
 b=hPWreFpJePjqzc74HKnLMvCmWlkpk2NtS+wbjZlU+AnzoBEc+gBrkAqUGm2Uon40HZUy
 wXHkdo2sweBbKPtPRlRRZJ/haRMPW6GeDmNsfW0suqVHLpWSAiyGBRyubE+O0QMjIrcN
 KPAo1Wzxzc99hPwbw12J5PYJwwMbdVeaRaC4vDyanNPbAyO3uiv2WcZey7t5hJigYq/c
 9yWUdtGgANOHO71wEv5vIh7C2MpT/C/5g2UmaRm6c68RafMLerS8k1HFDHYBMN4Cw7Uk
 V8SxNCLW6duAERbDnlgXR0BRUcBJBbE4kwKDrM7fCx2OA5U6G5Gd4Q5BfbvkS78uklk9 fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd0qjkya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 17:25:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6HPuXo031389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 17:25:56 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 09:25:53 -0800
Message-ID: <abdc8491-9c56-0525-ff2c-918367f1bc5e@quicinc.com>
Date: Wed, 6 Dec 2023 09:25:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <marijn.suijten@somainline.org>,
        <steev@kali.org>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
 <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
 <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
 <knm2uvjuad47famhr5uzibxxx3reknxdpb5raj3fox2vlkarvc@w6xer6jo4yok>
 <14e6d232-8e6d-0b5f-4ec4-a23244bcd701@quicinc.com>
 <20231206035107.GK1766637@hu-bjorande-lv.qualcomm.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231206035107.GK1766637@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3cz5BTUq_QRrYPCybttpVr2r8MFR2RO6
X-Proofpoint-ORIG-GUID: 3cz5BTUq_QRrYPCybttpVr2r8MFR2RO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_14,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060140



On 12/5/2023 7:51 PM, Bjorn Andersson wrote:
> On Mon, Dec 04, 2023 at 11:22:24AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/3/2023 7:31 PM, Bjorn Andersson wrote:
>>> On Fri, Dec 01, 2023 at 11:43:36AM -0800, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 12/1/2023 8:22 AM, Bjorn Andersson wrote:
>>>>> On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
>>>>>> On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>>>> On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
>>>>> [..]
>>>>>>>> @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>>>>>>>          dpu_enc->enabled = false;
>>>>>>>>          mutex_init(&dpu_enc->enc_lock);
>>>>>>>>          mutex_init(&dpu_enc->rc_lock);
>>>>>>>> +     mutex_init(&dpu_enc->vblank_ctl_lock);
>>>>>>>
>>>>>>> Is this somehow propagated to multiple different dpu_encoder_phys
>>>>>>> instances, or why do you need to initialize it here and pass the pointer
>>>>>>> through 2 different intermediate structures before assigning it to
>>>>>>> phys_enc->vblank_ctl_lock below?
>>>>>>
>>>>>> Yes, there can be two phys_enc instances for a single encoder, so this
>>>>>> part is fine.
>>>>>>
>>>>>
>>>>> Thanks for the clarification, Dmitry. Sounds like it make sense then.
>>>>>
>>>>> But, if I read the code correctly the two instances will have separate
>>>>> vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
>>>>> exclusion within. So why do we need shared mutual exclusion between the
>>>>> two? (This is where a proper description of the problem in the commit
>>>>> message would have been very helpful)
>>>>>
>>>>
>>>> Are you suggesting we just have one vblank_ctl_lock per encoder and not have
>>>> one vblank_ctl_lock per phys encoder? I cannot think of a display specific
>>>> reason for that other than just the SW layout.
>>>>
>>>> The reason its like this today is that control_vblank_irq is an encoder phys
>>>> op because it does different things based on the type of encoder.
>>>>
>>>> Because its an encoder phys op, it has the vblank_ctl_lock at the phys
>>>> structure and not the encoder one.
>>>>
>>>> Its just more about how the phys op is defined that each phys op operates on
>>>> its phys's structure.
>>>>
>>>> Generally, if we have one encoder with two physical encoders we anyways bail
>>>> out early for the other encoder so this is mostly a no-op for the slave phys
>>>> encoder.
>>>>
>>>> Please take a look at below return point.
>>>>
>>>> 715 	/* Slave encoders don't report vblank */
>>>> 716 	if (!sde_encoder_phys_vid_is_master(phys_enc))
>>>> 717 		goto end;
>>>> 718
>>>>
>>>> So technically its still providing protection for the same phys encoder but
>>>> the catch is this control_vblank_irq can get called from different threads
>>>> hence we need exclusion.
>>>>
>>>
>>> The way I understand the code is that the atomic is used to refcount
>>> when to enable/disable the interrupt, and the new lock protects this
>>> refcount during concurrent updates. I have no concerns with this part.
>>>
>>
>> Correct.
>>
>>>
>>> What I'm seeing is that the refcount it per phys_enc, and as such there
>>> would be no reason to have a common mutex to protect the two independent
>>> refcounts.
>>>
>>> But I'm probably misunderstanding something here...
>>>
>>
>> There is no reason to have a common mutex to protect the two independent
>> refcounts. In fact, there is no need to even have two independent refcounts
>> because whenever we have one encoder with two physical encoders, we use only
>> the master physical encoder for vblanks like I pointed above.
>>
>> The only reason we have it like this is because today the vblank_refcount is
>> part of phys_enc so the mutex handle is also now a part of it.
>>
>> Do you think if we move both the mutex and the vblank_refcount to the
>> dpu_encoder from the dpu_encoder_phys and maintain the mutex at that level
>> it will be less confusing for you?
>>
> 
> The two functions operate on dpu_encoder_phys objects, and as you say
> above the two instances doesn't need to be handled under shared mutual
> exclusion.
> 
> Moving the serialization mechanism to dpu_encoder seems like it would
> create an entanglement, for the sake of making the lock common. If
> nothing else this would act as documentation to me that the two
> functions are intertwined somehow.
> 
> I was rather hoping that we'd move the mutex_init() to
> dpu_encoder_phys_init() and avoid passing a reference around in
> unrelated parts of the code just to set up the sharing, if that's not
> necessary.
> 
> Regards,
> Bjorn
> 

In principle we need only one mutex per encoder and not per encoder phys.

Hence the two phys encoders are having the handle to the same mutex for 
that reason.

If having it that way is confusing you for some reason, I offered the 
alternative.

Otherwise I think what we have is enough and correct. We can update the 
commit text and doc around the mutex to explain what it does.

I dont think your suggestion will work.

dpu_encoder_phys_init() will be called once per each phys encoder so it 
can get called twice. Are you suggesting we have one mutex per phys 
encoder? Thats not necessary and its not correct as well.

If not, perhaps you can post something for us to review your idea.



>> I am fine with that.
>>
>>> Regards,
>>> Bjorn
>>>

