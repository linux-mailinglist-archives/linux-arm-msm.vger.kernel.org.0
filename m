Return-Path: <linux-arm-msm+bounces-19503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B188BFE87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 15:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 352D01F26987
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 13:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02414127E10;
	Wed,  8 May 2024 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlph6Sg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7F9127B51;
	Wed,  8 May 2024 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174186; cv=none; b=phkBPIkMemMHFD6QmORlV9V2RK98wcCakW7t3OKtCwdqCi1OgdJs5ZG4p7PeyUzFsdm5gEVQZ6UPGG7Grb+BqG0p3shVL49aBuTGmGiVlb1aeoawfp6o2kN0BaGN3aWHE8n4UMM5fnMgPg3qAtj5ZTJH+hnnLZQYHsjTgIyxPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174186; c=relaxed/simple;
	bh=lifN/agSpUEsjctyCIsr+TXeYS3JFwPNhUXnrldJp2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XggsCwjNsxDMjkAhDi4BOu6+wpQF6vkA24/cNKXesw8+M30Vu80X0SA+UxwF50igkdc0j9pvs0C9xp+duhvQ9QTwHF/mB2/6FVGICAEsHYB2BFaww0PsIFa0ztDP/Y1dnsBI6V8wxenWDPik8T3ryUR7hKHJqZzrGt3VeSN1gWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlph6Sg7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174185; x=1746710185;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lifN/agSpUEsjctyCIsr+TXeYS3JFwPNhUXnrldJp2g=;
  b=jlph6Sg7wvCAWnkRk6GZs/GsDRfn/bt6yYSVKyWihpQ6D0feTNAuyAE1
   WtLdQZKYX74EjkMV+YsyDzQzY6JZSF/O6l4iWKec5jNDlZ5N+nZBIzdmE
   WKzDc6e5c8G55Xob3mgi2kyHYMMV7rOfPHuOrEHo2D3aKn4Oa/W9SVB01
   x4ncDVOStr+GwZD4SLdwfO9qXcRuvsUG4fl2ZGbFtIqhfcwC9JyCivj9g
   7myWpMA9icScj1UMmCmSCBKr7cHqDiiiN6U/ApSh4Jz5GJHof7KFAyJAl
   fXYQ4mz9qQ8seg3MO8S8UQ+ye6ZC6dWjr6hTuLb7mWZerrLqEEbwAdNXo
   A==;
X-CSE-ConnectionGUID: /s6aE+taTAGQDby/i+SzLQ==
X-CSE-MsgGUID: EwnX3h3fSjGIrOyAOtODBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413329"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36413329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:25 -0700
X-CSE-ConnectionGUID: bsu1eEYFR6+cMJK2ATzrUg==
X-CSE-MsgGUID: w3/raNdzSdGFMemhzhWL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33356862"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115]) ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:16:23 -0700
Message-ID: <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
Date: Tue, 7 May 2024 16:40:42 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-39-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/24 14:51, Wesley Cheng wrote:
> For userspace to know about certain capabilities of the current platform
> card, add tags to the components string that it can use to enable support
> for that audio path.  In case of USB offloading, the "usboffldplybk: 1" tag

usboffloadplayback?

same question as before, do we need spaces?

And if we have controls, why do we need component strings? The component
string is not dynamic to the best of my knowledge, this could be
problematic if the card is no longer capable of supporting this stream,
while a control can be updated at will.


