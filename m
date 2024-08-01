Return-Path: <linux-arm-msm+bounces-27754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35026945502
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 01:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB231F229F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 23:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794BA14D70A;
	Thu,  1 Aug 2024 23:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YAJq9/uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1BC13E04C;
	Thu,  1 Aug 2024 23:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722556273; cv=none; b=pToqZkq7w8u1V+QVWKLXnEtzeqWkr/IJCecX6736B+eNJ7iUcH+BnlHk1N/rJpePio+qNjoAMp0E2Izp/7IqIehGcYWH7PneWYFDWXbagU8ZBd2ya3sZtd+68po4N3AYUcbZTZJwNYscRgKyIAv94YEBBGFXB+h0jgjjuFlrgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722556273; c=relaxed/simple;
	bh=SRe+HOduI9I/TTc5kqhaTutON7QjmRIiDJcjmvowtzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QbEs1ujZsoXKJBkL7fQTImjDvPv15s7PRtdnYL9OIdgfj8Db0O6CZ+FUC+5egloR6T0tHbPMDiNQ1uGl6UU5e+kIpW5E522mDDv1P2IZFlo9mWRnujujVISa4q8r8QIKnVqLbJ7Gm7Sbhtcs7NeXjrDe4T/pqgkCaYb+cAUwWQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YAJq9/uq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Lbj5X028809;
	Thu, 1 Aug 2024 23:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+jSJ/zbzuWb9fsjty1sUBSDZFvEM1ajNsop565+wIE=; b=YAJq9/uqMKhHRCFo
	ZooUxgXjmrpO/Ux9ieZ4HcN5AMR//EI9F1OvSxLL6LpSHJN0iULFFp5D+WTt6izt
	RJhZ6Qn2r7OgTdqjJNCLdVCWRTe0oEDMVIiMVoX9gZQFNaYkn49w+GSWv2oBGU7Y
	wZvWQ496CuCv3WFJ/rrIFySIMSoau5d8ai7tVGUIwLnbGGaN7CTDCBxFIEoPf7Ut
	z71SUGm/zlc7GhD7qgXh66PqcR6R9r08ns+IjGsqhOI0zNFe745bX26VRNZ5CxSY
	JrAoIPotkVJgbylWZsr1nuXDmG/4Uxzk6am58Ugcu/r04ZvhGHxhSF3W01h6YFr/
	6T57Ew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rjefr6wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:50:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471NoDKl004700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:50:13 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:50:12 -0700
Message-ID: <f621ae59-7a78-4cd2-8eb7-eb02432e4828@quicinc.com>
Date: Thu, 1 Aug 2024 16:50:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
 <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zEn_n7EfQwr72h4zIsLzjWracdp5xdRR
X-Proofpoint-ORIG-GUID: zEn_n7EfQwr72h4zIsLzjWracdp5xdRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_22,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=579
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010160

Hi Pierre,

On 8/1/2024 1:26 AM, Pierre-Louis Bossart wrote:
>> +
>> +::
>> +
>> +               USB                   |            ASoC
>> +                                     |  _________________________
>> +                                     | |   ASoC Platform card    |
>> +                                     | |_________________________|
>> +                                     |         |           |
>> +                                     |      ___V____   ____V____
>> +                                     |     |ASoC BE | |ASoC FE  |
>> +                                     |     |DAI LNK | |DAI LNK  |
>> +                                     |     |________| |_________|
>> +                                     |         ^  ^        ^
>> +                                     |         |  |________|
>> +                                     |      ___V____    |
>> +                                     |     |SOC-USB |   |
>> +     ________       ________               |        |   |
>> +    |USB SND |<--->|USBSND  |<------------>|________|   |
>> +    |(card.c)|     |offld   |<----------                |
>> +    |________|     |________|___     | |                |
>> +        ^               ^       |    | |    ____________V_________
>> +        |               |       |    | |   |IPC                   |
>> +     __ V_______________V_____  |    | |   |______________________|
>> +    |USB SND (endpoint.c)     | |    | |              ^
>> +    |_________________________| |    | |              |
>> +                ^               |    | |   ___________V___________
>> +                |               |    | |->|audio DSP              |
>> +     ___________V_____________  |    |    |_______________________|
>> +    |XHCI HCD                 |<-    |
>> +    |_________________________|      |
>> +
> It wouldn't hurt to describe what you mean by 'port' in this diagram...
Sure, as mentioned in my earlier comments, in the USB world, port and device is kind of interchangeable, at least IMO.  I'd like to stick with the "port" term, but if you see otherwise, let me know. 
>
>> +SOC USB driver
>> +==============
>> +Structures
>> +----------
>> +``struct snd_soc_usb``
>> +
>> +  - ``list``: list head for SND SOC struct list
>> +  - ``component``: reference to ASoC component
>> +  - ``num_supported_streams``: number of supported concurrent sessions
>> +  - ``connection_status_cb``: callback to notify connection events
>> +  - ``get_offload_dev``: callback to fetch selected USB sound card/PCM device
> I think you meant fetch offloaded sound card and PCM device information
> for a given USB card:device pair?
Correct, will change.
>
>> +Functions
>> +---------
>> +.. code-block:: rst
>> +
>> +	const char *snd_soc_usb_get_components_tag(bool playback);
>> +..
>> +
>> +  - ``playback``: direction of audio stream
> why not use the usual direction 0: playback and 1: capture?
>
>> +
>> +**snd_soc_usb_get_components_tag()** returns the tag used for describing if USB
>> +offloading is supported for appending to a sound card's components string.
> How does this work if the ASoC part is probe after the USB card? The
> component string would be modified after the creation of the card?
>
> A control is more dynamic by nature, not sure about this component
> string. Jaroslav?
Do we actually need to add this?  I think just having the kcontrol is sufficient.
>> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
>> +Once added, this device can be referenced by further operations.
>> +
>> +.. code-block:: rst
>> +
>> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
>> +..
>> +
>> +  - ``usb``: SOC USB device to remove
>> +
>> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
>> +After removing a device, any SOC USB operations would not be able to reference the
>> +device removed.
> Not clear to me if the notion of 'port' helps, why not just
> snd_soc_usb_add_device() and remove_device()?
I'm open to either terms, since both mean the same to me :).
>
>> +
>> +USB Offload Related Kcontrols
>> +=============================
>> +Details
>> +-------
>> +A set of kcontrols can be utilized by applications to help select the proper sound
>> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
>> +callback that designs can use to ensure that the proper indices are returned to the
>> +application.
>> +
>> +Implementation
>> +--------------
>> +
>> +**Example:**
>> +
>> +  **Sound Cards**:
>> +
>> +	::
>> +
>> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
>> +						Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
>> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +	::
>> +
>> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
>> +
>> +  **USB Sound Card** - card#2:
>> +
>> +	::
>> +
>> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>> +
>> +The above example shows a scenario where the system has one ASoC platform card
>> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
>> +the available kcontrols for each USB audio device, the following kcontrol lists
>> +the mapped offload path for the specific device:
>> +
>> +	"USB Offload Playback Route#*"
>> +
>> +The kcontrol is indexed, because a USB audio device could potentially have
>> +several PCM devices.  The above kcontrols are defined as:
>> +
>> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
>> +	card and PCM device index.  The output "0, 1" (card index, PCM device index)
>> +	signifies that there is an available offload path for the USB SND device
>> +	through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
>> +	available for the USB SND device.
>> +
>> +USB Offload Playback Route Kcontrol
>> +-----------------------------------
>> +In order to allow for vendor specific implementations on audio offloading device
>> +selection, the SOC USB layer exposes the following:
>> +
>> +.. code-block:: rst
>> +
>> +	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_value *ucontrol);
>> +..
>> +
>> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
>> +
>> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
>> +execute the registered function calls to the DPCM BE DAI link.
> Oh man, now I get what 'get_offload_dev" means: it really means
> "update_offload_info' or 'update_info_kcontrol".
> The 'get' routines usually provide a handle on something to another part
> of the kernel.
> Not here, it's an update of something to be looked-up by userspace...
>
I can change the naming for this if its not the right terms used.  As long as you understand how the concept works then the name changing isn't a problem.

Thanks

Wesley Cheng

>> +**Callback Registration:**
>> +
>> +.. code-block:: rst
>> +
>> +	static int q6usb_component_probe(struct snd_soc_component *component)
>> +	{
>> +	...
>> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
>> +	if (IS_ERR(usb))
>> +		return -ENOMEM;
>> +
>> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
>> +	usb->get_offload_dev = q6usb_get_offload_dev;
>> +
>> +	ret = snd_soc_usb_add_port(usb);
>> +..

