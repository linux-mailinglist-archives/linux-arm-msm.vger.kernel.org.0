Return-Path: <linux-arm-msm+bounces-22514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC2905BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 21:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26D71C22F2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 19:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3144582D89;
	Wed, 12 Jun 2024 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZarlGx8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09082C8E;
	Wed, 12 Jun 2024 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220554; cv=none; b=VSyV3WOfYRS5tvOmfmId+9rfJPFnGompSYXLhJfwKTj8Q1vOQqtSCylqSdHCcFffmHrhziouTtQYKJ4a5vjavVPeXShyFHVMD6mvkedgBi1pPl92kigppkrG15DE9zlbSe2cka9EjaONipm8KLf3b8plNmNiAL/ATjKSM5aOXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220554; c=relaxed/simple;
	bh=m8a6feG9FUitFbvUvIrRN4n8RJcdSpN0pdOMLBnv/bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fzizkNSmyF4GfXWjVpgprPsohYYnrj/G853f1nc1bIzd1aAkGdLrh9xxMwhCmzX+MlToiSfkW4Ziq8cdxxTPnxtcRuzu0u8o3w3d4ngCB0/5LKAutkKID7STMspEbS93Cqj2Qp/9EXeP/GFWPo84Sn7w7d+b2cOYV5CJssSFuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZarlGx8d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CGOwMZ032154;
	Wed, 12 Jun 2024 19:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCkqbtgD+H6fBegUBPh8HWnP7zadlp7CFVslclJwQlw=; b=ZarlGx8debYz7B5p
	EYodYSlVAT7aFS8RYs6MdKD7WbOXf0fqyFxvh3x5MDVqWNY1rVWIPaVJVA8lsPAF
	oDpXxBtdMdtvb+FWJK07LEOKF0mMn+MnvjWH/qOyBk6quWAH8A46c4N+cRJTORlI
	eRtp1ug8vXTHkLKY6Z/9JveeD8o/gz/W3N/bv/u9t+vTfwRL9FTLPEscQApnVDem
	8kH2gNhljIiVHqJGmnAgq49zpbnzi4lILTX/lGxXioPjadLlaB+ndjvNeZZDWEXX
	sfjUmH2QIX+AsUeC0YeYCB3c0pUPEyuMwFdTlOTKuX76oqiRM4WSi9hmT3ZFcWJw
	x0M2TQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s09rc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:28:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJSfcm009922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:28:41 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:28:40 -0700
Message-ID: <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
Date: Wed, 12 Jun 2024 12:28:40 -0700
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u75kKKgEq47EV2fB7Am8Eqx2k17JInXf
X-Proofpoint-ORIG-GUID: u75kKKgEq47EV2fB7Am8Eqx2k17JInXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 mlxlogscore=998
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120137

Hi Amadeusz,

On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
> 
> (...)
> 
>> +In the case where the USB offload driver is unbounded, while USB SND is
> 
> unbounded -> unbound
> 
> (...)
> 
>> +SOC USB and USB Sound Kcontrols
>> +===============================
>> +Details
>> +-------
>> +SOC USB and USB sound expose a set of SND kcontrols for applications 
>> to select
>> +and fetch the current offloading status for the ASoC platform sound 
>> card. Kcontrols
>> +are split between two layers:
>> +
>> +    - USB sound - Notifies the sound card number for the ASoC 
>> platform sound
>> +      card that it is registered to for supporting audio offload.
>> +
>> +    - SOC USB - Maintains the current status of the offload path, and 
>> device
>> +      (USB sound card and PCM device) information.  This would be the 
>> main
>> +      card that applications can read to determine offloading 
>> capabilities.
>> +
>> +Implementation
>> +--------------
>> +
>> +**Example:**
>> +
>> +  **Sound Cards**:
>> +
>> +    ::
>> +
>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                     Plantronics Plantronics C320-M at 
>> usb-xhci-hcd.1.auto-1, full speed
>> +
>> +
>> +  **Platform Sound Card** - card#0:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>> +
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Capable Card         0 (range -1->32)
>> +
>> +
>> +The platform sound card(card#0) kcontrols are created as part of 
>> adding the SOC
>> +USB device using **snd_soc_usb_add_port()**.  The following kcontrols 
>> are defined
>> +as:
>> +
>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>> card device index
>> +    that defines which USB SND resources are currently offloaded.  If 
>> -1 is seen, it
>> +    signifies that offload is not active.
>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM device 
>> index
>> +    that defines which USB SND resources are currently offloaded.  If 
>> -1 is seen, it
>> +    signifies that offload is not active.
>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound 
>> card index which
>> +    selects the USB device to initiate offloading on.  If no value is 
>> written to the
>> +    kcontrol, then the last USB device discovered card index will be 
>> chosen.
> 
> I see only one kcontrol, what if hardware is capable of offloading on 
> more cards, is it possible to do offloading on more than one device?
> 
>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>> index which selects
>> +    the USB device to initiate offloading on.  If no value is written 
>> to the
>> +    kcontrol, then the last USB device discovered PCM zero index will 
>> be chosen.
>> +
>> +The USB sound card(card#1) kcontrols are created as USB audio devices 
>> are plugged
>> +into the physical USB port and enumerated.  The kcontrols are defined 
>> as:
>> +
>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the sound 
>> card
>> +    number/index that supports USB offloading.  Further/follow up 
>> queries about
>> +    the current offload state can be handled by reading the offload 
>> status
>> +    kcontrol exposed by the platform card.
>> +
> 
> 
> Why do we need to some magic between cards? I feel like whole kcontrol 
> thing is overengineered a bit - I'm not sure I understand the need to do 
> linking between cards. It would feel a lot simpler if USB card exposed 
> one "USB Offload" kcontrol on USB card if USB controller supports 
> offloading and allowed to set it to true/false to allow user to choose 
> if they want to do offloading on device.
> 
> (...)

Based on feedback from Pierre, what I understood is that for some 
applications, there won't be an order on which sound card is 
queried/opened first.

So the end use case example given was if an application opened the USB 
sound card first, it can see if there is an offload path available.  If 
there is then it can enable the offload path on the corresponding card 
if desired.

>> +Mixer Examples
>> +--------------
>> +
>> +    ::
>> +
>> +      tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
>> +      tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
>> +
>> +
>> +    ::
>> +
>> +      tinymix -D 0 get 'USB Offload Playback Route Card Select'
>> +      --> 2 (range -1->32)
>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Select'
>> +      --> 0 (range -1->255)
>> +
>> +    ::
>> +
>> +      tinymix -D 0 get 'USB Offload Playback Route Card Status'
>> +      --> 2 (range -1->32)   [OFFLD active]
>> +      --> -1 (range -1->32) [OFFLD idle]
>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Status'
>> +      --> 0 (range -1->255)   [OFFLD active]
>> +      --> -1 (range -1->255) [OFFLD idle]
>> +
>> +    ::
>> +
>> +      tinymix -D 1 get 'USB Offload Playback Capable Card'
>> +      --> 0 (range -1->32)
>>
> 
> Yes, looking at examples again, I'm still not sure I understand. There 
> are two cards and you do linking between them, this feels broken by 
> design. From my point of view USB Offload should be property of USB card 
> and not involve any other card in a system.
> 

Main benefit to having two cards (keeping one for USB SND and another 
for the ASoC platform sound card) is that current applications won't 
break.  The behavior is the same, in that if something opens the USB 
sound card, it will go through the same non-offloaded path.  During 
initial reviews, I think this was a big point where folks wanted the USB 
PCM path to still be an option.

If applications want to add the offload capabilities to its environment, 
they can enable it as an additional feature.

Thanks
Wesley Cheng

