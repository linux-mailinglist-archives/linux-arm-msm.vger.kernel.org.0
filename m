Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E422881AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 07:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbgJIF0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 01:26:32 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:17044 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730449AbgJIF0c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 01:26:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602221191; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Dm1gQgqm5mk4Lj3wkil3hGGUs9hIPNbWzWiJXJQXouU=; b=ILViN/kcT8IyGuwx4vXoOYkhqO6AftY2uS1saoX4Onm1W2f8c3GSB7drUmY5zZmPvyKK1QVA
 FYD/B+Wfbjyceki96S7KAmTBmVs74MuUWCGj51H/0m3OXcjjtsYrXrRYTt8s12OU55OM8Xky
 Npjgj2wTl2/aXcEkE6NfTH2sbXM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7ff4874f8cc67c31061363 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 05:26:31
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC1F4C43382; Fri,  9 Oct 2020 05:26:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [47.9.88.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 313B4C433FE;
        Fri,  9 Oct 2020 05:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 313B4C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
To:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-6-caleb@connolly.tech>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <bf04cb91-5b2a-c30e-ac85-0437b2aaad23@codeaurora.org>
Date:   Fri, 9 Oct 2020 10:56:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201007174736.292968-6-caleb@connolly.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/7/2020 11:19 PM, Caleb Connolly wrote:
> The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
> is used for i2c, so disable it.
>
> https://patchwork.kernel.org/patch/11133827

Reviewed-by: Akash Asthana <akashast@codeaurora.org>

> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dead5db3315a..50a0674a6553 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -358,7 +358,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	struct geni_se *se = &gi2c->se;
>   	size_t len = msg->len;
>   
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>   
>   	if (dma_buf)
> @@ -400,7 +401,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	struct geni_se *se = &gi2c->se;
>   	size_t len = msg->len;
>   
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>   
>   	if (dma_buf)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

