Return-Path: <linux-arm-msm+bounces-27710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1D9447CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398781F281AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D371917CD;
	Thu,  1 Aug 2024 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsD4TPxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2594418CBEA;
	Thu,  1 Aug 2024 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503530; cv=none; b=rRk93vnARwVxzCyOF4FShE6xifUo/3FSPteu2Ut07C8W0cHT2wYuhBnzcOvg4Y2XDEHSyxZ3EKerkjXM3LdQxxay3uzTLkKPFLihHzTHTY3SQNVI7FViVtBCyN32iuuBTnWv47jJ1EUe6EP58OKz87LH5yl3Oonmo2nkU75YGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503530; c=relaxed/simple;
	bh=50P3KPPudZtfFpobkd/S2nDT5u5cmn8wStzeY+8OftQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw9T3f1LZ4fohpaROQX3I/Vnpi0RLIKYZVzeP8MhSzXRUsjawgjsyf35nHY3BtTjF2yXTqcZR5xVMwSq9Qgo5UdovivQyEIA+BAjL+9Ave67l35MZdsmRUuKqAADlRImITyJPAlonNj5EZJ7J9r0m017QOM184+iEg0scVHdvEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsD4TPxz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503530; x=1754039530;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=50P3KPPudZtfFpobkd/S2nDT5u5cmn8wStzeY+8OftQ=;
  b=UsD4TPxzl7OHQFtHbJsTqduFn5vqVDx7+FF2z9IlZIrQaj0IMW5XyMl4
   E1IUgKbgN9gUWDbbpHm6AkMIxu547zDr17UQ1qZ/QhDBUevkwQIVELXoF
   p4+xagubkcOwYWuLsiYFnJB8MA+Oo5YCSZNZLpg1T7ufhrAEjWT/+c7cq
   aO4lsnc0GPkqMRPZp/uWH0vin1qthOVzfcjU1rMqyNZfTe80JNF15AxKN
   T3ZAcrabw6iZao9loWbRkOPutO/dhh8hjB/eDXJXmVkHS9peHc18dRySB
   UOmbxVYQpcCbSiA0aGq3q6zv5GQtD6+XBBcyd3NGSb4cCjzAHGx7EG3pJ
   Q==;
X-CSE-ConnectionGUID: p8tfP5TLQOOsRVaI2ANzDg==
X-CSE-MsgGUID: xd4cOE7QTuiqAi5O6BIH4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383634"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:12:02 -0700
X-CSE-ConnectionGUID: 84VSGcL4TDymkhaL5jLvig==
X-CSE-MsgGUID: j43mw11GSaWyLm80EYxT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59090106"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:11:56 -0700
Message-ID: <9b3cccf2-8481-413e-8b9d-7de8a26de2cf@linux.intel.com>
Date: Thu, 1 Aug 2024 10:49:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 20/34] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
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
 <20240801011730.4797-21-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:17, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize

typo: sequences



