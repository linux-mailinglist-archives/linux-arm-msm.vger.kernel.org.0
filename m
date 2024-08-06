Return-Path: <linux-arm-msm+bounces-28005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E79493E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 16:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9812CB254D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 14:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B6A2101A3;
	Tue,  6 Aug 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1gyXILH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9528210190;
	Tue,  6 Aug 2024 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955932; cv=none; b=eRvbce2f8iwakb24Q/K7eWh7V5oYmQQqpQfucMc9yHCuukCk1BXaTiWrOnpX485GNECTinUG2qC95LAKQZVCdfKkkeptWlXaL5smoQ3ZeCyUWnYcWT+jr50V+FoBi75z0A/jDT0cPAk4z27dKxbvuBola0I1Wpc6lZGdlFWl2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955932; c=relaxed/simple;
	bh=ulhVGtEPKBdoyHz0l9ezBsABeAF4IDtYxjCyDs4xjzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XviYqBpEJvm4l8ff3L2XWSic1RNMr2es3gMaBlFwZLiN6w9+Z2ocYCYG7qC1kC3OGq8mXHSPRAB1h2hMfA3Dt8KOS+5dE76TAcx+u0W4+4L9z8oFLnsca+RuCtcgyj3JbTX1XR0+op7+0hTV14luUA9ikIREV4YM+lxwpJvdz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1gyXILH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955931; x=1754491931;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ulhVGtEPKBdoyHz0l9ezBsABeAF4IDtYxjCyDs4xjzE=;
  b=J1gyXILH5Hy10QTy9+i/v3C0PFMbwIUuS7p57nJgtIY3aDySErih81eT
   upW9yEk+EFmh1PSBgibaBU0wfjhO34P3Tn6ijprxtG9iXhdk5529XTsbT
   /x4O/FXRWR4T4Nqsm3tCFybLyV6lzTGtGi4r0LO7qb+PtSrMNmy3q/J+1
   6VIdTdTiQPn36Wq0hva4xvy3711++wkukvqy1QjSrxp7Haroymc8M9Ary
   +3jU/kq7gCRHdCS6L/EYS+o7bEVPjQdBidBJNl2BOexVPjpa4IRy6ck1J
   y4GLJzFSFWdweqwoHP2q+04tUg+d5RaByRDlA/EE1ZWPVvWI5Mfyy8pLm
   g==;
X-CSE-ConnectionGUID: LLunlwrKQGuc4zUy7GuwDQ==
X-CSE-MsgGUID: mbhwuqlZRjW6sGIJMtR95w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21102049"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21102049"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:52:03 -0700
X-CSE-ConnectionGUID: cJPN9FP4TuWrzG0YHOubYw==
X-CSE-MsgGUID: Y9MkFWawRqaVopuvdK1S7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87476718"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:51:57 -0700
Message-ID: <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
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
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-24-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> With USB audio offloading, an audio session is started from the ASoC
> platform sound card and PCM devices.  Likewise, the USB SND path is still
> readily available for use, in case the non-offload path is desired.  In
> order to prevent the two entities from attempting to use the USB bus,
> introduce a flag that determines when either paths are in use.
> 

How can this happen? Can you provide some example with list of devices 
and which one should block the other? If I recall correctly devices are 
already exclusive unless you support substreams which ASoC does not at 
the moment.


