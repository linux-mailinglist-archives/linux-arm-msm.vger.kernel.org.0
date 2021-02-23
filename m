Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CC6323465
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 00:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbhBWXrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 18:47:33 -0500
Received: from z11.mailgun.us ([104.130.96.11]:31996 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233654AbhBWXj7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 18:39:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614123560; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yGLSBwHnyIykQ5h2PxlcYuvkg18nQYW34O01Qcy7Fxs=; b=PeC5aIB3d+WNmcIQ2C97NbbPc0ux5X7bBpsr6h0mA5FskmOpiaWo4sX+bU4aOr3MejOZFS/P
 j49P1I5N+onAd9s7tCufrmqC2TbMkXjxKd4691P52IOO4LXqu8tFUT7v50Zdc3FafrtdItzK
 KXz4/cmpDdUC6jLAF/HnOvoz3cs=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60359201090a774287980e87 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Feb 2021 23:38:41
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36812C43462; Tue, 23 Feb 2021 23:38:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57E42C433ED;
        Tue, 23 Feb 2021 23:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57E42C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 3/6] firmware: qcom_scm: Workaround lack of "is available"
 call on SC7180
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Douglas Anderson <dianders@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
 <20210223214539.1336155-4-swboyd@chromium.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <c7fd9642-7dcb-42bc-18e9-6fd86d8f5be8@codeaurora.org>
Date:   Tue, 23 Feb 2021 16:38:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223214539.1336155-4-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/23/2021 2:45 PM, Stephen Boyd wrote:
> Some SC7180 firmwares don't implement the QCOM_SCM_INFO_IS_CALL_AVAIL
> API, so we can't probe the calling convention. We detect the legacy
> calling convention on these firmwares, because the availability call
> always fails and legacy is the fallback. This leads to problems where
> the rmtfs driver fails to probe, because it tries to assign memory with
> a bad calling convention, which then leads to modem failing to load and
> all networking, even wifi, to fail. Ouch!
> 
> Let's force the calling convention to be what it always is on this SoC,
> i.e. arm64. Of course, the calling convention is not the same thing as
> implementing the QCOM_SCM_INFO_IS_CALL_AVAIL API. The absence of the "is
> this call available" API from the firmware means that any call to
> __qcom_scm_is_call_available() fails. This is OK for now though because
> none of the calls that are checked for existence are implemented on
> firmware running on sc7180. If such a call needs to be checked for
> existence in the future, we presume that firmware will implement this
> API and then things will "just work".
> 
> Cc: Elliot Berman <eberman@codeaurora.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/firmware/qcom_scm.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 21e07a464bd9..9ac84b5d6ce0 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -131,6 +131,7 @@ static enum qcom_scm_convention __get_convention(void)
>   	struct qcom_scm_res res;
>   	enum qcom_scm_convention probed_convention;
>   	int ret;
> +	bool forced = false;
>   
>   	if (likely(qcom_scm_convention != SMC_CONVENTION_UNKNOWN))
>   		return qcom_scm_convention;
> @@ -144,6 +145,18 @@ static enum qcom_scm_convention __get_convention(void)
>   	if (!ret && res.result[0] == 1)
>   		goto found;
>   
> +	/*
> +	 * Some SC7180 firmwares didn't implement the
> +	 * QCOM_SCM_INFO_IS_CALL_AVAIL call, so we fallback to forcing ARM_64
> +	 * calling conventions on these firmwares. Luckily we don't make any
> +	 * early calls into the firmware on these SoCs so the device pointer
> +	 * will be valid here to check if the compatible matches.
> +	 */
> +	if (of_device_is_compatible(__scm ? __scm->dev->of_node : NULL, "qcom,scm-sc7180")) {
> +		forced = true;
> +		goto found;
> +	}

All SC7180 targets run DT?  None have ACPI?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
