Return-Path: <linux-arm-msm+bounces-23141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A290DDD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17ABFB22F50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 20:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DAC1741FF;
	Tue, 18 Jun 2024 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lyreBND0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA515EFAF;
	Tue, 18 Jun 2024 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743962; cv=none; b=ZIspCrxhSiRB618spTR7uBObnO85BLRKPKL9ewIETc6PelIVuVtEgIH/4yopqWU6UaI54PjsXaDbaAP6jniDAY2V3I/34Q9Ymp38pdQYObKOocxY88lS+NsXgjaYqs51j1A2qCBnwF7br9MwCybvJtPGFldmftt/s0bjhIOFKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743962; c=relaxed/simple;
	bh=Hi06hPfdn3udo4YD/TXcS150lCLSlF8kHt7+6Esd+M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QkOdFNeUhWvReNFKc4WGmoLN0ChFGtfPSke0OS7SMoth/avLnCV2/5b1jU1A9iLpDYVHXMUNOIaKgiwILcyYxPmKuejU3B2cNfLeecuJPbAp74NV++tqjUD33EUCf89gyq6euyN/3xR4uGyErUHEsSoSsKQPUbOQrDZZ8aOcsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lyreBND0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IBi8V2005389;
	Tue, 18 Jun 2024 20:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pGKFLivsmybOVo2YC+Rib89/pjxJijeCpoCj7hnxew=; b=lyreBND0smqY0Lgz
	mWqMtiFwJzazXeuI/RSZ+g0+0WBPMyN5l0zrYFFpTLRTyos+ASlUn7PE8eK0Ok+K
	XvjqqmwHYBiadYINBrZMR5FuDfRFVQtxOFCCr40bTLS0zLcq9TA6Ue75Kl28moC6
	KXt3TU+C1gFsiLwOoki4tL9wMTisKLXE/lwsOXWwQ5l7qbu2FnY3PR1VOA8P4SX+
	SOkoKoaALQeEMrdyyVYZpzn08N5pcWddWmNW5jsPXqWs0VsZV2jRe+NYzFTSxQD+
	PdT1qCB4IKLjGdzvNprCmiU0SKgrXbGnGpWnUvaHm/qK0mnHDZ4vvLU+1cl3LC67
	xlEmrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu9m6sajc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 20:52:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IKq5up010378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 20:52:05 GMT
Received: from [10.110.93.116] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 13:52:03 -0700
Message-ID: <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
Date: Tue, 18 Jun 2024 13:52:03 -0700
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DeJ37znB1cfWADYf-25KNa9cNl2mA-Qo
X-Proofpoint-ORIG-GUID: DeJ37znB1cfWADYf-25KNa9cNl2mA-Qo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_04,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180154

Hi Amadeusz,

On 6/18/2024 4:42 AM, Amadeusz Sławiński wrote:
> On 6/17/2024 7:02 PM, Wesley Cheng wrote:
>> Hi Amadeusz,
>>
>> On 6/13/2024 12:46 AM, Amadeusz Sławiński wrote:
>>> On 6/12/2024 9:28 PM, Wesley Cheng wrote:
>>>> Hi Amadeusz,
>>>>
>>>> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>>>>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>>>>
>>>>> (...)
>>>>>
>>>>>> +In the case where the USB offload driver is unbounded, while USB 
>>>>>> SND is
>>>>>
>>>>> unbounded -> unbound
>>>>>
>>>>> (...)
>>>>>
>>>>>> +SOC USB and USB Sound Kcontrols
>>>>>> +===============================
>>>>>> +Details
>>>>>> +-------
>>>>>> +SOC USB and USB sound expose a set of SND kcontrols for 
>>>>>> applications to select
>>>>>> +and fetch the current offloading status for the ASoC platform 
>>>>>> sound card. Kcontrols
>>>>>> +are split between two layers:
>>>>>> +
>>>>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>>>>> platform sound
>>>>>> +      card that it is registered to for supporting audio offload.
>>>>>> +
>>>>>> +    - SOC USB - Maintains the current status of the offload path, 
>>>>>> and device
>>>>>> +      (USB sound card and PCM device) information.  This would be 
>>>>>> the main
>>>>>> +      card that applications can read to determine offloading 
>>>>>> capabilities.
>>>>>> +
>>>>>> +Implementation
>>>>>> +--------------
>>>>>> +
>>>>>> +**Example:**
>>>>>> +
>>>>>> +  **Sound Cards**:
>>>>>> +
>>>>>> +    ::
>>>>>> +
>>>>>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>>>> +                     Plantronics Plantronics C320-M at 
>>>>>> usb-xhci-hcd.1.auto-1, full speed
>>>>>> +
>>>>>> +
>>>>>> +  **Platform Sound Card** - card#0:
>>>>>> +
>>>>>> +    ::
>>>>>> +
>>>>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>>>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>>>> +
>>>>>> +
>>>>>> +  **USB Sound Card** - card#1:
>>>>>> +
>>>>>> +    ::
>>>>>> +
>>>>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>>>>> +
>>>>>> +
>>>>>> +The platform sound card(card#0) kcontrols are created as part of 
>>>>>> adding the SOC
>>>>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>>>>> kcontrols are defined
>>>>>> +as:
>>>>>> +
>>>>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>>>>>> card device index
>>>>>> +    that defines which USB SND resources are currently offloaded. 
>>>>>> If -1 is seen, it
>>>>>> +    signifies that offload is not active.
>>>>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>>>>> device index
>>>>>> +    that defines which USB SND resources are currently offloaded. 
>>>>>> If -1 is seen, it
>>>>>> +    signifies that offload is not active.
>>>>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB 
>>>>>> sound card index which
>>>>>> +    selects the USB device to initiate offloading on.  If no 
>>>>>> value is written to the
>>>>>> +    kcontrol, then the last USB device discovered card index will 
>>>>>> be chosen.
>>>>>
>>>>> I see only one kcontrol, what if hardware is capable of offloading 
>>>>> on more cards, is it possible to do offloading on more than one 
>>>>> device?
>>>>>
>>>>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>>>>>> index which selects
>>>>>> +    the USB device to initiate offloading on.  If no value is 
>>>>>> written to the
>>>>>> +    kcontrol, then the last USB device discovered PCM zero index 
>>>>>> will be chosen.
>>>>>> +
>>>>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>>>>> devices are plugged
>>>>>> +into the physical USB port and enumerated.  The kcontrols are 
>>>>>> defined as:
>>>>>> +
>>>>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>>>>> sound card
>>>>>> +    number/index that supports USB offloading.  Further/follow up 
>>>>>> queries about
>>>>>> +    the current offload state can be handled by reading the 
>>>>>> offload status
>>>>>> +    kcontrol exposed by the platform card.
>>>>>> +
>>>>>
>>>>>
>>>>> Why do we need to some magic between cards? I feel like whole 
>>>>> kcontrol thing is overengineered a bit - I'm not sure I understand 
>>>>> the need to do linking between cards. It would feel a lot simpler 
>>>>> if USB card exposed one "USB Offload" kcontrol on USB card if USB 
>>>>> controller supports offloading and allowed to set it to true/false 
>>>>> to allow user to choose if they want to do offloading on device.
>>>>>
>>>>> (...)
>>>>
>>>> Based on feedback from Pierre, what I understood is that for some 
>>>> applications, there won't be an order on which sound card is 
>>>> queried/opened first.
>>>>
>>>
>>> Yes if you have multiple cards, they are probed in random order.
>>>
>>>> So the end use case example given was if an application opened the 
>>>> USB sound card first, it can see if there is an offload path 
>>>> available. If there is then it can enable the offload path on the 
>>>> corresponding card if desired.
>>>>
>>>
>>> This still doesn't explain why you need to link cards using controls. 
>>> What would not work with simple "Enable Offload" with true/false 
>>> values on USB card that works while you do have above routing controls?
>>>
>>
>> Sorry for the late response.
>>
>> I think either way, even with the "Enable Offload" kcontrol in USB 
>> SND, we'd need a way to link these cards, because if you have multiple 
>> USB audio devices connected, and say... your offload mechanism only 
>> supports one stream.  Then I assume we'd still need to way to 
>> determine if that stream can be enabled for that USB SND device or not.
>>
>> Since the USB SND isn't really the entity maintaining the offload 
>> path, I went with the decision to add that route selection to the ASoC 
>> platform card. It would have access to all the parameters supported by 
>> the audio DSP.
>>
> 
> Problem with card selection is that it will most likely work in pretty 
> random way during reboots and similar scenarios.
> 
> Taking from your example:
>      USB Offload Playback Route Card Select  1 (range -1->32)
>      USB Offload Playback Route PCM Select   0 (range -1->255)
>      USB Offload Playback Route Card Status  -1 (range -1->32)
>      USB Offload Playback Route PCM Status   -1 (range -1->255)
> 
> This tells that hw:1,0 will be offloaded USB card. What happens if after 
> reboot the USB card and offload card change places, the control will be 
> pointing at its owner... Another scenario to consider is that user 
> attaches two USB cards and only first one does offload. Now what happens 
> when they enumerate in different order after reboot (swapping places)? 
> Taking into the account that most systems restore previous values of 
> controls in some way - this will point at wrong card.

That sounds like a problem that would exist with current USB SND 
implementation too?  Removing the offloading perspective, how does the 
system ensure that the previous setting stays persistent?  For example, 
as you mentioned, depending on which USB device enumerates first, the 
sound card may be different so cards will be switched.

I think I mentioned this previously in another discussion, but I think 
the idea was that with the
USB Offload Playback Capable Card

kcontrol, would allow the system to at least know there is an offload 
capable path pointing to the ASoC platform card, and fetch more detailed 
information about which device is selected for offloading, etc...

> 
> In my opinion Offload capability should be the capability of the 
> endpoint - in this case USB card (even if in the background it needs to 
> talk to some other device) and it should be exposed as such. Currently 
> you are mixing capabilities of your audio card with capabilities of USB 
> card.
> 
> And adding more controls will not make it easy to use from end user 
> perspective. Most users will most likely want for the devices to perform 
> offload automatically if possible to save power and just have control to 
> disable it in case they want to test if it works better without it in 
> case of some problems.

I agree with you that we need to keep the controls at a minimum, but I 
think what I have in place is fairly reasonable.  If we switch to having 
the USB SND controlling things, we'd save maybe one control?  I think 
keeping the offload status controls are still fairly valuable in both 
scenarios, as userspace may need to verify which USB SND card is being 
offloaded.

> 
> Additional question what happens if you want to offload two usb cards, 
> currently the above set of controls allows you to only point at one 
> card, will you be adding additional set of above controls dynamically 
> for each USB card attached?
> 

It would depend on the number of offload streams that folks may be 
supporting on their platform.  In our case we only have one available 
stream, so applications would need to switch between the two devices 
using the card/pcm selector.

In this case, there will be only one set of controls to select the 
card/pcm device.  As of now (I think I'll change to to add another 
separate set of controls per stream) if you did support multiple 
streams, then the current card/PCM device selector would take in 
multiple arugments. (ie for two streams the kcontrol can take in two values)

Thanks
Wesley Cheng

