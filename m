Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895AA456699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 00:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhKRXzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 18:55:50 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:46687 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbhKRXzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 18:55:49 -0500
Received: by mail-ot1-f52.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so13863706otk.13;
        Thu, 18 Nov 2021 15:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7/Qq/3OYJSrnd3ea3zwdlyBbUdZJatQcrNEdjGp8fYI=;
        b=uBeZ6Jk+IatwP1VrxgzTtLAeNgLLZBSipcIK8fDD+eFoDP3oxh0weMPStSXiKhc3kR
         CVN+1/36TpNAPLyGfp3BqSuqQDRfd0hs5g41r0AcN4ZifZXJxkt2zJFRZQPacf+KHvD1
         fVHCs/5Mcj3yRBGyeJqCQeCTbq+Lw92ubfBet0MS4U1cOWmHzwn4JS2yxTgAA6EBwrtf
         1qAT35ZQ067hpldipzwZTTQ/r5MCM7PwYf0bxtefIrh00qXcY3XsTkxTqvK3lMGehL7O
         KUrVwTU15uO469xsjsjcFBQkGNivOA3wyGKYcCmIrAMvCQ/cZBlNDk3ZYVrIbNis74sf
         +0Eg==
X-Gm-Message-State: AOAM533/y4DPG53sKr0PKu5GkvfNKrsXhvmHyQZPskj/3eavQXun24/H
        vAFxcRM3SzgZWw+HKMUDga0tAe3Lsw==
X-Google-Smtp-Source: ABdhPJy3/ze0S52UjrMt/KQp1HsPA4dMEiW7NGFioBiraZnpZ/YpNi/NNRTpOHDR1zWHG3Wc9YhfiA==
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr977729ote.336.1637279568564;
        Thu, 18 Nov 2021 15:52:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a16sm253507otj.79.2021.11.18.15.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 15:52:48 -0800 (PST)
Received: (nullmailer pid 2019680 invoked by uid 1000);
        Thu, 18 Nov 2021 23:52:47 -0000
Date:   Thu, 18 Nov 2021 17:52:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        stephan@gerhold.net, bhupesh.linux@gmail.com,
        linux-crypto@vger.kernel.org, davem@davemloft.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/22] dt-bindings: qcom-bam: Add 'iommus' to optional
 properties
Message-ID: <YZbnT4/yeSqhjdkF@robh.at.kernel.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-6-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-6-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Nov 2021 16:29:05 +0530, Bhupesh Sharma wrote:
> Add 'optional' property - 'iommus' to the
> device-tree binding documentation for qcom-bam DMA IP.
> 
> This property describes the phandle(s) to apps_smmu node
> with sid mask.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/dma/qcom_bam_dma.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
