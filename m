Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77009403AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 15:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349395AbhIHNxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 09:53:04 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:34735 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhIHNxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 09:53:04 -0400
Received: by mail-oi1-f171.google.com with SMTP id p2so3198826oif.1;
        Wed, 08 Sep 2021 06:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pEsLDpR68NxsgI58XlZ6vfPJ266F/Xx5IhFzF3aWT6g=;
        b=3egKp1hv9bxpbaw2T7cM1feFSm8B3ZuHdccTTThv4C9D0P2O3EYotQL9erkd8oUqqG
         UD8hvlqm+UZg22UKNzd1S7WhPM3PZ8P8T83EEfY64DwVsEtpMUgox+VDHBlpyNIQNe20
         G1SlquaN+gFllci6AErgd2lJWlRycs4YE34Fgycu7ATkaL0pNIGqGwJcV458VoyQumX6
         Xzbepfyjk1JRcZhbZ3NUi1g8inGvPFb7/cuuSipvDDGkpIa9MTYoxWC7Efwoab4e8Md4
         XBNn58H/I3acx4pbMci4SLlYi45dO0Qz/N3fFiFGgwjRslzjxx/yJOWwKaRzX8FQ188U
         AWLg==
X-Gm-Message-State: AOAM532FsGUjnOdL3s7rae29xvuM/z8t2uWrUo/jGyfCdkXdNlgJteew
        Fmg3aK1tunKva4jz9omCfw==
X-Google-Smtp-Source: ABdhPJw2/UKvmNd6BGU4nmPAvQbO3JPsiAevs65B944KNRSDH0hj9t0IkwClmrz51yydykOcu1971g==
X-Received: by 2002:a05:6808:196:: with SMTP id w22mr2490182oic.139.1631109116076;
        Wed, 08 Sep 2021 06:51:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b2sm429860ook.46.2021.09.08.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 06:51:55 -0700 (PDT)
Received: (nullmailer pid 2028743 invoked by uid 1000);
        Wed, 08 Sep 2021 13:51:53 -0000
Date:   Wed, 8 Sep 2021 08:51:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v6 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 property
Message-ID: <YTi/+VIOuja9eLbl@robh.at.kernel.org>
References: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
 <1630916637-4278-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630916637-4278-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 06, 2021 at 01:53:46PM +0530, Sibi Sankar wrote:
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
> 
> Due to the current broken load state implementation, we can afford the
> binding breakage that ensues and the remoteproc functionality will remain
> the same when using newer kernels with older dtbs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> v6:
>  * Updated commit message to explain binding breakage. [Stephen]
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 61 +++++++++++-----------
>  1 file changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 0c112f3264a9..0d2b5bd4907a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -93,6 +93,10 @@ properties:
>      maxItems: 1
>      description: Reference to the reserved-memory for the Hexagon core
>  
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +

[...]

> @@ -511,6 +486,32 @@ allOf:
>              - const: mss_restart
>              - const: pdc_reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-mpss-pas
> +              - qcom,sc8180x-adsp-pas
> +              - qcom,sc8180x-cdsp-pas
> +              - qcom,sc8180x-mpss-pas
> +              - qcom,sm8150-adsp-pas
> +              - qcom,sm8150-cdsp-pas
> +              - qcom,sm8150-mpss-pas
> +              - qcom,sm8150-slpi-pas
> +              - qcom,sm8250-adsp-pas
> +              - qcom,sm8250-cdsp-pas
> +              - qcom,sm8250-slpi-pas
> +              - qcom,sm8350-adsp-pas
> +              - qcom,sm8350-cdsp-pas
> +              - qcom,sm8350-mpss-pas
> +              - qcom,sm8350-slpi-pas
> +    then:
> +      properties:
> +        qcom,qmp:
> +          items:
> +            - description: Reference to the AOSS side-channel message RAM.

This doesn't do anything. The property is already allowed for all 
compatibles. Perhaps you want to negate the if and put 'qcom,qmp: false' 
here.

Rob
