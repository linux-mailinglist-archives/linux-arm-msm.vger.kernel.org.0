Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62171FD0BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFQPTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgFQPTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:19:05 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25C7C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:19:04 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so2237289wmh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s8n+t7GKh3Gj29VbKmMJNzCidqU4PlfPQU8WVnQB0IA=;
        b=I7REmT73IfDFvu63aqYDtJbNMihndgSlsHwxtwEaifjpmkJiPPPYmo/UmhKIreG01j
         U1MCIyLANCzR3zsOFnAb4VdQiJHfPANnqXofkWP++8FiU/FRzt3hOP23SQkBB4zK8rVR
         2EE7/0qNK2ZKCpEJ5F6q1Qaar/+q1Hc2wwwy0HBo9uw8F5lqHmvg+tesCc/zmASpcDQr
         ef3BYwgN3Y6INjYRMHhdnusDXnEX9Xuscrabua6sBF7vlW22VYSKSSoj+06NUp51nl89
         vfofMnX18zAFF4Uc80NV483Uf8oqUxadFMAzb66FwkvbAt1x34NFsY169zHLILCBMDT4
         bHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s8n+t7GKh3Gj29VbKmMJNzCidqU4PlfPQU8WVnQB0IA=;
        b=IBEG/ivBS1uoIE/UeNNErHWZNf9CxTgHJyxSqIWgSct5g2yTRScvzQuTXWhIlgCHCx
         FHBrz3mr43LEWSjOClg9A5BaVG5Z2GGfqR87ZEUv5899XGgUW0HHPKJ/aJ7s+uibLqRV
         QfYtATGvO2Z0/AWVLzsPHgIg62qmu4fEUnhUFhMmYSKCHx4NeJZ6Y9sc/NhEzSuL53Ws
         gCDZGN65UUxupWSK7ygMVXgvWk59J511vUn72aNNZ/UWB3JFjfUhIs6jz+7C6a5JXS8X
         Z8JN9cCHinmwSizqxX9fRzDO1RPRmjjFcAIBAcU+axYd+Zp/GUuBTgdrrBVNr0eCVsC1
         3ANg==
X-Gm-Message-State: AOAM533UKYMDK4QFzCTtGTrk/eGVNlo+s1CnGnkLSsWoCRD6JpvXDIEt
        YU58ZHNHxoiUJ8dqr/sQhPT0Dw==
X-Google-Smtp-Source: ABdhPJwSJHXfP8SKdVG5+kRfmeZPSM3QIlEIPVrIYrhG2skOzNwr3S9gC6WwQGn/4TcLlQE8oJA2MA==
X-Received: by 2002:a1c:4189:: with SMTP id o131mr8622246wma.183.1592407143164;
        Wed, 17 Jun 2020 08:19:03 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 89sm7171745wrg.56.2020.06.17.08.19.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 08:19:02 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for
 blowing fuses
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <254998b9-c45e-bd6b-bc9a-b5934c0fea8e@linaro.org>
Date:   Wed, 17 Jun 2020 16:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/06/2020 15:51, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> On some systems it's possible to actually blow the fuses in the qfprom
> from the kernel.  Add properties to support that.
> 
> NOTE: Whether this is possible depends on the BIOS settings and
> whether the kernel has permissions here, so not all boards will be
> able to blow fuses in the kernel.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Add an extra reg range (at 0x6000 offset for SoCs checked)
> - Define two options for reg: 1 item or 4 items.
> - No reg-names.
> - Add "clocks" and "clock-names" to list of properties.
> - Clock is now "sec", not "secclk".
> - Add "vcc-supply" to list of properties.
> - Fixed up example.
> 
>   .../bindings/nvmem/qcom,qfprom.yaml           | 45 ++++++++++++++++++-
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 5efa5e7c4d81..b195212c6193 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -17,8 +17,27 @@ properties:
>       const: qcom,qfprom
>   
>     reg:
> -    items:
> -      - description: The corrected region.
> +    # If the QFPROM is read-only OS image then only the corrected region
> +    # needs to be provided.  If the QFPROM is writable then all 4 regions
> +    # must be provided.
> +    oneOf:
> +      - items:
> +          - description: The corrected region.
> +      - items:
> +          - description: The corrected region.
> +          - description: The raw region.
> +          - description: The config region.
> +          - description: The security control region.
> +
> +  # Clock must be provided if QFPROM is writable from the OS image.
> +  clocks:
> +    maxItems: 1


> +  clock-names:
> +    const: sec

Do we need clock-names for just one clock here?

> +
> +  # Supply reference must be provided if QFPROM is writable from the OS image.
> +  vcc-supply:
> +    description: Our power supply.
>   
>     # Needed if any child nodes are present.
>     "#address-cells":
> @@ -31,6 +50,28 @@ required:
>      - reg
>   
>   examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +    efuse@784000 {
> +      compatible = "qcom,qfprom";
> +      reg = <0 0x00784000 0 0x8ff>,
> +            <0 0x00780000 0 0x7a0>,
> +            <0 0x00782000 0 0x100>,
> +            <0 0x00786000 0 0x1fff>;
> +      clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
> +      clock-names = "sec";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      vcc-supply = <&vreg_l11a_1p8>;
> +
> +      hstx-trim-primary@25b {
> +        reg = <0x25b 0x1>;
> +        bits = <1 3>;
> +      };
> +    };
> +
>     - |
>       efuse@784000 {
>         compatible = "qcom,qfprom";
> 
