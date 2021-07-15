Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4453C9D01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 12:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241544AbhGOKnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 06:43:49 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42997 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbhGOKnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 06:43:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626345656; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MZWD24LnFgYePZssjjSAp5vYoK/AphJUtVon+awuc+k=;
 b=dLHtXhOLW+n5xCgWmdGNKs4VglGbs2Z/gQrnIuoQ9bwBSgrt/Iqn911Yycxv7OesWNhY+abc
 R77rfSR+mo3k2SDt+vONRJXswD0Bcfpj1W5zVW5doaIJAMQ+rDMWqrx0V3KynWSQLwLb5eP/
 lehRRA695HliG7kpx2GrTcEadbw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f010a3290ea35ee6b126b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Jul 2021 10:40:35
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5ED4FC4338A; Thu, 15 Jul 2021 10:40:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E216C433D3;
        Thu, 15 Jul 2021 10:40:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Jul 2021 16:10:33 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
In-Reply-To: <20210703005416.2668319-2-bjorn.andersson@linaro.org>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
Message-ID: <2864bbbda8fcf62b3092fe918e7f377f@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-03 06:24, Bjorn Andersson wrote:
> rpmhpd_aggregate_corner() takes a corner as parameter, but in
> rpmhpd_power_off() the code requests the level of the first corner
> instead.
> 
> In all (known) current cases the first corner has level 0, so this
> change should be a nop, but in case that there's a power domain with a
> non-zero lowest level this makes sure that rpmhpd_power_off() actually
> requests the lowest level - which is the closest to "power off" we can
> get.
> 
> While touching the code, also skip the unnecessary zero-initialization
> of "ret".
> 
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Tested-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  drivers/soc/qcom/rpmhpd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 2daa17ba54a3..fa209b479ab3 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct
> generic_pm_domain *domain)
>  static int rpmhpd_power_off(struct generic_pm_domain *domain)
>  {
>  	struct rpmhpd *pd = domain_to_rpmhpd(domain);
> -	int ret = 0;
> +	int ret;
> 
>  	mutex_lock(&rpmhpd_lock);
> 
> -	ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
> -
> +	ret = rpmhpd_aggregate_corner(pd, 0);
>  	if (!ret)
>  		pd->enabled = false;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
