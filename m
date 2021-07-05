Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E703BB64F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 06:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhGEE3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 00:29:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48205 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhGEE3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 00:29:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625459215; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yYpTiZpf19JnYVEBEkARGtbnCGMAkVEzYr6TbDh/j14=; b=RrO/O1UjmEJ6ttr6Q06FUlImBw5FR+dprUNr0W6g/ur3PcC6r3pNu/LZGgjUp4i+wzk+Gx7T
 CjiVFag7bKK6vrEmuv4o9ZRRRe0mTCtrSga9xjbPI5cRSR5iLqXE9pjNBQyXg7+vamX4tvm3
 NXJT6xmrXS1MWd2iU8KKW4ZpM58=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60e28a0a2a2a9a976189fd32 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Jul 2021 04:26:50
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23A5CC4323A; Mon,  5 Jul 2021 04:26:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.201.203])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C12DC433D3;
        Mon,  5 Jul 2021 04:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C12DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <cacd1a1f-01c8-b913-23e5-538a772cd118@codeaurora.org>
Date:   Mon, 5 Jul 2021 09:56:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703005416.2668319-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/3/2021 6:24 AM, Bjorn Andersson wrote:
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
> ---
>   drivers/soc/qcom/rpmhpd.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 2daa17ba54a3..fa209b479ab3 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -403,12 +403,11 @@ static int rpmhpd_power_on(struct generic_pm_domain *domain)
>   static int rpmhpd_power_off(struct generic_pm_domain *domain)
>   {
>   	struct rpmhpd *pd = domain_to_rpmhpd(domain);
> -	int ret = 0;
> +	int ret;
>   
>   	mutex_lock(&rpmhpd_lock);
>   
> -	ret = rpmhpd_aggregate_corner(pd, pd->level[0]);
> -
> +	ret = rpmhpd_aggregate_corner(pd, 0);

This won't work for cases where pd->level[0] != 0, rpmh would just ignore this and keep the
resource at whatever corner it was previously at.
(unless command DB tells you a 0 is 'valid' for a resource, sending a 0 is a nop)
The right thing to do is to send in whatever command DB tells you is the lowest level that's valid,
which is pd->level[0].


>   	if (!ret)
>   		pd->enabled = false;
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
