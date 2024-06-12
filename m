Return-Path: <linux-arm-msm+bounces-22449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCEE9055B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C88528B013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700AC17F36D;
	Wed, 12 Jun 2024 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ludUtzU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D791DFC6;
	Wed, 12 Jun 2024 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203812; cv=none; b=jrD3kCMYf0S6sOy7lVh3fxVYGqMshJBsGW1KNAwMn8Z+Bb2GIAf7In2eBLcDzzqXUUHs0dVqTVD3FNLNPipOTzXf6tNDI98R7KHZmA/pQEMHL1Fx5RkVd2xthtab6rah207yWZSddtL3x4JWD1SbFneqlLyTuUE3ke09egFMC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203812; c=relaxed/simple;
	bh=A3ALZuSC7JFA7FKUWJ7dtEFKaiBbbWF3EU24yn8PEOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3EnbwRBWyUicWBoImu5Kf4AujSwNxEM98bvPUl3zhhLB3xa72i44MzMfa2tdpNWdGfWe1EEgbQm81JYDwGxCbk2OUj95/eF+s1xtTSCpmu9NzQS1SctRPqImEuruhkM+Zgr0NdRbGtWa9VlNu5/yr81ImOsQJRSJCaNaP18sPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ludUtzU7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718203811; x=1749739811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A3ALZuSC7JFA7FKUWJ7dtEFKaiBbbWF3EU24yn8PEOM=;
  b=ludUtzU7LmTO+kSNJthOdS/BQde4iLc2wy8s+ObKl4kOgNgWqkoZFsZb
   c8rLZFYEsIbq1bWB9uhOCDG5VS6ZYxiNrXeuNZRwcNPkQbIVsmmN9Y2OO
   DgyA4JrgZWWnGRq7oHfX0UC94v79AV1VAqR6vTlExzrcbgUaernowYvek
   u8mfqetKQMso/YxM6OznL77FvO0rIHvhWmAAB/tnca2QDhoHq1UzLnpbK
   WPlut+tjhu5j/xkc6pNGJQTlBnSID1MwB72n1l9NdRcdt95OPEwPsQXwN
   9k1fWiOUwWhmU/Yd+kIK3sf3iYfIbm0zCOnkUpc7heNJPimpM5pgOc06t
   g==;
X-CSE-ConnectionGUID: wIze13QBTKmuKkcdNb4mOQ==
X-CSE-MsgGUID: krqLjsqNQrWDuIXnA7J2mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25603908"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25603908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:50:09 -0700
X-CSE-ConnectionGUID: sIB8IIaFR/u7dDoKj/j2Iw==
X-CSE-MsgGUID: V8mahd+5QBSIdsk5KEyVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="39925635"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:50:04 -0700
Message-ID: <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Date: Wed, 12 Jun 2024 16:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240610235808.22173-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/2024 1:57 AM, Wesley Cheng wrote:

> Wesley Cheng (32):
>    ASoC: Add SOC USB APIs for adding an USB backend
>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>    ASoC: qdsp6: q6afe: Increase APR timeout
>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>    ALSA: usb-audio: Export USB SND APIs for modules
>    ALSA: usb-audio: Save UAC sample size information
>    usb: dwc3: Specify maximum number of XHCI interrupters
>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>    ALSA: usb-audio: qcom: Add USB QMI definitions
>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>    ALSA: usb-audio: Check for support for requested audio format
>    ASoC: usb: Add PCM format check API for USB backend
>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>    ALSA: usb-audio: Prevent starting of audio stream if in use
>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>    ASoC: Introduce SND kcontrols to track USB offloading state
>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>    ASoC: usb: Create SOC USB SND jack kcontrol
>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>    ASoC: usb: Fetch ASoC sound card information
>    ALSA: usb-audio: Add USB offloading capable kcontrol
>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>    ASoC: usb: Rediscover USB SND devices on USB port add
>    ASoC: doc: Add documentation for SOC USB

I'm not sure how other reviewers feel about this, but is there any 
chance to group patches in some logical order? It is bit hard to review 
when I need to jump from generic ALSA to ASoC then QCOM code and then 
there are dt-bindings mixed in between and back again.

