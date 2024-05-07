Return-Path: <linux-arm-msm+bounces-19495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB49E8BFE57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A19751F2338B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B4D6F514;
	Wed,  8 May 2024 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Snqz4nCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB26A33F;
	Wed,  8 May 2024 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174170; cv=none; b=Y/VpYZ7i1zKmrg3gripfe06tOZ9VuWx5b+NSSpAL42pF9GrdVj7s4iLoH1j5KboCpwVRmvmdz7n5ACHcaOzwB6OXJ/6aKYWHs3GVTp1XnGJgX84nTMtzD+ruRuV6cu8ikHxzkOnJHq7Mlns0SjkhIxvXfQkj0Rd2AZMGnVklIMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174170; c=relaxed/simple;
	bh=vVrb2QffCoJ3vhXc+JFVlfmhicKV2+XhcCMK/mhmbNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJa7+DbwdE6CHw/VwuucrNHT6PI1DL+L+5AyDetAXlvZUd3cOHKi4YDHafGoshaLSuaTf7HXL1+jnBMXNEv7BWZgo7TwYPUHrYlrIQJRQ/PGqBDI+8N0+AHVZzAp1XABlEz0Db9bdqVe06LDHWABDu8C2Rp2wf1tJ8ZhkjkWmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Snqz4nCB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174168; x=1746710168;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vVrb2QffCoJ3vhXc+JFVlfmhicKV2+XhcCMK/mhmbNc=;
  b=Snqz4nCB8bREZwe+XqCynXqVpf2db5X6L4Yqtd9LRhZQgqtdV4jCs6Ll
   rS111QyDPpZsai5Y7BJePg1TnSTFIEdc+vY9OXChX1onfCJVNJ5IO1n6I
   qyPVnB0lbiTSG66lELyfpiqqHKd2ptfQlw91C1XVLq1fGELfNoZgFIFE/
   62hXfBnedVJusCHVnY+aRE3/6Y/fPAywAYlbqfXyrfqknKRmQVd1dIa7l
   EPtrLk5JdaE810U/fHu6wNjGORZ/MiWBma++LDuENGqkgHDK42bRSB74g
   lxiaDZrTaigJ306Qtfs0ULSHiGcMteQhO34fqAnyV3u++D8wHkOBaZrbL
   Q==;
X-CSE-ConnectionGUID: KfOaZ/86QECGr9FRsuc50A==
X-CSE-MsgGUID: DlQ2WfdTRoyylDlUKW0kbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413194"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:07 -0700
X-CSE-ConnectionGUID: BG53EO0uQn2K/bzllqF7BQ==
X-CSE-MsgGUID: 2orAWzXGQXSUs+sTMvostg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356733"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:06 -0700
Message-ID: <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
Date: Tue, 7 May 2024 15:26:10 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 07/39] ASoC: Add SOC USB APIs for adding an USB
 backend
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-8-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-8-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +const char *snd_soc_usb_get_components_tag(bool playback)
> +{
> +	if (playback)
> +		return "usbplaybackoffload: 1";
> +	else
> +		return "usbcaptureoffload : 1";

why are there different spaces and do we need spaces in the first place?

> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
> +{
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;

make the function return void?

> +int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx == usb) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;

make this return void?



