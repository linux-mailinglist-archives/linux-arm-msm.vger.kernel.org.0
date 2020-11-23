Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F042C1120
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 17:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbgKWQzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 11:55:44 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:40125 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729829AbgKWQzn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 11:55:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606150543; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=48GiYkMnk/tiZ+MZBdx/eVYwFAxX3prqUpGuzMArSDc=; b=qjIPWk0EIQ6/Kt9WQdHtlYDPOCRV1TNJBdI/IZgir6zSi8fMBW4bLbprC3jmzic31G2JzunQ
 hq7kfvZJLCA4f5plc2Qs3b/lcnpZkei2dytaVRRAXrO2p/52w5h+op52340GFp0wsRS3dbWu
 bxEILnC+KrsJKL2pYrs+nqJuJVY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fbbe9897e9d874dfc611b9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:55:37
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D47D3C433ED; Mon, 23 Nov 2020 16:55:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F075C433C6;
        Mon, 23 Nov 2020 16:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F075C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies
 to avoid build error
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20201121063302.84090-1-john.stultz@linaro.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e860242d-9024-0f68-9b83-ef4938fc17d8@codeaurora.org>
Date:   Mon, 23 Nov 2020 22:25:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201121063302.84090-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi John,

Thanks for the patch.

On 11/21/2020 12:03 PM, John Stultz wrote:
> The kernel test robot reported the following build error:
>
> All errors (new ones prefixed by >>):
>
>     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
>     qcom-rpmh-regulator.c:(.text+0x270): undefined reference to `rpmh_write'
>     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>     qcom-rpmh-regulator.c:(.text+0x2f2): undefined reference to `rpmh_write'
>     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
>>> qcom-rpmh-regulator.c:(.text+0x274): undefined reference to `rpmh_write_async'
>     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>     qcom-rpmh-regulator.c:(.text+0x2fc): undefined reference to `rpmh_write_async'
>
> Which is due to REGULATOR_QCOM_RPMH depending on
> QCOM_RPMH || COMPILE_TEST. The problem is that QOM_RPMH can now
> be a module, which in that case requires REGULATOR_QCOM_RPMH=m
> to build.
>
> However, if COMPILE_TEST is enabled, REGULATOR_QCOM_RPMH can be
> set to =y while REGULATOR_QCOM_RPMH=m which will cause build
> failures.
Seems typo here, you mean to say, REGULATOR_QCOM_RPMH can be set to =y 
while QCOM_RPMH=m....
>
> The easy fix here is to remove COMPILE_TEST.

As config QCOM_RPMH also has COMPILE_TEST, i don't see why it should be 
removed from REGULATOR_QCOM_RPMH.

Can REGULATOR_QCOM_RPMH have depends on ARCH_QCOM set similar to 
QCOM_RPMH? As test bot reported build errors on other ARCH with 
regulatore driver of QCOM arch.

Thanks,
Maulik

>
> Feedback would be appreciated!
>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/regulator/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 020a00d6696b..9e4fc73ed5a1 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -843,7 +843,7 @@ config REGULATOR_QCOM_RPM
>   
>   config REGULATOR_QCOM_RPMH
>   	tristate "Qualcomm Technologies, Inc. RPMh regulator driver"
> -	depends on QCOM_RPMH || COMPILE_TEST
> +	depends on QCOM_RPMH
>   	help
>   	  This driver supports control of PMIC regulators via the RPMh hardware
>   	  block found on Qualcomm Technologies Inc. SoCs.  RPMh regulator

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

