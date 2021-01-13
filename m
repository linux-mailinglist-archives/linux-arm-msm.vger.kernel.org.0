Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450682F4411
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 06:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbhAMFp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 00:45:27 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:39162 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbhAMFp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 00:45:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610516702; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hFAIRvzSlkyR1XtFS2t0dRLU8b5o3JTm4z6bVI4XCEY=;
 b=T4Q62e6bNNMI0V0dt825MzQrQsD0IahB+7hhpGQSLilHCBJV6x47+4aJNLNZZE4E5ZdL2CKX
 47xsntkUIBFt1TMGoWg0Zx4NQHu2HosGlQqbauKeMRltP3zqWvoGF4Ajv7+mbAAL/GPTyhpf
 eGzPGZTrSKHegSNqUcPjFyMPSyo=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ffe88c4415a6293c5531347 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 05:44:36
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32643C43462; Wed, 13 Jan 2021 05:44:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B8C8C433C6;
        Wed, 13 Jan 2021 05:44:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 11:14:35 +0530
From:   sanm@codeaurora.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown callback for dwc3
In-Reply-To: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
References: <1605162619-10064-1-git-send-email-sanm@codeaurora.org>
Message-ID: <d39144b6495db2d23466e76e509be0ed@codeaurora.org>
X-Sender: sanm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-12 12:00, Sandeep Maheswaram wrote:
> This patch adds a shutdown callback to USB DWC QCOM driver to ensure 
> that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c 
> b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d55..a930e06 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -790,13 +790,11 @@ static int dwc3_qcom_probe(struct platform_device 
> *pdev)
>  	return ret;
>  }
> 
> -static int dwc3_qcom_remove(struct platform_device *pdev)
> +static void __dwc3_qcom_teardown(struct dwc3_qcom *qcom)
>  {
> -	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> -	struct device *dev = &pdev->dev;
>  	int i;
> 
> -	of_platform_depopulate(dev);
> +	of_platform_depopulate(qcom->dev);
> 
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -807,12 +805,27 @@ static int dwc3_qcom_remove(struct 
> platform_device *pdev)
>  	dwc3_qcom_interconnect_exit(qcom);
>  	reset_control_assert(qcom->resets);
> 
> -	pm_runtime_allow(dev);
> -	pm_runtime_disable(dev);
> +	pm_runtime_allow(qcom->dev);
> +	pm_runtime_disable(qcom->dev);
> +}
> +
> +static int dwc3_qcom_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +
> +	__dwc3_qcom_teardown(qcom);
> 
>  	return 0;
>  }
> 
> +static void dwc3_qcom_shutdown(struct platform_device *pdev)
> +{
> +	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +
> +	__dwc3_qcom_teardown(qcom);
> +
> +}
> +
>  static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> @@ -887,6 +900,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
>  static struct platform_driver dwc3_qcom_driver = {
>  	.probe		= dwc3_qcom_probe,
>  	.remove		= dwc3_qcom_remove,
> +	.shutdown	= dwc3_qcom_shutdown,
>  	.driver		= {
>  		.name	= "dwc3-qcom",
>  		.pm	= &dwc3_qcom_dev_pm_ops,

Hi Felipe,

Can you please review this patch.

Regards
Sandeep
