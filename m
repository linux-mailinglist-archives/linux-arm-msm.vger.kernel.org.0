Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A622623026C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 08:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgG1GMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 02:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgG1GMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 02:12:30 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2C7C0619D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:12:30 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so4018704plz.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FTEn6vC4TzDFRYgBbBTvo3anpjXgbfxoEfVzcA7SkSk=;
        b=MUg3NliKoM4l5YHCqj5bM6/ricxHDSN+fUGuIqDe/VZsMi11o6T2ZWNrRmiGKK5bXn
         dLZvVFi/IzR3WXetg3BP7uU3fBwXJssdNdgivnfmBA7cBYg+K5O4ADsLf8uOtjMgwCmW
         BHVtqNd36wdDmGMHvhmLxiLOiWxKlF+4EXujG3fIufA2TNNIHe5Nz+L91MFOKPFXIVKl
         SQJdZRQBhdKoCi1prMQzl3mdc4RBqCnSLm8j77reyUikupG/akrM9Siwn4HHjKS03a5W
         7YnQPphP5IXd+BRNyHBQC9v7DGBNN9AcgsvqcnvlqDDqrmOCT3LpU7oErJhyYlMdKGUO
         gTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FTEn6vC4TzDFRYgBbBTvo3anpjXgbfxoEfVzcA7SkSk=;
        b=aweNqjRyCqE6AK86LZnlUIxrewFEKF4TOPd1JbrtVlgI2pNvbpo4ntj3FdwWTKVm6g
         /6yN8Wxx36cZxZBnma+uXlU7CB0GC0wrObHqDnMIVSYNSWuMo3uDmgmzJovUuIFdhWb4
         4Vf2fV4QOqGEut2C/c1LHVo3/gZ0jq2LRQZryOliE/Rd5Wth0GgZ4JPxLE3QTim0THR9
         8r1A6frAnytR9jjLxmzBBbbZOaixy0I/LrCnrJxbrOV6JpM5SBITFK8Dt7f2yVpZCNpx
         vh+EzOceRzPiamZNXXtWvgfzZzKOss/f1qyAKwpDxdoMw9sOyC1QG+jQez9zyHe52XNb
         dCeQ==
X-Gm-Message-State: AOAM5318Bds/Xz8IAlj+ZPJiW7Gr1U9ShocjQvv0uwB35B8xnbyi9Glv
        7FdEezy1A+B/54fS9g7a08DHUQ==
X-Google-Smtp-Source: ABdhPJy3fY7LAadwN1KhzxnyyGUckPuRZaBmAV2u3CSU6/2WJqNnkEDPuCSPRvntmZyPct9tGqDxrQ==
X-Received: by 2002:a17:902:7484:: with SMTP id h4mr7663521pll.139.1595916750072;
        Mon, 27 Jul 2020 23:12:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b22sm1545548pju.26.2020.07.27.23.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:12:29 -0700 (PDT)
Date:   Mon, 27 Jul 2020 23:08:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     rishabhb@codeaurora.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org, stable@vger.kernel.org
Subject: Re: [RESEND v1] soc: qcom: pdr: Reorder the PD state indication ack
Message-ID: <20200728060857.GB202429@builder.lan>
References: <20200701195954.9007-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701195954.9007-1-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Jul 12:59 PDT 2020, Sibi Sankar wrote:

> The Protection Domains (PD) have a mechanism to keep its resources
> enabled until the PD down indication is acked. Reorder the PD state
> indication ack so that clients get to release the relevant resources
> before the PD goes down.
> 
> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> Reported-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> I couldn't find the previous patch on patchworks. Resending the patch
> since it would need to land on stable trees as well
> 
>  drivers/soc/qcom/pdr_interface.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> index a90d707da6894..088dc99f77f3f 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -279,13 +279,15 @@ static void pdr_indack_work(struct work_struct *work)
>  
>  	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
>  		pds = ind->pds;
> -		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
>  
>  		mutex_lock(&pdr->status_lock);
>  		pds->state = ind->curr_state;
>  		pdr->status(pds->state, pds->service_path, pdr->priv);
>  		mutex_unlock(&pdr->status_lock);
>  
> +		/* Ack the indication after clients release the PD resources */
> +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
> +
>  		mutex_lock(&pdr->list_lock);
>  		list_del(&ind->node);
>  		mutex_unlock(&pdr->list_lock);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
