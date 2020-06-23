Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8322047B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 04:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731719AbgFWC4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 22:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731690AbgFWC4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 22:56:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85564C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 19:56:07 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so9400656pfn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kSTC0VTBrWDM5by3kGz7hIcxXLRKqyZK1aiOUbh6nM8=;
        b=eQ4xiTf7gx2KjSDgCEoSAdzK7UDZ8pqfOk3ewtrUignzeaxkaEM73d/Yd0pQAF1kbD
         /cTGE2Ja7Mn6ueajaTG/Ravft6sQHIuvGIhhVF55uRTIl9+1LgpYvNlrkNFLOoJdfFNl
         yfxfErmHrKZxhkS+wTdJeJ5kpQHYNVELPQaQc1Sjmwe1Nc403gxMAuo0Ha7p4Kgo+g2Z
         zkwbEyqaG/HsD7XYjTC2SCzs6JwgLPbLEiJhqTYDQFaY2heEyT6V93h/bSG1HyJW/gfw
         RcC0sGEZgafv6zkgZg1tIpHfJPvKHCLiPpRNMX2SoBHwOH42L0gZz4YJg5NQAWkaR6Sr
         B4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kSTC0VTBrWDM5by3kGz7hIcxXLRKqyZK1aiOUbh6nM8=;
        b=k78knkUCjO98Oy3D8AEMqgZBLDhoeHPzAhlV3sAS8DSpjPdQKbKEwtl/hhnFHKguOR
         M1FCAp/oNFOzJh5Z5C9o9pLJW8WbvyzHi2qDlCpG2SNqTUCR7rnOWnTkYEkh4sTnOBS7
         UDg4kHkzdPyiM2wRU6owHz4vlstZ4rvCMWYs+hjyn+zDqv1Oj1mcL44zUxLSA0tUQKX/
         KaJC/8BHJxrpKmGR12P9ip0Ry5JoC40i4MEFUtWmH66ZJ+ob0F9enibBtlYC+sA+m5tO
         V3YnsWB30bibk0tAU68pVvB0D9NjXZ5G05M5xrmVkmkXxXAJOL2TbPIPnRe3g9p64Lav
         wGDw==
X-Gm-Message-State: AOAM530QHXGDV8howzQeN8CsKoF9gr69mtttxbUPci5tMzbe7uohftAX
        LMprGkn47N95jkLdQx90ZD3q
X-Google-Smtp-Source: ABdhPJyrVggWi5UupCm2eia+264I1LZmyLdnPGHgQa9SBezyVI4TW8Vu1BIiFcqr1BCjXIz0g8Jk4A==
X-Received: by 2002:a05:6a00:1510:: with SMTP id q16mr21976058pfu.164.1592880966978;
        Mon, 22 Jun 2020 19:56:06 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:609d:7d26:e4ff:f0b0:edd6:2484])
        by smtp.gmail.com with ESMTPSA id y12sm15348621pfm.158.2020.06.22.19.56.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 19:56:06 -0700 (PDT)
Date:   Tue, 23 Jun 2020 08:26:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Qualcomm IPCC driver
Message-ID: <20200623025600.GF11093@Mani-XPS-13-9360>
References: <20200622222747.717306-1-bjorn.andersson@linaro.org>
 <20200622222747.717306-7-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622222747.717306-7-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 03:27:47PM -0700, Bjorn Andersson wrote:
> The IPCC hardware block provides a mechanism for triggering interrupts
> between co-processors in recent Qualcomm SoCs. This is used as basis for
> most form of communication between co-processors, so enable this
> support.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5848799dcad0..b3d13e1a052a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -834,6 +834,7 @@ CONFIG_IMX_MBOX=y
>  CONFIG_PLATFORM_MHU=y
>  CONFIG_BCM2835_MBOX=y
>  CONFIG_QCOM_APCS_IPC=y
> +CONFIG_QCOM_IPCC=y
>  CONFIG_ROCKCHIP_IOMMU=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_ARM_SMMU=y
> -- 
> 2.26.2
> 
