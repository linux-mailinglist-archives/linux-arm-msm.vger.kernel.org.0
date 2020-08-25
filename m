Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F8C251325
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 09:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbgHYH1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 03:27:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:44823 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729209AbgHYH1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 03:27:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598340469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nNXetVg3KEE34vdvnS3apACl8DjxRrs1XckEjwwmuAU=;
 b=Jkb/Ya3rUxLLBWGSbE6Twbrgq6klm9IiscR2nkKE3/SZLNFzNREI/MmxNdbuj11Dy8YNHilo
 rVxWAoD/dXO3Nyh7YOHLKFBF52fengKOFIOXkc41xeehQQAAoQBaM8DyQHWIjGdpiFQ7XWVm
 BKvXobvROKtGURL3YclcNswuwqk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f44bd75e20f098d46c5ee41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 07:27:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0063DC43395; Tue, 25 Aug 2020 07:27:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53881C433CA;
        Tue, 25 Aug 2020 07:27:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 25 Aug 2020 12:57:47 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     trix@redhat.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: initialize local variable
In-Reply-To: <20200819184637.15648-1-trix@redhat.com>
References: <20200819184637.15648-1-trix@redhat.com>
Message-ID: <6cfe9537e007bb74a481a4caba2a4123@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-20 00:16, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this problem
> 
> pdr_interface.c:596:6: warning: Branch condition evaluates
>   to a garbage value
>         if (!req.service_path[0])
>             ^~~~~~~~~~~~~~~~~~~~
> 
> This check that req.service_path was set in an earlier loop.
> However req is a stack variable and its initial value
> is undefined.
> 
> So initialize req to 0.
> 
> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart 
> helpers")
> 

Tom,
Thanks for the patch.

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soc/qcom/pdr_interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c 
> b/drivers/soc/qcom/pdr_interface.c
> index 088dc99f77f3..f63135c09667 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -569,7 +569,7 @@ EXPORT_SYMBOL(pdr_add_lookup);
>  int pdr_restart_pd(struct pdr_handle *pdr, struct pdr_service *pds)
>  {
>  	struct servreg_restart_pd_resp resp;
> -	struct servreg_restart_pd_req req;
> +	struct servreg_restart_pd_req req = { 0 };
>  	struct sockaddr_qrtr addr;
>  	struct pdr_service *tmp;
>  	struct qmi_txn txn;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
