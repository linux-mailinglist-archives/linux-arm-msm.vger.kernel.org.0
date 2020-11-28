Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763D62C73C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731559AbgK1SxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:53:04 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB391C061A4B
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:51:38 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t37so5894836pga.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZIzgK78VxHTmMr/A4/MkPFqMJBC+s9qkUagE2V/MKOQ=;
        b=edJ8U+5Oht1BsS4+sm/AKG47EmqafZBxQrErCGe3OEQCTdEguX2EC0Ws4+bWv+E8zy
         DikaH7gDKfrRTDfZGTSA9gokr5o+FsKmaa23UwOtz3Ja6qbR3V+fq7gXhT1WwZxZnKSX
         9GnWAJKnyASTYH37/H+dwmFdlyQ9gzjf0MSESbScUET4sCI4kfC6557uAdcoUmbwPhoZ
         8JHXrHdzQyhGTqV3jICUL08iSlV5iidZkuZwx1XaoNAyJunce/h7J4S/e0d70p9Mk/cp
         1lnCBW1lfXCLCO3OFmfz3kxaZkk8Wjn0h2jreX3jzwjINpTiPxWhOMBnqktFzuzMDN8H
         5lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZIzgK78VxHTmMr/A4/MkPFqMJBC+s9qkUagE2V/MKOQ=;
        b=Sc2ShJ61dD1yQcxHYVhu/KseVOo2OOTMyzSJke7vDlT8nRezE+K0gcmK9nnivrA5GC
         fhsmig/Xm1xEv7mFpTlLphFX79/UADfF/O8cEBMhKfZ8VDsc/C/TgRdQgSGmXHPjKsLa
         ysTR4JRTFqEHf2Geqmmr6xN3kGQxN26CbWXjP4m0WdkbeYmAG36Dspb3f0klxbsUaR60
         Az6jnnZ1Ta5ok9GLE186m2UYi/ynmU14tA+ORTqiLTiHsauSd0M9o40wdb92+LHhJ7MK
         kp8oGE5PwR9ex3lZJdIvw595ksOfPuSQ0J5pEugufYW7NponUOuwi2oUbKWvE29/pGzZ
         ZFoA==
X-Gm-Message-State: AOAM530z+K95bwpq7NDXyfkU2tvwlrXVCt5nU/2Z8Hiea5o0BzoUsEao
        GqNxVugsrl4c4WjYHj43Z82T
X-Google-Smtp-Source: ABdhPJzup9dpt/qzvJGgNfSk3tetN4z79IP6IHYOAMQDqs++sGYYj/nx24LGe2NcpTS7JA53oyyH9w==
X-Received: by 2002:a63:2bc8:: with SMTP id r191mr9475292pgr.54.1606542698051;
        Fri, 27 Nov 2020 21:51:38 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id e14sm8665591pgv.64.2020.11.27.21.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:51:37 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:21:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 9/9] mhi: pci_generic: Increase controller timeout
 value
Message-ID: <20201128055129.GE3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-10-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-10-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:29:07PM +0100, Loic Poulain wrote:
> On cold boot, device can take slightly more than 5 seconds to start.
> Increase the timeout to prevent MHI power-up issues.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 26c2dfa..bbecec0 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -162,7 +162,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  
>  static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>  	.max_channels = 128,
> -	.timeout_ms = 5000,
> +	.timeout_ms = 8000,
>  	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
>  	.ch_cfg = modem_qcom_v1_mhi_channels,
>  	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> -- 
> 2.7.4
> 
