Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF58435DFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 11:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUJcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 05:32:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41840 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231433AbhJUJcv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 05:32:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634808635; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gYHDDnb+FOinBLe6dwLyYFBnyP+NpR5ChpHgZs9ofaY=; b=gqLOHEjICrqPmd8XVHi/moZqAeMn89/bgo3PrN98hjPRtc4SkLvAtPt/7zGxOGgwV6szit7B
 6cCabQ0i6M/1pMXAe03aDL3wPT1x6RNfqmxUWIQF0u9FwuUYlIb04l6PDFmtMfySIuo+bAbS
 /NqFg4Ag+nI3ND+oHJuTlZnR+58=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6171332767f107c611ae19d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 09:30:15
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6EC3C43618; Thu, 21 Oct 2021 09:30:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [27.61.145.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 601F6C43617;
        Thu, 21 Oct 2021 09:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 601F6C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add fixed sleep stats offset for
 older RPM firmwares
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211018110803.32777-1-stephan@gerhold.net>
 <20211018110803.32777-3-stephan@gerhold.net>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <fa0aa97a-9501-bfcd-34c7-108d19e4693f@codeaurora.org>
Date:   Thu, 21 Oct 2021 15:00:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018110803.32777-3-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 10/18/2021 4:38 PM, Stephan Gerhold wrote:
> Not all RPM firmware versions have the dynamic sleep stats offset
> available. Older versions use a fixed offset of 0xdba0.
> 
> Add support for this using a new qcom,rpm-legacy-stats compatible
> that can be used for older SoCs like MSM8916.
> 
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>   drivers/soc/qcom/qcom_stats.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 817505bd99b5..67728de718fd 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
>   	.subsystem_stats_in_smem = false,
>   };
>   
> +/* Older RPM firmwares have the stats at a fixed offset instead */
> +static const struct stats_config rpm_legacy_data = {
> +	.stats_offset = 0xdba0,
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +	.dynamic_offset = false,
> +	.subsystem_stats_in_smem = false,
> +};
> +
>   static const struct stats_config rpmh_data = {
>   	.stats_offset = 0x48,
>   	.num_records = 3,
> @@ -247,6 +256,7 @@ static const struct stats_config rpmh_data = {
>   
>   static const struct of_device_id qcom_stats_table[] = {
>   	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
> +	{ .compatible = "qcom,rpm-legacy-stats", .data = &rpm_legacy_data },
>   	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
>   	{ }
>   };
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
