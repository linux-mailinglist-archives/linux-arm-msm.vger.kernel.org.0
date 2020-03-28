Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3861967BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 17:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgC1QvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 12:51:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgC1QvW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 12:51:22 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97539206DB;
        Sat, 28 Mar 2020 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585414281;
        bh=KsSPe/QT3K68IMZDlw8KBKFDmyfCgZAxFP7esvCzWTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jQ+DpCt34h2CqkDca2bhT+5JHTgNN9cESX0DSrX37H7NqF/6Ny3KuwveCrEOvEUfi
         AjTCKayhWm7D0D94dpTd6ESwTl11jlSCuPGHp382PcvL4x4lJKF7mUAVpJ5sidzFSI
         ANO9nYsxfSliDiTDOLLLCi9c+JwZK+4RwSYC8XbQ=
Date:   Sat, 28 Mar 2020 16:51:13 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, linus.walleij@linaro.org, sboyd@codeaurora.org,
        Jonathan.Cameron@huawei.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, linux-iio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: adc: Convert the QCOM SPMI ADC bindings to
 .yaml format
Message-ID: <20200328165113.6fdeedd3@archlinux>
In-Reply-To: <1585064650-16235-2-git-send-email-jprakash@codeaurora.org>
References: <1585064650-16235-1-git-send-email-jprakash@codeaurora.org>
        <1585064650-16235-2-git-send-email-jprakash@codeaurora.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Mar 2020 21:14:08 +0530
Jishnu Prakash <jprakash@codeaurora.org> wrote:

> Convert the adc bindings from .txt to .yaml format.
> 
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
Hi Jishnu,

Looks to me like we can tighten the checks a fair bit in here rather
than just using uint32s

Now, my yaml isn't great so I won't try to say how, but there are plenty
of examples in tree.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 173 --------------------
>  .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 178 +++++++++++++++++++++
>  2 files changed, 178 insertions(+), 173 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> deleted file mode 100644
> index c878768..0000000
> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -Qualcomm's SPMI PMIC ADC
> -
> -- SPMI PMIC voltage ADC (VADC) provides interface to clients to read
> -  voltage. The VADC is a 15-bit sigma-delta ADC.
> -- SPMI PMIC5 voltage ADC (ADC) provides interface to clients to read
> -  voltage. The VADC is a 16-bit sigma-delta ADC.
> -
> -VADC node:
> -
> -- compatible:
> -    Usage: required
> -    Value type: <string>
> -    Definition: Should contain "qcom,spmi-vadc".
> -                Should contain "qcom,spmi-adc5" for PMIC5 ADC driver.
> -                Should contain "qcom,spmi-adc-rev2" for PMIC rev2 ADC driver.
> -                Should contain "qcom,pms405-adc" for PMS405 PMIC
> -
> -- reg:
> -    Usage: required
> -    Value type: <prop-encoded-array>
> -    Definition: VADC base address in the SPMI PMIC register map.
> -
> -- #address-cells:
> -    Usage: required
> -    Value type: <u32>
> -    Definition: Must be one. Child node 'reg' property should define ADC
> -            channel number.
> -
> -- #size-cells:
> -    Usage: required
> -    Value type: <u32>
> -    Definition: Must be zero.
> -
> -- #io-channel-cells:
> -    Usage: required
> -    Value type: <u32>
> -    Definition: Must be one. For details about IIO bindings see:
> -            Documentation/devicetree/bindings/iio/iio-bindings.txt
> -
> -- interrupts:
> -    Usage: optional
> -    Value type: <prop-encoded-array>
> -    Definition: End of conversion interrupt.
> -
> -Channel node properties:
> -
> -- reg:
> -    Usage: required
> -    Value type: <u32>
> -    Definition: ADC channel number.
> -            See include/dt-bindings/iio/qcom,spmi-vadc.h
> -
> -- label:
> -    Usage: required for "qcom,spmi-adc5" and "qcom,spmi-adc-rev2"
> -    Value type: <empty>
> -    Definition: ADC input of the platform as seen in the schematics.
> -            For thermistor inputs connected to generic AMUX or GPIO inputs
> -            these can vary across platform for the same pins. Hence select
> -            the platform schematics name for this channel.
> -
> -- qcom,decimation:
> -    Usage: optional
> -    Value type: <u32>
> -    Definition: This parameter is used to decrease ADC sampling rate.
> -            Quicker measurements can be made by reducing decimation ratio.
> -            - For compatible property "qcom,spmi-vadc", valid values are
> -              512, 1024, 2048, 4096. If property is not found, default value
> -              of 512 will be used.
> -            - For compatible property "qcom,spmi-adc5", valid values are 250, 420
> -              and 840. If property is not found, default value of 840 is used.
> -            - For compatible property "qcom,spmi-adc-rev2", valid values are 256,
> -              512 and 1024. If property is not present, default value is 1024.
> -
> -- qcom,pre-scaling:
> -    Usage: optional
> -    Value type: <u32 array>
> -    Definition: Used for scaling the channel input signal before the signal is
> -            fed to VADC. The configuration for this node is to know the
> -            pre-determined ratio and use it for post scaling. Select one from
> -            the following options.
> -            <1 1>, <1 3>, <1 4>, <1 6>, <1 20>, <1 8>, <10 81>, <1 10>
> -            If property is not found default value depending on chip will be used.
> -
> -- qcom,ratiometric:
> -    Usage: optional
> -    Value type: <empty>
> -    Definition: Channel calibration type.
> -            - For compatible property "qcom,spmi-vadc", if this property is
> -              specified VADC will use the VDD reference (1.8V) and GND for
> -              channel calibration. If property is not found, channel will be
> -              calibrated with 0.625V and 1.25V reference channels, also
> -              known as absolute calibration.
> -            - For compatible property "qcom,spmi-adc5" and "qcom,spmi-adc-rev2",
> -              if this property is specified VADC will use the VDD reference
> -              (1.875V) and GND for channel calibration. If property is not found,
> -              channel will be calibrated with 0V and 1.25V reference channels,
> -              also known as absolute calibration.
> -
> -- qcom,hw-settle-time:
> -    Usage: optional
> -    Value type: <u32>
> -    Definition: Time between AMUX getting configured and the ADC starting
> -            conversion. The 'hw_settle_time' is an index used from valid values
> -            and programmed in hardware to achieve the hardware settling delay.
> -            - For compatible property "qcom,spmi-vadc" and "qcom,spmi-adc-rev2",
> -              Delay = 100us * (hw_settle_time) for hw_settle_time < 11,
> -              and 2ms * (hw_settle_time - 10) otherwise.
> -              Valid values are: 0, 100, 200, 300, 400, 500, 600, 700, 800,
> -              900 us and 1, 2, 4, 6, 8, 10 ms.
> -              If property is not found, channel will use 0us.
> -            - For compatible property "qcom,spmi-adc5", delay = 15us for
> -              value 0, 100us * (value) for values < 11,
> -              and 2ms * (value - 10) otherwise.
> -              Valid values are: 15, 100, 200, 300, 400, 500, 600, 700, 800,
> -              900 us and 1, 2, 4, 6, 8, 10 ms
> -              Certain controller digital versions have valid values of
> -              15, 100, 200, 300, 400, 500, 600, 700, 1, 2, 4, 8, 16, 32, 64, 128 ms
> -              If property is not found, channel will use 15us.
> -
> -- qcom,avg-samples:
> -    Usage: optional
> -    Value type: <u32>
> -    Definition: Number of samples to be used for measurement.
> -            Averaging provides the option to obtain a single measurement
> -            from the ADC that is an average of multiple samples. The value
> -            selected is 2^(value).
> -            - For compatible property "qcom,spmi-vadc", valid values
> -              are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
> -              If property is not found, 1 sample will be used.
> -            - For compatible property "qcom,spmi-adc5" and "qcom,spmi-adc-rev2",
> -              valid values are: 1, 2, 4, 8, 16
> -              If property is not found, 1 sample will be used.
> -
> -NOTE:
> -
> -For compatible property "qcom,spmi-vadc" following channels, also known as
> -reference point channels, are used for result calibration and their channel
> -configuration nodes should be defined:
> -VADC_REF_625MV and/or VADC_SPARE1(based on PMIC version) VADC_REF_1250MV,
> -VADC_GND_REF and VADC_VDD_VADC.
> -
> -Example:
> -
> -#include <dt-bindings/iio/qcom,spmi-vadc.h>
> -#include <linux/irq.h>
> -/* ... */
> -
> -	/* VADC node */
> -	pmic_vadc: vadc@3100 {
> -		compatible = "qcom,spmi-vadc";
> -		reg = <0x3100>;
> -		interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		#io-channel-cells = <1>;
> -		io-channel-ranges;
> -
> -		/* Channel node */
> -		adc-chan@VADC_LR_MUX10_USB_ID {
> -			reg = <VADC_LR_MUX10_USB_ID>;
> -			qcom,decimation = <512>;
> -			qcom,ratiometric;
> -			qcom,hw-settle-time = <200>;
> -			qcom,avg-samples = <1>;
> -			qcom,pre-scaling = <1 3>;
> -		};
> -	};
> -
> -	/* IIO client node */
> -	usb {
> -		io-channels = <&pmic_vadc VADC_LR_MUX10_USB_ID>;
> -		io-channel-names = "vadc";
> -	};
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> new file mode 100644
> index 0000000..72db14c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm's SPMI PMIC ADC
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  SPMI PMIC voltage ADC (VADC) provides interface to clients to read
> +  voltage. The VADC is a 15-bit sigma-delta ADC.
> +  SPMI PMIC5 voltage ADC (ADC) provides interface to clients to read
> +  voltage. The VADC is a 16-bit sigma-delta ADC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,spmi-vadc
> +      - qcom,spmi-adc5
> +      - qcom,spmi-adc-rev2
> +      - qcom,pms405-adc
> +
> +  reg:
> +    description: VADC base address in the SPMI PMIC register map
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#io-channel-cells':
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      End of conversion interrupt.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#io-channel-cells'
> +
> +patternProperties:
> +  "^[a-z0-9-_@]$":
> +    type: object
> +    description: |
> +      Represents the external channels which are connected to the ADC.
> +      For compatible property "qcom,spmi-vadc" following channels, also known as
> +      reference point channels, are used for result calibration and their channel
> +      configuration nodes should be defined:
> +      VADC_REF_625MV and/or VADC_SPARE1(based on PMIC version) VADC_REF_1250MV,
> +      VADC_GND_REF and VADC_VDD_VADC.
> +
> +    properties:
> +      reg:
> +        description: |
> +          ADC channel number.
> +          See include/dt-bindings/iio/qcom,spmi-vadc.h
> +
> +      label:
> +        description: |
> +            ADC input of the platform as seen in the schematics.
> +            For thermistor inputs connected to generic AMUX or GPIO inputs
> +            these can vary across platform for the same pins. Hence select
> +            the platform schematics name for this channel. It is required
> +            for "qcom,spmi-adc5" and "qcom,spmi-adc-rev2".
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +
> +      qcom,decimation:
> +        description: |
> +            This parameter is used to decrease ADC sampling rate.
> +            Quicker measurements can be made by reducing decimation ratio.
> +            - For compatible property "qcom,spmi-vadc", valid values are
> +              512, 1024, 2048, 4096. If property is not found, default value
> +              of 512 will be used.
> +            - For compatible property "qcom,spmi-adc5", valid values are 250, 420
> +              and 840. If property is not found, default value of 840 is used.
> +            - For compatible property "qcom,spmi-adc-rev2", valid values are 256,
> +              512 and 1024. If property is not present, default value is 1024.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32

Should ideally verify all the values against models etc rather than a uint32 binding.

> +
> +      qcom,pre-scaling:
> +        description: |
> +            Used for scaling the channel input signal before the signal is
> +            fed to VADC. The configuration for this node is to know the
> +            pre-determined ratio and use it for post scaling. Select one from
> +            the following options.
> +            <1 1>, <1 3>, <1 4>, <1 6>, <1 20>, <1 8>, <10 81>, <1 10>

Can we not provide this list as something that can be verified?

> +            If property is not found default value depending on chip will be used.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      qcom,ratiometric:
> +        description: |
> +            Channel calibration type.
> +            - For compatible property "qcom,spmi-vadc", if this property is
> +              specified VADC will use the VDD reference (1.8V) and GND for
> +              channel calibration. If property is not found, channel will be
> +              calibrated with 0.625V and 1.25V reference channels, also
> +              known as absolute calibration.
> +            - For compatible property "qcom,spmi-adc5" and "qcom,spmi-adc-rev2",
> +              if this property is specified VADC will use the VDD reference (1.875V)
> +              and GND for channel calibration. If property is not found, channel
> +              will be calibrated with 0V and 1.25V reference channels, also known
> +              as absolute calibration.
> +        type: boolean
> +
> +      qcom,hw-settle-time:
> +        description: |
> +            Time between AMUX getting configured and the ADC starting
> +            conversion. The 'hw_settle_time' is an index used from valid values
> +            and programmed in hardware to achieve the hardware settling delay.
> +            - For compatible property "qcom,spmi-vadc" and "qcom,spmi-adc-rev2",
> +              Delay = 100us * (hw_settle_time) for hw_settle_time < 11,
> +              and 2ms * (hw_settle_time - 10) otherwise.
> +              Valid values are: 0, 100, 200, 300, 400, 500, 600, 700, 800,
> +              900 us and 1, 2, 4, 6, 8, 10 ms.
> +              If property is not found, channel will use 0us.
> +            - For compatible property "qcom,spmi-adc5", delay = 15us for
> +              value 0, 100us * (value) for values < 11,
> +              and 2ms * (value - 10) otherwise.
> +              Valid values are: 15, 100, 200, 300, 400, 500, 600, 700, 800,
> +              900 us and 1, 2, 4, 6, 8, 10 ms
> +              Certain controller digital versions have valid values of
> +              15, 100, 200, 300, 400, 500, 600, 700, 1, 2, 4, 8, 16, 32, 64, 128 ms
> +              If property is not found, channel will use 15us.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32

Can we verify those values.

> +
> +      qcom,avg-samples:
> +        description: |
> +            Number of samples to be used for measurement.
> +            Averaging provides the option to obtain a single measurement
> +            from the ADC that is an average of multiple samples. The value
> +            selected is 2^(value).
> +            - For compatible property "qcom,spmi-vadc", valid values
> +              are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
> +              If property is not found, 1 sample will be used.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32

Verify the values if possible.

> +
> +    required:
> +      - reg
> +      - diff-channels
> +
> +examples:
> +  - |
> +      /* VADC node */
> +      pmic_vadc: vadc@3100 {

Should really be using generic names, so adc@3100 preferred.


> +        compatible = "qcom,spmi-vadc";
> +        reg = <0x3100>;
> +        interrupts = <0x0 0x31 0x0 0x1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #io-channel-cells = <1>;
> +        io-channel-ranges;
> +
> +        /* Channel node */
> +        adc-chan@0x39 {
> +          reg = <0x39>;
> +          qcom,decimation = <512>;
> +          qcom,ratiometric;
> +          qcom,hw-settle-time = <200>;
> +          qcom,avg-samples = <1>;
> +          qcom,pre-scaling = <1 3>;
> +        };
> +      };

