Return-Path: <linux-arm-msm+bounces-2707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC57FEF32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 13:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74FB61C20B29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 12:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B4647A42;
	Thu, 30 Nov 2023 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8587C10DE;
	Thu, 30 Nov 2023 04:36:41 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B0CD1042;
	Thu, 30 Nov 2023 04:37:27 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA393F5A1;
	Thu, 30 Nov 2023 04:36:39 -0800 (PST)
Date: Thu, 30 Nov 2023 12:36:36 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-kernel@lists.infradead.org, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Fix null pointer dereference
 during fastchannel init
Message-ID: <ZWiB1ATQF4dAxUHj@pluto>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129065748.19871-2-quic_sibis@quicinc.com>

On Wed, Nov 29, 2023 at 12:27:46PM +0530, Sibi Sankar wrote:
> The scmi_perf_domain_lookup requires the protocol handle to have the
> private data set, which is yet to happen during the fastchannel init
> scenario. This results in a null pointer dereference. Fix this by using
> the pre-populated perf_dom_info to pass on the required information
> instead.
> 
> Call trace:
> scmi_perf_protocol_init+0x434/0x678
> scmi_get_protocol_instance+0x168/0x29c
> scmi_devres_protocol_instance_get+0x50/0xa0
> scmi_devm_protocol_get+0x20/0x50
> scmi_cpufreq_probe+0x34/0xd4
> scmi_dev_probe+0x28/0x3c
> really_probe+0x148/0x2ac
> __driver_probe_device+0x78/0x12c
> driver_probe_device+0x40/0x160
> __device_attach_driver+0xb8/0x134
> bus_for_each_drv+0x80/0xdc
> __device_attach+0xa8/0x1b0
> device_initial_probe+0x14/0x20
> bus_probe_device+0xa8/0xac
> device_add+0x5cc/0x778
> device_register+0x20/0x30
> __scmi_device_create.part.0+0xec/0x1cc
> scmi_device_create+0x180/0x1c4
> scmi_create_protocol_devices+0x4c/0xb0
> scmi_probe+0x660/0x738
> platform_probe+0x68/0xdc
> really_probe+0x148/0x2ac
> __driver_probe_device+0x78/0x12c
> driver_probe_device+0x40/0x160
> __device_attach_driver+0xb8/0x134
> bus_for_each_drv+0x80/0xdc
> __device_attach+0xa8/0x1b0
> device_initial_probe+0x14/0x20
> bus_probe_device+0xa8/0xac
> deferred_probe_work_func+0x88/0xc0
> process_one_work+0x13c/0x264
> worker_thread+0x32c/0x438
> kthread+0x118/0x11c
> ret_from_fork+0x10/0x20
> 
> Fixes: 619bc6e034f3 ("firmware: arm_scmi: Populate fastchannel info only if set operations are allowed")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Yes indeed, I made this same error in the past and then I missed it when
reviewing the offending patch :< ...

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

>  drivers/firmware/arm_scmi/perf.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index d1323c5d9c27..a648521e04a3 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -759,40 +759,35 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
>  }
>  
>  static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
> -				     u32 domain, struct scmi_fc_info **p_fc)
> +				     struct perf_dom_info *dom)
>  {
>  	struct scmi_fc_info *fc;
> -	struct perf_dom_info *dom;
> -
> -	dom = scmi_perf_domain_lookup(ph, domain);
> -	if (IS_ERR(dom))
> -		return;
>  
>  	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
>  	if (!fc)
>  		return;
>  
>  	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
> -				   PERF_LEVEL_GET, 4, domain,
> +				   PERF_LEVEL_GET, 4, dom->id,
>  				   &fc[PERF_FC_LEVEL].get_addr, NULL);
>  
>  	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
> -				   PERF_LIMITS_GET, 8, domain,
> +				   PERF_LIMITS_GET, 8, dom->id,
>  				   &fc[PERF_FC_LIMIT].get_addr, NULL);
>  
>  	if (dom->info.set_perf)
>  		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
> -					   PERF_LEVEL_SET, 4, domain,
> +					   PERF_LEVEL_SET, 4, dom->id,
>  					   &fc[PERF_FC_LEVEL].set_addr,
>  					   &fc[PERF_FC_LEVEL].set_db);
>  
>  	if (dom->set_limits)
>  		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
> -					   PERF_LIMITS_SET, 8, domain,
> +					   PERF_LIMITS_SET, 8, dom->id,
>  					   &fc[PERF_FC_LIMIT].set_addr,
>  					   &fc[PERF_FC_LIMIT].set_db);
>  
> -	*p_fc = fc;
> +	dom->fc_info = fc;
>  }
>  
>  static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
> @@ -1102,7 +1097,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
>  		scmi_perf_describe_levels_get(ph, dom, version);
>  
>  		if (dom->perf_fastchannels)
> -			scmi_perf_domain_init_fc(ph, dom->id, &dom->fc_info);
> +			scmi_perf_domain_init_fc(ph, dom);
>  	}
>  
>  	ret = devm_add_action_or_reset(ph->dev, scmi_perf_xa_destroy, pinfo);
> -- 
> 2.17.1
> 

