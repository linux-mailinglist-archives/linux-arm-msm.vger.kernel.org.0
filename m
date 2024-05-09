Return-Path: <linux-arm-msm+bounces-19614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C31338C15C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0092C1C22D58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6150D86146;
	Thu,  9 May 2024 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SepNGnx2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE580055;
	Thu,  9 May 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284593; cv=none; b=A+lWI+DRORlB+mG1mcNnaC5uvesGMKKxonLOmPBn/bdGPfXHcAZvN+SnHQbj+5O4Vns3bOfsqJy+uvr5YskN4T3I/uGUfptP+/37a9DYP6OOATAHbBxLB5zJ8aSmT5NwyDoncUD8ymo5DyntA6/tuuI1m8Al3cHhSGPjCSDobtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284593; c=relaxed/simple;
	bh=+Xg6sg0lsspm+oGIl2gKYWFJ9L1HRkPP8JWiP000C8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctXkHb4dgUoe+gXGI7qJvqBVqACriUkUfi4y3254CwCy1zWlNRThlA0KsyEqR3+iSQAqNGTgJaHkdtcXFZl8iJE7CaSVGC4iDHCgfHmqX7UwTb3VDISh7uzm29sg1rLUY1+2OBARzcXnTIoBHj7ReO6Avrve4HN9sA4HIf+cxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SepNGnx2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284592; x=1746820592;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Xg6sg0lsspm+oGIl2gKYWFJ9L1HRkPP8JWiP000C8Y=;
  b=SepNGnx2IJcaxT8JIsgqVPN/ggX/nMrhL31NmSKCAZXNPOpCvbozrK0/
   xy9sy+LTGx/Eth2dOBVHkGqifhBXpSI7xqHBuBsA7xHdmJFFBlD/OrM1w
   sK/wTvCe7iXt/ClFo7oFVQEvalqA6dKIf8OcLqot26BOYsis+HQdmsvg7
   JXipXuIXdw5axHo6TR4d6N7pbhKSqsuEB1ZJtL3QVIsWF/6DkOEODOyf0
   GlRBk54v/0FpzVAM87GAf6SQbvniJN+f5KnxiO7HPNlekYT4QMrrTQfOc
   yMV3vYMaB7tD2uOrANQAPMluk/2Dde77xtuax1Pq/MN7L/renMAEWEERP
   w==;
X-CSE-ConnectionGUID: SbFtlId8TlKzai7seHk4qw==
X-CSE-MsgGUID: Gd1X/7AfS9+Ajo6SxFC6Bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454299"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11454299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:32 -0700
X-CSE-ConnectionGUID: 1ox1AHb5TkOlj5+tCcFZIQ==
X-CSE-MsgGUID: qXDyMCKMR7Opd+vqjTIr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34213141"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:56:28 -0700
Message-ID: <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
Date: Thu, 9 May 2024 08:17:39 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
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
 <20240507195116.9464-39-quic_wcheng@quicinc.com>
 <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
 <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/8/24 15:06, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:40 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/7/24 14:51, Wesley Cheng wrote:
>>> For userspace to know about certain capabilities of the current platform
>>> card, add tags to the components string that it can use to enable
>>> support
>>> for that audio path.  In case of USB offloading, the "usboffldplybk:
>>> 1" tag
>>
>> usboffloadplayback?
>>
>> same question as before, do we need spaces?
>>
> 
> I think spaces are currently used as a delimiter, so I'll remove the
> spaces.
> 
>> And if we have controls, why do we need component strings? The component
>> string is not dynamic to the best of my knowledge, this could be
>> problematic if the card is no longer capable of supporting this stream,
>> while a control can be updated at will.
>>
> 
> Maybe I misunderstood your comment here:
> 
> https://lore.kernel.org/linux-usb/925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com/
> 
> At the time, I didn't include the kcontrols on the USB SND portion of
> it, which was added after this series.  My interpretation was that there
> were userspace entities that could query for general information about
> what the card supports based on the components string, or sound card
> name.  I treated this as an independent identifier, since the change to
> add the offload capable jack was present.

My comment at the time stands: it's very hard to figure out that a
random card supports USB and is connected to a given endpoint.

It'd be much easier as you wrote in the comments on patch 34 to have a
control in the "regular" USB card to point to the 'better' offloaded
path exposed by another card. Applications wouldn't need to know what
this other card is, they would then use the card:device information
directly.

