Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2FD3B9659
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhGATGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 15:06:36 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:38826 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbhGATGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 15:06:35 -0400
Received: by mail-io1-f45.google.com with SMTP id k11so8833297ioa.5;
        Thu, 01 Jul 2021 12:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zxe6icUK9dg2zwl2+kOjeVvFVYbjyW2nckiV9CTtI7w=;
        b=QC/Zzroz3Jk2oY/CLOgjxt2yoBnEFCWHPN/xQJGq2HN+kiEo3hie0FX/m/r1ccTo1q
         pR7/Ial9sqMeqJURNBsRcAMQ5ruEh6FdiXnF6NYheAurBMOxAkjN+zslkelArDUqec8D
         Yn6Mw+ZtvPElWD5uMo+q8VcEyrwzxN+xaIAc21jpGrIPNmaIX7S26jkznPoiyEXuDHjF
         PJgyFBEjUmRqDfFWaiXUm8c2GTp0UumoEvHfa4RA15JpKvAW7La3r4fMF5EOzhOH/tJq
         FqRT5Cc5jSuSNbeM7qDQwA10kTK9vO1b22eevXgyBibDryOfacKd0uX5xhaN7A7Zrnmf
         hHOQ==
X-Gm-Message-State: AOAM533jMUmbm2A2+IA1yKfe8b2swA0jKpljSyD7JCCLo8utIn9JqzFz
        6x0TgZRhOJmBbXdBrEAVnw==
X-Google-Smtp-Source: ABdhPJzaGG+aYDhjSbVXo8hz+gZPHFEs4M+dIQlCfUSUgKl7xRMnwYRX52RQ3/KVV/+Osw9UC0L/oQ==
X-Received: by 2002:a02:3c17:: with SMTP id m23mr874544jaa.84.1625166244191;
        Thu, 01 Jul 2021 12:04:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j4sm322379iom.28.2021.07.01.12.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 12:04:03 -0700 (PDT)
Received: (nullmailer pid 2742755 invoked by uid 1000);
        Thu, 01 Jul 2021 19:03:59 -0000
Date:   Thu, 1 Jul 2021 13:03:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: aoss: Add SC8180X compatible
Message-ID: <20210701190359.GB2736150@robh.at.kernel.org>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
 <20210625234018.1324681-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625234018.1324681-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 04:40:16PM -0700, Bjorn Andersson wrote:
> Add compatible for the Qualcomm SC8180x platform to the AOSS QMP
> binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> index 783dc81b0f26..3747032311a4 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -18,10 +18,13 @@ power-domains.
>  	Definition: must be one of:
>  		    "qcom,sc7180-aoss-qmp"
>  		    "qcom,sc7280-aoss-qmp"
> +		    "qcom,sc8180x-aoss-qmp"
>  		    "qcom,sdm845-aoss-qmp"
>  		    "qcom,sm8150-aoss-qmp"
>  		    "qcom,sm8250-aoss-qmp"
>  		    "qcom,sm8350-aoss-qmp"
> +		    and:
> +		    "qcom,aoss-qmp"

This was missing from all the existing ones or is an addition?

>  
>  - reg:
>  	Usage: required
> @@ -70,7 +73,7 @@ The following example represents the AOSS side-channel message RAM and the
>  mechanism exposing the power-domains, as found in SDM845.
>  
>    aoss_qmp: qmp@c300000 {
> -	  compatible = "qcom,sdm845-aoss-qmp";
> +	  compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
>  	  reg = <0x0c300000 0x100000>;
>  	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
>  	  mboxes = <&apss_shared 0>;
> -- 
> 2.29.2
> 
> 
