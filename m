Return-Path: <linux-arm-msm+bounces-19499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547B8BFE72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8362B23FB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED20C86146;
	Wed,  8 May 2024 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW037m9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443185953;
	Wed,  8 May 2024 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174177; cv=none; b=RtkUKHaTJxuPYpBUtacfK/A8Y5/Ndnd+dEjDtc4MeUdpwXsLRhjvP6n5bVZFxI3vbNyjCb1jxHom7z+ubR4jHIJffNqR1jTHGlpMiB8NnuCpfkbEa6ad8AOr62VvUXP464LiZq+4XYaTebWnSPRn/FuAdfWiwDkbGE3Wzpihvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174177; c=relaxed/simple;
	bh=w+yqx0L73Rw5gOHQQ+B8HtBku2W//pUToQXNgXyM9nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un4fOtEz+vNXjZHF1THQkx9krL1GpzAOArDVXwjPyW52mkhVDFmZqxElG3n7giHC0rgj3ldvsEGgRKv4eJtL9D/Y7McWPr2Q4nEdKzf7NLwOOhzX/4GXDjbR2FDPSR1wtkwEcr2z4b7tJhCfnhWRydqlVNeuqMB1h84X6exZcHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iW037m9f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174176; x=1746710176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w+yqx0L73Rw5gOHQQ+B8HtBku2W//pUToQXNgXyM9nQ=;
  b=iW037m9f0rRRimiJ2QJ/vPq8TUsOsT8KrBHjMs8ytrbEqY9uX2xdfFSi
   GfP7sPAVjJIYDl25+BGOobL3YWE89LszMPkTzUg3rdgs+3cA3F72RdY/o
   CDVqbsUyU6Tlf6g5QaqFa5leYpOMb6ihkseVbRdZ/D19iut3MoZ8llk2v
   u0QX/TRXaC3a7F34a9eM4dEXdceVz3KBqXORLo/f78odticQjeZSxwVDK
   d7QvONHzTA+t0rCTvS8zOgH2vpdlNQfMVdvIyccuHYM4dvzWEq2sBvpM3
   wTDqB9XXr+6HELWtx1KbMXEGdyWo9ap3cehoVUtoLTItDTyb1yQ8/P77T
   w==;
X-CSE-ConnectionGUID: NDfYA/LCQ5SAEjEUcUuimg==
X-CSE-MsgGUID: DuqsdrvqRFy9d+9Iz7SrlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413253"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:16 -0700
X-CSE-ConnectionGUID: qvfIbtIxQJKu8CEdUpwLzQ==
X-CSE-MsgGUID: zrr7iwQZQ9+qWMTGxnuokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356785"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:14 -0700
Message-ID: <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
Date: Tue, 7 May 2024 16:23:51 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
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
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-27-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>  	if (connected) {
>  		/* We only track the latest USB headset plugged in */
>  		data->active_usb_chip_idx = sdev->card_idx;
> +
> +		set_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].sdev = sdev;

Not following the 'only track the latest USB headset plugged in', I
don't see anything that discard the previously latest headset...

If you plug headset1, then headset2, how is headset1 marked as not
available for USB offload?

> +	} else {
> +		clear_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].sdev = NULL;
>  	}
>  
>  	return 0;

