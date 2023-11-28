Return-Path: <linux-arm-msm+bounces-2304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C347FC0A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 18:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8131EB21398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA98439AF4;
	Tue, 28 Nov 2023 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmmeJA66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB278AB;
	Tue, 28 Nov 2023 09:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194043; x=1732730043;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U7SHRv8kT+n7b9v0GPnWjN8fPXLgdna0HJB40XzjEaE=;
  b=XmmeJA668oj5wlrR1op3ftWM+hNrTkF9WzqLhxdGSVWje9J4vGobtQoE
   TTWIrPxMUuf9z7BHrUTd1fRtTY+fRDByVXYEuMcwCFjOZcCUP93AZ33Xw
   nGwzVSs7CAEMMgUocsMzNg6ag8m8lWq3NEQQHY5xSzAfsjgQnzXbI+kKt
   5a3NT8hUmuVPR3LHpf+2eQyHknIHKz4O6lrHwuE0gcLRQXVYBmZ0a4zYN
   /yLZc3rAcCRJsC0Pyf5tJEEupPaHLVm9iYk8EqBn8gPmtxYRl3XADJ0zX
   yF1ZgU6duAgCdMKEup3txbBB99KARLpBu4O07mzdIo8Dxykif12yHH2Qa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127120"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424127120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715363"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834715363"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208]) ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:54:01 -0800
Message-ID: <d3a2eb33-ea3e-43ac-a872-a7182404eee6@linux.intel.com>
Date: Tue, 28 Nov 2023 11:49:44 -0600
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
 <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
 <4317ec5d-8eb8-4a2f-aebc-cc04f2aba145@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4317ec5d-8eb8-4a2f-aebc-cc04f2aba145@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/23 10:59, Krzysztof Kozlowski wrote:
> On 28/11/2023 17:56, Krzysztof Kozlowski wrote:
>> Currently the Qualcomm Soundwire controller in its DAI startup op
>> allocates the Soundwire stream runtime.  This works fine for existing
>> designs, but has limitations for stream runtimes with multiple
>> controllers, like upcoming Qualcomm X1E80100 SoC with four WSA8840
>> speakers on two Soundwire controllers.
>>
>> When two Soundwire controllers are added to sound card codecs, Soundwire
>> startup() is called twice, one for each Soundwire controller, and second
>> execution overwrites what was set before.  During shutdown() this causes
>> double free.
>>
>> It is expected to have only one Soundwire stream runtime, thus it should
>> be allocated from SoC soundcard context startup(), not from each
>> Soundwire startup().  Such way will properly handle both cases: one and
>> two Soundwire controllers in the stream runtime.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This is an entirely different approach than my previous try here:
>> https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
> 
> ... and I forgot to thank you Pierre-Louis for patient explanation of
> the case in my previous try. Your review was much appreciated!

You're welcome. It's good if we have multiple platforms using the
'stream' concept in similar ways.

