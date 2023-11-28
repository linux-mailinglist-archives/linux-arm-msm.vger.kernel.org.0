Return-Path: <linux-arm-msm+bounces-2301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952367FC0A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 18:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F02328284D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907839AC5;
	Tue, 28 Nov 2023 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNsE2E77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5FBC1;
	Tue, 28 Nov 2023 09:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194038; x=1732730038;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qIrihs3bgqghpQQf+Q4tySVJ/cFlr64il/GtOmU5bi4=;
  b=TNsE2E77M5FDyCbLjfVI1DNVJ0+jqKpcG6ru5Pr7fH9wXcivn6KTXhE+
   2xCoKafdfTc29fXzAnPwKXBDYXFWy0+3tfuz9w1OlasnpgwS92oko39JY
   Qep33jsFzwqUgEj/AxZBhVVGDQbe8gTV0J0bLt0SnXzNV/EmZ0MVhj7Hq
   V8sGe0P5TFVbJg6glR5FTqgJ5Bz2zeVxvWGYXpYbiHTZ+bNBxJHdnvMq+
   flFwU2siDZrRL/w7Fb7bskdSzuvHBg2NRbbL/97jIKoSLX4sRNTCp9Ti0
   wVyRF8pDQMBt3CiCrsCVEmC8xu8D7R7JtPiGlHXNOvU0iEUpiJiEwP9/H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127085"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424127085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715306"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834715306"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208]) ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:53:56 -0800
Message-ID: <e43db38a-206d-4ea5-8813-23e1f918dd65@linux.intel.com>
Date: Tue, 28 Nov 2023 09:35:56 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/23 09:00, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> over two Soundwire controllers, thus they need a multi-link Soundwire
> stream runtime.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is an entirely different approach than my previous try here:
> https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
> ---
>  drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 412b8e663a0a..57943724f0eb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -920,6 +920,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int qcom_swrm_read_prop(struct sdw_bus *bus)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +
> +	if (ctrl->version >= SWRM_VERSION_2_0_0) {
> +		bus->multi_link = true;
> +		bus->hw_sync_min_links = 3;
> +	}
> +
> +	return 0;
> +}
> +
>  static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>  						    struct sdw_msg *msg)
>  {
> @@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>  };
>  
>  static const struct sdw_master_ops qcom_swrm_ops = {
> +	.read_prop = qcom_swrm_read_prop,

nit-pick: read_prop() literally means "read platform properties".

The functionality implemented in this callback looks more like an
initialization done in a probe, no?

>  	.xfer_msg = qcom_swrm_xfer_msg,
>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>  	.post_bank_switch = qcom_swrm_post_bank_switch,
> @@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  
>  	mutex_lock(&ctrl->port_lock);
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {

just realizing this now, are you sure the 'port_lock' is the proper
means to protecting the stream->master_list? I don't see this used
anywhere else in stream.c. I think you need to use bus_lock.


> +		/*
> +		 * For streams with multiple masters:
> +		 * Allocate ports only for devices connected to this master.
> +		 * Such devices will have ports allocated by their own master
> +		 * and its qcom_swrm_stream_alloc_ports() call.
> +		 */
> +		if (ctrl->bus.id != m_rt->bus->id)
> +			continue;
> +
>  		if (m_rt->direction == SDW_DATA_DIR_RX) {
>  			maxport = ctrl->num_dout_ports;
>  			port_mask = &ctrl->dout_port_mask;

