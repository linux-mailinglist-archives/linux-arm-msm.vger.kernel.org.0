Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD073C9E7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 14:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhGOMTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 08:19:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36122 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbhGOMTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 08:19:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626351389; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NqFgpslk2ZytaLjLhoQfMGXxeRlmTVdttrtVGn8Aqpo=;
 b=R/T770O66kyfpAY2mpRs54uFo2ioUcsspwt6c6RcPA32JKQA3Gi3EWXLzrg8HGquOpFDE9XT
 IDPM6VtRCIPv8eHejmDIxVkACtEXu94bk2XGLqdg2sikba+LyjV9tQAwoDBFLZVr7oibdy8F
 m2wOlO2s/iHQFbVtlH9WgZbdgBY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f0270417c2b4047dec772e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Jul 2021 12:16:04
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92D2BC43217; Thu, 15 Jul 2021 12:16:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99CDDC433F1;
        Thu, 15 Jul 2021 12:16:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Jul 2021 17:46:02 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually
 enable the domain
In-Reply-To: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
References: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
Message-ID: <902f7665ab9045e87fb07f848b994316@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

Thanks for the patch.

On 2021-07-03 08:24, Bjorn Andersson wrote:
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performace state

s/performace/performance/

> is needed further requests has to be made.
> 
> But in contrast with other power-domain implementations (e.g. rpmpd) 
> the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
> 
> But the corner is never initialized, so a typical request to simply
> enable the power domain would not actually turn on the hardware. 
> Further
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
> ---
> 
> Resending because the hunk in rpmhpd_update_level_mapping() was left in 
> the
> index.
> 
>  drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index fa209b479ab3..76ea6b053ef0 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -30,6 +30,7 @@
>   * @active_only:	True if it represents an Active only peer
>   * @corner:		current corner
>   * @active_corner:	current active corner
> + * @enable_corner:	lowest non-zero corner
>   * @level:		An array of level (vlvl) to corner (hlvl) mappings
>   *			derived from cmd-db
>   * @level_count:	Number of levels supported by the power domain. max
> @@ -47,6 +48,7 @@ struct rpmhpd {
>  	const bool	active_only;
>  	unsigned int	corner;
>  	unsigned int	active_corner;
> +	unsigned int	enable_corner;
>  	u32		level[RPMH_ARC_MAX_LEVELS];
>  	size_t		level_count;
>  	bool		enabled;
> @@ -385,13 +387,13 @@ static int rpmhpd_aggregate_corner(struct rpmhpd
> *pd, unsigned int corner)
>  static int rpmhpd_power_on(struct generic_pm_domain *domain)
>  {
>  	struct rpmhpd *pd = domain_to_rpmhpd(domain);
> -	int ret = 0;
> +	unsigned int corner;
> +	int ret;
> 
>  	mutex_lock(&rpmhpd_lock);
> 
> -	if (pd->corner)
> -		ret = rpmhpd_aggregate_corner(pd, pd->corner);
> -
> +	corner = max(pd->corner, pd->enable_corner);
> +	ret = rpmhpd_aggregate_corner(pd, corner);
>  	if (!ret)
>  		pd->enabled = true;
> 
> @@ -436,6 +438,10 @@ static int rpmhpd_set_performance_state(struct
> generic_pm_domain *domain,
>  		i--;
> 
>  	if (pd->enabled) {
> +		/* Ensure that the domain isn't turn off */
> +		if (i < pd->enable_corner)
> +			i = pd->enable_corner;
> +
>  		ret = rpmhpd_aggregate_corner(pd, i);
>  		if (ret)
>  			goto out;
> @@ -472,6 +478,10 @@ static int rpmhpd_update_level_mapping(struct
> rpmhpd *rpmhpd)
>  	for (i = 0; i < rpmhpd->level_count; i++) {
>  		rpmhpd->level[i] = buf[i];
> 
> +		/* Remember the first non-zero corner */

Shouldn't we be tracking the corner that
corresponds to the first non-zero level
instead?

> +		if (!rpmhpd->enable_corner)
> +			rpmhpd->enable_corner = i;
> +
>  		/*
>  		 * The AUX data may be zero padded.  These 0 valued entries at
>  		 * the end of the map must be ignored.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
