Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFAD1E9700
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgEaKpa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 06:45:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgEaKpa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 06:45:30 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92F0C2074A;
        Sun, 31 May 2020 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590921929;
        bh=zM7Kj3FI/MQaE3oP/0hMFYF8RjR0bAJGQiRjb+uRBCk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jKfiJlHR7agJMol712aTxsI0hjY1aCB8JP48lGaMZj7A3oGbkIXoYynzRvKJ/zV/Y
         65ykGDOIBuck25inEINBWGFRoJiRXdw0/s5TVYJSskSKgWvWXijSP+RuXEVjeBX+nb
         iH7tpkzt7zk6P1uO0jaTAeySpQvb5/9ixRZIJRzk=
Date:   Sun, 31 May 2020 11:45:22 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, linus.walleij@linaro.org,
        Jonathan.Cameron@huawei.com, andy.shevchenko@gmail.com,
        amit.kucheria@verdurent.com, smohanad@codeaurora.org,
        kgunda@codeaurora.org, aghayal@codeaurora.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V6 2/7] iio: adc: Add PMIC7 ADC bindings
Message-ID: <20200531114522.419133e8@archlinux>
In-Reply-To: <1590684869-15400-3-git-send-email-jprakash@codeaurora.org>
References: <1590684869-15400-1-git-send-email-jprakash@codeaurora.org>
        <1590684869-15400-3-git-send-email-jprakash@codeaurora.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 May 2020 22:24:24 +0530
Jishnu Prakash <jprakash@codeaurora.org> wrote:

> Add documentation for PMIC7 ADC peripheral.
> For the PMIC7-type PMICs, ADC peripheral is present in HW for the
> following PMICs: PMK8350, PM8350, PM8350b, PMR735a and PMR735b.
> Of these, only the ADC peripheral on PMK8350 is exposed directly to SW.
> If SW needs to communicate with ADCs on other PMICs, it specifies the
> PMIC to PMK8350 through the newly added SID register and communication
> between PMK8350 ADC and other PMIC ADCs is carried out through
> PBS(Programmable Boot Sequence) at the firmware level.
> 
> In addition, add definitions for ADC channels and virtual channel
> definitions (combination of ADC channel number and PMIC SID number)
> per PMIC, to be used by ADC clients for PMIC7.
> 
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied.

Thanks,

J
> ---
>  .../bindings/iio/adc/qcom,spmi-vadc.yaml           | 38 ++++++++--
>  include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    | 67 ++++++++++++++++
>  include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h   | 88 ++++++++++++++++++++++
>  include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h   | 46 +++++++++++
>  include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h   | 28 +++++++
>  include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h   | 28 +++++++
>  include/dt-bindings/iio/qcom,spmi-vadc.h           | 78 ++++++++++++++++++-
>  7 files changed, 366 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> index de8d243..e6263b6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> @@ -13,7 +13,7 @@ maintainers:
>  description: |
>    SPMI PMIC voltage ADC (VADC) provides interface to clients to read
>    voltage. The VADC is a 15-bit sigma-delta ADC.
> -  SPMI PMIC5 voltage ADC (ADC) provides interface to clients to read
> +  SPMI PMIC5/PMIC7 voltage ADC (ADC) provides interface to clients to read
>    voltage. The VADC is a 16-bit sigma-delta ADC.
>  
>  properties:
> @@ -28,6 +28,7 @@ properties:
>            - qcom,spmi-vadc
>            - qcom,spmi-adc5
>            - qcom,spmi-adc-rev2
> +          - qcom,spmi-adc7
>  
>    reg:
>      description: VADC base address in the SPMI PMIC register map
> @@ -70,6 +71,8 @@ patternProperties:
>          description: |
>            ADC channel number.
>            See include/dt-bindings/iio/qcom,spmi-vadc.h
> +          For PMIC7 ADC, the channel numbers are specified separately per PMIC
> +          in the PMIC-specific files in include/dt-bindings/iio/.
>  
>        label:
>          $ref: /schemas/types.yaml#/definitions/string
> @@ -113,11 +116,11 @@ patternProperties:
>                channel calibration. If property is not found, channel will be
>                calibrated with 0.625V and 1.25V reference channels, also
>                known as absolute calibration.
> -            - For compatible property "qcom,spmi-adc5" and "qcom,spmi-adc-rev2",
> -              if this property is specified VADC will use the VDD reference (1.875V)
> -              and GND for channel calibration. If property is not found, channel
> -              will be calibrated with 0V and 1.25V reference channels, also known
> -              as absolute calibration.
> +            - For compatible property "qcom,spmi-adc5", "qcom,spmi-adc7" and
> +              "qcom,spmi-adc-rev2", if this property is specified VADC will use
> +              the VDD reference (1.875V) and GND for channel calibration. If
> +              property is not found, channel will be calibrated with 0V and 1.25V
> +              reference channels, also known as absolute calibration.
>          type: boolean
>  
>        qcom,hw-settle-time:
> @@ -208,6 +211,29 @@ allOf:
>                enum: [ 1, 2, 4, 8, 16 ]
>                default: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,spmi-adc7
> +
> +    then:
> +      patternProperties:
> +        "^.*@[0-9a-f]+$":
> +          properties:
> +            qcom,decimation:
> +              enum: [ 85, 340, 1360 ]
> +              default: 1360
> +
> +            qcom,hw-settle-time:
> +              enum: [ 15, 100, 200, 300, 400, 500, 600, 700, 1000, 2000, 4000,
> +                      8000, 16000, 32000, 64000, 128000 ]
> +              default: 15
> +
> +            qcom,avg-samples:
> +              enum: [ 1, 2, 4, 8, 16 ]
> +              default: 1
> +
>  examples:
>    - |
>      spmi_bus {
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h b/include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h
> new file mode 100644
> index 0000000..9426f27
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_PM8350_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_PM8350_H
> +
> +#ifndef PM8350_SID
> +#define PM8350_SID					1
> +#endif
> +
> +/* ADC channels for PM8350_ADC for PMIC7 */
> +#define PM8350_ADC7_REF_GND			(PM8350_SID << 8 | 0x0)
> +#define PM8350_ADC7_1P25VREF			(PM8350_SID << 8 | 0x01)
> +#define PM8350_ADC7_VREF_VADC			(PM8350_SID << 8 | 0x02)
> +#define PM8350_ADC7_DIE_TEMP			(PM8350_SID << 8 | 0x03)
> +
> +#define PM8350_ADC7_AMUX_THM1			(PM8350_SID << 8 | 0x04)
> +#define PM8350_ADC7_AMUX_THM2			(PM8350_SID << 8 | 0x05)
> +#define PM8350_ADC7_AMUX_THM3			(PM8350_SID << 8 | 0x06)
> +#define PM8350_ADC7_AMUX_THM4			(PM8350_SID << 8 | 0x07)
> +#define PM8350_ADC7_AMUX_THM5			(PM8350_SID << 8 | 0x08)
> +#define PM8350_ADC7_GPIO1			(PM8350_SID << 8 | 0x0a)
> +#define PM8350_ADC7_GPIO2			(PM8350_SID << 8 | 0x0b)
> +#define PM8350_ADC7_GPIO3			(PM8350_SID << 8 | 0x0c)
> +#define PM8350_ADC7_GPIO4			(PM8350_SID << 8 | 0x0d)
> +
> +/* 30k pull-up1 */
> +#define PM8350_ADC7_AMUX_THM1_30K_PU		(PM8350_SID << 8 | 0x24)
> +#define PM8350_ADC7_AMUX_THM2_30K_PU		(PM8350_SID << 8 | 0x25)
> +#define PM8350_ADC7_AMUX_THM3_30K_PU		(PM8350_SID << 8 | 0x26)
> +#define PM8350_ADC7_AMUX_THM4_30K_PU		(PM8350_SID << 8 | 0x27)
> +#define PM8350_ADC7_AMUX_THM5_30K_PU		(PM8350_SID << 8 | 0x28)
> +#define PM8350_ADC7_GPIO1_30K_PU		(PM8350_SID << 8 | 0x2a)
> +#define PM8350_ADC7_GPIO2_30K_PU		(PM8350_SID << 8 | 0x2b)
> +#define PM8350_ADC7_GPIO3_30K_PU		(PM8350_SID << 8 | 0x2c)
> +#define PM8350_ADC7_GPIO4_30K_PU		(PM8350_SID << 8 | 0x2d)
> +
> +/* 100k pull-up2 */
> +#define PM8350_ADC7_AMUX_THM1_100K_PU		(PM8350_SID << 8 | 0x44)
> +#define PM8350_ADC7_AMUX_THM2_100K_PU		(PM8350_SID << 8 | 0x45)
> +#define PM8350_ADC7_AMUX_THM3_100K_PU		(PM8350_SID << 8 | 0x46)
> +#define PM8350_ADC7_AMUX_THM4_100K_PU		(PM8350_SID << 8 | 0x47)
> +#define PM8350_ADC7_AMUX_THM5_100K_PU		(PM8350_SID << 8 | 0x48)
> +#define PM8350_ADC7_GPIO1_100K_PU		(PM8350_SID << 8 | 0x4a)
> +#define PM8350_ADC7_GPIO2_100K_PU		(PM8350_SID << 8 | 0x4b)
> +#define PM8350_ADC7_GPIO3_100K_PU		(PM8350_SID << 8 | 0x4c)
> +#define PM8350_ADC7_GPIO4_100K_PU		(PM8350_SID << 8 | 0x4d)
> +
> +/* 400k pull-up3 */
> +#define PM8350_ADC7_AMUX_THM1_400K_PU		(PM8350_SID << 8 | 0x64)
> +#define PM8350_ADC7_AMUX_THM2_400K_PU		(PM8350_SID << 8 | 0x65)
> +#define PM8350_ADC7_AMUX_THM3_400K_PU		(PM8350_SID << 8 | 0x66)
> +#define PM8350_ADC7_AMUX_THM4_400K_PU		(PM8350_SID << 8 | 0x67)
> +#define PM8350_ADC7_AMUX_THM5_400K_PU		(PM8350_SID << 8 | 0x68)
> +#define PM8350_ADC7_GPIO1_400K_PU		(PM8350_SID << 8 | 0x6a)
> +#define PM8350_ADC7_GPIO2_400K_PU		(PM8350_SID << 8 | 0x6b)
> +#define PM8350_ADC7_GPIO3_400K_PU		(PM8350_SID << 8 | 0x6c)
> +#define PM8350_ADC7_GPIO4_400K_PU		(PM8350_SID << 8 | 0x6d)
> +
> +/* 1/3 Divider */
> +#define PM8350_ADC7_GPIO4_DIV3			(PM8350_SID << 8 | 0x8d)
> +
> +#define PM8350_ADC7_VPH_PWR			(PM8350_SID << 8 | 0x8e)
> +
> +#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_PM8350_H */
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h b/include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h
> new file mode 100644
> index 0000000..dc2497c
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-pm8350b.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_PM8350B_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_PM8350B_H
> +
> +#ifndef PM8350B_SID
> +#define PM8350B_SID					3
> +#endif
> +
> +/* ADC channels for PM8350B_ADC for PMIC7 */
> +#define PM8350B_ADC7_REF_GND			(PM8350B_SID << 8 | 0x0)
> +#define PM8350B_ADC7_1P25VREF			(PM8350B_SID << 8 | 0x01)
> +#define PM8350B_ADC7_VREF_VADC			(PM8350B_SID << 8 | 0x02)
> +#define PM8350B_ADC7_DIE_TEMP			(PM8350B_SID << 8 | 0x03)
> +
> +#define PM8350B_ADC7_AMUX_THM1			(PM8350B_SID << 8 | 0x04)
> +#define PM8350B_ADC7_AMUX_THM2			(PM8350B_SID << 8 | 0x05)
> +#define PM8350B_ADC7_AMUX_THM3			(PM8350B_SID << 8 | 0x06)
> +#define PM8350B_ADC7_AMUX_THM4			(PM8350B_SID << 8 | 0x07)
> +#define PM8350B_ADC7_AMUX_THM5			(PM8350B_SID << 8 | 0x08)
> +#define PM8350B_ADC7_AMUX_THM6			(PM8350B_SID << 8 | 0x09)
> +#define PM8350B_ADC7_GPIO1			(PM8350B_SID << 8 | 0x0a)
> +#define PM8350B_ADC7_GPIO2			(PM8350B_SID << 8 | 0x0b)
> +#define PM8350B_ADC7_GPIO3			(PM8350B_SID << 8 | 0x0c)
> +#define PM8350B_ADC7_GPIO4			(PM8350B_SID << 8 | 0x0d)
> +
> +#define PM8350B_ADC7_CHG_TEMP			(PM8350B_SID << 8 | 0x10)
> +#define PM8350B_ADC7_USB_IN_V_16		(PM8350B_SID << 8 | 0x11)
> +#define PM8350B_ADC7_VDC_16			(PM8350B_SID << 8 | 0x12)
> +#define PM8350B_ADC7_CC1_ID			(PM8350B_SID << 8 | 0x13)
> +#define PM8350B_ADC7_VREF_BAT_THERM		(PM8350B_SID << 8 | 0x15)
> +#define PM8350B_ADC7_IIN_FB			(PM8350B_SID << 8 | 0x17)
> +
> +/* 30k pull-up1 */
> +#define PM8350B_ADC7_AMUX_THM1_30K_PU		(PM8350B_SID << 8 | 0x24)
> +#define PM8350B_ADC7_AMUX_THM2_30K_PU		(PM8350B_SID << 8 | 0x25)
> +#define PM8350B_ADC7_AMUX_THM3_30K_PU		(PM8350B_SID << 8 | 0x26)
> +#define PM8350B_ADC7_AMUX_THM4_30K_PU		(PM8350B_SID << 8 | 0x27)
> +#define PM8350B_ADC7_AMUX_THM5_30K_PU		(PM8350B_SID << 8 | 0x28)
> +#define PM8350B_ADC7_AMUX_THM6_30K_PU		(PM8350B_SID << 8 | 0x29)
> +#define PM8350B_ADC7_GPIO1_30K_PU		(PM8350B_SID << 8 | 0x2a)
> +#define PM8350B_ADC7_GPIO2_30K_PU		(PM8350B_SID << 8 | 0x2b)
> +#define PM8350B_ADC7_GPIO3_30K_PU		(PM8350B_SID << 8 | 0x2c)
> +#define PM8350B_ADC7_GPIO4_30K_PU		(PM8350B_SID << 8 | 0x2d)
> +#define PM8350B_ADC7_CC1_ID_30K_PU		(PM8350B_SID << 8 | 0x33)
> +
> +/* 100k pull-up2 */
> +#define PM8350B_ADC7_AMUX_THM1_100K_PU		(PM8350B_SID << 8 | 0x44)
> +#define PM8350B_ADC7_AMUX_THM2_100K_PU		(PM8350B_SID << 8 | 0x45)
> +#define PM8350B_ADC7_AMUX_THM3_100K_PU		(PM8350B_SID << 8 | 0x46)
> +#define PM8350B_ADC7_AMUX_THM4_100K_PU		(PM8350B_SID << 8 | 0x47)
> +#define PM8350B_ADC7_AMUX_THM5_100K_PU		(PM8350B_SID << 8 | 0x48)
> +#define PM8350B_ADC7_AMUX_THM6_100K_PU		(PM8350B_SID << 8 | 0x49)
> +#define PM8350B_ADC7_GPIO1_100K_PU		(PM8350B_SID << 8 | 0x4a)
> +#define PM8350B_ADC7_GPIO2_100K_PU		(PM8350B_SID << 8 | 0x4b)
> +#define PM8350B_ADC7_GPIO3_100K_PU		(PM8350B_SID << 8 | 0x4c)
> +#define PM8350B_ADC7_GPIO4_100K_PU		(PM8350B_SID << 8 | 0x4d)
> +#define PM8350B_ADC7_CC1_ID_100K_PU		(PM8350B_SID << 8 | 0x53)
> +
> +/* 400k pull-up3 */
> +#define PM8350B_ADC7_AMUX_THM1_400K_PU		(PM8350B_SID << 8 | 0x64)
> +#define PM8350B_ADC7_AMUX_THM2_400K_PU		(PM8350B_SID << 8 | 0x65)
> +#define PM8350B_ADC7_AMUX_THM3_400K_PU		(PM8350B_SID << 8 | 0x66)
> +#define PM8350B_ADC7_AMUX_THM4_400K_PU		(PM8350B_SID << 8 | 0x67)
> +#define PM8350B_ADC7_AMUX_THM5_400K_PU		(PM8350B_SID << 8 | 0x68)
> +#define PM8350B_ADC7_AMUX_THM6_400K_PU		(PM8350B_SID << 8 | 0x69)
> +#define PM8350B_ADC7_GPIO1_400K_PU		(PM8350B_SID << 8 | 0x6a)
> +#define PM8350B_ADC7_GPIO2_400K_PU		(PM8350B_SID << 8 | 0x6b)
> +#define PM8350B_ADC7_GPIO3_400K_PU		(PM8350B_SID << 8 | 0x6c)
> +#define PM8350B_ADC7_GPIO4_400K_PU		(PM8350B_SID << 8 | 0x6d)
> +#define PM8350B_ADC7_CC1_ID_400K_PU		(PM8350B_SID << 8 | 0x73)
> +
> +/* 1/3 Divider */
> +#define PM8350B_ADC7_GPIO1_DIV3			(PM8350B_SID << 8 | 0x8a)
> +#define PM8350B_ADC7_GPIO2_DIV3			(PM8350B_SID << 8 | 0x8b)
> +#define PM8350B_ADC7_GPIO3_DIV3			(PM8350B_SID << 8 | 0x8c)
> +#define PM8350B_ADC7_GPIO4_DIV3			(PM8350B_SID << 8 | 0x8d)
> +
> +#define PM8350B_ADC7_VPH_PWR			(PM8350B_SID << 8 | 0x8e)
> +#define PM8350B_ADC7_VBAT_SNS			(PM8350B_SID << 8 | 0x8f)
> +
> +#define PM8350B_ADC7_SBUx			(PM8350B_SID << 8 | 0x94)
> +#define PM8350B_ADC7_VBAT_2S_MID		(PM8350B_SID << 8 | 0x96)
> +
> +#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_PM8350B_H */
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h b/include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h
> new file mode 100644
> index 0000000..6c29687
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-pmk8350.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_PMK8350_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_PMK8350_H
> +
> +#ifndef PMK8350_SID
> +#define PMK8350_SID					0
> +#endif
> +
> +/* ADC channels for PMK8350_ADC for PMIC7 */
> +#define PMK8350_ADC7_REF_GND			(PMK8350_SID << 8 | 0x0)
> +#define PMK8350_ADC7_1P25VREF			(PMK8350_SID << 8 | 0x01)
> +#define PMK8350_ADC7_VREF_VADC			(PMK8350_SID << 8 | 0x02)
> +#define PMK8350_ADC7_DIE_TEMP			(PMK8350_SID << 8 | 0x03)
> +
> +#define PMK8350_ADC7_AMUX_THM1			(PMK8350_SID << 8 | 0x04)
> +#define PMK8350_ADC7_AMUX_THM2			(PMK8350_SID << 8 | 0x05)
> +#define PMK8350_ADC7_AMUX_THM3			(PMK8350_SID << 8 | 0x06)
> +#define PMK8350_ADC7_AMUX_THM4			(PMK8350_SID << 8 | 0x07)
> +#define PMK8350_ADC7_AMUX_THM5			(PMK8350_SID << 8 | 0x08)
> +
> +/* 30k pull-up1 */
> +#define PMK8350_ADC7_AMUX_THM1_30K_PU		(PMK8350_SID << 8 | 0x24)
> +#define PMK8350_ADC7_AMUX_THM2_30K_PU		(PMK8350_SID << 8 | 0x25)
> +#define PMK8350_ADC7_AMUX_THM3_30K_PU		(PMK8350_SID << 8 | 0x26)
> +#define PMK8350_ADC7_AMUX_THM4_30K_PU		(PMK8350_SID << 8 | 0x27)
> +#define PMK8350_ADC7_AMUX_THM5_30K_PU		(PMK8350_SID << 8 | 0x28)
> +
> +/* 100k pull-up2 */
> +#define PMK8350_ADC7_AMUX_THM1_100K_PU		(PMK8350_SID << 8 | 0x44)
> +#define PMK8350_ADC7_AMUX_THM2_100K_PU		(PMK8350_SID << 8 | 0x45)
> +#define PMK8350_ADC7_AMUX_THM3_100K_PU		(PMK8350_SID << 8 | 0x46)
> +#define PMK8350_ADC7_AMUX_THM4_100K_PU		(PMK8350_SID << 8 | 0x47)
> +#define PMK8350_ADC7_AMUX_THM5_100K_PU		(PMK8350_SID << 8 | 0x48)
> +
> +/* 400k pull-up3 */
> +#define PMK8350_ADC7_AMUX_THM1_400K_PU		(PMK8350_SID << 8 | 0x64)
> +#define PMK8350_ADC7_AMUX_THM2_400K_PU		(PMK8350_SID << 8 | 0x65)
> +#define PMK8350_ADC7_AMUX_THM3_400K_PU		(PMK8350_SID << 8 | 0x66)
> +#define PMK8350_ADC7_AMUX_THM4_400K_PU		(PMK8350_SID << 8 | 0x67)
> +#define PMK8350_ADC7_AMUX_THM5_400K_PU		(PMK8350_SID << 8 | 0x68)
> +
> +#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_PMK8350_H */
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h b/include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h
> new file mode 100644
> index 0000000..d6df1b1
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-pmr735a.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_PMR735A_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_PMR735A_H
> +
> +#ifndef PMR735A_SID
> +#define PMR735A_SID					4
> +#endif
> +
> +/* ADC channels for PMR735A_ADC for PMIC7 */
> +#define PMR735A_ADC7_REF_GND			(PMR735A_SID << 8 | 0x0)
> +#define PMR735A_ADC7_1P25VREF			(PMR735A_SID << 8 | 0x01)
> +#define PMR735A_ADC7_VREF_VADC			(PMR735A_SID << 8 | 0x02)
> +#define PMR735A_ADC7_DIE_TEMP			(PMR735A_SID << 8 | 0x03)
> +
> +#define PMR735A_ADC7_GPIO1			(PMR735A_SID << 8 | 0x0a)
> +#define PMR735A_ADC7_GPIO2			(PMR735A_SID << 8 | 0x0b)
> +#define PMR735A_ADC7_GPIO3			(PMR735A_SID << 8 | 0x0c)
> +
> +/* 100k pull-up2 */
> +#define PMR735A_ADC7_GPIO1_100K_PU		(PMR735A_SID << 8 | 0x4a)
> +#define PMR735A_ADC7_GPIO2_100K_PU		(PMR735A_SID << 8 | 0x4b)
> +#define PMR735A_ADC7_GPIO3_100K_PU		(PMR735A_SID << 8 | 0x4c)
> +
> +#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_PMR735A_H */
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h b/include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h
> new file mode 100644
> index 0000000..8da0e7d
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-pmr735b.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_PMR735B_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_PMR735B_H
> +
> +#ifndef PMR735B_SID
> +#define PMR735B_SID					5
> +#endif
> +
> +/* ADC channels for PMR735B_ADC for PMIC7 */
> +#define PMR735B_ADC7_REF_GND			(PMR735B_SID << 8 | 0x0)
> +#define PMR735B_ADC7_1P25VREF			(PMR735B_SID << 8 | 0x01)
> +#define PMR735B_ADC7_VREF_VADC			(PMR735B_SID << 8 | 0x02)
> +#define PMR735B_ADC7_DIE_TEMP			(PMR735B_SID << 8 | 0x03)
> +
> +#define PMR735B_ADC7_GPIO1			(PMR735B_SID << 8 | 0x0a)
> +#define PMR735B_ADC7_GPIO2			(PMR735B_SID << 8 | 0x0b)
> +#define PMR735B_ADC7_GPIO3			(PMR735B_SID << 8 | 0x0c)
> +
> +/* 100k pull-up2 */
> +#define PMR735B_ADC7_GPIO1_100K_PU		(PMR735B_SID << 8 | 0x4a)
> +#define PMR735B_ADC7_GPIO2_100K_PU		(PMR735B_SID << 8 | 0x4b)
> +#define PMR735B_ADC7_GPIO3_100K_PU		(PMR735B_SID << 8 | 0x4c)
> +
> +#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_PMR735B_H */
> diff --git a/include/dt-bindings/iio/qcom,spmi-vadc.h b/include/dt-bindings/iio/qcom,spmi-vadc.h
> index 61d556d..08adfe2 100644
> --- a/include/dt-bindings/iio/qcom,spmi-vadc.h
> +++ b/include/dt-bindings/iio/qcom,spmi-vadc.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * Copyright (c) 2012-2014,2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2014,2018,2020 The Linux Foundation. All rights reserved.
>   */
>  
>  #ifndef _DT_BINDINGS_QCOM_SPMI_VADC_H
> @@ -221,4 +221,80 @@
>  
>  #define ADC5_MAX_CHANNEL			0xc0
>  
> +/* ADC channels for ADC for PMIC7 */
> +
> +#define ADC7_REF_GND				0x00
> +#define ADC7_1P25VREF				0x01
> +#define ADC7_VREF_VADC				0x02
> +#define ADC7_DIE_TEMP				0x03
> +
> +#define ADC7_AMUX_THM1				0x04
> +#define ADC7_AMUX_THM2				0x05
> +#define ADC7_AMUX_THM3				0x06
> +#define ADC7_AMUX_THM4				0x07
> +#define ADC7_AMUX_THM5				0x08
> +#define ADC7_AMUX_THM6				0x09
> +#define ADC7_GPIO1				0x0a
> +#define ADC7_GPIO2				0x0b
> +#define ADC7_GPIO3				0x0c
> +#define ADC7_GPIO4				0x0d
> +
> +#define ADC7_CHG_TEMP				0x10
> +#define ADC7_USB_IN_V_16			0x11
> +#define ADC7_VDC_16				0x12
> +#define ADC7_CC1_ID				0x13
> +#define ADC7_VREF_BAT_THERM			0x15
> +#define ADC7_IIN_FB				0x17
> +
> +/* 30k pull-up1 */
> +#define ADC7_AMUX_THM1_30K_PU			0x24
> +#define ADC7_AMUX_THM2_30K_PU			0x25
> +#define ADC7_AMUX_THM3_30K_PU			0x26
> +#define ADC7_AMUX_THM4_30K_PU			0x27
> +#define ADC7_AMUX_THM5_30K_PU			0x28
> +#define ADC7_AMUX_THM6_30K_PU			0x29
> +#define ADC7_GPIO1_30K_PU			0x2a
> +#define ADC7_GPIO2_30K_PU			0x2b
> +#define ADC7_GPIO3_30K_PU			0x2c
> +#define ADC7_GPIO4_30K_PU			0x2d
> +#define ADC7_CC1_ID_30K_PU			0x33
> +
> +/* 100k pull-up2 */
> +#define ADC7_AMUX_THM1_100K_PU			0x44
> +#define ADC7_AMUX_THM2_100K_PU			0x45
> +#define ADC7_AMUX_THM3_100K_PU			0x46
> +#define ADC7_AMUX_THM4_100K_PU			0x47
> +#define ADC7_AMUX_THM5_100K_PU			0x48
> +#define ADC7_AMUX_THM6_100K_PU			0x49
> +#define ADC7_GPIO1_100K_PU			0x4a
> +#define ADC7_GPIO2_100K_PU			0x4b
> +#define ADC7_GPIO3_100K_PU			0x4c
> +#define ADC7_GPIO4_100K_PU			0x4d
> +#define ADC7_CC1_ID_100K_PU			0x53
> +
> +/* 400k pull-up3 */
> +#define ADC7_AMUX_THM1_400K_PU			0x64
> +#define ADC7_AMUX_THM2_400K_PU			0x65
> +#define ADC7_AMUX_THM3_400K_PU			0x66
> +#define ADC7_AMUX_THM4_400K_PU			0x67
> +#define ADC7_AMUX_THM5_400K_PU			0x68
> +#define ADC7_AMUX_THM6_400K_PU			0x69
> +#define ADC7_GPIO1_400K_PU			0x6a
> +#define ADC7_GPIO2_400K_PU			0x6b
> +#define ADC7_GPIO3_400K_PU			0x6c
> +#define ADC7_GPIO4_400K_PU			0x6d
> +#define ADC7_CC1_ID_400K_PU			0x73
> +
> +/* 1/3 Divider */
> +#define ADC7_GPIO1_DIV3				0x8a
> +#define ADC7_GPIO2_DIV3				0x8b
> +#define ADC7_GPIO3_DIV3				0x8c
> +#define ADC7_GPIO4_DIV3				0x8d
> +
> +#define ADC7_VPH_PWR				0x8e
> +#define ADC7_VBAT_SNS				0x8f
> +
> +#define ADC7_SBUx				0x94
> +#define ADC7_VBAT_2S_MID			0x96
> +
>  #endif /* _DT_BINDINGS_QCOM_SPMI_VADC_H */

