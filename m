Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE63E21A466
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 18:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgGIQJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 12:09:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41271 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgGIQJW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 12:09:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594310961; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eN0Ptdq7+QlqubS6nSPF3ikVU7xlsp4fhiaPh3+zthY=;
 b=i7LROHHwV2NJXNLz81CGxQkadEoCgolpvJsGPLJl0rPonTGsorr7DPWiQlCBW86FID2phKjw
 ksDLuuJ/HDp1wpQrrWnzbgPOVPYHK/lUN5rc131x9FPAdmbI6R491irtHwWUhhbEYK4Ih2TT
 YhBmOjSPJjwkfh8uTa8O6rJDxsQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f07411fa19992ac650bacf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 16:09:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1D23C433CA; Thu,  9 Jul 2020 16:09:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55EB4C433C6;
        Thu,  9 Jul 2020 16:09:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Jul 2020 09:09:02 -0700
From:   rishabhb@codeaurora.org
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org, stable@vger.kernel.org
Subject: Re: [RESEND v1] soc: qcom: pdr: Reorder the PD state indication ack
In-Reply-To: <20200701195954.9007-1-sibis@codeaurora.org>
References: <20200701195954.9007-1-sibis@codeaurora.org>
Message-ID: <777353d20205e8a2a997d9807a5cf7b6@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-01 12:59, Sibi Sankar wrote:
> The Protection Domains (PD) have a mechanism to keep its resources
> enabled until the PD down indication is acked. Reorder the PD state
> indication ack so that clients get to release the relevant resources
> before the PD goes down.
> 
> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart 
> helpers")
> Reported-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> I couldn't find the previous patch on patchworks. Resending the patch
> since it would need to land on stable trees as well
> 
>  drivers/soc/qcom/pdr_interface.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c 
> b/drivers/soc/qcom/pdr_interface.c
> index a90d707da6894..088dc99f77f3f 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -279,13 +279,15 @@ static void pdr_indack_work(struct work_struct 
> *work)
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

Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

Thanks,
Rishabh
