Return-Path: <linux-arm-msm+bounces-23466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220CB911561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964AA1F2283B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856FF84D13;
	Thu, 20 Jun 2024 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mWDGsyVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437A59167;
	Thu, 20 Jun 2024 22:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718921081; cv=none; b=P8w/KfshjXbgPy8vrmo8lgy4UYVWTgKSoByCPbDpE9ifG8bx6mrmTRV4D5Z7AccPhQ3zIbNdH5qKzc+K++nIXxFTVnKcMOWplXYp1+mtuoGBdI/redhia/kuQefd/UXM8TdV48dULsSN2cYxU3i7pM0TaJfrFgePQZpWGUya/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718921081; c=relaxed/simple;
	bh=gVYQl3pGyFlk05T7rufNWSVGMuubCIbjo9ynHZOlX0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rJEM9NgZUpeffaX5ZKrIu5u+zU4TdxE0IMJBmUr11TR4uITEVEvd7GAuTOVlEEp57GOobWetLdIA20ifUnumAhpxC6/w4wLsey4nzSERV9MKSWsZDi71v6wPezggQurW3aghrR3Cg3me4GK0YwNsahw5s0V0R/bkVnFs2DUjD4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mWDGsyVY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHKsWA010564;
	Thu, 20 Jun 2024 22:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xhWTtdjB/pWg5xkVHFabX0MQ0bplv4y9hWfHxdmgnU=; b=mWDGsyVYfgWL0pCN
	aY+M+Q3hSAPS/RzgrdgML04H2m6wdmu3woRrJYaY11Zo0LMNh318rDUkpy9TMPVb
	EzFlkFRRSptZnPDPg8F1Xhua8EsM5VMu/Vif6uUEw4T+7Pmh6XNldDLJyKSmy7c2
	bILB61CH2dvwss4IQOE2w2FCDqeAS6ffVkPBPdHdwR9XiXuph8ewyzVxyGN1ePi6
	/pI8tNM53I3uWxVhDNnX7xZvYHmTigrqmXdbdlHsveA/ogHo7bxVZDovYw+/HU3t
	mC/b7j9Kpmnh12RFIm1VidQsLB+UR2DvnkUYQS5OIsYqbh0jk0uRc90eNeA6NVbi
	E8Dk5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrrc8qr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 22:04:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KM45pr006861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 22:04:05 GMT
Received: from [10.110.23.35] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 15:04:04 -0700
Message-ID: <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
Date: Thu, 20 Jun 2024 15:04:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fkjkoaaKb0pnjbw8a4G2aIcuXdMzPNuF
X-Proofpoint-ORIG-GUID: fkjkoaaKb0pnjbw8a4G2aIcuXdMzPNuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_10,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406200162

Hi Amaduesz,

On 6/19/2024 12:52 AM, Amadeusz Sławiński wrote:
> On 6/18/2024 10:52 PM, Wesley Cheng wrote:
>> Hi Amadeusz,
>>
>> On 6/18/2024 4:42 AM, Amadeusz Sławiński wrote:
>>> On 6/17/2024 7:02 PM, Wesley Cheng wrote:
>>>> Hi Amadeusz,
>>>>
>>>> On 6/13/2024 12:46 AM, Amadeusz Sławiński wrote:
>>>>> On 6/12/2024 9:28 PM, Wesley Cheng wrote:
>>>>>> Hi Amadeusz,
>>>>>>
>>>>>> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>>>>>>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>>>>>>
>>>>>>> (...)
>>>>>>>
>>>>>>>> +In the case where the USB offload driver is unbounded, while 
>>>>>>>> USB SND is
>>>>>>>
>>>>>>> unbounded -> unbound
>>>>>>>
>>>>>>> (...)
>>>>>>>
>>>>>>>> +SOC USB and USB Sound Kcontrols
>>>>>>>> +===============================
>>>>>>>> +Details
>>>>>>>> +-------
>>>>>>>> +SOC USB and USB sound expose a set of SND kcontrols for 
>>>>>>>> applications to select
>>>>>>>> +and fetch the current offloading status for the ASoC platform 
>>>>>>>> sound card. Kcontrols
>>>>>>>> +are split between two layers:
>>>>>>>> +
>>>>>>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>>>>>>> platform sound
>>>>>>>> +      card that it is registered to for supporting audio offload.
>>>>>>>> +
>>>>>>>> +    - SOC USB - Maintains the current status of the offload 
>>>>>>>> path, and device
>>>>>>>> +      (USB sound card and PCM device) information.  This would 
>>>>>>>> be the main
>>>>>>>> +      card that applications can read to determine offloading 
>>>>>>>> capabilities.
>>>>>>>> +
>>>>>>>> +Implementation
>>>>>>>> +--------------
>>>>>>>> +
>>>>>>>> +**Example:**
>>>>>>>> +
>>>>>>>> +  **Sound Cards**:
>>>>>>>> +
>>>>>>>> +    ::
>>>>>>>> +
>>>>>>>> +      0 [SM8250MTPWCD938]: sm8250 - 
>>>>>>>> SM8250-MTP-WCD9380-WSA8810-VA-D
>>>>>>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>>>>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>>>>>> +                     Plantronics Plantronics C320-M at 
>>>>>>>> usb-xhci-hcd.1.auto-1, full speed
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +  **Platform Sound Card** - card#0:
>>>>>>>> +
>>>>>>>> +    ::
>>>>>>>> +
>>>>>>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>>>>>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>>>>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>>>>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +  **USB Sound Card** - card#1:
>>>>>>>> +
>>>>>>>> +    ::
>>>>>>>> +
>>>>>>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +The platform sound card(card#0) kcontrols are created as part 
>>>>>>>> of adding the SOC
>>>>>>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>>>>>>> kcontrols are defined
>>>>>>>> +as:
>>>>>>>> +
>>>>>>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB 
>>>>>>>> sound card device index
>>>>>>>> +    that defines which USB SND resources are currently 
>>>>>>>> offloaded. If -1 is seen, it
>>>>>>>> +    signifies that offload is not active.
>>>>>>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>>>>>>> device index
>>>>>>>> +    that defines which USB SND resources are currently 
>>>>>>>> offloaded. If -1 is seen, it
>>>>>>>> +    signifies that offload is not active.
>>>>>>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB 
>>>>>>>> sound card index which
>>>>>>>> +    selects the USB device to initiate offloading on.  If no 
>>>>>>>> value is written to the
>>>>>>>> +    kcontrol, then the last USB device discovered card index 
>>>>>>>> will be chosen.
>>>>>>>
>>>>>>> I see only one kcontrol, what if hardware is capable of 
>>>>>>> offloading on more cards, is it possible to do offloading on more 
>>>>>>> than one device?
>>>>>>>
>>>>>>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB 
>>>>>>>> PCM index which selects
>>>>>>>> +    the USB device to initiate offloading on.  If no value is 
>>>>>>>> written to the
>>>>>>>> +    kcontrol, then the last USB device discovered PCM zero 
>>>>>>>> index will be chosen.
>>>>>>>> +
>>>>>>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>>>>>>> devices are plugged
>>>>>>>> +into the physical USB port and enumerated.  The kcontrols are 
>>>>>>>> defined as:
>>>>>>>> +
>>>>>>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>>>>>>> sound card
>>>>>>>> +    number/index that supports USB offloading.  Further/follow 
>>>>>>>> up queries about
>>>>>>>> +    the current offload state can be handled by reading the 
>>>>>>>> offload status
>>>>>>>> +    kcontrol exposed by the platform card.
>>>>>>>> +
>>>>>>>
>>>>>>>
>>>>>>> Why do we need to some magic between cards? I feel like whole 
>>>>>>> kcontrol thing is overengineered a bit - I'm not sure I 
>>>>>>> understand the need to do linking between cards. It would feel a 
>>>>>>> lot simpler if USB card exposed one "USB Offload" kcontrol on USB 
>>>>>>> card if USB controller supports offloading and allowed to set it 
>>>>>>> to true/false to allow user to choose if they want to do 
>>>>>>> offloading on device.
>>>>>>>
>>>>>>> (...)
>>>>>>
>>>>>> Based on feedback from Pierre, what I understood is that for some 
>>>>>> applications, there won't be an order on which sound card is 
>>>>>> queried/opened first.
>>>>>>
>>>>>
>>>>> Yes if you have multiple cards, they are probed in random order.
>>>>>
>>>>>> So the end use case example given was if an application opened the 
>>>>>> USB sound card first, it can see if there is an offload path 
>>>>>> available. If there is then it can enable the offload path on the 
>>>>>> corresponding card if desired.
>>>>>>
>>>>>
>>>>> This still doesn't explain why you need to link cards using 
>>>>> controls. What would not work with simple "Enable Offload" with 
>>>>> true/false values on USB card that works while you do have above 
>>>>> routing controls?
>>>>>
>>>>
>>>> Sorry for the late response.
>>>>
>>>> I think either way, even with the "Enable Offload" kcontrol in USB 
>>>> SND, we'd need a way to link these cards, because if you have 
>>>> multiple USB audio devices connected, and say... your offload 
>>>> mechanism only supports one stream.  Then I assume we'd still need 
>>>> to way to determine if that stream can be enabled for that USB SND 
>>>> device or not.
>>>>
>>>> Since the USB SND isn't really the entity maintaining the offload 
>>>> path, I went with the decision to add that route selection to the 
>>>> ASoC platform card. It would have access to all the parameters 
>>>> supported by the audio DSP.
>>>>
>>>
>>> Problem with card selection is that it will most likely work in 
>>> pretty random way during reboots and similar scenarios.
>>>
>>> Taking from your example:
>>>      USB Offload Playback Route Card Select  1 (range -1->32)
>>>      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>
>>> This tells that hw:1,0 will be offloaded USB card. What happens if 
>>> after reboot the USB card and offload card change places, the control 
>>> will be pointing at its owner... Another scenario to consider is that 
>>> user attaches two USB cards and only first one does offload. Now what 
>>> happens when they enumerate in different order after reboot (swapping 
>>> places)? Taking into the account that most systems restore previous 
>>> values of controls in some way - this will point at wrong card.
>>
>> That sounds like a problem that would exist with current USB SND 
>> implementation too?  Removing the offloading perspective, how does the 
>> system ensure that the previous setting stays persistent?  For 
>> example, as you mentioned, depending on which USB device enumerates 
>> first, the sound card may be different so cards will be switched.
>>
> 
> It works because there is no control pointing at other card. My main 
> problem is with controls which have card and pcm id of other card in it.
> 
>> I think I mentioned this previously in another discussion, but I think 
>> the idea was that with the
>> USB Offload Playback Capable Card
>>
>> kcontrol, would allow the system to at least know there is an offload 
>> capable path pointing to the ASoC platform card, and fetch more 
>> detailed information about which device is selected for offloading, 
>> etc...
>>
> 
> This works only in your design, where USB Offload is backed by card, 
> what happens if it is backed by something else?
> 
>>>
>>> In my opinion Offload capability should be the capability of the 
>>> endpoint - in this case USB card (even if in the background it needs 
>>> to talk to some other device) and it should be exposed as such. 
>>> Currently you are mixing capabilities of your audio card with 
>>> capabilities of USB card.
>>>
>>> And adding more controls will not make it easy to use from end user 
>>> perspective. Most users will most likely want for the devices to 
>>> perform offload automatically if possible to save power and just have 
>>> control to disable it in case they want to test if it works better 
>>> without it in case of some problems.
>>
>> I agree with you that we need to keep the controls at a minimum, but I 
>> think what I have in place is fairly reasonable.  If we switch to 
>> having the USB SND controlling things, we'd save maybe one control?  I 
>> think keeping the offload status controls are still fairly valuable in 
>> both scenarios, as userspace may need to verify which USB SND card is 
>> being offloaded.
>>
> 
> It should be able to tell which one is being offloaded by examining 
> which USB card has Offload control set to true.
> 
> I would assume that USB cards that cannot perform Offload have no 
> control at all, as it is unneeded. And ones that can do, have Offload 
> control. And ones actively being Offloaded have it set to true, 
> otherwise to false.
> 
> End user has no need to know where it is offloaded. I'm not HW person, 
> but I would assume that it is even unlikely that someone will design HW, 
> where it is possible to Offload one endpoint to two different places, as 
> this complicates things a lot, but if it were possible, from design 
> perspective it would make a lot more sense to set it in Offloaded USB 
> card settings, instead of some seemingly unrelated controller card 
> device. And that is assuming that all solutions use some other card 
> device to perform Offload.
> 
>>>
>>> Additional question what happens if you want to offload two usb 
>>> cards, currently the above set of controls allows you to only point 
>>> at one card, will you be adding additional set of above controls 
>>> dynamically for each USB card attached?
>>>
>>
>> It would depend on the number of offload streams that folks may be 
>> supporting on their platform.  In our case we only have one available 
>> stream, so applications would need to switch between the two devices 
>> using the card/pcm selector.
>>
>> In this case, there will be only one set of controls to select the 
>> card/pcm device.  As of now (I think I'll change to to add another 
>> separate set of controls per stream) if you did support multiple 
>> streams, then the current card/PCM device selector would take in 
>> multiple arugments. (ie for two streams the kcontrol can take in two 
>> values)
>>
> 
> Then it is implementation detail of your device, and it should be 
> implemented as controls in your device instead of as part of generic API.
> 

I initially had it as part of the device specific files, but I did get 
some feedback on [1], it might be better to have generic control names, 
hence the reason for moving into soc-usb.

I'll spend some time to evaluate your suggestion about moving the logic 
to control the offloading from USB SND versus ASoC, since there are 
valid points.  However, before I do that, I just want to make sure folks 
are also inline with that thinking.  I've had to put a lot of effort 
moving things around such as the previous example, and now you've 
suggested to move it back to the vendor specific drivers.

@Pierre, since you've helped with providing a lot of valuable input in 
the previous revisions on the kcontrol uses, what do you think about the 
proposal from Amadeusz?  Basically shifting the offload device selection 
into USB SND from the ASoC USB BE driver, and having this per USB SND 
device.

[1] 
https://lore.kernel.org/linux-usb/20231017200109.11407-30-quic_wcheng@quicinc.com/

