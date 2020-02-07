Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCC6155763
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 13:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgBGMHl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 07:07:41 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:43953 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbgBGMHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 07:07:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581077261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TZk9gObJlIN3FrTAbG0+MON6E0t8urqw0CI+vpBR2NU=;
 b=JeIlMlwSgoLats32hbazhisQzlOsWEk9lsT3R09oB4eJY5q9KQqYmLopMTEyrTck8aqlYQad
 2OVNWg9SCfbI1fWhT+X44+1J6i4bKTvUsaA3ut70YWB3Mo6CPrGHQZ6MZN+WBJSHypm0TuRP
 gCbjpb7FWMY4hKFa+C/pjAPyxRA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d5303.7fa8334d1810-smtp-out-n01;
 Fri, 07 Feb 2020 12:07:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 929E9C4479C; Fri,  7 Feb 2020 12:07:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 010DBC433CB;
        Fri,  7 Feb 2020 12:07:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 20:07:30 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     ulf.hansson@linaro.org, adrian.hunter@intel.com,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V2] mmc: sdhci-msm: Don't enable PWRSAVE_DLL for certain
 sdhc hosts
In-Reply-To: <1581077075-26011-1-git-send-email-vbadigan@codeaurora.org>
References: <1581062518-11655-1-git-send-email-vbadigan@codeaurora.org>
 <1581077075-26011-1-git-send-email-vbadigan@codeaurora.org>
Message-ID: <45f9b0d60697571ce2c0e987b3754aa7@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-07 20:04, Veerabhadrarao Badiganti wrote:
> From: Ritesh Harjani <riteshh@codeaurora.org>
> 
> SDHC core with new 14lpp and later tech DLL should not enable
> PWRSAVE_DLL since such controller's internal gating cannot meet
> following MCLK requirement:
> When MCLK is gated OFF, it is not gated for less than 0.5us and MCLK
> must be switched on for at-least 1us before DATA starts coming.
> 
> Adding support for this requirement.
> 
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> --

Reviewed-by: Can Guo <cang@codeaurora.org>

> 
> Changes since V1:
>   Condition was not correct in V1, which is corrected in V2
> 
> --
> ---
>  drivers/mmc/host/sdhci-msm.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c 
> b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..aa5b610 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -977,9 +977,21 @@ static int
> sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>  		goto out;
>  	}
> 
> -	config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3);
> -	config |= CORE_PWRSAVE_DLL;
> -	writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec3);
> +	/*
> +	 * Set CORE_PWRSAVE_DLL bit in CORE_VENDOR_SPEC3.
> +	 * When MCLK is gated OFF, it is not gated for less than 0.5us
> +	 * and MCLK must be switched on for at-least 1us before DATA
> +	 * starts coming. Controllers with 14lpp and later tech DLL cannot
> +	 * guarantee above requirement. So PWRSAVE_DLL should not be
> +	 * turned on for host controllers using this DLL.
> +	 */
> +	if (!msm_host->use_14lpp_dll_reset) {
> +		config = readl_relaxed(host->ioaddr +
> +				msm_offset->core_vendor_spec3);
> +		config |= CORE_PWRSAVE_DLL;
> +		writel_relaxed(config, host->ioaddr +
> +				msm_offset->core_vendor_spec3);
> +	}
> 
>  	/*
>  	 * Drain writebuffer to ensure above DLL calibration
