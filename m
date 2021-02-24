Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C903242A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbhBXQ4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 11:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235785AbhBXQzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 11:55:33 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07D2C06178B;
        Wed, 24 Feb 2021 08:54:49 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id t26so1841220pgv.3;
        Wed, 24 Feb 2021 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bxTAN9CdPuyW7WQm4KkzcjERhkb6fpyoIb8CsEryTWU=;
        b=ne/3PrrXcP3z17ttRgC2E0DKcuSI9yYf/IJ8IjzYS21PZ7N1KIt0ZUE/LghXr0t6VO
         nXGi/ifUYaapiHvyRKAwXYQ12GsqrcWavoZ9qsRWAHImlpgG4CsK/lhEk6e5ieGrDPsL
         6Xqw7OTnVPoM2mrs0D4wxXRWOoPyMhA3UJ59MzTUG5KeWoe5qpgTnmwBq02KQpSH9bBV
         HQNr+fp3KvY/4wBpjrA6fb7BASczsBJ/cWyHfzCfiUMUVDUy7A7Yaoh0WJpDKVsVNQda
         x5sACWDQdmzhIljcrunE3EyCuWuC+lwvAc8QswO2r/jzfh0eu7rtbSfchHpC3YMs0BUS
         UOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bxTAN9CdPuyW7WQm4KkzcjERhkb6fpyoIb8CsEryTWU=;
        b=kV/4KDeJGaw/RlrcAGGO0niiTpCy1DPQfdjN+OCxWfGm62oqFF/Dl+I4UHsMcXwC5z
         gJc2FJ2qRuz0iVyXgYFG2tfLyP55qB/nDM1fXuq0trPpwil5t00tM53ADgQB86L19M60
         hrYY9lNpjbg/ALZEOPNp2buy/ZXzIm2CuBe1tY+j5CvD7elzTXeN62maZHapodeaFvnO
         oiNjuD20SZYPny9Bj4lp+uOAbC2VlzDUWTMd9W4Gy+l8O8vm34NZ/NSj6xfuKVFcO6fP
         df64GkXv8q98/Sc6k8HW75scQjZz8nIjl4qK2AqmNEGua8064HTk96VR+zmNl8EKK+OT
         uPqw==
X-Gm-Message-State: AOAM531JIKildTWigXZgBEJ57Mkb7kVAuAX2RJWHu8RrYlA+D67RejqF
        WNQvdbzdjAVS2wpi/Rr5UbA=
X-Google-Smtp-Source: ABdhPJzNP4ZECxhTYf+3Fb5cSjyflmttDFFz13qy8kM3PmJJr8UCmHkCKTTkop2kTnNPYcdR/slQRw==
X-Received: by 2002:a63:df01:: with SMTP id u1mr29839166pgg.341.1614185689486;
        Wed, 24 Feb 2021 08:54:49 -0800 (PST)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id j3sm2905009pgk.24.2021.02.24.08.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 08:54:48 -0800 (PST)
Subject: Re: [RESEND PATCH v6 1/3] bindings: pm8941-misc: Convert bindings to
 YAML
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
 <b8dcd61fdd8674b79d81c94b424fce79b86d8979.1611621365.git.gurus@codeaurora.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <294a35ec-7aab-4f06-a913-d1e8ca73fb29@gmail.com>
Date:   Thu, 25 Feb 2021 01:54:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b8dcd61fdd8674b79d81c94b424fce79b86d8979.1611621365.git.gurus@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21. 1. 26. 오전 9:38, Guru Das Srinagesh wrote:
> Convert bindings from txt to YAML.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ---------------
>   .../bindings/extcon/qcom,pm8941-misc.yaml          | 59 ++++++++++++++++++++++
>   2 files changed, 59 insertions(+), 41 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
>   create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
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
> index 0000000..e8eea83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -0,0 +1,59 @@
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
> +    items:
> +      - const: qcom,pm8941-misc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: usb_id
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
> 

Applied it.

Thanks,
Chanwoo Choi
