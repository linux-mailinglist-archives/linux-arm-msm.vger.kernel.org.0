Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AA53C817B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 11:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbhGNJ0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 05:26:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53188 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238463AbhGNJ0H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 05:26:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626254596; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PYhTm1oU9gXWfNpxNyiWJSeNsaqi/RZ1KyE0TF1OG+w=; b=j689kVKf9FgTFrFR1WVU0U02UrOKaZuOjIZouwL/77wE700HRby6L7Hg43VdsFq4tz/cIUue
 3CnVEk5vAqcNuK5F5KlMkUZA5MmRUljvSgCC+4NzBN6c039MW3xf/uYdvmxW37Ocz2nbLCNn
 9V9K0McjPA/YaaJzr6Copg4KtK0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60eeacec1d1afe585e0be234 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Jul 2021 09:22:52
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A771C43143; Wed, 14 Jul 2021 09:22:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.50.2.235] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00757C4338A;
        Wed, 14 Jul 2021 09:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00757C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually
 enable the domain
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <f3b61133-12d0-ba9d-e294-0dc019a9178f@codeaurora.org>
Date:   Wed, 14 Jul 2021 14:52:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/3/2021 8:24 AM, Bjorn Andersson wrote:
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performace state
> is needed further requests has to be made.
> 
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
> 
> But the corner is never initialized, so a typical request to simply
> enable the power domain would not actually turn on the hardware. Further
> more, when no more clients vote for a performance state (i.e. the
> aggregated vote is 0) the power domain would be turn off.
> 
> Fix both of these issues by always voting for a corner with non-zero
> value, when the power domain is enabled.
> 
> The tracking of the lowest non-zero corner is performed to handle the
> corner case if there's ever a domain with a non-zero lowest corner, in
> which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
> would be allowed to use this lowest corner.
> 
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Did some testing on sc7180 and sc7280 devices, no regressions seen,
Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
Tested-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
> 
> Resending because the hunk in rpmhpd_update_level_mapping() was left in the
> index.
> 
>   drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index fa209b479ab3..76ea6b053ef0 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -30,6 +30,7 @@
>    * @active_only:	True if it represents an Active only peer
>    * @corner:		current corner
>    * @active_corner:	current active corner
> + * @enable_corner:	lowest non-zero corner
>    * @level:		An array of level (vlvl) to corner (hlvl) mappings
>    *			derived from cmd-db
>    * @level_count:	Number of levels supported by the power domain. max
> @@ -47,6 +48,7 @@ struct rpmhpd {
>   	const bool	active_only;
>   	unsigned int	corner;
>   	unsigned int	active_corner;
> +	unsigned int	enable_corner;
>   	u32		level[RPMH_ARC_MAX_LEVELS];
>   	size_t		level_count;
>   	bool		enabled;
> @@ -385,13 +387,13 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
>   static int rpmhpd_power_on(struct generic_pm_domain *domain)
>   {
>   	struct rpmhpd *pd = domain_to_rpmhpd(domain);
> -	int ret = 0;
> +	unsigned int corner;
> +	int ret;
>   
>   	mutex_lock(&rpmhpd_lock);
>   
> -	if (pd->corner)
> -		ret = rpmhpd_aggregate_corner(pd, pd->corner);
> -
> +	corner = max(pd->corner, pd->enable_corner);
> +	ret = rpmhpd_aggregate_corner(pd, corner);
>   	if (!ret)
>   		pd->enabled = true;
>   
> @@ -436,6 +438,10 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
>   		i--;
>   
>   	if (pd->enabled) {
> +		/* Ensure that the domain isn't turn off */
> +		if (i < pd->enable_corner)
> +			i = pd->enable_corner;
> +
>   		ret = rpmhpd_aggregate_corner(pd, i);
>   		if (ret)
>   			goto out;
> @@ -472,6 +478,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
>   	for (i = 0; i < rpmhpd->level_count; i++) {
>   		rpmhpd->level[i] = buf[i];
>   
> +		/* Remember the first non-zero corner */
> +		if (!rpmhpd->enable_corner)
> +			rpmhpd->enable_corner = i;
> +
>   		/*
>   		 * The AUX data may be zero padded.  These 0 valued entries at
>   		 * the end of the map must be ignored.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
