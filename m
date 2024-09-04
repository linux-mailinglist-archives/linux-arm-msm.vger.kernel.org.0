Return-Path: <linux-arm-msm+bounces-30736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B930296BF75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719EE2896D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4701DA62C;
	Wed,  4 Sep 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDUQ4CUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C8F1EBFF7;
	Wed,  4 Sep 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458436; cv=none; b=oiAnZIn4idaURWtq5/4ZvELyd+vCxkYiHBAHXZeYyzszVUTxpFpoI+ob2hFhajTvxxdIGY3nY2RhTIRZPCq5Qp0S4ctnYenXyGMst9HpAwb6UyxKhQmXUyMP93SJdJc108LCVFKsL9QvYx7GP41NHC6w9qtHwNFawKzbWnahCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458436; c=relaxed/simple;
	bh=+CRW9fHTwyqsG6tpJpit9cPLag/L22KmuBUVPJ2c5tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtG316+Q31o3a5G+hG80fT6BON+0zhoq0Y8w0q2SypcC7eiTJUwIGIKopcimnHQP6jXAgDcHz89fKwJZ/UQOpnXx+y4E00aYFitkEhgFPZ6yDBKUaHm8pW1n26SgGRrEzJb6+qQkAyCz63jbRanv3SqD7mVWZMFJCsCUpJm0Vfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDUQ4CUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D94C4CEC2;
	Wed,  4 Sep 2024 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725458435;
	bh=+CRW9fHTwyqsG6tpJpit9cPLag/L22KmuBUVPJ2c5tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDUQ4CUCPJas5ehnPA45NkpU2iGhaJXOuvBqXUfs1BVya+C6ei3seJ37JjFPVWpzO
	 8fNNuLxgvQrHAsWGCZSRvu5A0WZAYISi/bGFgS6RJQvhL2zGUqkvd61X3XSM/+jdVq
	 zO11l1AxUwPL5rkXTdlrrBfWJhcgfHg0PR+CEvSR/RDt685TGaqWxEU/qJtbRN15eB
	 n9S56a/OW86ihmyAwFemHTIbuHo5DuzwgHUY+RKjnh2N3aqeFamoZ9e2NZJsiKCDHg
	 ma7jtF5axJ3v3jP2LwRyH0Oe2GpF8g8XHQ3sTr81npvovgsCD1VJ5rlSSreR7YJ72F
	 UvFtLBC7/qqZg==
Message-ID: <edb46e4c-d768-4d11-85f4-27a90ef69c18@kernel.org>
Date: Wed, 4 Sep 2024 16:00:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
To: Konrad Dybcio <konradybcio@kernel.org>,
 Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 johan@kernel.org
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <84adb06f-20f0-4e3d-9a6e-43e4b0d1b5ab@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <84adb06f-20f0-4e3d-9a6e-43e4b0d1b5ab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 3:56 PM, Konrad Dybcio wrote:
> On 4.09.2024 5:13 AM, Sibi Sankar wrote:
>> Ensure that the bad duplicates reported by the platform firmware doesn't
>> get added to the opp-tables.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>  drivers/firmware/arm_scmi/perf.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
>> index 2d77b5f40ca7..114c3dd70ede 100644
>> --- a/drivers/firmware/arm_scmi/perf.c
>> +++ b/drivers/firmware/arm_scmi/perf.c
>> @@ -386,9 +386,11 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
>>  		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
>>  
>>  	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
>> -	if (ret)
>> +	if (ret) {
>>  		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>>  			 opp->perf, dom->info.name, ret);
>> +		opp->perf = 0;
>> +	}
>>  }
>>  
>>  static inline void
>> @@ -404,9 +406,12 @@ process_response_opp_v4(struct device *dev, struct perf_dom_info *dom,
>>  		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
>>  
>>  	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
>> -	if (ret)
>> +	if (ret) {
>>  		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>>  			 opp->perf, dom->info.name, ret);
>> +		opp->perf = 0;
>> +		return;
>> +	}
>>  
>>  	/* Note that PERF v4 reports always five 32-bit words */
>>  	opp->indicative_freq = le32_to_cpu(r->opp[loop_idx].indicative_freq);
>> @@ -871,6 +876,10 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
>>  		else
>>  			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
>>  
>> +		/* Skip all invalid frequencies reported by the firmware */
>> +		if (!freq)
>> +			continue;
> 
> Maybe something like this instead? (not tested)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 2d77b5f40ca7..530692119c79 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -431,8 +431,14 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
>  {
>         struct scmi_opp *opp;
>         struct scmi_perf_ipriv *p = priv;
> +       unsigned int idx = st->desc_index + st->loop_idx;
> +
> +       opp = &p->perf_dom->opp[idx];
> +
> +       /* Avoid duplicate entries coming from buggy firmware */
> +       if (idx > 0 && opp->perf && p->perf_dom->opp[idx - 1].perf)
> +               return 0;
>  
> -       opp = &p->perf_dom->opp[st->desc_index + st->loop_idx];
>         if (PROTOCOL_REV_MAJOR(p->version) <= 0x3)
>                 process_response_opp(ph->dev, p->perf_dom, opp, st->loop_idx,
>                                      response);

No that won't work, perf_dom->opp has all the entries and that's used
in e.g. scmi_dvfs_device_opps_add :/

Konrad

