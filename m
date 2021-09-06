Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E76B401DC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 17:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242960AbhIFPvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 11:51:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39929 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242248AbhIFPvL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 11:51:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630943406; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+EJw87u3VrcDLuHUv/GxuAklamXxAsR9kAqaJTr6SFU=;
 b=YZHpRhOVBZtdNGuk2ovoQjPnePFFGwru6ylJyysuzFTLBIbdSGqtnD3B8ozdXBWr7XP4jgvt
 gdmt7mL20apemloR+dqBUp+E8ulFsHEbMhP4FoYUrIqYQ7T8VyRKAFBOvfhN1NW7+TQXvlCr
 lvuBhYl2h25R/xIVhvVLO6AcROQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 613638a61567234b8c292c16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 15:49:58
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2299BC43616; Mon,  6 Sep 2021 15:49:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79313C4338F;
        Mon,  6 Sep 2021 15:49:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 06 Sep 2021 21:19:57 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add IPQ8074 family ID-s
In-Reply-To: <20210905171131.660885-1-robimarko@gmail.com>
References: <20210905171131.660885-1-robimarko@gmail.com>
Message-ID: <2c26a5c1302813f5343cb0fd5c192267@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-05 22:41, Robert Marko wrote:
> IPQ8074 family SoC ID-s are missing, so lets add them based on
> the downstream driver.
> 

Did you intentionally left out the IDs for below variants?

IPQ8172 - 397
IPQ8173 - 398
IPQ8174 - 399

Reviewed-by: Kathiravan T <kathirav@codeaurora.org>

> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 9faf48302f4b..288897868435 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -281,19 +281,31 @@ static const struct soc_id soc_id[] = {
>  	{ 319, "APQ8098" },
>  	{ 321, "SDM845" },
>  	{ 322, "MDM9206" },
> +	{ 323, "IPQ8074" },
>  	{ 324, "SDA660" },
>  	{ 325, "SDM658" },
>  	{ 326, "SDA658" },
>  	{ 327, "SDA630" },
>  	{ 338, "SDM450" },
>  	{ 341, "SDA845" },
> +	{ 342, "IPQ8072" },
> +	{ 343, "IPQ8076" },
> +	{ 344, "IPQ8078" },
>  	{ 345, "SDM636" },
>  	{ 346, "SDA636" },
>  	{ 349, "SDM632" },
>  	{ 350, "SDA632" },
>  	{ 351, "SDA450" },
>  	{ 356, "SM8250" },
> +	{ 375, "IPQ8070" },
> +	{ 376, "IPQ8071" },
> +	{ 389, "IPQ8072A" },
> +	{ 390, "IPQ8074A" },
> +	{ 391, "IPQ8076A" },
> +	{ 392, "IPQ8078A" },
>  	{ 394, "SM6125" },
> +	{ 395, "IPQ8070A" },
> +	{ 396, "IPQ8071A" },
>  	{ 402, "IPQ6018" },
>  	{ 403, "IPQ6028" },
>  	{ 421, "IPQ6000" },

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
