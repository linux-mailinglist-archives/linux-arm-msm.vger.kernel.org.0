Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4425F2F8080
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 17:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbhAOQT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 11:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbhAOQT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 11:19:56 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD93C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 08:19:16 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id j8so2333125oon.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=geuO1g60CBuDCxEMB7n0Q7qyNXPLly9Rk9aTB8IfnSk=;
        b=uKT08lnc0iFaqeh1HLX8QD1IvRybkx3T/ZvEzyqjpHJe0s/vMmo4d6hmFolOIQ0lkT
         NN9jFJZLI1oicFGR/RPl72ZU19XAiPYeZuRQCFONR+pi7MN0i3v7NoWFJe3s/IjSHcCO
         VQdDT5SZKiAIe6cGZI+7gmgfciozTT0GqOi73D3QXQqGdhqS1GjxQSesyzmIXKbaG+uQ
         ogSy0aDl5yy3FfqhdL1/qJHtRfTvhyC+uoTGS24XKAJcHAWBliCgozZEJTfOy3wqEBuL
         CbfwtVn+n9PzaS0UULL27Z0MVsKNxFK060bK5et0xI1Aym9LRwYtx3SpzQ3hhu2GpgRj
         EL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=geuO1g60CBuDCxEMB7n0Q7qyNXPLly9Rk9aTB8IfnSk=;
        b=d2RzitXwPZEhghHLG4UM6fo/iv2n/hZ+qPbERNSCbqXrpkmxC3OrhKw8i9OxfaZ9AQ
         dSxQV8h8GfBsD11QSClN7Dk9LBJe26xA+5Am0uuVSDT+YKQ4rAUbfetXbb5RsOt2ElCj
         axhnOB2LyNC854Z3/3jU9Kvv9IgaX937i+D0w2LB1XwVuDN7ZZ5amPL9UgzKYgP2GXTY
         E3ozn39VoCqQvJkzoJ9HW5WubxDebm3p06HwLEWK5VgNsdY2VGvOoCxtwXdBvzoiA8yU
         6pkXVsz441nUn2EDn8yjbIE2FpKvV/i0uvQkvWzjlul/gvELp4ml0EBoNY8ISuW8kOU4
         7Khw==
X-Gm-Message-State: AOAM5322gsWoyaoOmYzJ482b0Fcb6YrR9hrfc2G2wuJ+Aqa3ctuQ2Nvc
        gp5pWtZuzwpInJzk/mmjhIeTHg==
X-Google-Smtp-Source: ABdhPJzl6R2KjdjZkGS8ayF8kJ2PW8nt3kuw1gO5L5R0k3GvCk5zqGhz+85qxZeuoWqTzLygSLbxMA==
X-Received: by 2002:a4a:ea5a:: with SMTP id j26mr8700278ooe.45.1610727554099;
        Fri, 15 Jan 2021 08:19:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l12sm1850803ooq.22.2021.01.15.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:19:13 -0800 (PST)
Date:   Fri, 15 Jan 2021 10:19:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qcom SNPS Femto PHY
Message-ID: <YAHAf5HpGw11bu/l@builder.lan>
References: <20200918125312.2920-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918125312.2920-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Sep 07:53 CDT 2020, Manivannan Sadhasivam wrote:

> Enable Qualcomm USB high-speed SNPS Femto phy found in Qualcomm
> chipsets.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 47ae0ab7e9e8..a803853fc71e 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -953,6 +953,7 @@ CONFIG_PHY_MVEBU_CP110_COMPHY=y
>  CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_USB_HS=y
> +CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y

We should be able to reach initramfs without this, so please make it =m.

Regards,
Bjorn

>  CONFIG_PHY_RCAR_GEN3_PCIE=y
>  CONFIG_PHY_RCAR_GEN3_USB2=y
>  CONFIG_PHY_RCAR_GEN3_USB3=m
> -- 
> 2.17.1
> 
