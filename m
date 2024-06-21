Return-Path: <linux-arm-msm+bounces-23540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86F911EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07ED51C214B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D2B127B5A;
	Fri, 21 Jun 2024 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/+F0EfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48616B3B9;
	Fri, 21 Jun 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718958460; cv=none; b=O7LZTeg9hZ8UwLeUi+nf0APQVmoCBDxNCikcntnnSPFd6zceZJKGKjYhWizMD4WYnY7idG5EGBYtmj9DV7Eu6VWwx0H7oL+4CLLwhgKZFN/s+2+YGcO+f3FLgThNdkY1FKWKGSAm1MGIBAGwiEe5ILQNzGqIrx2qeXR3yIJ0OlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718958460; c=relaxed/simple;
	bh=wuZBbOonZAFOS0sB1XJO28DAm8t6RfuaFgesGkuVgmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUP0bxOjnJIm//43Xi8AHE1px/KSriZqtvgfs9/1SF5S2R2kPSdxdgAkzNgoJcrs64fFzo6AlFpP+lZdZyi8N5a9RANS0xCdLgxIdOqGQWQuav3ftiJRTckul4mUnAkRyPCOIJ8mH8/xaP5sy/jw4PLzdVP8gkp8Z7JYLhInGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/+F0EfU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718958459; x=1750494459;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wuZBbOonZAFOS0sB1XJO28DAm8t6RfuaFgesGkuVgmA=;
  b=K/+F0EfUyMc/mjYwXznhW5pimJVD33jNdWIL4G9Qn6tMhTRn+YUyere4
   AsD423Yy30WbD93SvKN7pM4qrAcwxnotCY0A7j1b7RTkWl2pc9d8iMKsC
   OURIDPVtPPZ2fqs1WdrSzuJBcLLNv0Lt9HKjGkUYiv1OpXolQ4ZW2mxHX
   7oNrzIYc9DY7N4XTXZeTLNodLE5N4knv8tZeQys+UmXnP0m3rtTsLamyJ
   c0bAuo5OypSUpqKNRZB712Be3xOPOf1YttvjoX0bh8bm/GcPN40pXjoS9
   Og31rpqRL2LPwhv3RUXnpmDh1iUBjeWIWTqgebr/InSHeLXgocWMvevBV
   Q==;
X-CSE-ConnectionGUID: mK8Vwa3sQ0WD3Dp7TfoKFA==
X-CSE-MsgGUID: k3kIITlfQha56Vt1fJC7Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33438310"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="33438310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 01:27:38 -0700
X-CSE-ConnectionGUID: 83RXG4JlThiu0gr95hxjnw==
X-CSE-MsgGUID: bZhtUY6HTEaIIglKI2p5DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42628778"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.142]) ([10.245.246.142])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 01:27:33 -0700
Message-ID: <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
Date: Fri, 21 Jun 2024 10:27:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




> I'll spend some time to evaluate your suggestion about moving the logic
> to control the offloading from USB SND versus ASoC, since there are
> valid points.  However, before I do that, I just want to make sure folks
> are also inline with that thinking.  I've had to put a lot of effort
> moving things around such as the previous example, and now you've
> suggested to move it back to the vendor specific drivers.
> 
> @Pierre, since you've helped with providing a lot of valuable input in
> the previous revisions on the kcontrol uses, what do you think about the
> proposal from Amadeusz?  Basically shifting the offload device selection
> into USB SND from the ASoC USB BE driver, and having this per USB SND
> device.
> 
> [1]
> https://lore.kernel.org/linux-usb/20231017200109.11407-30-quic_wcheng@quicinc.com/

This thread is very hard to follow, I am not sure I fully understood the
initial proposal, and I am not sure I follow Amadeusz' either.

There are really multiple layers to deal with

a) is the controller able to support the offload path? IIRC this is
embedded in an obscure XHCI property, it would make sense to expose it
as a control, or component string, of the USB card.

b) is there a companion card capable of dealing with the offload path?
Since the presence of this card may depend on driver probe, there should
be a control on the USB card. userspace could detect changes to this
control and detect if that path is or is no longer enabled.

c) which PCM device is actually offloaded? This could be plural for some
implementations. The mapping between PCM devices exposed by the USB
card, and those exposed by the companion card, should be known to
userspace. I am not sure how this would be done though, a variable
number of controls is a sure way to confuse userspace.

At any rate, I would put all the controls under the USB generic card,
because it's always present no matter what the controller or DSP
configurations are.





