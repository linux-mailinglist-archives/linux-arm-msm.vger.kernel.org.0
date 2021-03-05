Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1DB32F6A6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 00:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhCEXhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 18:37:01 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35145 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhCEXhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 18:37:01 -0500
Received: by mail-ot1-f54.google.com with SMTP id r19so3491199otk.2;
        Fri, 05 Mar 2021 15:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1tLdHqPjOw0oS3E1Aqx3XDxrDkeAhsjwl8ce7IJGqqI=;
        b=pWAtbB3gaP2omiadZTZeWf6qwUJANf1WBD7e6vq3IQAQ0YxdeUQG3L7ta3gO57XxKk
         bjpwxbxL+AIRA8Y/bpl1IZZ4NimQ2DTMZZ4rYZ4BgW+OSZYGqUkjA4UX/DPHp8BlJlvR
         pRuCY8q9ZBpwxkeZzQBNcumaPNsqif/UfYDemLsJqe4VoM29lH9Mf7mABT9tKII8a4Mz
         OZNdqEfzF3qda4e/dZbas8IOiCCX6uiUZtMgudWGcaqXyYU5dIkd9/lDoviTO3jMCejb
         AHd+mwyKBpJFs+t3wjTicPvwmBTr8mOx48T/JQwmJaw0I8VK12qfVwuUWdHZLVhFml1z
         W2TQ==
X-Gm-Message-State: AOAM531afTLgf9WPEesWU0vks+YE8bVWbu4BBeA3wW07gzr9Y4rvhuG0
        HLYqkfB/+uArC4abMuMJ98GfEaHUNA==
X-Google-Smtp-Source: ABdhPJzHIrEx/psMaWb5sExfGryDm/kqhblVrz2IFl77edEGkv1dHe6mbZVPg7UElvfJxzq0E6btvw==
X-Received: by 2002:a9d:63d1:: with SMTP id e17mr10054802otl.183.1614987420688;
        Fri, 05 Mar 2021 15:37:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l25sm831240oic.49.2021.03.05.15.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 15:36:58 -0800 (PST)
Received: (nullmailer pid 849924 invoked by uid 1000);
        Fri, 05 Mar 2021 23:36:57 -0000
Date:   Fri, 5 Mar 2021 17:36:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210305233657.GA839767@robh.at.kernel.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> driver can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..7500e20da9c1 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -48,6 +48,13 @@ patternProperties:
>          enum:
>            - 512
>  
> +      qcom,secure-regions:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Don't you need 64-bit regions potentially? Though 4GB should be enough 
for anyone.

If more than one addr+size, then you need a matrix.

> +        description:
> +          Regions in the NAND memory which are protected using a secure element
> +          like Trustzone. This property contains the start address and size of
> +          the secure regions present (optional).
> +
>  allOf:
>    - $ref: "nand-controller.yaml#"
>  
> -- 
> 2.25.1
> 
