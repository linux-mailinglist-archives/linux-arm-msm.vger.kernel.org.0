Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B42620C37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 10:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiKHJaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 04:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiKHJ3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 04:29:51 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66ED25C42
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 01:29:49 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d20so20167271ljc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 01:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOVmsonL+k/0HZVK2nxpFgpQMHWhsli4Q3QlCw0qmsE=;
        b=tDhHK71PxNsz0WNgtB/w97HLA516yj+UB6dkiAiSfyEHunUfai9u2vudUgCSjnZK4g
         XI212VYIzT3Z+8kAiNxqL44J0IDz9EM7L3a/5hY3TcY0mCcDlWjy1fKU610hHLUwsIQD
         fFP+Eh2u7g8oP0fWT2YC+pbmkzlY0bAnFBuEgUa5Ueb5UjR/UQGUMk9TspPhb7/vGvdX
         4vjAT1iZDFUTnIOncRdoPRk5iPbMhvDc4tkiwBGsF7GV/R7SLGvcmlSeCL8pz6M0YM7T
         rw9ymsI/bExsNZV4Rxiq7izCA9+5l2J9B5A0HtYIj2ceFX1E3i31FYCC44Ssg9ZrBITd
         nXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOVmsonL+k/0HZVK2nxpFgpQMHWhsli4Q3QlCw0qmsE=;
        b=G2OmD+6Ypl02TowUb3IY+GG0mcWVUCWOdYfSIY1t+bk7NAFslSDGXzunvNxm/yc5Ka
         ylKEi1B0pWVEGxiN4GSFrCcZLhpT0E5BENXbO+qYKS3n51chJaVSvQ5X/MDshHoUAMfp
         Sh8RCq+sRnzZeMWv2Ln1pGUHkWS4Q2gS61iSGq3egW4wigJgEpclZEJ9pjohYm5JAiab
         81ftOs5yKxUTXJxxdUGueSG+8yYPk/SBAJ0Gk9y02oI0H4y/R8eCBXZLk6SU2N6KThXb
         glOv8xjjZC55QYu2ahRpurSL9nH4WuYN5KdkVO2sf1foZg+1rB6vRvTbe8ayWUDUGMHw
         zB4A==
X-Gm-Message-State: ACrzQf2s5JIFR2DY8VutZKfM76QB4mViXCOK+nnMJvWiOELHZWKy/NoP
        BAU9ei339WpR5C4zCxqonHzpdA==
X-Google-Smtp-Source: AMsMyM40579+zfxIe+Ql7/outiP4k9BXLWi8yzxj8i7/ri53RvHNqLkyvFPwfRVxa4oQ6UqtiowIyw==
X-Received: by 2002:a2e:a211:0:b0:277:1888:e14b with SMTP id h17-20020a2ea211000000b002771888e14bmr6331047ljm.339.1667899788261;
        Tue, 08 Nov 2022 01:29:48 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o4-20020a05651205c400b0048ae518364dsm1721417lfo.148.2022.11.08.01.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:29:47 -0800 (PST)
Message-ID: <13d80a37-9202-480c-94ec-13cb1abce305@linaro.org>
Date:   Tue, 8 Nov 2022 10:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add sdm670 and pixel 3a device
 trees
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221108030411.59409-1-mailingradian@gmail.com>
 <20221108030411.59409-5-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108030411.59409-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 04:04, Richard Acayan wrote:
> The Qualcomm Snapdragon 670 has been out for a while. Add a device tree
> for it and the Google Pixel 3a as the first device.
> 
> The Pixel 3a has the same bootloader issue as the Pixel 3 and will not work
> on Android 10 bootloaders or later until it gets fixed for the Pixel 3.
> 
> SoC Initial Features:
>  - power management
>  - clocks
>  - pinctrl
>  - eMMC
>  - USB 2.0
>  - GENI I2C
>  - IOMMU
>  - RPMh
>  - interrupts
> 
> Device-Specific Initial Features:
>  - side buttons (keys)
>  - regulators
>  - touchscreen
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sdm670-google-sargo.dts     |  533 ++++++++
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          | 1160 +++++++++++++++++
>  3 files changed, 1694 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm670.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index b0558d3389e5..4eb5d8829efb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -124,6 +124,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> new file mode 100644
> index 000000000000..fe3f61f8a348
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device tree for Google Pixel 3a, adapted from google-blueline device tree,
> + * xiaomi-lavender device tree, and oneplus-common device tree.
> + *
> + * Copyright (c) 2022, Richard Acayan. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include "sdm670.dtsi"
> +#include "pm660.dtsi"
> +#include "pm660l.dtsi"
> +
> +/delete-node/ &mpss_region;
> +/delete-node/ &venus_mem;
> +/delete-node/ &wlan_msa_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &mba_region;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &gpu_mem;
> +
> +/ {
> +	model = "Google Pixel 3a";
> +	compatible = "google,sargo", "qcom,sdm670";
> +	qcom,board-id = <0x00041e05 0>;
> +	qcom,msm-id = <321 0x20001>;

These two are not allowed for your platform. If you tested your DTS, you
would see:

 /: qcom,board-id: False schema does not allow [[269829, 0]]
 /: qcom,msm-id: False schema does not allow [[321, 131073]]

This must be fixed.

Best regards,
Krzysztof

