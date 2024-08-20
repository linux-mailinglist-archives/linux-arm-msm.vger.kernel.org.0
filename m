Return-Path: <linux-arm-msm+bounces-29162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF39959149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 01:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A0C1F24196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E6A1C8FB7;
	Tue, 20 Aug 2024 23:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S87Sj045"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E714A4F0;
	Tue, 20 Aug 2024 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724197299; cv=none; b=VA/nMYT9VGWPwss2l7/T7z7WwkN+IIatJoj7b6hN8ELuYlzvwyU4yp6+x9Xbv29vlGaepAqOPlM0PD8je1QIzZJrO0OPrKKp68tpMsydYQCxeE0NGZxDZG4P7jK6cx7qEPW3l5EotzaiHTbQ2jblZT70+dEgJRXXgfD/LC7+Gl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724197299; c=relaxed/simple;
	bh=Oz4ictvZa/glJJtpD3FaAHLOq4xAQvkCo3lPcmuXIXc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QQwBOu5ZYNYW9E+7otlrWd6WNFVFfoSWdnR5nChDqZE6HpthdX5959ufmK7KjadDOCnCuXPRAT0Zn2C1lqRg+6ZlpLPMYquW/QAaCLTzaBrKwb5GYuFhvdIPMJLoH0527lAukstKNOt4e0bWLoTADWSAAkGb6ZaXtao3igDLIuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S87Sj045; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KG3tSU026084;
	Tue, 20 Aug 2024 23:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2xSHxx/O1IBD0VFXMURcOHZcfL9/KRzxqHJdamFR6E=; b=S87Sj045LK14QvkR
	87oyKdX0PA02Tl+lnuUD20KN8C3v8sP/bJwqMRWeSSFHTR8ESbKHgIAt9iFm5oU6
	h/p4o0VisAKXFZCfaoDYt3n8nEYghAtZkPLYSbJEH1WRmrKABYI7lghQyVa4WbQs
	Dya4kFb5QCf8QW+hFS/4jsUuG38a0LVKCgJ0Hxky7/xqu9Gax/mZe3iRtWkIrWOA
	7zV448qd9W+SKs1wZhSpjmjrjRzNh0L+N0GSYBnmrUPDkgh6gAVi3nJr/FKFomqp
	dy/5W8g+0s+rBdDacKuJgq4VbkqejVy24LKnfN7jnIAj/5skB6Om2CTeJ6gikLE5
	GjIJNg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414xb9gw5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 23:38:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KNcOpI017411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 23:38:24 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 16:38:23 -0700
Message-ID: <56ebd11e-9522-406b-9ca4-5e284eaac409@quicinc.com>
Date: Tue, 20 Aug 2024 16:38:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
From: Wesley Cheng <quic_wcheng@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <88d5ed6f-1429-4381-8014-d5824ec7866e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ST7IiTIh_vJ13SBgn85S-sPx1NsnI_FY
X-Proofpoint-ORIG-GUID: ST7IiTIh_vJ13SBgn85S-sPx1NsnI_FY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=985 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200173

Hi Pierre,

On 8/20/2024 10:37 AM, Wesley Cheng wrote:
> Hi Pierre,
>
> On 8/19/2024 11:39 PM, Pierre-Louis Bossart wrote:
>>>>> +/**
>>>>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>>>>> + * @chip - USB SND chip device
>>>>> + *
>>>>> + * Creates a sound control for a USB audio device, so that applications can
>>>>> + * query for if there is an available USB audio offload path, and which
>>>>> + * card is managing it.
>>>>> + */
>>>>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>>>>> +{
>>>>> +	struct usb_device *udev = chip->dev;
>>>>> +	struct snd_kcontrol_new *chip_kctl;
>>>>> +	struct snd_usb_stream *as;
>>>>> +	char ctl_name[37];
>>>>> +	int ret;
>>>>> +
>>>>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>>>>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>>>>> +		chip_kctl->count = 1;
>>>>> +		/*
>>>>> +		 * Store the associated USB SND card number and PCM index for
>>>>> +		 * the kctl.
>>>>> +		 */
>>>>> +		chip_kctl->private_value = as->pcm_index |
>>>>> +					  chip->card->number << 16;
>>>>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>>>>> +			as->pcm_index);
>>>>> +		chip_kctl->name = ctl_name;
>>>>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>>>>> +				  udev->bus->sysdev));
>>>>> +		if (ret < 0)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>> Hi Pierre,
>>>> None of this looks Qualcomm-specific, shouldn't this be part of the
>>>> soc_usb framework instead of being added in the qcom/ stuff?
>>> Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:
>>>
>>> 1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.
>>>
>>> 2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.
>>>
>>> Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.
>> My comment was only referring to the location of the code, it's now in
>> sound/usb/qcom/mixer_usb_offload.c but does not contain anything
>> specific to Qualcomm. I was not asking for any encapsulation inside of
>> soc-usb, I was only suggesting a move of the code to a shared helper
>> library so that this code can be reused as is and not duplicated if the
>> QCOM parts are not compiled in.
> Ah, great, thanks for the clarification.  Let me take a look with that perspective.
>
Going back on the history behind moving it into qcom/ was based off feedback that Takashi pointed out in v14[1].  It was mainly due to the fact that we would be adding another hard dependency between USB SND and the offloading components.  Hence the reason for moving it to within the QCOM offloading package. 

Thanks

Wesley Cheng

[1]: https://lore.kernel.org/linux-usb/87y1bt2acg.wl-tiwai@suse.de/


