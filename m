Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056EB3EA581
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 15:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237666AbhHLNWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 09:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237682AbhHLNVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 09:21:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9073CC00EA9E
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 06:21:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id n6so10492335ljp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yjZ/rfFZv9yz218MWmQe0cfR6IJjiAXfYaqScy1hjno=;
        b=rDTzdG/m/QTa4eJgPkUCeC5RJseS2Zz/fq9jOKWkTMSYWZhDlp5ftM4xgBhvpZg2qX
         594bbYnY1UsoTYoLNbrTbeUCw+cl89ayOYwTIYijQzIfmc3SoMmE9/WIUHN4iPAONAGD
         WYhlVfjb7/6K5yHjV4TwHnSksm2/Rn5b0znQVgt9rBdm6RELohCx6lvsZFtbgI8vd3GW
         AVRZFaMmEP1phjpu04/2tqIDUxsMiX+ymd4RMngkSj1j+o3g0w3ygP/qM7Qv/6z6XH72
         kIWDM6aThkLQMmFMGGJzISorgAKe+NhB5JmF+iB1aphytoo61l92ekbVL2uJw+vMCk3l
         MW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yjZ/rfFZv9yz218MWmQe0cfR6IJjiAXfYaqScy1hjno=;
        b=Ogr9yituKGS2ZHUUhGoZQFElaMPKLvukyh/MTipRIf2tOASh/+iPrbjxtqkAqXRQFL
         Gwwoj6qtGMGxQ+BaTtK+xHWESP0xAZazFvhcIhUdhaS8dCkc9jf8q4kly2+qRpnLVl+t
         rYBHWk6CZv9HbDxmtn7DyYT/lpjCCC9WkSXEuTWRq8ur6lOATILAUGkTynl4ervXx4zg
         g7x7z7kbI+b6y7J5vLKgB2GOhP7PdMSvUVtLyDDZW0TBYTaVnIsMwPP5LRO4qqlCnrpi
         EY0w282OX8jJ/HN07j42LnpW21diEzGE8LnvNJzn3aggL/wD5BpTPrIBl7RFRWf5Vx7g
         P+aQ==
X-Gm-Message-State: AOAM530ew9b/1Wg4nCFplRwQHVNnPF4ukcwpUbGKNtZXnciyKlYkzYrq
        47jvaiighcbv8vQ8VUsNXgsUnA==
X-Google-Smtp-Source: ABdhPJwD6ODMBgPaE5cXR1FoZjeCM22LtEudadyrDARL5mQ4ObYER8CTLSU8NPChYE4bmb94Mr+dBQ==
X-Received: by 2002:a2e:a4d5:: with SMTP id p21mr2934156ljm.214.1628774468960;
        Thu, 12 Aug 2021 06:21:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c10sm262390lfb.136.2021.08.12.06.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 06:21:08 -0700 (PDT)
Subject: Re: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually
 enable the domain
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <45bfb6ae-d131-10d7-1924-48c98a957667@linaro.org>
Date:   Thu, 12 Aug 2021 16:21:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2021 05:54, Bjorn Andersson wrote:
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
> ---
> 
> Resending because the hunk in rpmhpd_update_level_mapping() was left in the
> index.

So, colleagues, what is the fate of this patch? Is it going to be 
applied? Or we agree that current approach (power_on + 
set_performance_state) is the expected behaviour? My patches on gdsc 
rework depend on this patch, but I can rework in them in favour of 
required-opp approach.

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
With best wishes
Dmitry
