Return-Path: <linux-arm-msm+bounces-22453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E590560C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 17:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EAC1F21C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F0617F504;
	Wed, 12 Jun 2024 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGgBAM1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5517F4F9;
	Wed, 12 Jun 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204395; cv=none; b=M+rQiTg7udEZDSmKiwhXWrjLlRZDKTWY0Owlr6SlTuWN9EI43L2Pjj8bT4dElg+5UlQBiT/2W8kVRQusp0mcpMo/uTU/MLrXL5k4aU1E3T3g6W6DYt7vBUbf9uCNqSLzGIIZMgcvKVmv4jWx4JHkq/Hh9zx7tMyHLLstioTZrgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204395; c=relaxed/simple;
	bh=ClXfKtrObNYFGJH3nO4MkQnRpdoJTRqan1XfI/UCRmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZCNyD3YmVXhsULi5lLGfan/sFT5NivtKvt6RWT0Pwoz7i+m52gtnlT1OrO/OeS/BOKzEbyy6CCHGS8RC5mqu+LBCAxI0J8dqydRIY/blI6LvZzHJB6sI2tdiHgtGTpXHKFEzjHrEcqcm6msBY+f6sy4RjtmVB0AcMVVlsv9Ix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGgBAM1K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718204394; x=1749740394;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ClXfKtrObNYFGJH3nO4MkQnRpdoJTRqan1XfI/UCRmQ=;
  b=WGgBAM1KGSABw5nU+48YRz4JkUvsszlwO++Gg6smvO+zM1JRju8NdE7V
   +AnfphSmzna+rLoKI9ckaNV0ZXraMrei+Jj8Rb/5zu2D9JMXf9/IZgAZu
   YJEVFjDpxN4Awo5T+X7QyWTpmzkXJHAC7Oc9kb2hfwc/aq1otTlI493gl
   xnvT6i714HM5iTfvsjS463lpjqEZYs5HPv4gXwDCKpnB7tP8HPBlPj59r
   Uyr93YzqHQt3P8v/ZAc/+SiFW9+imOKfShgYFhnE9x5VKibTkpxVz3+1e
   bBzHrEAc9SMfjxZjgZK81A7H7HJgpZjBYZzMqWzOH2UdB35I9rQM7VRAU
   A==;
X-CSE-ConnectionGUID: wLJMRod/TfeyL19UeHZS4g==
X-CSE-MsgGUID: 8qUZB+4BR1C6L/Y1p6uz+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25551549"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25551549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:59:54 -0700
X-CSE-ConnectionGUID: 841aPa7dSOKPs3kKUGyVwg==
X-CSE-MsgGUID: +1nNoP70T1e7w8bmaCZ8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44938104"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO [10.245.246.56]) ([10.245.246.56])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:59:48 -0700
Message-ID: <fabc7ac8-6c44-4395-bd16-59257a949e9b@linux.intel.com>
Date: Wed, 12 Jun 2024 16:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
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
 <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/12/24 16:50, Amadeusz Sławiński wrote:
> On 6/11/2024 1:57 AM, Wesley Cheng wrote:
> 
>> Wesley Cheng (32):
>>    ASoC: Add SOC USB APIs for adding an USB backend
>>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>>    ASoC: qdsp6: q6afe: Increase APR timeout
>>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>>    ALSA: usb-audio: Export USB SND APIs for modules
>>    ALSA: usb-audio: Save UAC sample size information
>>    usb: dwc3: Specify maximum number of XHCI interrupters
>>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>>    ALSA: usb-audio: qcom: Add USB QMI definitions
>>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>>    ALSA: usb-audio: Check for support for requested audio format
>>    ASoC: usb: Add PCM format check API for USB backend
>>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>>    ALSA: usb-audio: Prevent starting of audio stream if in use
>>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>>    ASoC: Introduce SND kcontrols to track USB offloading state
>>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>>    ASoC: usb: Create SOC USB SND jack kcontrol
>>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>>    ASoC: usb: Fetch ASoC sound card information
>>    ALSA: usb-audio: Add USB offloading capable kcontrol
>>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>>    ASoC: usb: Rediscover USB SND devices on USB port add
>>    ASoC: doc: Add documentation for SOC USB
> 
> I'm not sure how other reviewers feel about this, but is there any
> chance to group patches in some logical order? It is bit hard to review
> when I need to jump from generic ALSA to ASoC then QCOM code and then
> there are dt-bindings mixed in between and back again.

Completely agree. And splitting the 32 patches in smaller sets would
help as well, every time I want to review I just don't have the time to
go through 32 heavy-duty patches across USB/ALSA/ASoC.

