Return-Path: <linux-arm-msm+bounces-27712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC59447DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5A85B26438
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59AB19EEC0;
	Thu,  1 Aug 2024 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXUJfgKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABD19E7E3;
	Thu,  1 Aug 2024 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503537; cv=none; b=mPsqAJd+lJ4rrYkf6KLSj7LL2iorzVEGCm/qE1ouCgf4qc3zlfqjabPtIYSHqVXJTSCbjUyx8BKjLZJpmKS3O3ffwoHDF2Dn3JISDJ72tUQZVLQRRUx6eHIQWAUYevfFXW4dGtgIIXcxS+rGqTXGS4zsxU+l2nv/cTbhPWegJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503537; c=relaxed/simple;
	bh=hlG5dmxzgBQ8QYdl97vTifyi/3aA4LNWtHjoLyb36DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjKqT5vsTgAyNd1n68XHPUivfU7wlmXTakn/t1K79w7Zz15D6lnx5pNl+6pMlz0TCDiNZ3NNM9VQbt9r59OWkEMGO9XOdoZeDwmo0R05PEudV+1CfVKLKIm6OFXI5cydIaSF91wWroDue/8C5NOx6n7h+WHbOqCAxwnJup4BOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXUJfgKW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503537; x=1754039537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hlG5dmxzgBQ8QYdl97vTifyi/3aA4LNWtHjoLyb36DE=;
  b=KXUJfgKWoOEfFByV2rhbtJe9TbUq6DkE8ZWcvaUhxf6ZEdKkDIEKy70A
   OPdg3L3kzpAtgBG3xcf8cGyMCv2okkJcMJNFZvgf+H+CfFCxY/TFsZ3eO
   0inHlU7jdOlznPlofZAO0SQw6az+Vw464lrELJC+9Wvkn6pLrBPNOACzq
   3REdCteyIWf5Si1zfUsOWvlecLkEthmkIYW6fkxnCa++tR6ui3lSIEiqu
   qQ/FFo3pkNDwVTYh/kWV15I9pR10iaq446bjJfGG0KmHqGjU9+jefTjRU
   28dJJxfmV1VfijVHir2HCNWPcy/mihKlBnsCI1qjnx3AkogEuqNust4YC
   Q==;
X-CSE-ConnectionGUID: KuOPl7lDTD+2/78Q//cjDA==
X-CSE-MsgGUID: 1+9KjdwUSmunaba3aYz9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383695"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:16 -0700
X-CSE-ConnectionGUID: as0uoOqLRVyGfgF+j/kEug==
X-CSE-MsgGUID: YgCYS42HRumVFZ5NUqy/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59090227"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:10 -0700
Message-ID: <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
Date: Thu, 1 Aug 2024 11:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-30-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
> +snd-usb-audio-qmi-objs += mixer_usb_offload.o
> +endif
> \ No newline at end of file

add one?

> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..c00770400c67
> --- /dev/null
> +++ b/sound/usb/qcom/mixer_usb_offload.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/soc-usb.h>
> +
> +#include "../card.h"
> +#include "../mixer.h"
> +#include "../usbaudio.h"
> +
> +#include "mixer_usb_offload.h"
> +
> +#define PCM_IDX(n)  (n & 0xffff)
> +#define CARD_IDX(n) (n >> 16)
> +
> +static int
> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
> +		      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int card;
> +	int pcm;
> +
> +	card = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
> +					  PCM_IDX(kcontrol->private_value),
> +					  SND_SOC_USB_KCTL_CARD_ROUTE);
> +
> +	pcm = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
> +					 PCM_IDX(kcontrol->private_value),
> +					 SND_SOC_USB_KCTL_PCM_ROUTE);
> +	if (card < 0 || pcm < 0) {
> +		card = -1;
> +		pcm = -1;
> +	}
> +
> +	ucontrol->value.integer.value[0] = card;
> +	ucontrol->value.integer.value[1] = pcm;
> +
> +	return 0;
> +}

see my earlier comment, should those two calls be collapsed to return
all the information in one shot?

> +
> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 2;
> +	uinfo->value.integer.min = -1;
> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
> +	uinfo->value.integer.max = 0xff;
> +
> +	return 0;
> +}
> +
> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
> +	.info = snd_usb_offload_route_info,
> +	.get = snd_usb_offload_route_get,
> +};
> +
> +/**
> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
> + * @chip - USB SND chip device
> + *
> + * Creates a sound control for a USB audio device, so that applications can
> + * query for if there is an available USB audio offload path, and which
> + * card is managing it.
> + */
> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
> +{
> +	struct usb_device *udev = chip->dev;
> +	struct snd_kcontrol_new *chip_kctl;
> +	struct snd_usb_stream *as;
> +	char ctl_name[37];
> +	int ret;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
> +		chip_kctl = &snd_usb_offload_mapped_ctl;
> +		chip_kctl->count = 1;
> +		/*
> +		 * Store the associated USB SND card number and PCM index for
> +		 * the kctl.
> +		 */
> +		chip_kctl->private_value = as->pcm_index |
> +					  chip->card->number << 16;
> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
> +			as->pcm_index);
> +		chip_kctl->name = ctl_name;
> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
> +				  udev->bus->sysdev));
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	return ret;

None of this looks Qualcomm-specific, shouldn't this be part of the
soc_usb framework instead of being added in the qcom/ stuff?

