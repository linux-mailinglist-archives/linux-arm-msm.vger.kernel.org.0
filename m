Return-Path: <linux-arm-msm+bounces-27749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D050494549A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 00:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB19284CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 22:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A1114A0AD;
	Thu,  1 Aug 2024 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lfF305o6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CBD14D6E9;
	Thu,  1 Aug 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722552261; cv=none; b=czsa3bABwSprzLvxDGJP9JPoJU3IGiAJKY4AL1OEm0uPAoSG2Wdf4EUYJ49p25H107ONmhYuKbmz11yB4rQU4ytxr9vW8g0hMVmg3o9a8Vg6uUPSHuRSzvostl2b9dvQWVu5EOR1+9pOYzBwb2FutigzXlhTCxkRsdI8VHbL1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722552261; c=relaxed/simple;
	bh=YgcMeHbecvcwAZcMU2fEaHUgFYpRhsPXQb6yZzvX9Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V0878T3ONHCcbxjJxOjpc/nF5pAnuVLp3OSd4l5zfBQQtdGGpa19VFlGnucoJgEOxio4YHevbuQtCDUfeDXlu7AxvbFibMJRJrJAJX/FAtdhqcSR3anUu1bODH+wCMrM5GPZCDzOhuLlEDraLNpMljVSikaOuxS8/iVpE4seAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lfF305o6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LajVc024593;
	Thu, 1 Aug 2024 22:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGG1xu/Ws5ZdwYrfCVjBOTjooBbgHwtQA2Br32FjgVM=; b=lfF305o6k0ZUPcjF
	xQE4GP+uieLUOfwU/0EURArLd0ql2Kk6uvVxiIcGMyVAa24SwZvRB3li6fN90iji
	beLTmNS/KORCWwbXVwmuCahg/+Hr8vrPY+xCAu2UmVjSXDl4k1E0dw8WFStplj/Y
	kQHH2Je/H6q4DxblHgepb4U7X76/mmLqP3fHpDnP3iK2Uu2cE4uMRJPYF551aiZX
	8G/u4d4IA+Bo9/BS9gNfOV9aHJ6BSmvxWqCyUI7f6T5rol3fW1sBzlAYJHBm+fAO
	8d//hvPKCdsNEUxVGOJsRHwns38tZW//3Is3UfDP3gV040FBVexg4++ytQn44aHc
	8LXX/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje303h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 22:43:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471MhHdQ023311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 22:43:17 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:43:16 -0700
Message-ID: <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
Date: Thu, 1 Aug 2024 15:43:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
 <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gXHq5d8kZnKKMYYfVok95REoRv2uhT8d
X-Proofpoint-ORIG-GUID: gXHq5d8kZnKKMYYfVok95REoRv2uhT8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=966
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010152

Hi Pierre,

On 8/1/2024 1:07 AM, Pierre-Louis Bossart wrote:
>
>
>> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +						 struct snd_soc_jack *jack)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>> +{
>> +	return -ENODEV;
>> +}
> usually fallback functions return 0, is the error code intentional?
ACK.
>
>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +					struct snd_soc_jack *jack)
>> +{
>> +	int ret;
>> +
>> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
> do we need the reference to Playback?
No, will remove.
>> +					SND_JACK_HEADPHONE, jack);
> wondering if there would be any merit in defining a new type of jack,
> e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
> device connected. The type of device does not really matter, does it?
>
Not as of now, but I think we discussed in the past that maybe depending on if playback and capture is supported, we can notify SND_JACK_HEADSET?  That is something I will need to change depending on how we want to handle the comments on patch#9

Thanks

Wesley Cheng

>> +	if (ret < 0) {
>> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_component_set_jack(component, jack, NULL);
>> +	if (ret) {
>> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;

