Return-Path: <linux-arm-msm+bounces-19610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B688C15AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31DDA1C2202A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405DA80632;
	Thu,  9 May 2024 19:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buzW5gge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2647FBDF;
	Thu,  9 May 2024 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284579; cv=none; b=X43Nk7gWBfCoV76OpeOQaBlZqNpWPiJ9HurT+4duJl6qIWlcedBpwGhKcQCptaJ2cmpKmp7xVqRrH3H/W5Z7K+woViuc8dujBMdCjMKh9ygNZhdnFNWfeekUkbpG+pGZpwf/GzyxkpROs3t1Ho3bfl30Ghz6xh2/cvD6NgUG2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284579; c=relaxed/simple;
	bh=pqJGDudG3EtP+HKlIxczhzYllZ6fjisuemy8gyrPPqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClqJ5JACDxdYpLrHPERr8+tC2bF4AaSJliDANwcCVMojsfbRWNTestkQh6dHKAZ1qr1mJ1fm20KOGdHTzt8+p8qbXfSyzyoh4Lq6SF1Eu0RA+ftJU5AWKIAu6IieFJbfPwaXzIJhTmMB0/6IFMznprapXVi8fEAE+ifhDsCc6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buzW5gge; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284578; x=1746820578;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pqJGDudG3EtP+HKlIxczhzYllZ6fjisuemy8gyrPPqI=;
  b=buzW5ggew0mIN4l14a1zTP/tvPY7cs+Mc1UPn3H2eK6SZQo45OIGD1wz
   wkPYJSrtnAE0j4K5d1TJRXajkA8QXLX3UAmVgvIE+jxomacVtXXRwNNEu
   MolQXtEd+DK6aRsBkaswydCLTPBgXDfRnuXHyV00Tx5nNufwXQsb1QjF2
   FXn4g+aW0zQHkJlfAmoQ0xBFDrQGCiaEDWP/ryxbN/A4eRjkZgEw+zAzu
   1VnFllnIXdWtX6TimbQSYDt8pLF4BVR8xjWNZ80qmd91OTpmFRENV1IxW
   TOazwWVmKKfIzM20sPudChAtkAI1lxKr8AcRrcL74aicJqyrE++zRvG4d
   w==;
X-CSE-ConnectionGUID: v90NA5gIRP6jZuPJLAcYDQ==
X-CSE-MsgGUID: xb4zGuPQQEelwF022qCJiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454254"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:17 -0700
X-CSE-ConnectionGUID: hRhLxpRCQlCZGrFg1s62Zg==
X-CSE-MsgGUID: m1N3f5RbQ+yjnemil+4Tng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213076"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:14 -0700
Message-ID: <c97a0563-c4ce-45cd-8141-ee9be1e01899@linux.intel.com>
Date: Thu, 9 May 2024 08:01:04 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 22/39] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240507195116.9464-23-quic_wcheng@quicinc.com>
 <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
 <066fe096-a9d3-2498-275d-185f709e9a02@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <066fe096-a9d3-2498-275d-185f709e9a02@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/8/24 18:40, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:20 PM, Pierre-Louis Bossart wrote:
>>
>>> If a PCM device is already in use, the check will return an error to
>>> userspace notifying that the stream is currently busy.  This ensures
>>> that
>>> only one path is using the USB substream.
>>
>> What was the point of having a "USB Mixer" then?
> 
> The USB mixer is intended to enable/route the USB offloading path to the
> audio DSP, and is for controlling the ASoC specific entities.  This
> change is needed to resolve any contention between the USB SND PCM
> device (non offload path) and the ASoC USB BE DAI (offload path).

Not following, sorry. Is the "USB Mixer" some sort of hardware entity
related to USB offload or just a pure DAPM processing widget handling
volume and actual mixing between streams?

I was trying to get clarity on whether there can be multiple streams
mixed before going to the USB endpoint. The commit message "only one
path is using the USB substream" is ambiguous, not sure if you are
referring to mutual exclusion between offloaded and non-offloaded paths,
or number of streams when offloaded is supported. Different concepts/levels.

