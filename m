Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E2234B843
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 17:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhC0QlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 12:41:08 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:37483 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhC0QlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 12:41:02 -0400
Received: by mail-ot1-f44.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so8221280otr.4;
        Sat, 27 Mar 2021 09:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wb4sH2K63Zh3SiFRvUPI8IlBfub9eBg1HUipVUt8VBI=;
        b=Kx0zRUC6uaTQ/N4Vu10Ltddq+l6cGnPHbCRrEh2EI5V84IcKEZSrrNmKzs/upQrVoF
         TQmNqegVzgBHiZo23FPkig7jMASYfNgXh3eAXFy34FED9WZw/3aAhEJCLNk/2bxaXovi
         XSvqx+ziXl8Gvp+AMZuo5sRa0WxEo5tb7uSFN6uQ4VWHD9X3iXvvvmkvleNy+btnEyu8
         1SyB0gHeCQG+NpwsiGNDnkh4K7LQv4GIf74v44vIdCVgG0Q3N5izubJDA1GfXqdWlYRg
         6xi+udYL0dyJgKFS5f9xwliOPXcJBx8ihzNMCyz9BVbJv0zjg91upSNWVAPEV8EQ4ZlQ
         FRdw==
X-Gm-Message-State: AOAM530is/QRXy/oJros2Do3Q5J6Mjyr29MRcCyBGWhEOWbIMQMlVQ5+
        /+0EBAPzKlY7OL7PsTexlA==
X-Google-Smtp-Source: ABdhPJywxocBdq+u+4dCiSNTO48Yh6y1yejg1pEi9Bp58/WqcYpE420zdyRI0SRmfytnYuV5CmQtlA==
X-Received: by 2002:a9d:5a8d:: with SMTP id w13mr16600598oth.145.1616863261384;
        Sat, 27 Mar 2021 09:41:01 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id e15sm2842895otk.64.2021.03.27.09.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:41:00 -0700 (PDT)
Received: (nullmailer pid 217627 invoked by uid 1000);
        Sat, 27 Mar 2021 16:40:56 -0000
Date:   Sat, 27 Mar 2021 10:40:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: qcom: geni-se: document iommus
Message-ID: <20210327164056.GA216078@robh.at.kernel.org>
References: <20210321174522.123036-1-caleb@connolly.tech>
 <20210321174522.123036-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321174522.123036-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 21, 2021 at 05:46:32PM +0000, Caleb Connolly wrote:
> Document the iommus property for QCOM Geni SE.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> index 84671950ca0d..68c4ee55ae7d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> @@ -51,6 +51,9 @@ properties:
>    interconnect-names:
>      const: qup-core
>  
> +  iommus:

Need to define how many entries (maxItems: 1?)

> +    description: the iommu and adress to be used to configure DMA for large transfers.

The property doesn't define the address to be used.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.30.2
> 
> 
