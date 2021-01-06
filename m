Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681482EBE8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 14:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbhAFNVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 08:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbhAFNVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 08:21:39 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE22C06134D
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 05:20:58 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id i7so2213611pgc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 05:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=msN5beST2gM1x6b/nNxKoYhQKO4QOMO63tKVWJ18BhQ=;
        b=G6y0oGQ3Ob3m4SW+kJevLihH3FNldAP11XObvHFJU8kUyGZOBUuRVEOTDjnAp/Aqvm
         mhgFAZyO0DOWIyR4UTxEmKbcSRgR5zeVBh5QCwL7/Bh6p+hHzbgogEZ+uoi/Qbk11CkK
         xah0KEaABd7bq1M+qie1IJouMJ+korACNiF/ctfGc9ZzbXunddQA0C3Z/ppsrMC6651P
         6JIDvgMEy2ucFrCFojozdGgjc+CsZ3GtUV4t1U5Y9ibZFY681z+yph0kVYycvPzXQpce
         KQAZWCutKZr0KNqS3AvY8TNZRtQsxlaiF6BnrZDhuO4U9O3NdO6TuxieF88YpX6+3DIH
         JV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=msN5beST2gM1x6b/nNxKoYhQKO4QOMO63tKVWJ18BhQ=;
        b=O3oW7WGcLlqDYVWK75EdZ3Gmq1vabX1MtBzwa72z3nQhZp3enP1FmSECEHvo540RFr
         L5T0nAjn5wl398sbm983xR4U/q0XJo8QHDujMsg6t7jQdnl78WfnRrBWKRIZRaUJ8k+i
         GDjVlukPMkva4RnHITRzrMJFn3768mqrlRFXy5f1kV1PIlzCMyENxJHvsLQfnHK8lACV
         dn7XIzi9AjLlQ/v4YuzxO4uAaFD0xrC+p30S2I1b7o1fxjyiM07uIBbi/MkZbPus5nq1
         MB7Acz6xkugTYHeYheqqgx+vXMQwKYoBK/cdtSMiwNukXDQIX3Jy4Z7Bi+5lHDcR3vjW
         T/rw==
X-Gm-Message-State: AOAM533OVkqE3MbqkT0HHessHRs+pma/0KcUiQgLYkMPF6w8L1n2dipW
        +pOCTwKAt1EWIu8JdaQ5GTp/AUqp3kB7
X-Google-Smtp-Source: ABdhPJwJuKikkKMkXq/FI6fzkUrbfv10v/4loF/Fs9EPOAL/fHKiOG/B+1ILPo0RW2S6iOcCvKySww==
X-Received: by 2002:a62:4e95:0:b029:1a3:a372:8b3c with SMTP id c143-20020a624e950000b02901a3a3728b3cmr3891746pfb.28.1609939258400;
        Wed, 06 Jan 2021 05:20:58 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id 197sm2984470pgd.69.2021.01.06.05.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:20:57 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:50:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mhi: pci_generic: Fix shared MSI vector support
Message-ID: <20210106132052.GI3131@thinkpad>
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
 <1609865076-13890-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609865076-13890-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 05:44:36PM +0100, Loic Poulain wrote:
> When a shared MSI vector must be used (e.g. when VTd is disabled on
> x86_64), each event MSI vector must be set to the shared vector idx.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: reword MSI warning
> 
>  drivers/bus/mhi/pci_generic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 86ff0c3..5b3a23a4 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -154,7 +154,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>  };
>  
> -static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> +static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
>  	MHI_EVENT_CONFIG_CTRL(0),
>  	/* DIAG dedicated event ring */
> @@ -164,7 +164,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	MHI_EVENT_CONFIG_HW_DATA(3, 101)
>  };
>  
> -static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> +static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 8000,
>  	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
> @@ -295,8 +295,12 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	}
>  
>  	if (nr_vectors < mhi_cntrl->nr_irqs) {
> -		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d), use shared MSI\n",
> -			 nr_vectors, mhi_cntrl_config->num_events);
> +		dev_warn(&pdev->dev, "using shared MSI\n");
> +
> +		/* Patch msi vectors, use only one (shared) */
> +		for (i = 0; i < mhi_cntrl_config->num_events; i++)
> +			mhi_cntrl_config->event_cfg[i].irq = 0;
> +		mhi_cntrl->nr_irqs = 1;
>  	}
>  
>  	irq = devm_kcalloc(&pdev->dev, mhi_cntrl->nr_irqs, sizeof(int), GFP_KERNEL);
> -- 
> 2.7.4
> 
