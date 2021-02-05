Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59541311685
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 00:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhBEXDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 18:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbhBEMeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 07:34:31 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336B6C0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 04:33:51 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e12so3495567pls.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 04:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sBL0rh7/UX7kJnSumXQxIF++HgA86FQxGZPZlk+vylQ=;
        b=ftLPADEBQAOI6kwd+EMBCA+MsygDr1ICdiKPueRpTw/ZwaTojcGh+HZWsEH7yhczjD
         GpEohFLz+6jcbJuZX5WLExJIIcDIAy7Ddd1CeBwuYTpE3GNNCpo85uLn0uMcRng4tlAb
         NA7xB+sXVOO/pc6Fh3lblYQIrvDBJ0ROFctqSgtZzIyemzIExDIdKgq0zs+t7v1baSgU
         unNOjmeWUWjvPgSbxbi1bKqjv8BsP5RxuWhKsU9BP/OmVzQISHP7FrEvfcSisyciBgma
         uwdwLhTfw2DjDPDnzU5kOYYIHhuF2lqXKgPYadR7W0FQ2y31TBEbXnhmcY6Esfx9wCFd
         Nn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sBL0rh7/UX7kJnSumXQxIF++HgA86FQxGZPZlk+vylQ=;
        b=lXahelauWDVf58zjkIuQp2xN6SRiqMvGzV6DCuEZgmrnxtEZsf6+u+mJdk+9b7QoiR
         lK3tQ2/ZoVnV/hqzkO7RneWoax2i5xvHDkA/EZDnOIEV/goOVuuNRMhJHBAafYQ8Ygoa
         1hFO1tEkeNC7ZLx9BTslbQF0+T9Nm4Iv5QR+k/BTd3xvMOLAJg/+Y0NtzDKUfk7VjI1M
         l/m8lBdLV8hI2OBhfAvc+fTWqfEgiYj8HCE8ljZ1yj99RlTy6lsMiWauNZ1ISVVZvJjs
         wlmVvFTeQZcinUy++Z+imGbrxnE6MlYDny4xQlFQTR4ac6OSvuaS9LtOWt3h24bkU1/0
         kcDA==
X-Gm-Message-State: AOAM533qwvJE1K7ASjKsQug7du753pu51qmwFE+fY7T0m8cBtZ0l1jn/
        DkxSjYz1zNpfm3U/YGQI92QOOI5aB6UT
X-Google-Smtp-Source: ABdhPJxHfLSdAsnVzJ8yY9hIUPPoGjECrqMnaHyoynMq/E0mOATL7ibW6coW9K1AZR9itLO1Y63jFg==
X-Received: by 2002:a17:902:bb8c:b029:dc:2e5e:2b2 with SMTP id m12-20020a170902bb8cb02900dc2e5e02b2mr3886782pls.10.1612528430638;
        Fri, 05 Feb 2021 04:33:50 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
        by smtp.gmail.com with ESMTPSA id r30sm9652337pfq.12.2021.02.05.04.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:33:49 -0800 (PST)
Date:   Fri, 5 Feb 2021 18:03:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: Print warning in case of firmware
 crash
Message-ID: <20210205123345.GC3221@thinkpad>
References: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 03, 2021 at 05:39:42PM +0100, Loic Poulain wrote:
> Print warning when MHI detects sys error.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: remove useless fallthough & unused mhi_pdev variable
> 
>  drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 444693e..2476041 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -217,7 +217,17 @@ static void mhi_pci_write_reg(struct mhi_controller *mhi_cntrl,
>  static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  			      enum mhi_callback cb)
>  {
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +
>  	/* Nothing to do for now */
> +	switch (cb) {
> +	case MHI_CB_FATAL_ERROR:
> +	case MHI_CB_SYS_ERROR:
> +		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
> +		break;
> +	default:
> +		break;
> +	}
>  }
>  
>  static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
> -- 
> 2.7.4
> 
