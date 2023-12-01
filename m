Return-Path: <linux-arm-msm+bounces-2919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE1801006
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358DA281085
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B344C608;
	Fri,  1 Dec 2023 16:24:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0FD1095;
	Fri,  1 Dec 2023 08:24:03 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC601007;
	Fri,  1 Dec 2023 08:24:49 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF1F3F6C4;
	Fri,  1 Dec 2023 08:24:01 -0800 (PST)
Date: Fri, 1 Dec 2023 16:23:58 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_mdtipton@quicinc.com, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com, Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix possible frequency
 truncation when using level indexing mode
Message-ID: <ZWoInq9QIuZXpTbc@pluto>
References: <20231130204343.503076-1-sudeep.holla@arm.com>
 <20231130204343.503076-2-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130204343.503076-2-sudeep.holla@arm.com>

On Thu, Nov 30, 2023 at 08:43:43PM +0000, Sudeep Holla wrote:
> The multiplier is already promoted to u64, however the frequency
> calculations done when using level indexing mode doesn't use the
> multiplier computed. It instead hardcodes the multiplier value of 1000
> at all the usage sites.
> 
> Clean that up by assigning the multiplier value of 1000 when using
> the perf level indexing mode and upadte the frequency calculations to

				   ^update

> use the multiplier instead. It should fix the possible frequency
> truncation for all the values greater than or equal to 4GHz.
> 
> Fixes: 31c7c1397a33 ("firmware: arm_scmi: Add v3.2 perf level indexing mode support")
> Reported-by: Sibi Sankar <quic_sibis@quicinc.com>
> Closes: https://lore.kernel.org/all/20231129065748.19871-3-quic_sibis@quicinc.com/
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Other than the typo, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

>  drivers/firmware/arm_scmi/perf.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 8ce449922e55..875dcb71bb65 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -268,7 +268,8 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
>  		dom_info->sustained_perf_level =
>  					le32_to_cpu(attr->sustained_perf_level);
>  		if (!dom_info->sustained_freq_khz ||
> -		    !dom_info->sustained_perf_level)
> +		    !dom_info->sustained_perf_level ||
> +		    dom_info->level_indexing_mode)
>  			/* CPUFreq converts to kHz, hence default 1000 */
>  			dom_info->mult_factor =	1000;
>  		else
> @@ -806,7 +807,7 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
>  		if (!dom->level_indexing_mode)
>  			freq = dom->opp[idx].perf * dom->mult_factor;
>  		else
> -			freq = dom->opp[idx].indicative_freq * 1000;
> +			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
> 
>  		data.level = dom->opp[idx].perf;
>  		data.freq = freq;
> @@ -853,7 +854,8 @@ static int scmi_dvfs_freq_set(const struct scmi_protocol_handle *ph, u32 domain,
>  	} else {
>  		struct scmi_opp *opp;
> 
> -		opp = LOOKUP_BY_FREQ(dom->opps_by_freq, freq / 1000);
> +		opp = LOOKUP_BY_FREQ(dom->opps_by_freq,
> +				     freq / dom->mult_factor);
>  		if (!opp)
>  			return -EIO;
> 
> @@ -887,7 +889,7 @@ static int scmi_dvfs_freq_get(const struct scmi_protocol_handle *ph, u32 domain,
>  		if (!opp)
>  			return -EIO;
> 
> -		*freq = opp->indicative_freq * 1000;
> +		*freq = opp->indicative_freq * dom->mult_factor;
>  	}
> 
>  	return ret;
> @@ -910,7 +912,7 @@ static int scmi_dvfs_est_power_get(const struct scmi_protocol_handle *ph,
>  		if (!dom->level_indexing_mode)
>  			opp_freq = opp->perf * dom->mult_factor;
>  		else
> -			opp_freq = opp->indicative_freq * 1000;
> +			opp_freq = opp->indicative_freq * dom->mult_factor;
> 
>  		if (opp_freq < *freq)
>  			continue;
> --
> 2.43.0
> 

