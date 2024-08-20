Return-Path: <linux-arm-msm+bounces-29031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A7957B75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 04:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13F0CB224B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CEB22318;
	Tue, 20 Aug 2024 02:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dDiqdbHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79749622;
	Tue, 20 Aug 2024 02:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724121259; cv=none; b=tEviD8PJhSuJbokAq1eC0BLwsy2qDgOrzaEGEWUzhXWLdM3tTvHQnLEYxVOVp38h62RZ41SLK11TSos5i/OXXgFAWlQODUdSj8T0MQAAbuoyUY7c02nwiyn4PsS4YrhzA7OTU109YZ8arbMciZ/0MYR6JSig9cVOd+2r6dcV/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724121259; c=relaxed/simple;
	bh=EX7m7E4uVFpmQxuytLHn8Izj+uT6XzL1vKALGH1360A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=icS9o40H89OHJ8Bdd22Jg7d2hu8wLeja399HGNwS3MaUyEQVyWFMTjNKYZ+y4GJ+NV3nOIl68ZSNu99CtdUqVj3TnaJ4n0bQwGqg8AVixG4M37OGPnpSR81vZqBNGk0CajRHF0YMC13GXr9yNikIA7o+SrgYAjavrZbK8/xoc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dDiqdbHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K2C282012421;
	Tue, 20 Aug 2024 02:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdvKqTI0IYHL1eLLYyhx4z9hi6k3a2+Z/kg0NhcHBQQ=; b=dDiqdbHNDfh0A2B2
	7lcKjF3MXhfcotG6OaBzKeZoe7WZxVfzkm79PzCip8UaoCzPB9YLLlydhq7ZhFOU
	xhgdFt8cipELYl7AaoRAT7wRs8y4xYjXdNmXVNzcfOK9d6evn2ejqfrfvj6ugDl8
	jGiFdwxeNPgQs24oWUKuLRULkxucJDdBnJFub23pNnAuoSoa2h6eb0iTwflXrwlY
	cpysxvpIFaGTZKiJZ06/YUekpzMq16Wq5CD43hniELuKbiuqKhd57R96+mQGr308
	NYNy7RTmP4oAzOgpI4eMAtuIXsmOcIerUif6sdc/z5y8NguzGWc0RuoWojG/nozR
	2/dpog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j5701bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:33:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K2Xmw2030765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 02:33:48 GMT
Received: from [10.110.70.123] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 19:33:47 -0700
Message-ID: <58043166-c494-42db-b7d3-575991e43e8b@quicinc.com>
Date: Mon, 19 Aug 2024 19:33:47 -0700
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
X-Proofpoint-ORIG-GUID: kHPYq0DIRqcezxG483IwCovOPnBE9jat
X-Proofpoint-GUID: kHPYq0DIRqcezxG483IwCovOPnBE9jat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200018

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
Hi Pierre,
> None of this looks Qualcomm-specific, shouldn't this be part of the
> soc_usb framework instead of being added in the qcom/ stuff?

Started working on this particular comment, and there are some things that needs to be considered if we moved this into SOC USB:

1.  We do save the reference to the USB BE DAI link within the USB DT node, which can be fetched/referenced based on sysdev.  However, I'm not sure if everyone would potentially follow that way.

2.  I tried a few implementations of adding a new SOC USB API, and the argument list was a bit long, because I didn't want to directly reference the usb_chip.

Sorry for the delay, but I wanted to give a good stab at implementing this before bringing up the implications.  It is possible, but definitely not as clean as how we have it now IMO.

Thanks

Wesley Cheng


