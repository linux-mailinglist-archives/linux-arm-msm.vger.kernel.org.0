Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B19382A15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 12:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236466AbhEQKsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 06:48:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58342 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbhEQKsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 06:48:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621248404; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=S+IAPGtnvFdKL7NINP3s9LC8QnyhhrGllYhIK1ILdyE=;
 b=G1QrcZ3/zBdESyJdBTwK8c8tFCdWV+tzvb9jpb+UMJLwCpZxjt1vmVzHoYDsoYQvNj/x3yU2
 cXGNyfqAjXMB8sR2QFgdW0gN9nqth2YiBgF/A6ur0hRf3ESUaZ6FQK5nbydXK8lLwLReKn6L
 okHyxaB0rb4v9LEnHYcciIQtz/M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60a24990b15734c8f93d72ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 10:46:40
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56F70C4338A; Mon, 17 May 2021 10:46:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A154C433D3;
        Mon, 17 May 2021 10:46:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 May 2021 16:16:38 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add remaining IPQ6018 family ID-s
In-Reply-To: <20210504114826.64376-1-robert.marko@sartura.hr>
References: <20210504114826.64376-1-robert.marko@sartura.hr>
Message-ID: <0870f5c7cadf86d102747ec4f3d1b77e@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-04 17:18, Robert Marko wrote:
> ID for IPQ6018 was previously added, but ID-s for rest of the
> family are missing.
> So, lets add those based on downstream driver.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Kathiravan T <kathirav@codeaurora.org>

Nit: May be you can add the IPQ6005(453) variant as well? or you want to 
add it later on need basis?

> ---
>  drivers/soc/qcom/socinfo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index f6cfb79338f0..28bbc7a9227e 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -255,6 +255,9 @@ static const struct soc_id soc_id[] = {
>  	{ 351, "SDA450" },
>  	{ 356, "SM8250" },
>  	{ 402, "IPQ6018" },
> +	{ 403, "IPQ6028" },
> +	{ 421, "IPQ6000" },
> +	{ 422, "IPQ6010" },
>  	{ 425, "SC7180" },
>  	{ 455, "QRB5165" },
>  };

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
