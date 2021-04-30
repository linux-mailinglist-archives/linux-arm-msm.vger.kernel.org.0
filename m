Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE136FD27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 17:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhD3PBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 11:01:09 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:42682 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhD3PAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 11:00:41 -0400
Received: by mail-oi1-f169.google.com with SMTP id v24so2587784oiv.9;
        Fri, 30 Apr 2021 07:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7oqLTL7FjBg9HY0sSGI6aFeDyE5SlvMfM0+YrnIr+68=;
        b=Atd9mx4JpjunbEpNR7TNWvwyTyETx6qDOvp97IDKjuJTY1mJQSjeNoxql0+iEjipq0
         KaofdjWx/iKlZyWZJJCv0hYUrqiZ5zesO8EdThpKVwQz5i2qFJ6yIBh9q/c7WL5eDYCF
         5cvEt94MNbuK5IB+RQlRqM5/QimHOzLHo5rtXWAvFcSr5rTDeQtq3DP2zKwZwf9a6meG
         HTA1nR68lGU4OZjdA/udYUwaHYVgBkwuDv/ekLr4Bl/jtCkr8eCtuJT6OXvVj6d7j9FV
         QShBLoMocfIg11hN6D2ft2nj7G0Td6QkYhYO5EkcFklqbSttTJyp9KOEggXcEwpp1G0M
         DlcA==
X-Gm-Message-State: AOAM533ZCARvxa5IgsOp2CYclTVAxLVqM7PXMimvD4wRiibiVkCtJ5OE
        flNw2bjEDkB2dyfmL/BVIQ==
X-Google-Smtp-Source: ABdhPJzFifVNTAoqHLiYvOi6iZntw6lonma1dt6TUb3/duVMgdwGynueJoTcanI8AUD76d8GTty0HQ==
X-Received: by 2002:a54:4719:: with SMTP id k25mr10005129oik.174.1619794792956;
        Fri, 30 Apr 2021 07:59:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n105sm782562ota.45.2021.04.30.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:59:51 -0700 (PDT)
Received: (nullmailer pid 3313764 invoked by uid 1000);
        Fri, 30 Apr 2021 14:59:50 -0000
Date:   Fri, 30 Apr 2021 09:59:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        mathieu.poirier@linaro.org, swboyd@chromium.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH 01/12] dt-bindings: soc: qcom: aoss: Drop power-domain
 bindings
Message-ID: <20210430145950.GA3311658@robh.at.kernel.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618574638-5117-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 16, 2021 at 05:33:47PM +0530, Sibi Sankar wrote:
> Drop power-domain bindings exposed by AOSS QMP node.

That's obvious from the diff. The commit msg should tell us why.

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt       | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> index 783dc81b0f26..c0ae051a5b76 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -9,8 +9,7 @@ Messaging Protocol (QMP)
>  
>  The AOSS side channel exposes control over a set of resources, used to control
>  a set of debug related clocks and to affect the low power state of resources
> -related to the secondary subsystems. These resources are exposed as a set of
> -power-domains.
> +related to the secondary subsystems.
>  
>  - compatible:
>  	Usage: required
> @@ -46,14 +45,6 @@ power-domains.
>  	Definition: must be 0
>  		    The single clock represents the QDSS clock.
>  
> -- #power-domain-cells:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: must be 1
> -		    The provided power-domains are:
> -		    CDSP state (0), LPASS state (1), modem state (2), SLPI
> -		    state (3), SPSS state (4) and Venus state (5).
> -
>  = SUBNODES
>  The AOSS side channel also provides the controls for three cooling devices,
>  these are expressed as subnodes of the QMP node. The name of the node is used
> @@ -66,8 +57,7 @@ to identify the resource and must therefor be "cx", "mx" or "ebi".
>  
>  = EXAMPLE
>  
> -The following example represents the AOSS side-channel message RAM and the
> -mechanism exposing the power-domains, as found in SDM845.
> +The following example represents the AOSS side-channel message RAM as found in SDM845.
>  
>    aoss_qmp: qmp@c300000 {
>  	  compatible = "qcom,sdm845-aoss-qmp";
> @@ -75,8 +65,6 @@ mechanism exposing the power-domains, as found in SDM845.
>  	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
>  	  mboxes = <&apss_shared 0>;
>  
> -	  #power-domain-cells = <1>;
> -
>  	  cx_cdev: cx {
>  		#cooling-cells = <2>;
>  	  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
