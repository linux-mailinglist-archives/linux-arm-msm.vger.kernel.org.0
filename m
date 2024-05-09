Return-Path: <linux-arm-msm+bounces-19612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE0A8C15B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5A428461A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5FE84FB3;
	Thu,  9 May 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X45PQWYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16084DF9;
	Thu,  9 May 2024 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284584; cv=none; b=B5HJlnTO4FpV8ViiqpJQjrwFUZO6z4blNgVmsZIDNS1o/Zz9CxddRy6fZkR7z3nEG7vbBraZzlLomTWeVnvSkBMmNzuJP3awvjdhVQaqSUnirsTM+H6yh8F3KUM04MHSKr7ZGqcM809t492oykGxSZCMddPrSIsVEf4kTNfBYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284584; c=relaxed/simple;
	bh=3epbr7u3CfAFndEOsNu4jNNDKiPVR3FkG4nsSdqrrb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gw73TYnPnfborNAqxSeszn2etjLuZCuyAYYKbvaLB5N7j39/cxx2hlU8X2bgsX9bLHAhIME3jiDpgIMGKF0r5mVWjWDTTC+ec7+nIDwqjDpEezYoleAfWmbCQBj9gTCHqYmXLCivAIkSVi4sdhY5QvsZdDr/brX374PfkBKR1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X45PQWYL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284583; x=1746820583;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3epbr7u3CfAFndEOsNu4jNNDKiPVR3FkG4nsSdqrrb0=;
  b=X45PQWYLUDbpOYU7CYbi7yQgiGacA06ELZN7ilLyVD879dKj7+5cglvs
   dRiyyzwLWO7UY8d7gl3KMtqljdKhf6khF/P0q0Am4lTbUcdKSutOTdnku
   X8PyIy/WQclIeXtxXFC+vaMcJIn+wkzxTIo7zrNixrhnH1URWiVSML3fL
   QYA58tJScoSxaQOpaJ9UC4/MPYugrK+ln4O0IcERHLERkgYH0LG5tNFdK
   h/MGG0T2D6EDq6HJLnpOjFObefsi8YRUFfZ1h36g7GG65DLErUH81tCtI
   FcAyn2a751fqf2GsJfzC/DqppthHFJIRqWfeAcDWBN/yp+Zif8M81w/iv
   A==;
X-CSE-ConnectionGUID: w132kA1ZS5600QJC9VBOUg==
X-CSE-MsgGUID: v1Mj2OJNQRizWojE0IsRMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454276"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454276"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:23 -0700
X-CSE-ConnectionGUID: mB+YzDLqRz6/iJpx7j2KHg==
X-CSE-MsgGUID: J9w1UCm6QO6uAg+td9Am0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213110"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:20 -0700
Message-ID: <f1368be7-fea5-450c-a61c-f289ba61f150@linux.intel.com>
Date: Thu, 9 May 2024 08:07:36 -0500
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
 <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
 <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/8/24 19:10, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:26 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/7/24 14:51, Wesley Cheng wrote:
>>> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
>>> which USB card number and PCM device to offload.  This allows for
>>> userspace
>>> to potentially tag an alternate path for a specific USB SND card and PCM
>>> device.  Previously, control was absent, and the offload path would be
>>> enabled on the last USB SND device which was connected.  This logic will
>>> continue to be applicable if no mixer input is received for specific
>>> device
>>> selection.
>>>
>>> An example to configure the offload device using tinymix:
>>> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
>>>
>>> The above command will configure the offload path to utilize card#1
>>> and PCM
>>> stream#0.
>>
>> I don't know how this is usable in practice. Using card indices is
>> really hard to do, it depends on the order in which devices are
>> plugged-in...
> 
> How are the existing mechanisms handling USB audio devices, or what is
> the identifier being used?

Well it's a mess, that's why I asked.

There are configuration work-arounds to make sure that 'local'
accessories are handled first and get repeatable card indices.

But between USB devices I guess the rule is 'anything goes'. Even if
there are two devices connected at boot, the index allocation will
depend on probe order. The card names are not necessarily super-useful
either, i.e. yesterday I was confused by an USB card named "CODEC"
without any details.

