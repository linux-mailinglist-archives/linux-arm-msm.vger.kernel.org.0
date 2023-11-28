Return-Path: <linux-arm-msm+bounces-2303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A347FC0A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 18:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F716282895
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D2539AFC;
	Tue, 28 Nov 2023 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+3okfD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC962C1;
	Tue, 28 Nov 2023 09:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194041; x=1732730041;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ChXBVBqsS5xdsQgc7KH0fBuDsClye8kOccQk8AVBPTw=;
  b=M+3okfD4QsWlMOq0Gs5bGvspqg7k3grNVXenKtWTszf+IVbT3DfIF5wR
   CYOJ7QE1m2uBHA/6uN8YyhXLLnGEoZNlIBu1k83h3S6ghbFHjOocHu+Vk
   qvkt+vyXlo+Yy0bpjPuBZdSNh4z4Lj4PrHWVsue3RH/sRgsHoO+Uh2MAb
   L/nRk3miSEGRx0LrBsg0p+gJ8pQ5+5aGysEKZVFxZjW6JV+tNKrY0/nX7
   9Xb0gcpCt1xRt7jbCGBjaVJqx04WxNH1r1OEusMDX/Z/N2YI6Ux2isJOl
   x6+RFHDp65kvXXktHZkQ1ajwTGZdJ+5NGKlz22hPyy+oKU/+y6vvk5EFc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127108"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424127108"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715335"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834715335"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208]) ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:59 -0800
Message-ID: <56b8175d-ce80-44b5-a738-22a0802e520f@linux.intel.com>
Date: Tue, 28 Nov 2023 11:47:27 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: Move Soundwire runtime stream alloc to
 soundcards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
 <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/23 10:56, Krzysztof Kozlowski wrote:
> Currently the Qualcomm Soundwire controller in its DAI startup op
> allocates the Soundwire stream runtime.  This works fine for existing
> designs, but has limitations for stream runtimes with multiple
> controllers, like upcoming Qualcomm X1E80100 SoC with four WSA8840
> speakers on two Soundwire controllers.
> 
> When two Soundwire controllers are added to sound card codecs, Soundwire
> startup() is called twice, one for each Soundwire controller, and second
> execution overwrites what was set before.  During shutdown() this causes
> double free.
> 
> It is expected to have only one Soundwire stream runtime, thus it should
> be allocated from SoC soundcard context startup(), not from each
> Soundwire startup().  Such way will properly handle both cases: one and
> two Soundwire controllers in the stream runtime.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is an entirely different approach than my previous try here:
> https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


