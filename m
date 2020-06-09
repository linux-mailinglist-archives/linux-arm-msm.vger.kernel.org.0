Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A1C1F494C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 00:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgFIWTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 18:19:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42489 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFIWTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 18:19:50 -0400
Received: by mail-io1-f66.google.com with SMTP id d5so24627541ios.9;
        Tue, 09 Jun 2020 15:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8s6kkulWi/y9LeLttfC0mDAvUCDq1t3sPBSwBQ7Eqvw=;
        b=t73RS678nG5WWn3ArF849RFpCb4QJRoqQuwQy0xEVKkKa6bwhB4qop1otzG+1lJwgf
         XQexJccIXb9WHbspEJYHC8qeo3Ft2e0W30YCA9J3F34Q8SyWUzn0K34SlJupdWeTTPFg
         hqfD7BZ4XoRBy2NwIyq7KC40xw6BQp+6tLFVShvdArN+ctF4wMh8iKcuusi1AJz6Bf9S
         Qw/rqD6eegIo8kovT7QcjCEAbwQpMqi9vunp1tYT075YxtQB9t6SOSnw62ymiQgRToBL
         tQJSIedTlgT1xTM4080hZMedK9oOR7mvQOawPMmakeSxxuFuOYYJTQIPXaCk6FGsvbXg
         2/3Q==
X-Gm-Message-State: AOAM531w4ZEkZzLHmMdnFl5zrecRg1qa9A5t0fsary/KJY4q7p01233p
        5IYHxoDWZWuSxxYf/61p6Y1yijQ=
X-Google-Smtp-Source: ABdhPJxhWRu82Hg4UFkANZb7OvSJbvzNSuEnFZV5cN3RnYdeqDpfoYZiKMvF8CKimjHnppx3mInn7Q==
X-Received: by 2002:a05:6602:13c6:: with SMTP id o6mr307806iov.84.1591741188629;
        Tue, 09 Jun 2020 15:19:48 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id 12sm9905723ill.30.2020.06.09.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:19:47 -0700 (PDT)
Received: (nullmailer pid 1600262 invoked by uid 1000);
        Tue, 09 Jun 2020 22:19:46 -0000
Date:   Tue, 9 Jun 2020 16:19:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] Add compatible strings and the include files for the
 msm8992 GCC.
Message-ID: <20200609221917.GA1595469@bogus>
References: <20200531174612.260113-1-konradybcio@gmail.com>
 <20200531174612.260113-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200531174612.260113-3-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 31, 2020 at 07:46:08PM +0200, Konrad Dybcio wrote:
> This commit adds the include files and documents compatible
> strings for the msm8992 GCC driver

'dt-bindings: clock: qcom,gcc: ...' for the subject.

> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
>  include/dt-bindings/clock/qcom,gcc-msm8992.h  | 144 ++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-msm8992.h  |   8 +
>  3 files changed, 154 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8992.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8992.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index e533bb0cfd2b..66e51f2c0c27 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -26,6 +26,7 @@ description: |
>    - dt-bindings/reset/qcom,gcc-msm8660.h
>    - dt-bindings/clock/qcom,gcc-msm8974.h
>    - dt-bindings/reset/qcom,gcc-msm8974.h
> +  - dt-bindings/reset/qcom,gcc-msm8992.h
>    - dt-bindings/clock/qcom,gcc-msm8994.h
>    - dt-bindings/clock/qcom,gcc-mdm9615.h
>    - dt-bindings/reset/qcom,gcc-mdm9615.h
> @@ -45,6 +46,7 @@ properties:
>        - qcom,gcc-msm8974
>        - qcom,gcc-msm8974pro
>        - qcom,gcc-msm8974pro-ac
> +      - qcom,gcc-msm8992
>        - qcom,gcc-msm8994
>        - qcom,gcc-mdm9615
>        - qcom,gcc-sdm630
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8992.h b/include/dt-bindings/clock/qcom,gcc-msm8992.h
> new file mode 100644
> index 000000000000..8591a881005d
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8992.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Don't care about DT on non-GPL OSs?

> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + */
> +
> +
> +#ifndef _DT_BINDINGS_CLK_MSM_GCC_8992_H
> +#define _DT_BINDINGS_CLK_MSM_GCC_8992_H
> +
> +#define GPLL0_EARLY                     0
> +#define GPLL0                           1
> +#define GPLL4_EARLY                     2
> +#define GPLL4                           3
> +#define USB30_MASTER_CLK_SRC            4
> +#define BLSP1_QUP1_I2C_APPS_CLK_SRC     5
> +#define BLSP1_QUP1_SPI_APPS_CLK_SRC     6
> +#define BLSP1_QUP2_I2C_APPS_CLK_SRC     7
> +#define BLSP1_QUP2_SPI_APPS_CLK_SRC     8
> +#define BLSP1_QUP3_I2C_APPS_CLK_SRC     9
> +#define BLSP1_QUP3_SPI_APPS_CLK_SRC     10
> +#define BLSP1_QUP4_I2C_APPS_CLK_SRC     11
> +#define BLSP1_QUP4_SPI_APPS_CLK_SRC     12
> +#define BLSP1_QUP5_I2C_APPS_CLK_SRC     13
> +#define BLSP1_QUP5_SPI_APPS_CLK_SRC     14
> +#define BLSP1_QUP6_I2C_APPS_CLK_SRC     15
> +#define BLSP1_QUP6_SPI_APPS_CLK_SRC     16
> +#define BLSP1_UART1_APPS_CLK_SRC        17
> +#define BLSP1_UART2_APPS_CLK_SRC        18
> +#define BLSP1_UART3_APPS_CLK_SRC        19
> +#define BLSP1_UART4_APPS_CLK_SRC        20
> +#define BLSP1_UART5_APPS_CLK_SRC        21
> +#define BLSP1_UART6_APPS_CLK_SRC        22
> +#define BLSP2_QUP1_I2C_APPS_CLK_SRC     23
> +#define BLSP2_QUP1_SPI_APPS_CLK_SRC     24
> +#define BLSP2_QUP2_I2C_APPS_CLK_SRC     25
> +#define BLSP2_QUP2_SPI_APPS_CLK_SRC     26
> +#define BLSP2_QUP3_I2C_APPS_CLK_SRC     27
> +#define BLSP2_QUP3_SPI_APPS_CLK_SRC     28
> +#define BLSP2_QUP4_I2C_APPS_CLK_SRC     29
> +#define BLSP2_QUP4_SPI_APPS_CLK_SRC     30
> +#define BLSP2_QUP5_I2C_APPS_CLK_SRC     31
> +#define BLSP2_QUP5_SPI_APPS_CLK_SRC     32
> +#define BLSP2_QUP6_I2C_APPS_CLK_SRC     33
> +#define BLSP2_QUP6_SPI_APPS_CLK_SRC     34
> +#define BLSP2_UART1_APPS_CLK_SRC        35
> +#define BLSP2_UART2_APPS_CLK_SRC        36
> +#define BLSP2_UART3_APPS_CLK_SRC        37
> +#define BLSP2_UART4_APPS_CLK_SRC        38
> +#define BLSP2_UART5_APPS_CLK_SRC        39
> +#define BLSP2_UART6_APPS_CLK_SRC        40
> +#define GP1_CLK_SRC                     41
> +#define GP2_CLK_SRC                     42
> +#define GP3_CLK_SRC                     43
> +#define PCIE_0_AUX_CLK_SRC              44
> +#define PCIE_0_PIPE_CLK_SRC             45
> +#define PDM2_CLK_SRC                    46
> +#define SDCC1_APPS_CLK_SRC              47
> +#define SDCC2_APPS_CLK_SRC              48
> +#define SDCC3_APPS_CLK_SRC              49
> +#define SDCC4_APPS_CLK_SRC              50
> +#define TSIF_REF_CLK_SRC                51
> +#define USB30_MOCK_UTMI_CLK_SRC         52
> +#define USB3_PHY_AUX_CLK_SRC            53
> +#define USB_HS_SYSTEM_CLK_SRC           54
> +#define GCC_BLSP1_AHB_CLK               55
> +#define GCC_BLSP1_QUP1_I2C_APPS_CLK     56
> +#define GCC_BLSP1_QUP1_SPI_APPS_CLK     57
> +#define GCC_BLSP1_QUP2_I2C_APPS_CLK     58
> +#define GCC_BLSP1_QUP2_SPI_APPS_CLK     59
> +#define GCC_BLSP1_QUP3_I2C_APPS_CLK     60
> +#define GCC_BLSP1_QUP3_SPI_APPS_CLK     61
> +#define GCC_BLSP1_QUP4_I2C_APPS_CLK     62
> +#define GCC_BLSP1_QUP4_SPI_APPS_CLK     63
> +#define GCC_BLSP1_QUP5_I2C_APPS_CLK     64
> +#define GCC_BLSP1_QUP5_SPI_APPS_CLK     65
> +#define GCC_BLSP1_QUP6_I2C_APPS_CLK     66
> +#define GCC_BLSP1_QUP6_SPI_APPS_CLK     67
> +#define GCC_BLSP1_UART1_APPS_CLK        69
> +#define GCC_BLSP1_UART2_APPS_CLK        70
> +#define GCC_BLSP1_UART3_APPS_CLK        71
> +#define GCC_BLSP1_UART4_APPS_CLK        72
> +#define GCC_BLSP1_UART5_APPS_CLK        73
> +#define GCC_BLSP1_UART6_APPS_CLK        74
> +#define GCC_BLSP2_AHB_CLK               75
> +#define GCC_BLSP2_QUP1_I2C_APPS_CLK     76
> +#define GCC_BLSP2_QUP1_SPI_APPS_CLK     77
> +#define GCC_BLSP2_QUP2_I2C_APPS_CLK     78
> +#define GCC_BLSP2_QUP2_SPI_APPS_CLK     79
> +#define GCC_BLSP2_QUP3_I2C_APPS_CLK     80
> +#define GCC_BLSP2_QUP3_SPI_APPS_CLK     81
> +#define GCC_BLSP2_QUP4_I2C_APPS_CLK     82
> +#define GCC_BLSP2_QUP4_SPI_APPS_CLK     83
> +#define GCC_BLSP2_QUP5_I2C_APPS_CLK     84
> +#define GCC_BLSP2_QUP5_SPI_APPS_CLK     85
> +#define GCC_BLSP2_QUP6_I2C_APPS_CLK     86
> +#define GCC_BLSP2_QUP6_SPI_APPS_CLK     87
> +#define GCC_BLSP2_UART1_APPS_CLK        88
> +#define GCC_BLSP2_UART2_APPS_CLK        89
> +#define GCC_BLSP2_UART3_APPS_CLK        90
> +#define GCC_BLSP2_UART4_APPS_CLK        91
> +#define GCC_BLSP2_UART5_APPS_CLK        92
> +#define GCC_BLSP2_UART6_APPS_CLK        93
> +#define GCC_BOOT_ROM_AHB_CLK            94
> +#define GCC_GP1_CLK                     95
> +#define GCC_GP2_CLK                     96
> +#define GCC_GP3_CLK                     97
> +#define GCC_MSS_CFG_AHB_CLK             98
> +#define GCC_MSS_Q6_BIMC_AXI_CLK         99
> +#define GCC_PCIE_0_AUX_CLK              100
> +#define GCC_PCIE_0_CFG_AHB_CLK          101
> +#define GCC_PCIE_0_MSTR_AXI_CLK         102
> +#define GCC_PCIE_0_PIPE_CLK             103
> +#define GCC_PCIE_0_SLV_AXI_CLK          104
> +#define GCC_PDM2_CLK                    105
> +#define GCC_PDM_AHB_CLK                 106
> +#define GCC_PRNG_AHB_CLK                107
> +#define GCC_SDCC1_AHB_CLK               108
> +#define GCC_SDCC1_APPS_CLK              109
> +#define GCC_SDCC2_AHB_CLK               110
> +#define GCC_SDCC2_APPS_CLK              111
> +#define GCC_SDCC3_AHB_CLK               112
> +#define GCC_SDCC3_APPS_CLK              113
> +#define GCC_SDCC4_AHB_CLK               114
> +#define GCC_SDCC4_APPS_CLK              115
> +#define GCC_SYS_NOC_USB3_AXI_CLK        116
> +#define GCC_TSIF_AHB_CLK                117
> +#define GCC_TSIF_REF_CLK                118
> +#define GCC_USB2_HS_PHY_SLEEP_CLK       119
> +#define GCC_USB30_MASTER_CLK            120
> +#define GCC_USB30_MOCK_UTMI_CLK         121
> +#define	GCC_USB30_SLEEP_CLK             122
> +#define GCC_USB3_PHY_AUX_CLK            123
> +#define GCC_USB3_PHY_PIPE_CLK           124
> +#define GCC_USB_HS_AHB_CLK              125
> +#define GCC_USB_HS_SYSTEM_CLK           126
> +#define GCC_USB_PHY_CFG_AHB2PHY_CLK     127
> +
> +
> +/* Indexes for GDSCs */
> +#define PCIE_GDSC                       0
> +#define PCIE_0_GDSC                     1
> +#define USB30_GDSC                      2
> +
> +#endif
> diff --git a/include/dt-bindings/reset/qcom,gcc-msm8992.h b/include/dt-bindings/reset/qcom,gcc-msm8992.h
> new file mode 100644
> index 000000000000..558dfeffdeef
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,gcc-msm8992.h
> @@ -0,0 +1,8 @@

License?

> +#ifndef _DT_BINDINGS_RESET_MSM_GCC_8992_H
> +#define _DT_BINDINGS_RESET_MSM_GCC_8992_H
> +
> +#define PCIE_PHY_0_RESET 0
> +#define QUSB2_PHY_RESET 1
> +#define USB3_PHY_RESET 2
> +
> +#endif
> -- 
> 2.26.2
> 
