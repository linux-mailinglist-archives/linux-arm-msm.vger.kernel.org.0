Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7161D3384E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhCLFKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:10:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:32878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229664AbhCLFJm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:09:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CFA964F9F;
        Fri, 12 Mar 2021 05:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615525782;
        bh=Nmh2nu8X9PCC8zcvi1syw6tWZGH29aICzWzUdkCtCFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YxmAOPHhnoHv5RP+3CC8JS7U2DkA2Iz5MIGMuU8MOeMfWd3MlMvWXvxWedqJ1WhJK
         4C9Z4WZYjAxu4n/iwkpdKQWSnapi55uq5GN1JbGtQS/+HHxcdLnYV+kcj740DThGIj
         5fhj5TiFp3OnYSyklVsngDFQCCwpe2vsLLFULbfqP8/aqzZjH/jGzgyuKooMUI6SsN
         Qvcgdgfr0vsaPq/ZLDACHW4wZ+ooaWR71Qqa4sYxaf0kFqFKCWcmeZ1F728jd1FUVj
         4z2MV9fZIwWBqSULTazrYveLdu/1kIXGIQFQ2fhrse90w9aiAZT/Ahfgn45rBvh8gk
         XvpiXh6IrdkRA==
Date:   Fri, 12 Mar 2021 10:39:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible
 strings
Message-ID: <YEr3kg6vPu6Htnpw@vkoul-mobl>
References: <20210204165234.61939-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204165234.61939-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-02-21, 22:22, Vinod Koul wrote:
> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.

Gentle reminder for this patch, Rob has acked this

Thanks

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  - add Bjorn's ack
>  - split from phy series
> 
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index 415ccdd7442d..d8fd4df81743 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -14,6 +14,8 @@ Required properties:
>  			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>  - reg               : <registers mapping>
>  
> -- 
> 2.26.2

-- 
~Vinod
