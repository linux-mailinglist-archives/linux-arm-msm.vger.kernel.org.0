Return-Path: <linux-arm-msm+bounces-28131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B152594B48D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 03:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7075D282C94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD713D6B;
	Thu,  8 Aug 2024 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b4gKN3+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764918BE5;
	Thu,  8 Aug 2024 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723080005; cv=none; b=Tly+3GIjIicdPwiraNUHs5AdOh7CYMuhZaSnP2kwW/m0IxvZ75HRAJqHdVk2TBHnT1Dz9fuGyCpuwTsUTaNtXDkdItSZPavBoBiIkSRauo5Uueokk1UzSMlyILrXuLu5Sls1GclyxR5v6KRgxVF10xGKQjJMILbasnZWGf7LsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723080005; c=relaxed/simple;
	bh=/npPi7ba/WeC/JMiP+Sf/QXwjSMN5tPK9lDCU6TBq/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UDFhLLdM034gEGxSpGgrvvC/sEgI7M6H1qa8fog2q9odAbCGqy+xD+pOFoKAFuswepi9uTEYfTAO8VWngDVIk2YhAWkMFzFy7lDrQYQSazmMupZCkMUEoL3wgVHMqNVhVlayHO/+p7rjBdbwXnIzeyRlQ86WFXUuK5jH9WRrnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b4gKN3+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477Hxhj5020463;
	Thu, 8 Aug 2024 01:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/npPi7ba/WeC/JMiP+Sf/QXwjSMN5tPK9lDCU6TBq/s=; b=b4gKN3+wc9T78ftm
	GCqJVU8TmTCwIINMjdeIVyGxh1gFXl4h5SfUNn7IUnoMCT0nmLvM8U8Lyg57jH+g
	behMO8r5XT40TbxMrKN5ew1/EJSv7gf0/N1p6xZHJZxzOVCYBBCt5/28J4G/ZjFT
	dEY7G2GqwjncVgoGY23gIoJr+x/HFSjFlV7Uim6yks0Hrw++fmSk/0BRqZINse3b
	AzPBsVwdr/WM9bbZHk4ou2er9FNY4TzvLgGNBOl1cJLgloluuFDYsJRCrobIcF3b
	k2bWIgPp1+sHeWBrTQrV8MWPR8g2sOQowdp9NV68pJOeYxLkBhJbjbI2f8hDdIGI
	BLZS5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scmu4bpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:19:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4781JYwn026031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:19:34 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:19:34 -0700
Message-ID: <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
Date: Wed, 7 Aug 2024 18:19:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
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
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H4OCoCeVN5FDgeBLWpQHKW-817o9LPGU
X-Proofpoint-GUID: H4OCoCeVN5FDgeBLWpQHKW-817o9LPGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080007

Hi Amadeusz,

On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>
> How can this happen? Can you provide some example with list of devices and which one should block the other? If I recall correctly devices are already exclusive unless you support substreams which ASoC does not at the moment.
>
From past discussions, I think so far everyone is on board with the idea of having both the USB sound card and PCM devices exist in conjunction w/ the USB offload path, which is going to be done over the ASoC platform card.  So for example,

/ # cat /proc/asound/cards
 0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
                      SM8250-MTP-WCD9380-WSA8810-VA-DMIC
 1 [C320M          ]: USB-Audio - Plantronics C320-M
                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed

This device currently has the following sound cards within the system:

- card#0 - ASoC platform card: handles USB offload, speaker, etc...

- card#1 - USB SND card: card created for interacting with the connected USB device.

So now, with USB offloading in the picture, there are basically two paths that can start attempting to utilize the same USB device endpoints.  Let's keep it simple and assume the device only has one playback substream (which means only one PCM device)

/proc/asound/card1 # cat stream0
Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed : USB Audio

Playback:
  Status: Stop
  Interface 2
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ADAPTIVE)
    Rates: 8000, 16000, 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR

So the patch here will prevent transfers from happening from both the offload path and directly over the USB SND PCM device, which correlates to the following paths:

- offload: card#0 pcm#0

- USB SND: card#1 pcm#0

Thanks

Wesley Cheng


