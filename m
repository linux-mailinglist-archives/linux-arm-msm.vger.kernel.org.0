Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F36B432652
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 20:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhJRS26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 14:28:58 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35832 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhJRS25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 14:28:57 -0400
Received: by mail-oi1-f181.google.com with SMTP id r6so1031769oiw.2;
        Mon, 18 Oct 2021 11:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FouZD7WWAm4FEr44KhGasJDNRL3CwqxudIFUEOILOfM=;
        b=A9G3a76XjbCSX186/RfONbbj9RCYOnVK8AUjkpLPbWFLMpjaravdXDXfTDXUmpbPR2
         8Em2epRWlFmcn1UFHgd15ieCuTqByMLw3UnDc4H9wAd9I1+cvphZ52BWTWoeiDcskJtU
         DZpv9/F5MWTUrLoynzyIfWGHgiAkMKm+wyePnl1XP6xMNDV7xIOwnki5g3UcULT4eizn
         SyXVP9fW/k3VnYsfQnwJiTkEHJ6sFYZUsF6Xl5pE3cjYTgDekOV0sxzrelurR/my9u9A
         eEj1aA+CAoyRHfGbflhVlxGzvthB6/iJdULDCQrJ2mcponfoDpixxAMKWWmLJrqxSGUM
         RGCg==
X-Gm-Message-State: AOAM530BKPOApE3+DW9un8RbsIBxafklEzvHagovK0OLLE/pexjZ6dhn
        +bgF424H8YlQRnvpH4LEPQ==
X-Google-Smtp-Source: ABdhPJzgKEr+ZEnCBB0TINT5L+Hks6jkJRLj6D8d/PeDLfJ1LGueYN1L0xSHwgTaIgOSWvSXUPUdRw==
X-Received: by 2002:aca:41d5:: with SMTP id o204mr416199oia.41.1634581605651;
        Mon, 18 Oct 2021 11:26:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g12sm2619925oof.6.2021.10.18.11.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:26:45 -0700 (PDT)
Received: (nullmailer pid 2705218 invoked by uid 1000);
        Mon, 18 Oct 2021 18:26:44 -0000
Date:   Mon, 18 Oct 2021 13:26:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        davem@davemloft.net, agross@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, bhupesh.linux@gmail.com
Subject: Re: [PATCH v4 11/20] dt-bindings: crypto : Add new compatible
 strings for qcom-qce
Message-ID: <YW28ZIbBj2+mfndy@robh.at.kernel.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-12-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105541.68045-12-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 16:25:32 +0530, Bhupesh Sharma wrote:
> Newer qcom chips support newer versions of the qce crypto IP, so add
> soc specific compatible strings for qcom-qce instead of using crypto
> IP version specific ones.
> 
> Keep the old strings for backward-compatibility, but mark them as
> deprecated.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
