Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1EF2EAE4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbhAEPal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbhAEPal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:30:41 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282B7C06179A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 07:30:01 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id iq13so1880549pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 07:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LTmKq8h/hcEarEzcygFryWNEn0cPl2jO/8gOElXD1mU=;
        b=mzh5Sh/mjquO1MDBR5ADlM3uXZa5OrlleZ2r0oM7CvqLGsNf9Vm4tpK0N9aLYTn4AY
         EiqAInXN6b+uER6b7RvscAS91ieyzPz52hbZ9eutMWziPf9psULJ7EzeBkqqO6bVu8xX
         xNgo5EAqdroT4kwq8nOhe0unaKPjuMh9n5hLoWcT890tNJ7SINHS5b/aGrRqRE+6i+MM
         WfseRJXH9Rp8UA6RodYD2k+4NpqbBGd2ntWr9/P2uLG9OBjiuYtWwoursppM8ryXk72A
         EzLKvIxMV6OS1ZgG7MdJiuIjLGPYscFP4ja7f0riwh7u/03/TAIdZPTtK2f7t49GPJT8
         KzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LTmKq8h/hcEarEzcygFryWNEn0cPl2jO/8gOElXD1mU=;
        b=dBKKoL39v9J5b5NFMEa+YN+dPWXtDd3x9EXjRx9sg1a5bM35NDpdguh0Brik8DJYUL
         aignrfdGOlPOt9MA6LW2R4q1K/xwxV0yA1eJn4SjDnUkEUdZMOK1Cyigq9xRPs1bdpTL
         6aTUxuaViMbBI1rf3RVHikTWXPKxB+1OhcXI0++46NZzutA0RV5pNXiItDT5QAmfUZ3z
         b/kpkWe2AI8liImXakMwx3nsBS73L62TgVeB1pCQbGPGMRc75kgqHFo1ebaXhjP5zGno
         q1AiCxKcqcFamTdrVwXA6W0LieawoJki2OgN7co2qGKe5WOGYYlkcQHCJixE9hVdWkNK
         PYMA==
X-Gm-Message-State: AOAM532rmBgfaNHc8q5DyHA1llTxNd1AtXA1GGGaz83AV2zjM5CHKAjv
        oTBIvQsAPo8Cm0Fg7fpGQrhUkz9VTU0M
X-Google-Smtp-Source: ABdhPJwlTphWl9/jZ0BO0OxGm7Tapnpe73ql1+ZkAgaevnp8ZRhx8KXFXsgEtwWlrxXZwE+4dIqeyg==
X-Received: by 2002:a17:902:bc47:b029:da:cbd5:dbdf with SMTP id t7-20020a170902bc47b02900dacbd5dbdfmr103374plz.77.1609860600633;
        Tue, 05 Jan 2021 07:30:00 -0800 (PST)
Received: from thinkpad ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id 7sm34986pfh.142.2021.01.05.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 07:29:59 -0800 (PST)
Date:   Tue, 5 Jan 2021 20:59:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] mhi: pci_generic: Fix shared MSI vector support
Message-ID: <20210105152956.GB14794@thinkpad>
References: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
 <1609836975-5758-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609836975-5758-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 09:56:15AM +0100, Loic Poulain wrote:
> When a shared MSI vector must be used (e.g. when VTd is disabled on
> x86_64), each event MSI vector must be set to the shared vector idx.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 86ff0c3..23ef585 100644
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
> @@ -297,6 +297,11 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	if (nr_vectors < mhi_cntrl->nr_irqs) {
>  		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d), use shared MSI\n",

So now the log should say, "using shared MSI"! with that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

>  			 nr_vectors, mhi_cntrl_config->num_events);
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
