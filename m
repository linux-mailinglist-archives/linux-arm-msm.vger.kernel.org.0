Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D6B297351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373957AbgJWQOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:14:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39863 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373717AbgJWQOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:14:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id o14so1845938otj.6;
        Fri, 23 Oct 2020 09:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5kEMkxgoNy8opPw6UXfyf4QLqQ2OLwQLchsFqtash4=;
        b=lQcf7cUvABdljs7fFBsZoHPOYkHphueceiYWvewCFa3aAdLPDoiNS4fmC6IT5mSV4d
         1+CSNhDy7igPyQZSy4+/bsHs+ebOCNiy7xQQJcVoVeELdeGSsjIrV9HKTBMVAJbhCXDy
         3ubsx79PV9KY3pZOotor7BvlKkD2SWTLisf1bSTVSRFVYNhxqm3ygisGMplbz2ShD+FH
         fErB560cavcnLskFsJVYgT0x67Q4KmoVsToza9to5Qo/gm14ybPegODWkp2YslMlgGT+
         UVOhRyTrhG1oRvbBpzqZPRyvHY7Weo4ldUEiR6eIzfF1GGR3A7qmHrNgQ83TY6ZuPRro
         tlvg==
X-Gm-Message-State: AOAM530+M2oq/TMIRroLQL0cLlN2WZssuCHN6DZJ7HsDAtbexWa09UXF
        byk9yuBRx9HWra/oPqlrFg==
X-Google-Smtp-Source: ABdhPJyUjfbHr6xN04JIBsg0WDXstw5xbJMCSdRySq+1FAwZdB8MgmRXyAgRA24B7zWiR1WlXWIoKw==
X-Received: by 2002:a9d:2d85:: with SMTP id g5mr2337017otb.300.1603469651106;
        Fri, 23 Oct 2020 09:14:11 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k6sm485546otp.33.2020.10.23.09.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:14:10 -0700 (PDT)
Received: (nullmailer pid 2800012 invoked by uid 1000);
        Fri, 23 Oct 2020 16:14:09 -0000
Date:   Fri, 23 Oct 2020 11:14:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [PATCH v3 1/2] bindings: pm8941-misc: Convert to YAML and add
 support for VBUS detection
Message-ID: <20201023161409.GB2790207@bogus>
References: <cover.1603403020.git.gurus@codeaurora.org>
 <b63ffcc19639f69aaba1072c059ca79e4081e6ef.1603403020.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b63ffcc19639f69aaba1072c059ca79e4081e6ef.1603403020.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 02:47:43PM -0700, Guru Das Srinagesh wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> Convert bindings to YAML. Also add compatible string that adds support
> for reporting the VBUS status that can be detected via a dedicated PMIC
> pin.

Converting to yaml and add Vbus support should be 2 patches.

Really, the main pm8941 needs to be converted and then this one 
referenced by it.

> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/extcon/qcom,pm8941-misc.txt           | 41 --------------
>  .../bindings/extcon/qcom,pm8941-misc.yaml          | 65 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> deleted file mode 100644
> index 35383adb..0000000
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Qualcomm's PM8941 USB ID Extcon device
> -
> -Some Qualcomm PMICs have a "misc" module that can be used to detect when
> -the USB ID pin has been pulled low or high.
> -
> -PROPERTIES
> -
> -- compatible:
> -    Usage: required
> -    Value type: <string>
> -    Definition: Should contain "qcom,pm8941-misc";
> -
> -- reg:
> -    Usage: required
> -    Value type: <u32>
> -    Definition: Should contain the offset to the misc address space
> -
> -- interrupts:
> -    Usage: required
> -    Value type: <prop-encoded-array>
> -    Definition: Should contain the usb id interrupt
> -
> -- interrupt-names:
> -    Usage: required
> -    Value type: <stringlist>
> -    Definition: Should contain the string "usb_id" for the usb id interrupt
> -
> -Example:
> -
> -	pmic {
> -		usb_id: misc@900 {
> -			compatible = "qcom,pm8941-misc";
> -			reg = <0x900>;
> -			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> -			interrupt-names = "usb_id";
> -		};
> -	}
> -
> -	usb-controller {
> -		extcon = <&usb_id>;
> -	};
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> new file mode 100644
> index 0000000..f422546
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/extcon/qcom,pm8941-misc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8941 USB ID Extcon device
> +
> +maintainers:
> +  - Guru Das Srinagesh <gurus@codeaurora.org>
> +
> +description: |
> +  Some Qualcomm PMICs have a "misc" module that can be used to detect when
> +  the USB ID pin has been pulled low or high.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Don't need oneOf for a single entry.

> +          - enum:
> +              - qcom,pm8941-misc
> +              - qcom,pmd-vbus-det
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2

Need 'minItems: 1' if 1 or 2 interrupts is valid.

> +
> +  interrupt-names:
> +    anyOf:
> +      - items:

Don't need 'anyOf'

> +          - enum:
> +              - usb_id
> +              - usb_vbus

I think what you want here is:

minItems: 1
items:
  - const: usb_id
  - const: usb_vbus

Meaning 'usb_id' is always present and 'usb_vbus' is optional 2nd 
interrupt.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupt-controller;
> +            #interrupt-cells = <4>;
> +
> +            usb_id: misc@900 {
> +                    compatible = "qcom,pm8941-misc";
> +                    reg = <0x900>;
> +                    interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> +                    interrupt-names = "usb_id";
> +            };
> +    };
> +
> +    usb-controller {
> +           extcon = <&usb_id>;
> +    };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
