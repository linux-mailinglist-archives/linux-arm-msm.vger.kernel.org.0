Return-Path: <linux-arm-msm+bounces-27701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59050944788
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA4D1F272B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA6016F8E7;
	Thu,  1 Aug 2024 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZ4wP0Fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D8916EB54;
	Thu,  1 Aug 2024 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503516; cv=none; b=UIXhwMMJ5BBZU6z0kyaa/cxHeqAk4yosMzHuJUAS6PuOA8xyXRAiK9DTGMETFiBiLgFYo8DszMOiITNmPhpKyVkRDu9LsT0csBab4eTZ6rSuZ+3K0Vv16s8XurSrGXxL+NqnURj2sD4O9JEQlYnYbfk8QUVWLL1w4DLloR2Eb0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503516; c=relaxed/simple;
	bh=bWXEw8TFjsKa/Hb4/Eb5rG16j7U/8Z24Kda92N1MJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQX+GiaYsGObg4COBU+B65/A37k0cGi8TkC/AueGvNLimyA6tiYEkk8MQ7l706bCnaIxFIBIlMEqzsZrb0N0wN0kpXMkXxxQQhjVPnhP7VAjpoF2a0OkShq7uKhDqyen3MVWqo2hxC3TY0FKG1qLlLEC6XapZ7a4u3xiCUYipH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZ4wP0Fa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503515; x=1754039515;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bWXEw8TFjsKa/Hb4/Eb5rG16j7U/8Z24Kda92N1MJ4I=;
  b=XZ4wP0FaKD5reUwjC6TZKxcatdSha69HUEBb2bdXNzAxDRB+wg0Cqnzh
   8D1xVAegpOe9T1L+r0SApD9rI20/oS1IapsnqortRGhU3WHm2UQKwP3lt
   x/b9tivoMHcFnTuwsKeyAynRziTCbgqkbMBrancZluCzog7JNOehc8RJ7
   VDSF5fIVqrg+UjReDsnfs37QygoJbvYQaZ77Ka30fkqRDgTc12K3mmhWm
   T3iaoHk/PQEv+FDZDL8BcTsBiEmnerLJ6Sac3zuCChn657JbO4Lmc73LN
   mFV9XYkSlPRvoaqhPBG1iqr9ivm+Jg1pUDAYH9CZy8b/Kl+Tl0bpCihd8
   Q==;
X-CSE-ConnectionGUID: RiYsEug7SjW+ViCl7F3biQ==
X-CSE-MsgGUID: pu1B2tb+Ra2RgRJ+UN6gJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383378"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20383378"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:10:59 -0700
X-CSE-ConnectionGUID: wD2mZchpQ2uK+zw06fP8TQ==
X-CSE-MsgGUID: 2y4A7VElRRC8qWG3k+0cRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59089784"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220]) ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:10:53 -0700
Message-ID: <f70b6f65-fd8f-4d2c-ba41-fa814d0b5154@linux.intel.com>
Date: Thu, 1 Aug 2024 11:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/34] Introduce QC USB SND audio offloading support
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/24 03:16, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.

I find this update a lot easier to review than previous versions, thanks
for this. That said, there are still quite a few confusing parts in the
documentation and implementation - specifically the get_offload_dev()
stuff makes sense at a high-level but the details can be improved a
great deal.

It's encouraging though, there aren't any major conceptual issues IMHO,
it shouldn't be too hard to make the patches clearer/cleaner.


