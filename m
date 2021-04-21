Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C530F3670F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Apr 2021 19:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbhDURKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 13:10:53 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33337 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbhDURKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 13:10:47 -0400
Received: by mail-ot1-f53.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso17090841otl.0;
        Wed, 21 Apr 2021 10:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e0xWzzrYHgN7CwVeKC5YSWwbefoDagQfjjCSIuIGdkk=;
        b=GJjakUme88UXAIo3Hp7GGOq45grhSO63FKN8D6v8Paw7tZwAV+W2IFfTzEdIeA5BUj
         ksuafC+8FSmKXjApUmTNxejzdD2PAuzCd82nyFhQgVqEoHZ2OieU1t/hqhzPHABl7cpX
         ZDpSWgoAS1XFMXnbN1Am+OgwbRMTO/tj4LyKHyx+YCHKqqntYzTIoo9KPYnLwUh+1JTP
         CMjv3bWtpKL5gGHNSfHN7S7ffM/HprKZfj6asSN1Aho0kfRUlGHLvSy2y6+teG61e0KS
         IlctDIF61LU6cJUpOup7pvYogL176sy5j9fTnDlEQDPnINkBsU1MkBEvSevuOH3IlTSm
         R1WQ==
X-Gm-Message-State: AOAM532NB3h4WMCQFkvmEtZbMoTNKg9MfeIT4r8xdKnnys/NWkT3EUC7
        lgI9vKy1nNp3rAFB0MJoPKsHtOh48g==
X-Google-Smtp-Source: ABdhPJypK4E7aeXDEY++vjKPabPUUmMwWk6RUH2mGwu/pJkMcLh3KjbnujNyOy8QDhNdXav2oMUGIg==
X-Received: by 2002:a9d:39e4:: with SMTP id y91mr22109670otb.277.1619025013631;
        Wed, 21 Apr 2021 10:10:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j4sm590199oiw.0.2021.04.21.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:10:12 -0700 (PDT)
Received: (nullmailer pid 1306257 invoked by uid 1000);
        Wed, 21 Apr 2021 17:10:09 -0000
Date:   Wed, 21 Apr 2021 12:10:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v2 2/3] dt-bindings: net: bluetooth: Convert to DT schema
Message-ID: <20210421171009.GA1300559@robh.at.kernel.org>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
 <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 20, 2021 at 09:56:49PM +0530, Venkata Lakshmi Narayana Gubba wrote:
> Converted Qualcomm Bluetooth binidings to DT schema.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt | 69 -----------------
>  .../bindings/net/qualcomm-bluetooth.yaml           | 87 ++++++++++++++++++++++
>  2 files changed, 87 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml

> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> new file mode 100644
> index 0000000..55cd995
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Bluetooth Chips
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +  - Marcel Holtmann <marcel@holtmann.org>

This should be someone that knows and cares about this h/w. I don't.

> +
> +description:
> +  This binding describes Qualcomm UART-attached bluetooth chips.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qca6174-bt
> +      - qcom,qca9377-bt
> +      - qcom,wcn3990-bt
> +      - qcom,wcn3991-bt
> +      - qcom,wcn3998-bt
> +      - qcom,qca6390-bt      
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: gpio specifier used to enable chip
> +   
> +  clocks:
> +    maxItems: 1
> +    description: clock provided to the controller (SUSCLK_32KHZ)
> +
> +  vddio-supply:
> +    description: VDD_IO supply regulator handle
> +
> +  vddxo-supply:
> +    description: VDD_XO supply regulator handle
> +
> +  vddrf-supply:
> +    description: VDD_RF supply regulator handle
> +
> +  vddch0-supply:
> +    description: VDD_CH0 supply regulator handle
> +
> +  max-speed: 
> +    description: see Documentation/devicetree/bindings/serial/serial.yaml
> +
> +  firmware-name:
> +    description: specify the name of nvm firmware to load
> +
> +  local-bd-address:
> +    description: see Documentation/devicetree/bindings/net/bluetooth.txt
> +
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    uart {
> +        label = "BT-UART";

Why do you need a label for in internal port where you've described the 
connection?

> +        status = "okay";

Don't show status in examples.

> +
> +        bluetooth {
> +            compatible = "qcom,qca6174-bt";
> +            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
> +            clocks = <&divclk4>;
> +            firmware-name = "nvm_00440302.bin";
> +        };
> +    };
> +  - |
> +    uart {
> +
> +        bluetooth {
> +            compatible = "qcom,wcn3990-bt";
> +            vddio-supply = <&vreg_s4a_1p8>;
> +            vddxo-supply = <&vreg_l7a_1p8>;
> +            vddrf-supply = <&vreg_l17a_1p3>;
> +            vddch0-supply = <&vreg_l25a_3p3>;
> +            max-speed = <3200000>;
> +            firmware-name = "crnv21.bin";		
> +        };
> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
