Return-Path: <linux-arm-msm+bounces-25269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EE927511
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 13:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B02C0B2376D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C45B1AD3F3;
	Thu,  4 Jul 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+iyaGdx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5501AC449;
	Thu,  4 Jul 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092321; cv=none; b=GdfqZ8FuFf/P0feXW6SYopWUoVNcX6d95PL0CEjla/hTewFr5ie7fOjs9AOhgz36ZHvT2LFRynepC07nXhn7FIzhBbDBb7hzaWdHKZYuzpa4YLTnjV1oM22m8VfE2Do+RCM2vO0Xotvbjhnc+XZyFZtqXYkBOUr+XObgMGv7ZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092321; c=relaxed/simple;
	bh=jkDP8M9nS6zbeKG8Ls4A6Gkiqj2sTDusTpp/rBGe0V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1r4zA9H4hYxwVCbLCgHspU4Xdk4YHu3BMekApe63F96/MZQKQDT1S9eltIxGeFyw5NYw7vQwtJZGbUqVprSKBXVxMq3bxpF1xmm3IyYU3QpyX7Ov3d3ujZwvFgNpZn+Qm21IZjpmiAlZKaBNWf9rErcM6tezWQS8qpTNBuKCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+iyaGdx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720092319; x=1751628319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jkDP8M9nS6zbeKG8Ls4A6Gkiqj2sTDusTpp/rBGe0V8=;
  b=k+iyaGdxIEE+bEjjCbngFqguf9ZVanRXNGituaRAbFsY8+naKNzNnEf9
   LiBHVI0wOlH1/pXTIA/Ox2V6biHD/ZzWlvhEyjoNL3fvDq5KhOgwVhmwb
   hh48MQTtWtl/f46nF6BmmTPiVsAoIGu0DS0QfHhECe1VydMwBn0zuz//p
   lJSRKrp4d82MpSrysQTyGrEc810L6R745wpnj4VNoEhVKwdnYosx0ZxRB
   XRRqMh0WbJRPeaQ96/d4BDqp9dWFWeN5WEUfvyu1AOghrgd3fKOwpeZ67
   Scam5T7W+3X4YyaOAvB+0OO5v8yaB9aPAwW/F43r+GrAEKoVU/OiwIW24
   g==;
X-CSE-ConnectionGUID: Hn0X33VeTmeKrDWy1OdVMA==
X-CSE-MsgGUID: 3cHolDtUQoiCJ41gtJS2TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17477832"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17477832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 04:25:18 -0700
X-CSE-ConnectionGUID: ws7LtSdaR264xMczHG3i8g==
X-CSE-MsgGUID: K9y0McSiT7qKUb2J70jrew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69759893"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.90]) ([10.245.246.90])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 04:25:12 -0700
Message-ID: <f9923336-3dd3-4f36-b5f6-f45f4ed09e0c@linux.intel.com>
Date: Thu, 4 Jul 2024 13:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
 <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
 <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
 <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>> Just so I understand...is it really desired that userspace doesn't
>> have the flexibility to choose which USB device is offloaded?  I know
>> it complicates what needs to be done, but it could be just an
>> additional feature that can be added later on.  Again, by default, we
>> select the last USB headset plugged in to be enabled for offload by
>> default.
> 
> If it chooses endpoint by itself perhaps you can send patch set without
> controls first? This has added benefit of less patches in series, making
> it easier to review and it won't block whole patch set by discussion on
> controls feature. Controls can be added in followup series.

We do need read-only controls for userspace to know that offload is
possible and which card/device to use. That can be done in a first step
assuming there's a single device plugged-in.

Dealing with multiple devices and defining rules or configuration
options to select the offloaded device is a second-level problem.

In most cases the only thing that will be offloaded is a headset
anyways, so the selection could be rather static based on a
vendor/system ID, all other USB devices would be ignored.

