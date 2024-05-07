Return-Path: <linux-arm-msm+bounces-19498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8128BFE6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6691F25251
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC8C8592A;
	Wed,  8 May 2024 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDvvLr21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1EF85620;
	Wed,  8 May 2024 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174175; cv=none; b=Uq5fHTNuicrzplht502FWzbq3C0ymeChZOT6XbKoVn2idKWhRnP8vAaoO+w9OKo3GXDvdHBMNOEfT1kuNkkf8quWmDjj6GyEBMzDI5L8GB4ws/QyU3peTX5XJwOyaHN6XumD0GhDM63tNZi14p//d1IlVBknBZPvV043f9CxyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174175; c=relaxed/simple;
	bh=XNeckRnANZcfLQNUQ8Z5GX84AOZZtK3YH+F5AxvIfmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQFsB6EgnQji56Zv8m+B21iIDQhFJhjGpqbFT1/l+KDIK8EkYm8Y1mFE39je2rabk2zf2/69AR3qAe0ZN2W3cdobjwt2VyhYzgA9ZXLb5EOH/GY2vTx6j2PSnt2su9w1hVs2t3tjGPN19yor9a5VgdGzTZgUDlP4Gozw+OvONVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDvvLr21; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174174; x=1746710174;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XNeckRnANZcfLQNUQ8Z5GX84AOZZtK3YH+F5AxvIfmQ=;
  b=iDvvLr21cD0nDvGDK7Ccpx5EDkAZ0y0gJK8zkxhicsiUZLvNWWKJZqOg
   oB4NKz+TlvOsOj9zK9XHEJ9EjmNSfoEuxagZ74czcuqUnkdr4W27QE34z
   1vLmSrLIj6iA+jBed7pKFe2/vcNsNR4mdXz3pTOdH55v/7nIgxrgC3xQ6
   FIKwkD8H6oxZeI0XB89vzMFbe6LK2soyNLc/TPiluJmjt7X/fjVUTzewv
   PVEL0niU/IALXjPJtYWeAB+vFDscxskkQeRLEbDXYVOktmZv6ZpveyiXo
   LD2xG2s2LhF9GuFtZZuzqEoziaLMp9Rz5/epnNSkJqHOUCxrFRM0NOSzw
   Q==;
X-CSE-ConnectionGUID: vH4wXSX0SnytZMSfExtWlA==
X-CSE-MsgGUID: MKIfV/w4T96zPh6uQQfpPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413239"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:13 -0700
X-CSE-ConnectionGUID: k1L20U8iT+SrjOlDKwEB5A==
X-CSE-MsgGUID: hl5X9CpDQOm8ex+CqCP06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356774"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:12 -0700
Message-ID: <1e98935e-e35a-49e0-bbbf-ff326d40b581@linux.intel.com>
Date: Tue, 7 May 2024 16:20:26 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> If a PCM device is already in use, the check will return an error to
> userspace notifying that the stream is currently busy.  This ensures that
> only one path is using the USB substream.

What was the point of having a "USB Mixer" then?

