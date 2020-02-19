Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA3716525F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 23:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgBSWUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 17:20:20 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43843 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSWUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 17:20:20 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so25458858oif.10;
        Wed, 19 Feb 2020 14:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HoqrxNkiO4sNPwbZAyhaFYleU66OIoSnWRCO5MqVWZA=;
        b=ZTCklV0BuzC4L+j3fRoPF8bl1T6doR7H0Ny7qEIAp1J95CtoSXV20NKcNgjxW5d5v/
         uS8oNn6YeC7vNERD3R0QhOMfG942CjAI3YUwJrJ0OpRiu+YWvXPGJ9xEU09WhO5UDRjA
         LWGwNSw+jt/IViAWUGOeIKByoE4wViEVn71CTFm2Pt19MDoNKBxki//BSB6MHCRVE22Q
         TkOlJQsdAKRIujcdsFrz8kj23x+8Dln+4BzbDzVsZMOhY54lHL4QD5RwgoZtiCZPl7VK
         q1U+VEaGAdiODhV+Nj9WMKnCrWaRiuhKaaKShSAZjdD3o6qhJj2gFcfCon6SLL4mv8EJ
         sCZA==
X-Gm-Message-State: APjAAAWrhxQkk1SDgq5xSDXXrVtJw3uXZst6SoW1YJ6yM+LpCXfoNpvE
        S1c9nEeVBegaBn7gNA/jIA==
X-Google-Smtp-Source: APXvYqweTSoqkjBqa80EjYR38p/0rwqrjoj1Bwt52lzGyBMpICjKEyD3wwxsGLI2bekiwMC9Vj24bA==
X-Received: by 2002:aca:190b:: with SMTP id l11mr6388881oii.65.1582150820064;
        Wed, 19 Feb 2020 14:20:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f3sm375970oto.57.2020.02.19.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:20:19 -0800 (PST)
Received: (nullmailer pid 9018 invoked by uid 1000);
        Wed, 19 Feb 2020 22:20:18 -0000
Date:   Wed, 19 Feb 2020 16:20:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: arm: qcom: Add sdm630 and sdm660 SoCs
Message-ID: <20200219222018.GA6988@bogus>
References: <20200212170916.7494-1-alexey.min@gmail.com>
 <20200212170916.7494-4-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212170916.7494-4-alexey.min@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 08:09:14PM +0300, Alexey Minnekhanov wrote:
> Add a SoC strings for the Qualcomm SDM630 and SDM660 SoCs.
> Also document the new xiaomi,lavender compatible used in
> a device tree binding.
> 
> Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 529d924931f1..c5af92acd427 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -36,6 +36,8 @@ description: |
>          msm8994
>          msm8996
>          sc7180
> +        sdm630
> +        sdm660
>          sdm845
>  
>    The 'board' element must be one of the following strings:
> @@ -125,6 +127,11 @@ properties:
>                - samsung,a5u-eur
>            - const: qcom,msm8916
>  
> +      - items:
> +          - enum:
> +              - xiaomi,lavender
> +          - const: qcom,sdm660

I think you want to keep this sorted by the compatible string and not be 
in the middle of msm89xx.

> +
>        - items:
>            - const: qcom,msm8996-mtp
>  
> -- 
> 2.20.1
> 
