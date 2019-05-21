Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D094D24E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEULjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 07:39:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfEULji (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 07:39:38 -0400
Received: from localhost (unknown [106.51.107.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 528C520862;
        Tue, 21 May 2019 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558438778;
        bh=ReFAdyWrKRD7BGj/7Cy0+dRZJceMz9zOiOfU+eJeyaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vx8LHB/5pSK8emSZW8au9utY1uOslIxXWXlYmw/rRUwtCJ3sOJa7rFKFksAoARXy9
         drVF3MhAjyk/dTAf7SvbppmuPgRcmF570wfSXQodW+Om2KCaYn7fr+g5fcf/A4AC62
         wZJxi25ZSIlodYbPj1s0Z2hD5Y/jZ+k0tIHU6X48=
Date:   Tue, 21 May 2019 17:09:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr
Subject: Re: [PATCH v4 1/9] soc: qcom: rpmpd: fixup rpmpd set performance
 state
Message-ID: <20190521113933.GJ15118@vkoul-mobl>
References: <20190513102015.26551-1-sibis@codeaurora.org>
 <20190513102015.26551-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513102015.26551-2-sibis@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-05-19, 15:50, Sibi Sankar wrote:
> Remoteproc q6v5-mss calls set_performace_state with INT_MAX on

s/performace/performance

> rpmpd. This is currently ignored since it is greater than the
> max supported state. Fixup rpmpd state to max if the required
> state is greater than all the supported states.
> 
> Fixes: 075d3db8d10d ("soc: qcom: rpmpd: Add support for get/set performance state")
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 005326050c23..235d01870dd8 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -226,7 +226,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
>  	struct rpmpd *pd = domain_to_rpmpd(domain);
>  
>  	if (state > MAX_RPMPD_STATE)
> -		goto out;
> +		state = MAX_RPMPD_STATE;
>  
>  	mutex_lock(&rpmpd_lock);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
