Return-Path: <linux-arm-msm+bounces-31355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E13D1971EA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E79C1F24812
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF3413C9CA;
	Mon,  9 Sep 2024 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsqarH1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52975137764;
	Mon,  9 Sep 2024 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725897798; cv=none; b=cln13Htf20UBc1+LPc6mGRd8A0yesDlOMSbr6Mf+6K3KkWe37Cd0YzN6hQjGdQKiQ5jAK8PfwG7vGajjflSuoQ0BtCj9kfNK+o/NClLez5DdwHWn4P21w0zbyq9eLmRzovHmQyX4cVEoW4snhJi2AoI1sc3OyUnO5W/WqmmglWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725897798; c=relaxed/simple;
	bh=PDO5Q2PW0U8Dl37qialTE5Jq9umZ1RqHzT6t9eTX7oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQvgpeGhxedH0bAYx1v39r3FeMmH44y8xda56ArwJDxqP6bOluTNh6CEe0+S8RsiZnI+DqJ5stdCoqev9BVnpFzNuh1EKoYRuKz5lyLJuk4/tNix4vHsvTwaUdeNp366LVDOGTGJiR87XfLODIG7+aYRzQtJhyDw7a81XaxBsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsqarH1A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725897797; x=1757433797;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PDO5Q2PW0U8Dl37qialTE5Jq9umZ1RqHzT6t9eTX7oo=;
  b=IsqarH1AiA0v80uPh/ukCv6UyAKxWWLh9pMQusQS2CqoiAv4YrK3wOfH
   kcrV3g4SAZhao8f1Z1SQJ2k30ZYsp5P4LnpUGEEs75x4hvrwX0+Bu3bYX
   JMR2XLpLNe2QMM0GYvSRsfkJewaFMEGFX7RmcfmeZrUTSZ40sd9X/YGQV
   K9KcfotabpaiJ0fVJHvYb95Q7tXxAbQoYB31LOqoO0viBb+SvSR2wDUJE
   siZOp/f8TyVJcMwFwEyNMmrWfwekSWtG74o7od1FKY0vkJ2kKM/kh8fHe
   BxVGhxbEiVVQ2GnIcfzH55tOHYN+EdfPMqlP1VHgq616k73PdW1bgPnoM
   g==;
X-CSE-ConnectionGUID: 3J2ZnHQLTB+cKgum4AwDDg==
X-CSE-MsgGUID: cjT9vLx7TUe3vktr4G/Mog==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35747373"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35747373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:03:16 -0700
X-CSE-ConnectionGUID: Wbp3KqQkREOjxTGxEV3hFw==
X-CSE-MsgGUID: LO4DXqsKSbOOvbpNnTj+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67456255"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.241]) ([10.245.246.241])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:03:12 -0700
Message-ID: <d6625b2e-c926-478b-b3bf-5e241270da62@linux.intel.com>
Date: Mon, 9 Sep 2024 18:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com, kernel@quicinc.com, quic_pkumpatl@quicinc.com
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/24 12:55, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> This patch series will resolve channel mask mismatch between master and slave.
> 
> Scenario: wcd937x AMIC2 usecase
> 
>                           Master                 Slave (wcd937x)
>                      +--------------+           +--------------+
>                      |  +--------+  |           |  +--------+  |
>          AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
>          AMIC2 ----->|  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>          AMIC3 ----->|  +--------+  |           |  +--------+  |
>                      |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
>                      |  |        |  |           |  |        |  |<-----------AMIC3
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
>                      |  |        |  |           |  |        |  |<-----------MBHC
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
>                      |  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      +------------- +           +--------------+
> 
> For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
> for Master required PORT1 with channel mask 2,
> 
> In existing design master and slave configured with same channel mask, it will fail
> AMIC2 usecase.
> 
> The New design will help to configure channel mapping between master and slave from
> device tree.

That's rather controversial...

In theory you already have the means to deal with a different channel
mapping in the hw_params callback for your manager and peripheral
devices. That's how we e.g. send a 2ch stream on the manager to two
separate amplifiers and program which channel is used by what amplifier.

The common part between manager and peripheral is the notion of
'stream', and you can add a different port/stream configuration for
manager and peripheral with sdw_stream_add_master() and
sdw_stream_add_slave() respectively.

Port1 and TX2 can be used by just setting the relevant port_config.num
value.

Likewise the port_config.ch_mask can be programmed at will to select the
relevant mappings. See e.g. rt1308_sdw_hw_params() in rt1308-sdw.c, the
mapping were handled with a set_tdm_slot() callback before.

In short, please re-visit your hw_params() implementation first and use
the existing 'stream' APIs.

