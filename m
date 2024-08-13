Return-Path: <linux-arm-msm+bounces-28435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF257951000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 00:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C5F1F266DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 22:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FA41A7054;
	Tue, 13 Aug 2024 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bnUyn2ta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264E1AAE0A;
	Tue, 13 Aug 2024 22:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723589893; cv=none; b=ASRDIGH3jwc5gKWXkhLdjYS1xIDZ+lNsHTPBHRd1ruXT/mYaCMJ90E8NGhIsboSeexiH0y4aPh+Tr8LMQNp6QZGEQ2xHle/ZXWD63/1rGvd+Id2Y3Dy3BMgXfsKhCRmKOriIOtfSClWqlyEP/VkwqKXoQCF+TnoD+yuadPZsE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723589893; c=relaxed/simple;
	bh=v6pouzSjcUubJw/OLcJ2anfWGui3sH49fxAKvgWiqqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MDq7ueVEB8/oyUgTHOKgDEiuz9uUDOdHx9ITC2S64uczaDGy3dzutF2tiqmPB7tEaswlKVJIaP2BMdKKy+KGP+Ui4A4bpHZ1bYrSupKlV62qUxeFA7oq1e9/h02Ypyb3u6Enj8FRojxpilp3+kNAytgWRQYITMvRM+MYUUGHcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bnUyn2ta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DCpTrR002395;
	Tue, 13 Aug 2024 22:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIL8R124Of5TZX5wuk8bz/6NSDthT5u39JslZvw5xWQ=; b=bnUyn2taEsFo120f
	aDfi8xAXE4/49Wtnkp+VAjs0ie7H24kmQ0Zb52l2H9wyJoCTanQUlwIXXGs4iiH0
	lKug3mE1Y6rSOmhAyznmCo1ei9k+wrSv2BIKiImss5YVIGMOC2iIpYRLSD2pVeQk
	KBFFL2lsPummAneqfAlYXjKdjDew10e5rOw0RON7NebDDuT5WVqDkFTaME6TrgOu
	CfMPyLOH5XotZ0brNyMxp3JPlFO4CTK7FJkf9U0PwY7vjrVdAqusnvQnQvaQs1Bh
	ZrhITT2EvsKyaWdycfPcXk2dcfacAx0wTcqdQyGU5HqSVRstzK45b9amykW43gGn
	uXydyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x16815va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 22:57:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DMvjSW005026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 22:57:45 GMT
Received: from [10.110.24.42] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 15:57:45 -0700
Message-ID: <6855763c-0230-4535-a603-343059de5202@quicinc.com>
Date: Tue, 13 Aug 2024 15:57:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
 <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
 <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
 <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <acf4de1d-d551-4539-8353-3c85aa3d965c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _WsJpwi-2I3ra7escjcgBbfBvs8wZqXW
X-Proofpoint-ORIG-GUID: _WsJpwi-2I3ra7escjcgBbfBvs8wZqXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_12,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130165

Hi Pierre,

On 8/1/2024 11:26 PM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 23:43, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 8/1/2024 1:02 AM, Pierre-Louis Bossart wrote:
>>>
>>>> +/**
>>>> + * struct snd_soc_usb_device
>>>> + * @card_idx - sound card index associated with USB device
>>>> + * @pcm_idx - PCM device index associated with USB device
>>>> + * @chip_idx - USB sound chip array index
>>>> + * @num_playback - number of playback streams
>>>> + * @num_capture - number of capture streams
>>> so here we have a clear separation between playback and capture...
>> Thanks for the quick review of the series, I know that its a lot of work, so its much appreciated.
>>
>> I guess in the past revisions there was some discussions that highlighted on the fact that, currently, in our QC USB offload implementation we're supporting playback only, and maybe it should be considered to also expand on the capture path.  I went ahead and added some sprinkles of that throughout the SOC USB layer, since its vendor agnostic, and some vendors may potentially have that type of support.  Is it safe to assume that this is the right thinking?  If so, I will go and review some of the spots that may need to consider both playback and capture paths ONLY for soc-usb. (as you highlighted one below)  Else, I can note an assumption somewhere that soc-usb supports playback only and add the capture path when implemented.
> I don't think it's as simple as playback only or playback+capture. If
> there is no support for capture, then there is also no support for
> devices with implicit feedback - which uses the capture path. So you
> gradually start drawing a jagged boundary of what is supported and what
> isn't.
>
> My preference would be to add capture in APIs where we can, with TODOs
> added to make sure no one us under any illusion that the code is fully
> tested. But at least some of the basic plumbing will be in place.
>
> Takashi should chime in on this...
>
>>>> + * @list - list head for SoC USB devices
>>>> + **/
>>>> +struct snd_soc_usb_device {
>>>> +	int card_idx;
>>>> +	int pcm_idx;
>>>> +	int chip_idx;
>>>> +	int num_playback;
>>>> +	int num_capture;
>>>> +	struct list_head list;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct snd_soc_usb
>>>> + * @list - list head for SND SOC struct list
>>>> + * @component - reference to ASoC component
>>>> + * @num_supported_streams - number of supported concurrent sessions
>>> ... but here we don't. And it's not clear what the working 'sessions'
>>> means in the comment.

After taking a look at this "num_supported_streams" naming a bit more, I wanted to check with you to see adds to the complexity of the terminology being used across soc-usb.

The intention of this is to define how many concurrent USB devices the USB backend can support.  So for example, if the audio DSP did support multiple USB devices at the same time, this would denote that.  This is where I wanted to make sure the terminology was right....  So in this case, to me, it makes more sense if num_supported_streams --> num_supported_devices, because it determines how many USB devices the ASoC USB backend DAI can manage/support.  This adds a bit to the reason why I think using the term "port" for explaining the SOC USB context is reasonable.

Thanks

Wesley Cheng

>>>> + * @connection_status_cb - callback to notify connection events
>>>> + * @priv_data - driver data
>>>> + **/
>>>> +struct snd_soc_usb {
>>>> +	struct list_head list;
>>>> +	struct snd_soc_component *component;
>>>> +	unsigned int num_supported_streams;
>>>> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>>> +			struct snd_soc_usb_device *sdev, bool connected);
>>>> +	void *priv_data;
>>>> +};
>>>> +/**
>>>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
>>> USB port?
>> Noted, refer to the last comment.
>>>> + * @component: USB DPCM backend DAI component
>>>> + * @num_streams: number of offloading sessions supported
>>> same comment, is this direction-specific or not?
>> Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>>>> + * @data: private data
>>>> + *
>>>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>>>> + * are used in subsequent sequences.
>>>> + *
>>>> + */
>>>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>>> +					      int num_streams, void *data)
>>>> +{
>>>> +	struct snd_soc_usb *usb;
>>>> +
>>>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>>>> +	if (!usb)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	usb->component = component;
>>>> +	usb->priv_data = data;
>>>> +	usb->num_supported_streams = num_streams;
>>>> +
>>>> +	return usb;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>>>> +
>>>> +/**
>>>> + * snd_soc_usb_free_port() - free a SOC USB device
>>>> + * @usb: allocated SOC USB device
>>>> +
>>>> + * Free and remove the SOC USB device from the available list of devices.
>>> Now I am lost again on the device:port relationship. I am sure you've
>>> explained this before but I forget things and the code isn't
>>> self-explanatory.
>>>
>> Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.
> I am not sure USB uses 'port' at all. If by 'port' you meant 'connector'
> it's not quite right, USB audio works across hubs.
>
>

