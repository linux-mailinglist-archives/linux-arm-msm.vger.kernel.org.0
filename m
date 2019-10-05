Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788C6CC7F5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfJEE4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:56:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34274 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfJEE4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:56:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so5152935pfa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 21:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nxVm0xunWOBBVAAFXWndvWPXDw/0SmFto2e0wGq2Utk=;
        b=Es6/WFDpSDi+uUS3ssFw8k2X6y9T2lLmlB3BJ5yMVSfrXVNwu6fCRLjOurcjJCLeZp
         j/2vkFLP2Y3MIWe5OrvrkX/VPjYh8WDB7WXUIcrXPBdZZTXSFYC6WoAVc0aPWJJ9nT9H
         UIONclhMdlXmiX124VebxUKGUcIfV4qN5jNdIdMphwOcKN/ILU6JpHKTZpYzX6z8Sc3F
         vWwIUxav/2EUYWAqwVoGXDr2hjAvsA5MbBYvnU8hJ6ckl3XTOi9+tFbxcjdjuoILN3gI
         FqLdpbLD4MhCjdUJXPrRhTSIGfieyHZjR/SlWHn/cxAw/Iq13I1b6emvNTVDnLQDfQ2b
         UM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nxVm0xunWOBBVAAFXWndvWPXDw/0SmFto2e0wGq2Utk=;
        b=IEpEKZpLMVm5j6DH8PcTJ4HgHLjX9+vxFYsz27+Ct+plZgmWkPpSrdbqLBt4CG0mV4
         0Mm+WbHI16id2TQ47AWoF0BvLXyAMaeMlCWdwZoQjJGixWOj7MzHsxGPiqGGkw0yv0kq
         Vv24rR6PlAVmNDM+FUYcr1P/t7wkz8bSATiFtD8K2bmyqHPwcIWsZ1xYb8We4R81Fu5Y
         xaMu6a5UEzjkmizpk9ie/9gPDzWTuGt423WupmElqNe3KoaF+eATgeMo+HLT2fSvAA8n
         Js+joCsRJTtIc68RnlTMAr/EVY+PuDNcF6Y0UClH8mVsrzcRhzEyRyRBXeEYIfFEvweF
         daJw==
X-Gm-Message-State: APjAAAWrjaN6jLwJ5aJfn9w/BYlRZb/StyXiSo2GH+Cv8xgADlz+JOnT
        /upMwVp4f+JPmZVBTjDWwHmEVw==
X-Google-Smtp-Source: APXvYqxUDnIpVTFnF1XELHDDilE2OljkXH45wCip/vedAt6UgJnmqiscN0yJy1vKGz9lAlTEWEusow==
X-Received: by 2002:a17:90a:cc08:: with SMTP id b8mr20841755pju.119.1570251389539;
        Fri, 04 Oct 2019 21:56:29 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b3sm6041371pjp.13.2019.10.04.21.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:56:28 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:56:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: Re: [PATCH v4 0/7] Add support for QCOM IOMMU v2 and 500
Message-ID: <20191005045626.GE6390@tuxbook-pro>
References: <20191001220205.6423-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Oct 15:01 PDT 2019, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Some Qualcomm Family-B SoCs have got a different version of the QCOM
> IOMMU, specifically v2 and 500, which perfectly adhere to the current
> qcom_iommu driver, but need some variations due to slightly different
> hypervisor behavior.
> 

Do you think it's out of the question to get the arm-smmu driver to play
nice with this platform?


If not, would it be possible to change the DT binding so that we specify
the SID and then read the SMR and S2CR registers to figure out the
associated context bank?

Regards,
Bjorn

> The personal aim is to upstream MSM8956 as much as possible.
> 
> This code has been tested on two Sony phones featuring the Qualcomm
> MSM8956 SoC.
> 
> Changes in v2:
> - Fixed optional properties placement in documentation
> 
> Changes in v3:
> - Rebased onto linux-next 01/10/2019
> - Added missing SCM commit (required by the AArch64 PT switch support)
> 
> Changes in v4:
> - Removed rej files from the SCM patch (I'm truly sorry for the noise...)
> 
> Angelo G. Del Regno (1):
>   firmware: qcom: scm: Add function to set IOMMU pagetable addressing
> 
> AngeloGioacchino Del Regno (6):
>   iommu/qcom: Use the asid read from device-tree if specified
>   iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
>   iommu/qcom: Properly reset the IOMMU context
>   iommu/qcom: Add support for AArch64 IOMMU pagetables
>   iommu/qcom: Index contexts by asid number to allow asid 0
>   iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts
> 
>  .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
>  drivers/firmware/qcom_scm-32.c                |   6 +
>  drivers/firmware/qcom_scm-64.c                |  15 ++
>  drivers/firmware/qcom_scm.c                   |   7 +
>  drivers/firmware/qcom_scm.h                   |   4 +
>  drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
>  include/linux/qcom_scm.h                      |   2 +
>  7 files changed, 145 insertions(+), 28 deletions(-)
> 
> -- 
> 2.21.0
> 
