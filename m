Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D532940B468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 18:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhINQVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 12:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhINQVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 12:21:04 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E51C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 09:19:46 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso19260736otv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 09:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jtb8OFYVUbw9XLg2yYwY4Ltv6cAZL0xcIR85bxlF9uA=;
        b=at6HxkSSyz92um8ZPONMuS1WvGH3tzq9djna/Xd9JXgh8WSHaW3huOltIWeI1u77s/
         XwKKOGepaHXQlRW3lCzGc4X/2SNIPfBQ5CGl3cUsAoJg5tOzzXqVjDPt1ibEeMjqKRr9
         APKUwJtHinEkLUW8LfRXiOXt+tZPm4Y7K3m4ljnO60xv7iq4L+tQyu7BBwwqqlL3Eg+H
         GOKBfu83BYdGUVykZRU7to3gk21pHWi37A2I9223L2JxAokUgo9u8aAzFYqlGzfuXjQP
         Jb+Qo5OPXZp7LEKancmKr4XL6xqcHrBX9+qGvcn6hgmCdlB3b+ZltTuObngXLyaIh1r0
         EV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jtb8OFYVUbw9XLg2yYwY4Ltv6cAZL0xcIR85bxlF9uA=;
        b=gsbvWrI0YO1Hn4Udb7LuS+3tST6HOPFMNd0uQ5uX1wRC1XlfT/NTxjTjwGGGtr6nnF
         BaCebqYeOsPHcXRcKwjU1bHY1rXWlUuo6rjLlNgBpVEXImc35JuNCddD3pG+alAhAZld
         xnNZnxaS+dzifpzIxe1dvtZwOd0W5k9FEPAodigOokdO5gpegw775WGxOXJztwyXcNnr
         cgf7jZLDzX/1zcMUIObt1RFblYZvQbNJ0HO9Xnn8tKFxh0bSAv1H/AvBESm6wlg6CVCL
         gll+zau05O1/sbuiQM5wdGYh69TthW0enPTidoElh52qOwI1sGmumVwWaUb7Mfgo4qtJ
         f34w==
X-Gm-Message-State: AOAM5318GU94mFGEUaRe8TztImu7XM9CBr+iuGl0ozFMeAKzWOVHYFYt
        7jOyx8WK3lpwwXjwbhp4HzS+NA==
X-Google-Smtp-Source: ABdhPJwcyBDRYHdI3C8TASoR12zuUKZ8BwdC++6KzkmP0P0TKJfrjymH8IhpGDm1tI5v6oIvVKwi3Q==
X-Received: by 2002:a9d:4d8a:: with SMTP id u10mr15608379otk.21.1631636385946;
        Tue, 14 Sep 2021 09:19:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u19sm2708436oof.30.2021.09.14.09.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:19:45 -0700 (PDT)
Date:   Tue, 14 Sep 2021 11:19:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 17/18] arm64: dts: qcom: Add device tree for Sony
 Xperia 10 III
Message-ID: <YUDLn1l+EfKLBM+f@builder.lan>
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
 <20210828131814.29589-17-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828131814.29589-17-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 28 Aug 08:18 CDT 2021, Konrad Dybcio wrote:

> Add initial SM6350 SoC and Sony Xperia 10 III (PDX213, Lena platform) device
> trees. There is no sign of another Lena devices on the horizon, so a common
> DTSI is not created for now. 10 III features a Full HD OLED display and 5G
> support, among other nice things like USB3.
> 

Thanks for the series, looks quite nice, so please respin with the few
small modifications noted in the reviews.

> The bootloader is VERY unpleasant, to get a bootable setup you have to run:
> 
> mkbootimg --kernel arch/arm64/boot/Image.gz --ramdisk [some initrd] \
> --dtb arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb \
> --cmdline "[some cmdline]" --base 0 --kernel_offset 0x8000 \
> --ramdisk_offset 0x1000000 --dtb_offset 0x1f00000 --os_version 11 \
> --os_patch_level "2021-08" --tags_offset 0x100 --pagesize 4096 \
> --header_version 2 -o mainline.img
> 
> adb reboot bootloader
> 
> // You have to either pull vbmeta{"","_system"} from
> // /dev/block/bootdevice/by-name/ or build one as a part of AOSP build process
> fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
> fastboot --disable-verity --disable-verification flash vbmeta_system \
> vbmeta_system.img
> 
> fastboot flash boot mainline.img
> fastboot erase dtbo // This will take approx 70s...

I always assumed that erase was broken when it took more than 5 seconds
to clear the dtbo partition(s). So I always just flash a few kB of
/dev/zero.

Regards,
Bjorn

> fastboot reboot
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../qcom/sm6350-sony-xperia-lena-pdx213.dts   | 57 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5bbeb058e1f2..d1ace2541ce1 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akatsuki.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-apollo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> new file mode 100644
> index 000000000000..a26c23754f5d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +/dts-v1/;
> +
> +#include "sm6350.dtsi"
> +
> +/ {
> +	model = "Sony Xperia 10 III";
> +	compatible = "sony,pdx213", "qcom,sm6350";
> +	qcom,msm-id = <434 0x10000>, <459 0x10000>;
> +	qcom,board-id = <0x1000B 0>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer@a0000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xa0000000 0 0x2300000>;
> +			width = <1080>;
> +			height = <2520>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			clocks = <&gcc GCC_DISP_AXI_CLK>;
> +		};
> +	};
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	cd-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <13 4>, <45 2>, <56 2>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	maximum-speed = "super-speed";
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +};
> -- 
> 2.33.0
> 
