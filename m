Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5E32D2F22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 17:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730338AbgLHQJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 11:09:15 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34261 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbgLHQJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 11:09:15 -0500
Received: by mail-ot1-f67.google.com with SMTP id a109so645253otc.1;
        Tue, 08 Dec 2020 08:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k7NQaM0vE+genhrk83STERXj/DkO+VaiPI2COlb+7Nc=;
        b=iPE3X4crLpPYA0BVNYpfYWImXNsU+oMGDy/DMrYBAWQTQp/DgHOWbUFAiNypzUB5ma
         JupjJcuQoJmXJnzr1gJmUJ4AOMdzTeaU+O9avOs+iifKf63TQZG05j4+v7Ek9b3fNdH4
         +4pofeeNhyKU27oMfRRaBtlXfjKSza1qFMuvnWmuRD2u4E5K/8vbzGG8fUuV1nu2gSsy
         Wiaey1S23tTwyAmsY/0Rn63PcI93s3dgZcKM/FUTOkhTugiwm4NA3oEdekabzvmXwvdX
         SlfB3JvZ6TN5sltsmOz/86ECFbUvWn/NFWF15VzX28sgOHZFepE/NNzwZxcdaApVvH/4
         S39A==
X-Gm-Message-State: AOAM53215cW5DO779z4ta3HjrbUPU2SDDnBM9w6hmpQ5e+DUmA6W49A2
        Hny3A8KdgSOcPQZApKYHgA==
X-Google-Smtp-Source: ABdhPJw4m9+XxlvsXQBxugPRQakCvqVEyxoX1SQ5Ty8HvPJbZwSQzM6GOhobNJWrjpcg80Fv0udCgA==
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr4192511otb.59.1607443714891;
        Tue, 08 Dec 2020 08:08:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j73sm3467253otj.37.2020.12.08.08.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:08:32 -0800 (PST)
Received: (nullmailer pid 2619424 invoked by uid 1000);
        Tue, 08 Dec 2020 16:08:30 -0000
Date:   Tue, 8 Dec 2020 10:08:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vkoul@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Document SDX55 platform
 and boards
Message-ID: <20201208160830.GA2619372@robh.at.kernel.org>
References: <20201126083138.47047-1-manivannan.sadhasivam@linaro.org>
 <20201126083138.47047-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126083138.47047-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Nov 2020 14:01:37 +0530, Manivannan Sadhasivam wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Document the SDX55 platform binding and also the boards using it.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
