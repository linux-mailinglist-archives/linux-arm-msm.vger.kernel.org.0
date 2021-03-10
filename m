Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3788B333F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhCJNuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhCJNt4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:49:56 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469ACC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:49:56 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t29so11976175pfg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E4+6eVLBLjzUhwN8/AADW+U+uo0yly+mgPXEvznoLck=;
        b=IZlIlYE24YxwJzbAPOeisk6F9R7CLebUuFqUIASvCQA6dEBMjTbDtFdXFFtYe/mt6R
         lZFwXngE49U30OwJTL6TJAOoIMTq+352NQdHoJ1aDPLY3NPpIq5584/4BPLl171RI/lg
         btx/6Gpwr/U9w76/50wn/zy5U4j+JzeW6Sn64miU5GND1vO9Zf0O/SFNBd1dg4eIvL/H
         QNGxv/4K2Ab5/drxsdOKR/kKPnFrSpYVcAnt//V0XvsTUSiKO/mzwT/xIVs12+Lrgj8M
         RGatu4NsFFhHus4peJRJcjQET4bD3f2nFY3O4xG8TZRZrE25rOtmco1FqCwkQv10g9So
         dHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E4+6eVLBLjzUhwN8/AADW+U+uo0yly+mgPXEvznoLck=;
        b=mWRBOT03V1jy+dkLzovvAOnyPbc08ZWKlX0EU9TJ70tglLZVESopLDAASun+n+05CP
         mo2gVPr+t8z9E2ncvJOlyPUmXlXZvJEfG497sILfi/UUSWAFqAEOVGsYwI9b0aEzkRko
         HMBYY42297Lo2hn8P6XjR93jb5+uQ3DNADi3wUqyZL3s2ekaI6OYw/nuvhgw90k53HfP
         n4uhhgk+GYF8Bsd4R/mk8WBXWD9vn5sxG7lqk8xxtTPxmucOdIfN9rE1YAUQ3VfWcm+b
         dQuAGQDiBA/9GNDAK80+vGw1Vlt6bU3rFjuAaXF97FdeXwgyr70ytghBaGxVE2DMDJCx
         5D6Q==
X-Gm-Message-State: AOAM532j8tVm4MdVKqbjIZKcl387dheG7rI/rBdXaRN4y5h58YnEsBqk
        FQAHz5i9sLHOqCEAolhUkwYH
X-Google-Smtp-Source: ABdhPJwjFPK1YPIeAdXLfM20vT9RYmtazTk2PuyEUKBdOhCIC8zg5lBy4C1Cee2Ifd/z+ekXFd87cA==
X-Received: by 2002:a63:f055:: with SMTP id s21mr2932711pgj.293.1615384195797;
        Wed, 10 Mar 2021 05:49:55 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id q66sm6591162pja.27.2021.03.10.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:49:55 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:19:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH] mhi: Rename debugfs directory name
Message-ID: <20210310134951.GL30275@thinkpad>
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

Applied to mhi-next!

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
