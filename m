Return-Path: <linux-arm-msm+bounces-19500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA98BFE78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F481B242AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374E386274;
	Wed,  8 May 2024 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdIL34tY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A2C86253;
	Wed,  8 May 2024 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174180; cv=none; b=noAgiCX4gJ5SOdy+e6tSfZSBLpSQXZymkDaL4rtAp65O8RzMfCb9xBPaRhKiV1gl20c+W919SSvY3DRfjkyX3Yh7CJ16SYG4GKsFGukhI7skHp0o4B5iJqdC+0oHe3w8NHa1kuAWSLWUxQAnisk8AZ5sLwdmvtab80YtKPl3fgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174180; c=relaxed/simple;
	bh=l99SSYYgUarZwFUL8X6JnYSQ7YCqlp1K/sehN4H8WYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClWmZoz7l4GSKFkEOKiXzVWcqXOJrKb5fVUd8cqY4c9AEI4S+QObkQ58GUMFXa0+sRYcDmp2AXBVGVzSB757dElt6irpakApsggSLGt4LjsNboESSbN6kLXTdp02OApH7ZJDhtjmH3eUaMJ0P/UNXbWRRe5YzDSUZ+tvCVQd8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdIL34tY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174179; x=1746710179;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l99SSYYgUarZwFUL8X6JnYSQ7YCqlp1K/sehN4H8WYA=;
  b=XdIL34tYfA6RSdiTFgygv6eIbgiZx0odLBEJWmQj/RYInfMAbfOsKLkA
   +Ld4OzoYeQIPPFweUIayy3RRZdC5w8sGeqIBAMatlBA7GArx1ePjVe6VR
   iBZLzafXzR1NWPr6L1BrjHho7fzAkMBzvIDEdyHaOVjw8pSCGyybVErgh
   KQBX9Mgcg47flT6dDcTs05+aBr+WzyZSjcpMUXld3ypkZfEk5LXdzwymN
   X29FheI53aFEZBvv1txNEyhPn8kSWWqm2QvM1BkyggzhxrITGN6vyONaD
   DQuhn6tLOGYdzAhHCUyCqsvO3CsIJUbfnKNUQUfq0HfybYezlX+gIdvml
   w==;
X-CSE-ConnectionGUID: 76mfqUxbQyGziLh7deszBw==
X-CSE-MsgGUID: dRXqz7hvRLeeRHRUiJ6Gtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413270"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:18 -0700
X-CSE-ConnectionGUID: LkpahC3rQNmkL/KTma1Kew==
X-CSE-MsgGUID: lmGKK0rbQMGnIMdH9b7Rdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356806"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:17 -0700
Message-ID: <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
Date: Tue, 7 May 2024 16:26:09 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 27/39] ASoC: Introduce SND kcontrols to select sound
 card and PCM device
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
 <20240507195116.9464-28-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-28-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/24 14:51, Wesley Cheng wrote:
> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
> which USB card number and PCM device to offload.  This allows for userspace
> to potentially tag an alternate path for a specific USB SND card and PCM
> device.  Previously, control was absent, and the offload path would be
> enabled on the last USB SND device which was connected.  This logic will
> continue to be applicable if no mixer input is received for specific device
> selection.
> 
> An example to configure the offload device using tinymix:
> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
> 
> The above command will configure the offload path to utilize card#1 and PCM
> stream#0.

I don't know how this is usable in practice. Using card indices is
really hard to do, it depends on the order in which devices are
plugged-in...

