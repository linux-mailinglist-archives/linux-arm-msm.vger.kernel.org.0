Return-Path: <linux-arm-msm+bounces-19528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA518C0532
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 21:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9361C213EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 19:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DB7130A7E;
	Wed,  8 May 2024 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eO8Qobbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA6225D9;
	Wed,  8 May 2024 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715197300; cv=none; b=qKOdra07+aAJIsWRbdtQLAU4aj3OiDEsFNO3OF/9cIVEaOA1n80kqZAaXKCpuHuGMRJYS4P0jNtzxPMQdveDHqqFo8lo9qtL6Re8pSZGbX5JrpAI3DVRMrDkceQppKgowK6evWJK647T4SgwaN+YDZOpMy24sV6uf75K3/cC3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715197300; c=relaxed/simple;
	bh=HapdOvbkq3cPe7mrnwPRJWY/JCHXpUP5zWlGDoia4vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OAwtl4+3AguKmAXEPLfGf5tOhCYmDbWY0NctqbopvbSvABIuIE4vfFrGTl849D1l4jNKkfdBxW14vK5+eQC4s1ltobvjawPOOkBYh1dMX282gugqxzsKsVzXnoAIRoGbZqceqEEpIdkfcHVqMAfKcEvfg6h6bTPmSpg6DkDGz6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eO8Qobbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448C4OBB027127;
	Wed, 8 May 2024 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=//8eQG+4DJgnx0oufJSB0Ib+8mNORV/5apGuxCNbiww=; b=eO
	8QobbhfFGKKMOMN0MklkBu/IIMkRiTUFvOXG2N0U+uncWf4fVgG9GtPXMgeIdubH
	J50HYgA+5bxk/nOeBJHHbq2HKS4j5zMZ/Q3kDh7dq/kv/49NO56vh1ECoLNr55EU
	DA3rlZra/g4d45My0ErWb2TBFfwn/+mWfuAVHYx8MVCGNaBlQNyJoTWp2Em/Bdsv
	noRyvN6Bi5XEkIJot+es0BoE4Pi6E91c9c8TnRmI35MoU3j788jIDFeUcUiWTXna
	4DXKNHqvzTUGvxIJnfOVGtLo+GEUrt52unFv9Gy1fHU9pzb2hr+0C0xfzEerqppB
	zzlAl1GT3Pp2WutiX/ug==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930s2f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 19:41:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448JfGU3007751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 19:41:16 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 12:41:15 -0700
Message-ID: <a602e121-28e0-3255-87bb-c75355926125@quicinc.com>
Date: Wed, 8 May 2024 12:41:10 -0700
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4ce8ee3b-21d3-4aa3-8fd5-7dcccc2b8abe@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _92PkR2WXZJ-AELmvZ21blO6NJUTRqKm
X-Proofpoint-ORIG-GUID: _92PkR2WXZJ-AELmvZ21blO6NJUTRqKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080144

Hi Pierre,

On 5/7/2024 2:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/24 14:51, Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> index is associated with the ASoC platform card supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.  SOC USB will expose more
>> details about the current offloading status, which includes the USB sound
>> card and USB PCM device indexes currently being used.
>>
>> It is expected for the USB offloading driver to add the kcontrol to the
>> sound card associated with the USB audio device.  An example output would
>> look like:
>>
>> tinymix -D 1 get 'USB Offload Playback Capable Card'
>> 0 (range -1->32)
> 
> You already gave the following examples in patch 29:
> 
> "
> USB offloading idle:
> tinymix -D 0 get 'USB Offload Playback Route Status'
> -->-1, -1 (range -1->32)
> 
> USB offloading active(USB card#1 pcm#0):
> tinymix -D 0 get 'USB Offload Playback Route Status'
> -->1, 0 (range -1->32)
> "
> 
> Can you clarify how many controls there would be in the end?

For USB offload situations, there will be a set of controls for playback 
status and playback select.  The offload jack will also be there to tell 
us if there is an offload path available for the platform ASoC sound card.

> Also isn't tinymix -D N going to give you the controls for card N?
> 

Yes, since the offload portion is handled as a DPCM DAI link to the 
platform ASoC card, it will be included as a kcontrol for that.

Thanks
Wesley Cheng


