Return-Path: <linux-arm-msm+bounces-19621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117B8C192B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B46EB1C21BC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 22:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D14129A70;
	Thu,  9 May 2024 22:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KsKSSrBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE898770E1;
	Thu,  9 May 2024 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292350; cv=none; b=lF08H4HMynb/vNMxjjFZ/90rSxf3+zxSp02hECLmFtP+OaCoC3SNMzMOA/sGn3SYklFmCT3dziEo/c5Js1QfWaFkb5MlRwQV4hEQsMbOLL3OpQ09gg/UMsJBE/HEIr9fmhtwdIFnDfvJN3bLtjnHBOF7iN3gLBh8EOxeKXSRc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292350; c=relaxed/simple;
	bh=rH6e0J1vmAW151AhHYeukL7y7x5TAeAfSG3fd7YpQUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BY4xOPJKu3QS93XVgFzNh1oMqHwrG+n42VFbAvdXJmFlU1YUsO6JIfOlfLnIx2cC7G504viZywwHuVg+IwygdrX4+laIdPAOKzE2/HcQb6/loDPfFWB7iMwvjGlLljqFRrdV2YxN5o9UxQM6qVu/pz1hVWKiMmL43aszhyDfbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KsKSSrBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449M03LS030402;
	Thu, 9 May 2024 22:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UFzwS+gtnLFVF4fOXrWIsL7ONuzcSKpYbSLr3j5oWzE=; b=Ks
	KSSrBY+2RLajy+6XwhslTQcZ1sry1d8UiMW+bWWMHaVAcDqDNQNJPs6Mnwa0Nble
	r7jGMVfD2sAk/J3TYK6mHZOQQQUK+jEUJcen5ShAsb4nf/jM46+6ecCSPlUotncx
	r7ZSewTzQC+NesST15QidUEOHjccCr6dHOIXxi2wLVpAspgysUThNCSoxA4gcfwy
	6zqFIJ8wOfrTRQkLUT4Gxz6ai/4ECvdd1bzdbUvIprTWcUh4TcMSiliyY0b3K5T4
	f+P+FC7MjQ0tib5wtjjHQ1NyYGszoAx97tpPfipoOgALTtJpQoHYX+zygkAu/idA
	2ymxPNc1sNWWFOscMe1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1g09w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 22:05:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449M53pF005085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 22:05:03 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 15:05:02 -0700
Message-ID: <d3e6a9cb-2091-0792-603d-bb39abedfc7e@quicinc.com>
Date: Thu, 9 May 2024 15:05:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 34/39] ALSA: usb-audio: Add USB offloading capable
 kcontrol
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-35-quic_wcheng@quicinc.com>
 <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
 <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
 <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
 <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f4d59f05-9279-4c89-b5e1-57a0b3e8cddf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DsNj39Vuef5vKPXYBBA8A3efKOKlB28n
X-Proofpoint-GUID: DsNj39Vuef5vKPXYBBA8A3efKOKlB28n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090157

Hi Pierre,

On 5/9/2024 6:11 AM, Pierre-Louis Bossart wrote:
> 
>>>>> It is expected for the USB offloading driver to add the kcontrol to the
>>>>> sound card associated with the USB audio device.  An example output
>>>>> would
>>>>> look like:
>>>>>
>>>>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>>>>> 0 (range -1->32)
>>>>
>>>> You already gave the following examples in patch 29:
>>>>
>>>> "
>>>> USB offloading idle:
>>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>>> -->-1, -1 (range -1->32)
>>>>
>>>> USB offloading active(USB card#1 pcm#0):
>>>> tinymix -D 0 get 'USB Offload Playback Route Status'
>>>> -->1, 0 (range -1->32)
>>>> "
>>>>
>>>> Can you clarify how many controls there would be in the end?
>>>
>>> For USB offload situations, there will be a set of controls for
>>> playback status and playback select.  The offload jack will also be
>>> there to tell us if there is an offload path available for the
>>> platform ASoC sound card.
>>>
>>>> Also isn't tinymix -D N going to give you the controls for card N?
>>>>
>>>
>>> Yes, since the offload portion is handled as a DPCM DAI link to the
>>> platform ASoC card, it will be included as a kcontrol for that.
>>>
>>> Thanks
>>> Wesley Cheng
>>>
>>>
>>
>> Sorry for responding again.  I read your email again, and wanted to also
>> add that aside from the above, which are all within the ASoC layer, as
>> we discussed previously, we should have a kcontrol in the USB SND card
>> to determine if there is an ASoC platform card capable of offloading.
>> This is also available from the SND card created by the USB audio device.
> 
> That makes sense: if the application wanted to use a given endpoint, it
> could check if there is a 'better' path exposed by another card. It'd be
> a lot easier than reading controls from random cards.
> 
> Was this part of this patchset or more of an idea for a future addition?

Its part of this patchset.  Please refer to patch#34.  The 
mixer_usb_offload is initialized by the offload entity residing in USB 
SND (qc_usb_audio_offload), and will add it to the sound card associated 
with the USB device.

Thanks
Wesley Cheng

