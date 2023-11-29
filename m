Return-Path: <linux-arm-msm+bounces-2562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A47FDF95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 19:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3966B20E66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 18:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39668347AC;
	Wed, 29 Nov 2023 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRCEbeLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1519A1B4;
	Wed, 29 Nov 2023 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701283545; x=1732819545;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cKJeFNkIQAf+/tiMMgC+hJ3Nk+Hnaj6HJWSuL5lnedo=;
  b=jRCEbeLwuepAT3ho4szAd9g+6HYrPSUxEr+U6jLv4+DfNuNtHPq6IwLw
   OYQY7VKtgb/fOY9YhM0Zl5GahCfQD/XyvyRqk1X+QKIirurcKy8+wn+E4
   sHiLLcfQKuUuSXo2ayKb+o0vXUFk11DSx+q6qrid0e1f67LOOv8fJ5Wif
   pa9Uk7oaeEu9MGlUVBfAIlIrwEp6V2BLfB7ko074ItTxfpLXG4sqsZDIS
   VlrCT4vUCflzMkfQlq/4WZDrkRkHNxudxzKmp5eZXDs9v0opS9wDqsDAd
   7bN0e5dSSJyi0IGoIhDTxWj/sFg0uFZBGDK1tm3iq65zz04e7fwBv6EAl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383602809"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="383602809"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942421675"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="942421675"
Received: from caw1-mobl1.amr.corp.intel.com (HELO [10.255.229.136]) ([10.255.229.136])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 10:45:43 -0800
Message-ID: <3d36d707-86f7-44fe-a613-64e264bb53cd@linux.intel.com>
Date: Wed, 29 Nov 2023 11:07:20 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: allow multi-link on newer devices
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
References: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
 <e43db38a-206d-4ea5-8813-23e1f918dd65@linux.intel.com>
 <ab0fc6e0-a358-42e7-92e5-77ceea53a546@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ab0fc6e0-a358-42e7-92e5-77ceea53a546@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/29/23 10:43, Krzysztof Kozlowski wrote:
> On 28/11/2023 16:35, Pierre-Louis Bossart wrote:
>>>  static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>>>  						    struct sdw_msg *msg)
>>>  {
>>> @@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>>>  };
>>>  
>>>  static const struct sdw_master_ops qcom_swrm_ops = {
>>> +	.read_prop = qcom_swrm_read_prop,
>>
>> nit-pick: read_prop() literally means "read platform properties".
>>
>> The functionality implemented in this callback looks more like an
>> initialization done in a probe, no?
> 
> Yes, but multi_link is being set by sdw_bus_master_add() just before
> calling read_prop(). It looks a bit odd, because "bus" comes from the
> caller and is probably zero-ed already. Therefore I assumed the code did
> it on purpose - ignored multi_link set before sdw_bus_master_add(),

On the Intel side, there's a bit of luck here.

The caller intel_link_probe() does not set the multi-link property, but
it's set in intel_link_startup() *AFTER* reading the properties - but we
don't have any properties related to multi-link, only the ability to
discard specific links.

>>>  	.xfer_msg = qcom_swrm_xfer_msg,
>>>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>>>  	.post_bank_switch = qcom_swrm_post_bank_switch,
>>> @@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>>>  
>>>  	mutex_lock(&ctrl->port_lock);
>>>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>>
>> just realizing this now, are you sure the 'port_lock' is the proper
>> means to protecting the stream->master_list? I don't see this used
>> anywhere else in stream.c. I think you need to use bus_lock.
> 
> This is from ctrl, internal driver structure:
> 
> struct qcom_swrm_ctrl *ctrl

My point what that all other instances where list_for_each_entry() is
used on stream->master list rely on the bus_lock.

You may be fine in this specific case with a QCOM-specific lock, not
sure if there's any risk. At any rate that is not introduced by this
patch, so for now

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

