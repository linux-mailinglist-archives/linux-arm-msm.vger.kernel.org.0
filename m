Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BE71FD90F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 00:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgFQWka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 18:40:30 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:41263 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbgFQWk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 18:40:28 -0400
Received: by mail-il1-f193.google.com with SMTP id c75so3926377ila.8;
        Wed, 17 Jun 2020 15:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zfs6fQ9dNu1WR3lr294IASeX3pxyyPciqezJugqbLdg=;
        b=G0ltQ4jE9bsx7HoaSL+9uqiI/M6feDClifO1DbwqodFsP4zcHESho+38F4RrtIaaaV
         yU0pDEPrS9aGF8uJwOmV1gPCsOfkTyO5BStywEfwQVFEg+WhvkKDCcm11c7Xiilzg50V
         gNcQeJm+sxPi40QHlrZ4/mj0zFZfB7kyJUfd4BPkjce793MQkdYKEAZZayKSaSADKzkS
         gGI2KSCk6zhTC+zWv0QugNd89LMvHYm52NuFYxuMoSpLmSRlqup/sqREzaSPbpmVUVxt
         Dr/SYEs9oHunV8kUNqJc5umPm8FY2onZ0YnH5YCsT3BMwQy7Z+8BbKoRr77jRBYKQMEB
         Rpxw==
X-Gm-Message-State: AOAM5339dqAUPQ12LSkQvcX5IrSOvdm6LNhw0vU40ixBybnhlDQNAWx3
        f6BrHo/l/qlHU09hLcN23Q==
X-Google-Smtp-Source: ABdhPJzRwz/0uaYi76fA5Zd1pUASZHPvWS/+PxMD1pnVAfG3nH0ehNSUR64R0ytuzMsQ9XxUG4dQDg==
X-Received: by 2002:a05:6e02:ef2:: with SMTP id j18mr1221721ilk.69.1592433627244;
        Wed, 17 Jun 2020 15:40:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c85sm537559ilg.41.2020.06.17.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:40:26 -0700 (PDT)
Received: (nullmailer pid 2970050 invoked by uid 1000);
        Wed, 17 Jun 2020 22:40:25 -0000
Date:   Wed, 17 Jun 2020 16:40:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v8 3/7] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
Message-ID: <20200617224025.GA2969998@bogus>
References: <20200611222128.28826-1-jcrouse@codeaurora.org>
 <20200611222128.28826-4-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611222128.28826-4-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Jun 2020 16:21:24 -0600, Jordan Crouse wrote:
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
