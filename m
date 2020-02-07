Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA87155FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgBGUn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:43:26 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17791 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727012AbgBGUnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:43:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581108205; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=RSf3QhfauvaQZ3vgECy5h0hwpHIoKPQESdoOHFRylBE=; b=waELrOMfcdj55HHipiCVtzzuWJXi7KyvT/46uccCIdtVib4P99MUKWOUb4osIE2T1X/cWBV8
 Cx80u+0klK3yJMtwHCM69pj+xxhBoeYwveuKR/LwhUT8e2MTrPpjxI63HtAtCCVTP5fXR/Kk
 aqd0oWIdMpQhxNMj41JolQ1iK0M=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3dcbe8.7f8e37061030-smtp-out-n01;
 Fri, 07 Feb 2020 20:43:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C49D1C43383; Fri,  7 Feb 2020 20:43:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11BC5C433CB;
        Fri,  7 Feb 2020 20:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11BC5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 7 Feb 2020 12:43:15 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 09/18] usb: dwc3: qcom: Add support for usb-conn-gpio
 connectors
Message-ID: <20200207204315.GA18464@jackp-linux.qualcomm.com>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-10-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207201654.641525-10-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Fri, Feb 07, 2020 at 08:16:45PM +0000, Bryan O'Donoghue wrote:
> This patch adds a routine to find a usb-conn-gpio in the main DWC3 code.
> This will be useful in a subsequent patch where we will reuse the current
> extcon VBUS notifier with usb-conn-gpio.
> 
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 261af9e38ddd..fc66ca3316ef 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
>  	.ss_phy_irq_index = 2
>  };
>  
> +static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)

Why not just squash this patch into "[PATCH v5 12/18] usb: dwc3: qcom:
Enable gpio-usb-conn based role-switching" where it is actually used?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
