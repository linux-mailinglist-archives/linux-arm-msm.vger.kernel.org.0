Return-Path: <linux-arm-msm+bounces-30735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DA96BF5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7ED2B2A1F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3091F1DB927;
	Wed,  4 Sep 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u11o0+f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDF1DB55E;
	Wed,  4 Sep 2024 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458226; cv=none; b=JOFItGdbHtA5yxu7fDaXgOHW10P5dnstwDlhWBVfO8XoF7OnPx3HMO0JEBkhrGj0lqWUoFaYatO6eIvThtyjKIY85HDvLiZLoyIxu8mc5qbDLrHVofmUnA9EnBhvTWf1eLxYgxnUWX3Z273D9ETTGO/p1t+kXpI8MQwQ3C5a3Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458226; c=relaxed/simple;
	bh=S8BOYJKLeSUjKhrIzHcSl/3wnnBKftTAfWhQ5hK+080=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcGYBzFK5pHhXCpPzz4xU8xGSo2W43WHxsTrJgdM3ncT1AUFCk3yPOlfhP5dEAP+AKE7lvfapum53md6iJD+z2fMeGNDdHwCPWe2JgbcH3TVw0PfqabMWak+MZ0jJ5/KYvXyND+GQMA6JdDfkFTx/mcngUvz9QUPjrX7lMAODho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u11o0+f9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3ACC4CEC2;
	Wed,  4 Sep 2024 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725458225;
	bh=S8BOYJKLeSUjKhrIzHcSl/3wnnBKftTAfWhQ5hK+080=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u11o0+f9M05QicsrK2ig5lPfZtDg2Mz0oJOIzm/xKPPBzFzrSHcpQx0HNF2Ziq+C9
	 pJNXZ08+Xum1upeMIXL+B+BNtBmp0SpbMAuE1dtQE+gkPMr95zxD1yXm51u6rI9k2S
	 kllFCE/fWGoFJLB4ZCBSbewnIC6NNWYPwGUbZT4O3I/Pqz04sY8G9gvWPkWDkM0Qsr
	 jgA82zYqoNUG1BgrQKviCADsk3JC0DWk7vm0dknOhJeopv1qU7Ic1GJvCsh9gBFj3I
	 l/3lr9QXuDF6JgOzxTdHgOwUTA4ANBcJoIeHgAvgRAva2JznzaTAoH1KuSUUbFfdsl
	 0TZlmzcR4yq2Q==
Message-ID: <84adb06f-20f0-4e3d-9a6e-43e4b0d1b5ab@kernel.org>
Date: Wed, 4 Sep 2024 15:56:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 johan@kernel.org, konradybcio@kernel.org
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904031324.2901114-3-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 5:13 AM, Sibi Sankar wrote:
> Ensure that the bad duplicates reported by the platform firmware doesn't
> get added to the opp-tables.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/perf.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 2d77b5f40ca7..114c3dd70ede 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -386,9 +386,11 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
>  		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
>  
>  	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
> -	if (ret)
> +	if (ret) {
>  		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>  			 opp->perf, dom->info.name, ret);
> +		opp->perf = 0;
> +	}
>  }
>  
>  static inline void
> @@ -404,9 +406,12 @@ process_response_opp_v4(struct device *dev, struct perf_dom_info *dom,
>  		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
>  
>  	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
> -	if (ret)
> +	if (ret) {
>  		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>  			 opp->perf, dom->info.name, ret);
> +		opp->perf = 0;
> +		return;
> +	}
>  
>  	/* Note that PERF v4 reports always five 32-bit words */
>  	opp->indicative_freq = le32_to_cpu(r->opp[loop_idx].indicative_freq);
> @@ -871,6 +876,10 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
>  		else
>  			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
>  
> +		/* Skip all invalid frequencies reported by the firmware */
> +		if (!freq)
> +			continue;

Maybe something like this instead? (not tested)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 2d77b5f40ca7..530692119c79 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -431,8 +431,14 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
 {
        struct scmi_opp *opp;
        struct scmi_perf_ipriv *p = priv;
+       unsigned int idx = st->desc_index + st->loop_idx;
+
+       opp = &p->perf_dom->opp[idx];
+
+       /* Avoid duplicate entries coming from buggy firmware */
+       if (idx > 0 && opp->perf && p->perf_dom->opp[idx - 1].perf)
+               return 0;
 
-       opp = &p->perf_dom->opp[st->desc_index + st->loop_idx];
        if (PROTOCOL_REV_MAJOR(p->version) <= 0x3)
                process_response_opp(ph->dev, p->perf_dom, opp, st->loop_idx,
                                     response);

Konrad

