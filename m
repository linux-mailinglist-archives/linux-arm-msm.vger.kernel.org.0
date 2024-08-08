Return-Path: <linux-arm-msm+bounces-28130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C095994B476
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 03:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52E661F23353
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5768720ED;
	Thu,  8 Aug 2024 01:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nuyOU1V6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAA8BE5;
	Thu,  8 Aug 2024 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723079443; cv=none; b=jNtwawGbVdT0HReSy3bb7Xdffh5o1ILU7pFKjaoXeGbwAwg3ZFrN4jf4nWBGpMTQJS5vq2bLKylMXzWd5YuiiCv8VLxVZpcKGlVeMge1fBRLo+lDV0y4VGe4F50vRsXztBrd93ptk9GEt2GNGUq8HNQuHknC9DkCofS8kULNbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723079443; c=relaxed/simple;
	bh=zNqeGe5SZ1R/HNoeZ1p4saUGdt1QHIZFw6RmLBAQO2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aaA3a/5izrASk8l3dh1h3yuw7S8ALoMxPy3Xnsqb2fmb//9J58nt/TOblsSrYmlB49GAZaui3VGkhglcx17FFHNREMKt8Uyy8XE8RXF27j1gSlepu0yDwNEakNnoLroJLjgv707UPmthbW3IkbaqrB2Y+vNqzBtsYNA0T6eergg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nuyOU1V6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477I6VRB013694;
	Thu, 8 Aug 2024 01:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8zs0pLpq9x10EoaY6DU1mr+Wg5AwuPzK8KlejsV5fI=; b=nuyOU1V6o7OYh+hS
	UFSXiPT9DsKWeK/FbLCmp8JuNx11//GQ3raF6dTZHwJChUqsk5lEuOmK3yQr+NIC
	0zFsark0QY1JjDg0bw8XGpaGZfEs6uyCFKbwJEuAVtUV6Grre914rw8LYdoTvqhr
	T1IFOJCP2UTF3q3jvz9DfzHo5jQux/zSG0NK7gHvMgKPRFOETZQa1ubvIGuKI7Wr
	5Tpz/FANsTeMCSKSViwmvlErFF443K9hKfOcRoQMCU7dWoUO/RBY/fO90eLt/6yY
	eGHG2TQlCmr5gT1/wKlEaCxct5pTKMnsZaniYb4WygofHrofQ1n7qOTwDTPmS2KB
	h6A15w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8f4c4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:10:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4781AKOH017260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:10:20 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:10:19 -0700
Message-ID: <49dc63b7-1b9b-4888-8127-d988bc3e8373@quicinc.com>
Date: Wed, 7 Aug 2024 18:10:18 -0700
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w1MIkmMMNVY1A41xA_hAbWhFLD1zzPmE
X-Proofpoint-ORIG-GUID: w1MIkmMMNVY1A41xA_hAbWhFLD1zzPmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080007

Hi Pierre,

On 8/1/2024 2:02 AM, Pierre-Louis Bossart wrote:
>
>> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
>> +snd-usb-audio-qmi-objs += mixer_usb_offload.o
>> +endif
>> \ No newline at end of file
> add one?
>
>> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..c00770400c67
>> --- /dev/null
>> +++ b/sound/usb/qcom/mixer_usb_offload.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/usb.h>
>> +
>> +#include <sound/core.h>
>> +#include <sound/control.h>
>> +#include <sound/soc-usb.h>
>> +
>> +#include "../card.h"
>> +#include "../mixer.h"
>> +#include "../usbaudio.h"
>> +
>> +#include "mixer_usb_offload.h"
>> +
>> +#define PCM_IDX(n)  (n & 0xffff)
>> +#define CARD_IDX(n) (n >> 16)
>> +
>> +static int
>> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
>> +		      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
>> +	int card;
>> +	int pcm;
>> +
>> +	card = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
>> +					  PCM_IDX(kcontrol->private_value),
>> +					  SND_SOC_USB_KCTL_CARD_ROUTE);
>> +
>> +	pcm = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
>> +					 PCM_IDX(kcontrol->private_value),
>> +					 SND_SOC_USB_KCTL_PCM_ROUTE);
>> +	if (card < 0 || pcm < 0) {
>> +		card = -1;
>> +		pcm = -1;
>> +	}
>> +
>> +	ucontrol->value.integer.value[0] = card;
>> +	ucontrol->value.integer.value[1] = pcm;
>> +
>> +	return 0;
>> +}
> see my earlier comment, should those two calls be collapsed to return
> all the information in one shot?
>
>> +
>> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 2;
>> +	uinfo->value.integer.min = -1;
>> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
>> +	uinfo->value.integer.max = 0xff;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
>> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
>> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
>> +	.info = snd_usb_offload_route_info,
>> +	.get = snd_usb_offload_route_get,
>> +};
>> +
>> +/**
>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>> + * @chip - USB SND chip device
>> + *
>> + * Creates a sound control for a USB audio device, so that applications can
>> + * query for if there is an available USB audio offload path, and which
>> + * card is managing it.
>> + */
>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>> +{
>> +	struct usb_device *udev = chip->dev;
>> +	struct snd_kcontrol_new *chip_kctl;
>> +	struct snd_usb_stream *as;
>> +	char ctl_name[37];
>> +	int ret;
>> +
>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>> +		chip_kctl->count = 1;
>> +		/*
>> +		 * Store the associated USB SND card number and PCM index for
>> +		 * the kctl.
>> +		 */
>> +		chip_kctl->private_value = as->pcm_index |
>> +					  chip->card->number << 16;
>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>> +			as->pcm_index);
>> +		chip_kctl->name = ctl_name;
>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>> +				  udev->bus->sysdev));
>> +		if (ret < 0)
>> +			break;
>> +	}
>> +
>> +	return ret;
> None of this looks Qualcomm-specific, shouldn't this be part of the
> soc_usb framework instead of being added in the qcom/ stuff?

Let me see if I can do that. 

Thanks

Wesley Cheng


