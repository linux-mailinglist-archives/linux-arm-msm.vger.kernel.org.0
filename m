Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5526841276C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 22:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhITUoI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 16:44:08 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46649 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhITUmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 16:42:08 -0400
Received: by mail-ot1-f43.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso25304155otr.13;
        Mon, 20 Sep 2021 13:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XQfBkyxcnpFDWr8Mv2qU5aEkU/ePQ/ccdR6CWROptdM=;
        b=t6ITI6dpfetnsbezLgwpn1DToC/n0t0/J2Ya3zpnM2VyF+SC1vUk5KjYsJvdgqbFDu
         CtcTTtZVIUV1VottuKHGarATzaie1H57WzJNPRm/Ff/r9pzCepLrT23/V0UctS9AXbTO
         YsNwI3lKwJ+gGcvL3F9oWg48Ob1mRMYdskUfgQm/X7s3jWIqR9m0BQpVZaRLp3l1qpS4
         L2KbHbea6BrOX8EJjJsLsdFVsIBCVQeeR7AzIPzLZZyQxdM2eXmz9zdileKN2FFnSwIv
         SqXrQIQZleK0+l5IDgtVVjfKY+c49xttEKjQW011D+P2LeJMWuGZGMrGZtTxjFtKOS3j
         1wmA==
X-Gm-Message-State: AOAM532pQcAvwJMoSH2qkX+geiQ1eiqRS+TiY+8V8yhBHMF4oiVKovsW
        C0wr3u78UPEC8NpP9ZiaRZcNUCpoVw==
X-Google-Smtp-Source: ABdhPJx5C21c6ugEjGBz0jMaQ38Z+t9k2bOlXXGsQUNkAc5zOzx+48Adu0nx01bsJD60uutCywtDrA==
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr23078469otj.208.1632170440898;
        Mon, 20 Sep 2021 13:40:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v2sm3693372ooh.28.2021.09.20.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:40:40 -0700 (PDT)
Received: (nullmailer pid 717119 invoked by uid 1000);
        Mon, 20 Sep 2021 20:40:38 -0000
Date:   Mon, 20 Sep 2021 15:40:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Message-ID: <YUjxxnz9BFS7/WDK@robh.at.kernel.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 17, 2021 at 04:15:35PM +0530, Satya Priya wrote:
> Add pm8008-regulator node and example.
> 
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index ec3138c..de182f8 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -45,6 +45,10 @@ properties:
>      const: 0
>  
>  patternProperties:
> +  "^pm8008[a-z]?-regulator$":

Is more than 1 node possible for a given PMIC? If not use 'regulators' 
for the node name.

> +    type: object
> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
> +
>    "^gpio@[0-9a-f]+$":
>      type: object
>  
> @@ -122,6 +126,26 @@ examples:
>            interrupt-controller;
>            #interrupt-cells = <2>;
>          };
> +
> +        pm8008-regulator {
> +          compatible = "qcom,pm8008-regulator";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          vdd_l1_l2-supply = <&vreg_s8b_1p2>;
> +          vdd_l3_l4-supply = <&vreg_s1b_1p8>;
> +          vdd_l5-supply = <&vreg_bob>;
> +          vdd_l6-supply = <&vreg_bob>;
> +          vdd_l7-supply = <&vreg_bob>;
> +
> +          pm8008_l1: regulator@4000 {
> +            reg = <0x4000>;
> +            regulator-name = "pm8008_l1";
> +            regulator-min-microvolt = <950000>;
> +            regulator-max-microvolt = <1300000>;
> +            qcom,min-dropout-voltage = <96000>;
> +          };
> +        };
>        };
>      };
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> 
