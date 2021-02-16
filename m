Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D3031C6B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 08:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhBPHQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 02:16:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhBPHQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 02:16:16 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53424C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:15:36 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id y25so2319509pfp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 23:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vJHwNyr8YZNuQ/iUaWQ8xC14pN2wcXqAYqE9YC1JuNk=;
        b=de53O0vTk30i0vNDIdgj9BHw4kGm2Axss4ANp5onpAcaU7szqvlclXePjBDlkFxfxi
         rVtA+yX1/ut4gF+3HwTg6RdUEEO9CbpKzFkUlSqwcLLZKk7GM7X+2eQZ1bAvDCyaECj7
         kzrxeSzlRtHt3nSXHL37MdiUXo1qnH7WKWHiNMh6PKwNx2f41DNHokX6DFjblZmLG+nV
         qZc55ZfDo66+kED/Kdb0Em2ZLtxNouu3XXEkerQpQaN7hN9v7qb36baNX1dGAlNGHBwx
         E4hM/hLzaD0MnHcYielQ/TG2HcY9eWq7EPctlWFZpX2kxH/An9oCz8N2O2F65JfPQl5+
         WyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vJHwNyr8YZNuQ/iUaWQ8xC14pN2wcXqAYqE9YC1JuNk=;
        b=in3qWv6x7tOv+9VyquDSQOmKdhdaIb7zsrymnoXS1KIiZWiHEnaDtjb4WXSR+T4bO2
         en0zF20SCm6tQUILPc60ik3I88cKIHmJiB4unpf9CID83eY5mgdrc88Dns/hikDEH1hl
         ML15f4mbX9bnmseuzu2JbIJV62bwVwdz0inUwCA0q0jpaWICz6KcNYEvx9EHqO5Gjh1K
         5hxCP3zU6BZyjoCC0hI7ghUJqlBX4hlII6rioh8mcZ6BpHcre7grrq06eGK7N5VgQRZI
         xxA2+YTflkHWrAhiWL5GOXxjuWzwTVvfCkGEgyLV/wzPNtQwZezTHmRGU+f2LKXjmGXb
         UrJw==
X-Gm-Message-State: AOAM530dmc7vZiISGUtDdy/O72nYgqq2ZJ+jGul4Etw9haoTNujTg96N
        8t2ZhqWU3ftF+qfPFtzD9/CGWlUcLVOw
X-Google-Smtp-Source: ABdhPJww6+B7fI3nd+3m2Mm4SBabsvJDB+lP9ydVHTQZwe4UyjlvKfiTAF7OuANxmx1UiCTPm+4Sng==
X-Received: by 2002:a63:1354:: with SMTP id 20mr4020181pgt.21.1613459735834;
        Mon, 15 Feb 2021 23:15:35 -0800 (PST)
Received: from thinkpad ([2409:4072:618e:567:b42:dd4b:9608:1db1])
        by smtp.gmail.com with ESMTPSA id s18sm1597877pjr.14.2021.02.15.23.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:15:35 -0800 (PST)
Date:   Tue, 16 Feb 2021 12:45:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH] mhi: Rename debugfs directory name
Message-ID: <20210216071529.GA5082@thinkpad>
References: <1613403753-1457-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613403753-1457-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 15, 2021 at 04:42:33PM +0100, Loic Poulain wrote:
> Use MHI controller device name instead of the 'bus' device name as
> debugfs dir name (e.g. /sys/kernel/debug/mhi0). That aligns with
> sysfs device name.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 7d43138..858d751 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -377,7 +377,7 @@ static struct dentry *mhi_debugfs_root;
>  void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
>  {
>  	mhi_cntrl->debugfs_dentry =
> -			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
> +			debugfs_create_dir(dev_name(&mhi_cntrl->mhi_dev->dev),
>  					   mhi_debugfs_root);
>  
>  	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
> -- 
> 2.7.4
> 
