Return-Path: <linux-arm-msm+bounces-19554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4A8C088C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 02:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3FBF1C210DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8B61B5A0;
	Thu,  9 May 2024 00:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IA40vaTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A21376FC;
	Thu,  9 May 2024 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715215367; cv=none; b=qupYuFmSHB3+f5FJ+MobW5hrL8N7hReAJmlAhcqFUtTd77uAqeBespkzIWO6spKx1nWY8FgsanG21KlnRdJTcWUIwDZVC0MxHzt/1gT21iUklxYkbCr1EGa5FWSQHh4/THfZ1od3vmOI0/7lBsN/K8NPONJfR9fQ+Wm1f3ingsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715215367; c=relaxed/simple;
	bh=yMcVIWeEy97ZjKAUkHxNI+odNAy+ZoUDCqohKsxBv1k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=o/Pa2r71PvkCT8LccVpOdO2CABjmDyUGeUdO6KJtl4BTA2qbWEiLqL2XQJhfMcTqcG+MAJkGhhtya1/hLW2J3PIoDcnDpec7kMlSR1tjFeelC96123gHGPzZsMsrzlfzZxNZWSidJLmjiO1FmBMu4HMp/tGnt8lNWCZZTsItkfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IA40vaTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448BZrIM002462;
	Thu, 9 May 2024 00:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S4gM+pVUJ5Q6pLxDg6wjqkjqYaNOpOAT6Tz8qpd8mM8=; b=IA
	40vaTaODHqMcYjc0YZYQOnmiSqEm6zgJaBJgVDHvoBeFkY5lwIhSW6iPWPM2hjA7
	ZBeTmxAMvw4H4dki8xkpZq7FozPLdbcGzF1A8Cyk7ExeALZQI4ij5IwI4RyW1aXm
	Uny+vLtozkTb0ClVwuYrzlG9FLs1A3HSgm7ofu7wPL6r1utpYdcByoRgh3hGIhJC
	soE6Aj+309FQ0R4jvTmAOZjTdbYYt7duaBHTGFmgQOR4ACKlJ6zWS6KyqEummdzr
	5ktQNYnJleUIUwLYhfpDAjkqRpX9FIXHVLlQFT9a6c8Me7ddJRT+1z6YKeQYVW5w
	XmxhGm0V+ApZnSVHDcHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y08ne1hnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 00:42:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4490gAJu019359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 00:42:10 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 17:42:09 -0700
Message-ID: <a0d19e7c-8fb0-e93a-d79b-319d8339504a@quicinc.com>
Date: Wed, 8 May 2024 17:42:09 -0700
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
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
In-Reply-To: <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E4KjvUFRQ8zlDlU_RC6jOoWXubnoPsOR
X-Proofpoint-ORIG-GUID: E4KjvUFRQ8zlDlU_RC6jOoWXubnoPsOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090002

Hi Pierre,

On 5/8/2024 12:41 PM, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:37 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/7/24 14:51, Wesley Cheng wrote:
>>> In order to allow userspace/applications know about USB offloading 
>>> status,
>>> expose a sound kcontrol that fetches information about which sound card
>>> index is associated with the ASoC platform card supporting 
>>> offloading.  In
>>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>>> responsible for registering to the SOC USB layer.  SOC USB will 
>>> expose more
>>> details about the current offloading status, which includes the USB 
>>> sound
>>> card and USB PCM device indexes currently being used.
>>>
>>> It is expected for the USB offloading driver to add the kcontrol to the
>>> sound card associated with the USB audio device.  An example output 
>>> would
>>> look like:
>>>
>>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>>> 0 (range -1->32)
>>
>> You already gave the following examples in patch 29:
>>
>> "
>> USB offloading idle:
>> tinymix -D 0 get 'USB Offload Playback Route Status'
>> -->-1, -1 (range -1->32)
>>
>> USB offloading active(USB card#1 pcm#0):
>> tinymix -D 0 get 'USB Offload Playback Route Status'
>> -->1, 0 (range -1->32)
>> "
>>
>> Can you clarify how many controls there would be in the end?
> 
> For USB offload situations, there will be a set of controls for playback 
> status and playback select.  The offload jack will also be there to tell 
> us if there is an offload path available for the platform ASoC sound card.
> 
>> Also isn't tinymix -D N going to give you the controls for card N?
>>
> 
> Yes, since the offload portion is handled as a DPCM DAI link to the 
> platform ASoC card, it will be included as a kcontrol for that.
> 
> Thanks
> Wesley Cheng
> 
> 

Sorry for responding again.  I read your email again, and wanted to also 
add that aside from the above, which are all within the ASoC layer, as 
we discussed previously, we should have a kcontrol in the USB SND card 
to determine if there is an ASoC platform card capable of offloading. 
This is also available from the SND card created by the USB audio device.

Thanks
Wesley Cheng

