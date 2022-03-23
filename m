Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79C04E59FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244428AbiCWUmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiCWUmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:42:05 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6289174612;
        Wed, 23 Mar 2022 13:40:35 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b15so3297165edn.4;
        Wed, 23 Mar 2022 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=REuWT7c5q3clJAiy1HaZPdQda7ysOoTGaVnHgUwiC4U=;
        b=TAecRXwRHGGtZ3w9hg5Fyojj+FN4o2cnPtqW5U+Au3mjyzim2axTLd1Gy7BLn6wxzc
         WlVyfoTOvnp0vq56l2kvAmaerXw/h2Gkh50eWfGKgTtdKlBEiy535sdbmXxH3F3kp4j9
         dN6RtGsTuWE7+GngizFmsJtIr6mJf3STMo/5Uy/k97ofzaz990Y8r8B3B/B8+K7GFSer
         MEqnb2yMi5mgH4wVg0eTZ5mrQS3niOSwNtYpnnAVbZ4s9PmfuKL8IehlEYL6r9JBAyBV
         j+mtGztBoG2KXgH49cShvH9nl7bo966k8lNmvq0AQGZqWVSStH7hpnP5iI+T2jM+4VG7
         W/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=REuWT7c5q3clJAiy1HaZPdQda7ysOoTGaVnHgUwiC4U=;
        b=T3ylVAMHLSHztr68FsEpe1qwlejhjS2cGttN5foJp+crV4cwzyJ1Lt700LynWR8IQc
         8Fi7e2T66XFBmIDqImJUZwICKxiUCp/F1sxeo3HsMR0VIzU1IgkrWPWYQWdqiz1dFRaV
         jXj5Emlf04Jd5LqA6FQvdZQPDQ0ZycpgC7utqggg5AnktVYLhK/5/P89+NiM4qky58Ds
         cHexsdbdX02BHm95xWAx3XRL7KaBRNg0oREqYHE76/y9YlLfgF/6185ZVboTr8Mdbx95
         NHMwxiBmlbu+FuJaerc2TiQak7kOUJkkm+uiQvyrW9/jgcMLYjpntw4u1L71CNsD5eCH
         9Ptw==
X-Gm-Message-State: AOAM533qTI3OeN88bRl67HMrnTNVvK5o6Z47u17qIU1JDCtzuIBjWOyY
        YiRB0NHe3aO40V1SxFIZ2HHlZ8jWGOD8YA==
X-Google-Smtp-Source: ABdhPJxO64DGACCZWL1pMWJNU1j7u8r8CYXuA4Y1TrRFHNFsrl2AGMc/6wMKnw9+ArJf5oun+jG4dQ==
X-Received: by 2002:aa7:d1ce:0:b0:419:19ed:725a with SMTP id g14-20020aa7d1ce000000b0041919ed725amr2558635edp.270.1648068033932;
        Wed, 23 Mar 2022 13:40:33 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906605700b006ccebe7f75dsm316586ejj.123.2022.03.23.13.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 13:40:33 -0700 (PDT)
Date:   Wed, 23 Mar 2022 21:40:30 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc1 definition
Message-ID: <YjuFvtE44Uwvht8E@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220218203710.895-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218203710.895-1-petr.vorel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> Angler does not have SD card, thus sdhc2 kept disabled.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,

> credit for assigned-clock{s,-rates} goes to Konrad.
> Thanks!

> [    1.567434] sdhci: Secure Digital Host Controller Interface driver
> [    1.567477] sdhci: Copyright(c) Pierre Ossman
> [    1.573265] Synopsys Designware Multimedia Card Interface Driver
> [    1.577950] sdhci-pltfm: SDHCI platform and OF driver helper
> ...
> [    1.631203] mmc0: SDHCI controller on f9824900.sdhci [f9824900.sdhci] using ADMA 64-bit
> ...
> ### postmarketOS initramfs ###
> ...
> [    1.868905] mmc0: new HS400 MMC card at address 0001
> [    1.871467] mmcblk0: mmc0:0001 064G70 58.2 GiB 
> [    1.876902] GPT:partition_entry_array_crc32 values don't match: 0x4aa75f3b != 0xe3345ddf
> [    1.877211] GPT: Use GNU Parted to correct GPT errors.
> [    1.886103]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44
> [    1.901299] mmcblk0boot0: mmc0:0001 064G70 4.00 MiB 
> [    1.908973] mmcblk0boot1: mmc0:0001 064G70 4.00 MiB 
> [    1.913706] mmcblk0rpmb: mmc0:0001 064G70 4.00 MiB, chardev (234:0)
> ERROR: failed to mount subpartitions!

> => no overclocking warnings.

> Kind regards,
> Petr

>  .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts  | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 0e3dd48f0dbf..6dddf700f744 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> + * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
>   */

>  /dts-v1/;
> @@ -41,3 +41,13 @@ serial@f991e000 {
>  &tlmm {
>  	gpio-reserved-ranges = <85 4>;
>  };
> +
> +&sdhc1 {
> +	status = "okay";
> +
> +	mmc-hs400-1_8v;
> +
> +	/* avoid overclocking warnings */
> +	assigned-clocks = <&gcc GPLL4_EARLY>;
> +	assigned-clock-rates = <384000000>;
As I wrote at Konrad's patch "clk: qcom: gcc-msm8994: Fix gpll4 width" [1]
with that fix this workaround is not needed => I'll submit v5 without this.

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/YjuE+cgGXCLihPIa@pevik/T/#t
> +};
