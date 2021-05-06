Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA86B375C2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 22:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbhEFU2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 16:28:30 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33711 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhEFU23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 16:28:29 -0400
Received: by mail-ot1-f49.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so2039182oto.0;
        Thu, 06 May 2021 13:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=itqPIgMSRUm7mjLuAMIStPX3IirpKll5U1amEMt59hU=;
        b=NId6L8dlVh0j874adHL5WWBbV2/xQX9ssnc4pmWkxC2MJ+PKdmXxFUdheVQIf6oqbi
         0OvvvsVWhpvNZdUXvIwgPHKGmk+9TMpjuk/GA5lxgYsl/0CDpwEZwY/zQHIjMghC0FU+
         nMPcKygNc6a01SQvFb4nETaf3OtKV+oeBVSCElR/H41R3NpWqX3aXX9ZiYsLQMp4HK45
         50J34/zcvRRZLhwIftAziDn6RMfyvbkgy5xst73NVspAoi433BxZJDmQRdPwtysYjufK
         EEtJVwn7AhLHtYt/3CM6EFDjScSrFQoHnjTpLSwygIUgpw7c+tTpwuv1A0qRqOxExHkG
         30/w==
X-Gm-Message-State: AOAM531yME04fH0oV6YdBuhfgYquD6nsZYxyJhascRgrzpCSiyp38o8/
        KYn8Yc76RIFC9JpW+QCuwbMPJkZXVA==
X-Google-Smtp-Source: ABdhPJylItoM595UGV/4yqDvwNAmHRcH3hYhsGZVyPxxAwPv63lCNxd5mL71+50GRRhJp8CY6zqWYA==
X-Received: by 2002:a05:6830:33ea:: with SMTP id i10mr5157809otu.212.1620332849774;
        Thu, 06 May 2021 13:27:29 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l131sm592786oia.0.2021.05.06.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:27:28 -0700 (PDT)
Received: (nullmailer pid 748504 invoked by uid 1000);
        Thu, 06 May 2021 20:27:26 -0000
Date:   Thu, 6 May 2021 15:27:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: update qcom,a53pll bindings for
 MSM8939 support
Message-ID: <20210506202726.GA744866@robh.at.kernel.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504052844.21096-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 04, 2021 at 01:28:41PM +0800, Shawn Guo wrote:
> Update qcom,a53pll bindings for MSM8939 support:
> 
>  - Add optional clock-output-names property.
>  - Add MSM8939 specific compatibles.
>  - Add MSM8939 examples.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> index db3d0ea6bc7a..7a410a76be2f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -18,6 +18,9 @@ properties:
>      enum:
>        - qcom,ipq6018-a53pll
>        - qcom,msm8916-a53pll
> +      - qcom,msm8939-a53pll-c0
> +      - qcom,msm8939-a53pll-c1
> +      - qcom,msm8939-a53pll-cci

These 3 have differences?

>  
>    reg:
>      maxItems: 1
> @@ -33,6 +36,9 @@ properties:
>      items:
>        - const: xo
>  
> +  clock-output-names:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -57,3 +63,31 @@ examples:
>          clocks = <&xo>;
>          clock-names = "xo";
>      };
> +  #Example 3 - A53 PLLs found on MSM8939 devices
> +  - |
> +    a53pll_c1: clock-controller@b016000 {
> +        compatible = "qcom,msm8939-a53pll-c1";
> +        reg = <0xb016000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo_board>;
> +        clock-names = "xo";
> +        clock-output-names = "a53pll_c1";
> +    };
> +
> +    a53pll_c0: clock-controller@b116000 {
> +        compatible = "qcom,msm8939-a53pll-c0";
> +        reg = <0xb116000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo_board>;
> +        clock-names = "xo";
> +        clock-output-names = "a53pll_c0";
> +    };
> +
> +    a53pll_cci: clock-controller@b1d0000 {
> +        compatible = "qcom,msm8939-a53pll-cci";
> +        reg = <0xb1d0000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo_board>;
> +        clock-names = "xo";
> +        clock-output-names = "a53pll_cci";
> +    };

Do these examples really add anything?
