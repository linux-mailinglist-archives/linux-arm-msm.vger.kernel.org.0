Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826BBE54AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 21:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfJYTvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 15:51:46 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36742 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfJYTvq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 15:51:46 -0400
Received: by mail-oi1-f195.google.com with SMTP id j7so2399182oib.3;
        Fri, 25 Oct 2019 12:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h2z/cGsp1B4hc5Hc2TEPB0+iYCA1ZMEOK5oa7ytat2Y=;
        b=Dr3Q/u8zy1YLxkKKOhQ1XsNsxbQjl+zApG4/PRFS2Rieh8ci16QTM77JyEEGT2eFST
         3vkYqB1ksldUjAzatd+Y81QAFSgB641S4anC+ApBZLstdwjSos3Vs3xuPNIhXs61wJlu
         o0QNAat7p4kkLV5hOY0BnxSJ0XjacSYXCjbMkayZo2q4etwOnKRVGjOyFTYIqRSsT7rG
         ItlrZi3mBoBzeqUg9142z9OTsJMKyYNwwJo/s05iNjkrHu5UAWIaN0y1FEKZZzIMYplI
         4Q9zwXUSdXAd64OqZWJ5mLlIZAP/iMxtg+QZyq6VmvQTwYIHPyRy1+RmQmNS+bHDdDOQ
         TWfw==
X-Gm-Message-State: APjAAAXSXoWsWEkstL+k40tR+5Y1bc+DtFivsFZiWf2H3KdXqja8lgTx
        doa7BIBfXBzKPOoCLOeFzw==
X-Google-Smtp-Source: APXvYqx7jkmGfgJxpTI09sXjt/YKhiiMHaf7Np0KOYGQOU/mrPCmNUVCkYSvIBcLek7yBFrsw3AWwQ==
X-Received: by 2002:aca:f1a:: with SMTP id 26mr4502975oip.172.1572033104907;
        Fri, 25 Oct 2019 12:51:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a21sm828784oia.27.2019.10.25.12.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:51:44 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:51:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: arm-smmu: update binding for qcom
 sc7180 SoC
Message-ID: <20191025195143.GA31658@bogus>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-4-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023090219.15603-4-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 23, 2019 at 02:32:11PM +0530, Rajendra Nayak wrote:
> Add the soc specific compatible for sc7180 smmu-500
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3ba7567..347869807cf2 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -30,6 +30,7 @@ conditions.
>                    Qcom SoCs implementing "arm,mmu-500" must also include,
>                    as below, SoC-specific compatibles:
>                    "qcom,sdm845-smmu-500", "arm,mmu-500"
> +                  "qcom,sc7180-smmu-500", "arm,mmu-500"

This is now a schema file in my tree.

>  
>  - reg           : Base address and size of the SMMU.
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
