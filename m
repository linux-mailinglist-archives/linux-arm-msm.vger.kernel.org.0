Return-Path: <linux-arm-msm+bounces-29232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A095A536
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 21:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECBD7B21B9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 19:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692D116D9C1;
	Wed, 21 Aug 2024 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n4FCOV4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8850879CD;
	Wed, 21 Aug 2024 19:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724268119; cv=none; b=tSlytF0yGbO/rWspGpIq/DVmU+er2XK0u39RPrbzCgT0C2R0/aOVJ6dIUWQ2a/HOGGZECJ/nCIGkOB0V+fKWv5bmXcAZ6mY0hWvVZNj4JkMq2dBfiWoGDvuANX6VB1dS/fU59giCR7sqhgKSjZpAwndgvvXuuz58VRnaSc4KgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724268119; c=relaxed/simple;
	bh=qmXL/sbe8gh31UrF/74eBGgG/9WwYKl1q8qHI7W83pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nHY7+2B6QRDqoEzIZ+1m99FMlfG4EyyPdiSUFGcfGxxm5l6r/EScydORCX+GU17CWIjJ9rYxGm1LaIYDmAGPDr74GAclPC5dElKSPGQfgiSYzUdbNMrduCDrH8VG7ICSa/ec5LorxD4vlu8Qrcc3z53fnxBAlx/dN8NhH45SQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n4FCOV4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LD8CI4013010;
	Wed, 21 Aug 2024 19:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IeoT+nBRM0LBhs2H011zrEWCmbgYexhNOYy2/7m0ac=; b=n4FCOV4xeqR3TFbE
	W1uYTqj8TGw57a4uTiuc5WuyplInh6mA8RYu8JC08BadQ+GPhhHh6W6og2El4+6w
	1k2Nzgd6XuGrn4QWMoE31JEojVg8bswRgzn3/dXHWyI8hp0P8qLqCG0OIIPLYIJi
	AKN5BX0XRIMFqtfc9ib0NXD18hRTluLVHDbuSlzs52LyvIgLZbUi+9HNXegOGnru
	YMgf3mrOb9BZKIY/huC7LXyJDteyJk+3ZO+sRv6BQNflBvcpItprrox/9qoG9Ydv
	4w5ncRavE9E8rexAgA5Wu0O9exWtQrvSeU7xXTpsQUAlHq/nlcJR2/S4rbzswgd0
	x47ALw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pe5nqjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 19:21:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47LJLMd1009134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 19:21:22 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 12:21:21 -0700
Message-ID: <ca38ba10-2700-4b61-8f6d-55809f9e151e@quicinc.com>
Date: Wed, 21 Aug 2024 12:21:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
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
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
 <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
 <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
 <f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com>
 <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
 <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
 <7b3421f5-8d57-4138-9456-1bf0eb4662c0@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <7b3421f5-8d57-4138-9456-1bf0eb4662c0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xg0AxG_ydxq1eaLQt4O5ZcoXgQ8dk4is
X-Proofpoint-GUID: Xg0AxG_ydxq1eaLQt4O5ZcoXgQ8dk4is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408210142


On 8/21/2024 12:02 AM, Pierre-Louis Bossart wrote:
>
>
>>>>>>> +/**
>>>>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>>>>> + * @chip - USB SND chip device
>>>>>>> + *
>>>>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>>>>> + * query for if there is an available USB audio offload path, and which
>>>>>>> + * card is managing it.
>>>>>>> + */
>>>>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>>>>> +{
>>>>>>> +	struct usb_device *udev = chip->dev;
>>>>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>>>>> +	struct snd_usb_stream *as;
>>>>>>> +	char ctl_name[37];
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>>>>> +		chip_kctl->count = 1;
>>>>>>> +		/*
>>>>>>> +		 * Store the associated USB SND card number and PCM index for
>>>>>>> +		 * the kctl.
>>>>>>> +		 */
>>>>>>> +		chip_kctl->private_value = as->pcm_index |
>>>>>>> +					  chip->card->number << 16;
>>>>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>>>>> +			as->pcm_index);
>>>>>>> +		chip_kctl->name = ctl_name;
>>>>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>>>>> +				  udev->bus->sysdev));
>>>>>>> +		if (ret < 0)
>>>>>>> +			break;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return ret;
>>>>> Hi Pierre,
>>>>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>>>>> soc_usb framework instead of being added in the qcom/ stuff?
>>>>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>>>>
>>>>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>>>>
>>>>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>>>>
>>>>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
>>>> My comment was only referring to the location of the code, it's now in
>>>> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
>>>> specific to Qualcomm. I was not asking for any encapsulation inside of
>>>> soc-usb, I was only suggesting a move of the code to a shared helper
>>>> library so that this code can be reused as is and not duplicated if the
>>>> QCOM parts are not compiled in.
>>> Ah, great, thanks for the clarification.  Let me take a look with that perspective.
>>>
>> Going back on the history behind moving it into qcom/ was based off feedback that Takashi pointed out in v14[1].  It was mainly due to the fact that we would be adding another hard dependency between USB SND and the offloading components.  Hence the reason for moving it to within the QCOM offloading package. 
>>
>> Thanks
>>
>> Wesley Cheng
>>
>> [1]: https://lore.kernel.org/linux-usb/87y1bt2acg.wl-tiwai@suse.de/
> I don't see anything wrong with the initial proposal
>
>
>  +config SND_USB_OFFLOAD_MIXER
>  +	bool
>  +
>   config SND_USB_AUDIO_QMI
>   	tristate "Qualcomm Audio Offload driver"
>   	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
>   	select SND_PCM
>  +	select SND_USB_OFFLOAD_MIXER
>
>
> That would allows the SND_USB_OFFLOAD_MIXER to be build as a module, and
> it would allow other non-QCON solutions to use the module.
> Maybe just make it a tristate?

I think the main concern was that in the initial suggestion, I made it as part of usb-snd-audio and the call to create the kcontrol was made in the main USB SND mixer driver.  Maybe in the new proposal, we'll just have it as its own independent module and allow for other vendors to use the same (kcontrol creation done by vendor USB offload driver)?  Takashi, would this be acceptable?

Thanks

Wesley Cheng


