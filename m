Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C2638BB9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 03:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbhEUBf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 21:35:58 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:38479 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhEUBf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 21:35:58 -0400
Received: by mail-ot1-f50.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so5455970otk.5;
        Thu, 20 May 2021 18:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3KqOTz9cT/tMGazvO6ygfWRH83+WMkUtMMTtE+XYBxA=;
        b=kZrMJ1DFuhJ0GflHPjgWbnq62retvot6Npmjr5AhGl8rpWIDpNVx6Hf6HPK/rhpvYz
         HE2ErOw1QU5yxWolLGt0FoC2DG5c8JYmO7dEXnQEuyPEqK8YUdgbexBD1BnidnMw9AMY
         0HcmvmI5orEuAfEFG3Q00K3MhIofxUbRKDNJJ3ikvkZukvw2nrllSVkITnX/IPi5XeFj
         FHtI0j/UK0scIuS75zAmRjCKkQB1QrvFNb/UL9e22PwwzD3lkpLF13HTo2Wv/J3XQVoB
         FDFuH25Ti8H6SCMU+x0BqajvcMsG4H3ZLXhWIaF5hZsCMyof9Ny49a3TmuAK4TbUnzkJ
         sVzQ==
X-Gm-Message-State: AOAM530o1erhXcC99cmrePoDnwBeS+NeblvbFByNxFTYGKhVuhWlYnuG
        8y49qajfLZWNAuSq4QrQBw==
X-Google-Smtp-Source: ABdhPJzmbsE+MBBALY8bY0mc0707ALUDDAjpaj9ywMzau2Qc943lqRlg9iB21wwTszXE/JmSOHoVdA==
X-Received: by 2002:a9d:26a:: with SMTP id 97mr6010018otb.140.1621560875317;
        Thu, 20 May 2021 18:34:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w10sm933386ott.75.2021.05.20.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:34:34 -0700 (PDT)
Received: (nullmailer pid 2450536 invoked by uid 1000);
        Fri, 21 May 2021 01:34:33 -0000
Date:   Thu, 20 May 2021 20:34:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Robert Marko <robert.marko@sartura.hr>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pwm: add IPQ6018 binding
Message-ID: <20210521013433.GA2444011@robh.at.kernel.org>
References: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
 <12137bb3caf68d43e7fbbb60d9f600145eb78507.1621410526.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12137bb3caf68d43e7fbbb60d9f600145eb78507.1621410526.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 10:48:45AM +0300, Baruch Siach wrote:
> DT binding for the PWM block in Qualcomm IPQ6018 SoC.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../devicetree/bindings/pwm/ipq-pwm.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/ipq-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml b/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml
> new file mode 100644
> index 000000000000..a98f20664702
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/ipq-pwm.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/ipq-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ6018 PWM controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +properties:
> +  "#pwm-cells":
> +    description: |
> +      Should be set to 2.

constraints, not free form text:

const: 2

> +
> +  compatible:
> +    const: qcom,pwm-ipq6018
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: core
> +
> +required:
> +  - "#pwm-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pwm@1941010 {
> +            #pwm-cells = <2>;
> +            compatible = "qcom,pwm-ipq6018";
> +            reg = <0x0 0x1941010 0x0 0x20>;
> +            clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +            clock-names = "core";
> +        };
> +    };
> -- 
> 2.30.2
> 
