Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87810974FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 10:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfHUI3L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 04:29:11 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46431 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHUI3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 04:29:11 -0400
Received: by mail-vs1-f66.google.com with SMTP id x20so579700vsx.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUO9A4l3IfX0BlcDjJGE9UTcfydGN+ATiaQcy0Ok630=;
        b=mtHid4fIRJBF1KgK1ORVUgVi130Qk5dhCtY9XJmivMq1x4zdyLroy2KcuhKSZAxYjI
         9XVAtxvhY0CoxhsHQDsrDYOryjyTQbG8+XhUxjKTkbrSUdL2cINzJmCLozYSWdxd0eDE
         4Ds2x98xlIPrmc+nJjHWT51Ajpsc96ud33Jp3Gc6THTBgFMDnaSAOUr1XoySaWNPqNXT
         BmiLogl44KCvqzEw7zUR42Qbjra4jHITvvpMye81DKIoVrxomHxc2uXP3AT0dca5UpJd
         MXPp+OtygXsRPPdWSOe1X54tjIOQHJ/cHA+AFL105vdC0KST9FywtcwIncegrJoDOzQ0
         VZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUO9A4l3IfX0BlcDjJGE9UTcfydGN+ATiaQcy0Ok630=;
        b=sbT0VCgghg/tENJxUVRRtRIHH7K/Slio6CkdqBC+QyMTB5ALLK/vWrslnBVMTxsrV+
         VpVs0jH6n5fkd7/WlOe6nRYj/u0CKiNChGcLi+F1aOZkVdGfZ9jVR/bNfTLxH0mIzMoK
         kmPyFEqw1qsMUcKbtc44Bngu3H87IRkhB64f1M7UT3sCsZuq2T7+lJLkbwFxFAX2HkMW
         5/HLTD1D9AbbuQ5e0cV7KAg2e5DQq0GjyTPU0qsg2Jo3uU6bDbhH3VxwzTuxlc9Nk+hW
         mBFaJK0euouFVP0i0orVVKTt0JykcBl34m6xaj92nZ1O1XLU9Nc7RguC1Q//S/CApcBt
         cpIg==
X-Gm-Message-State: APjAAAWaY+Du/9vuAtpeM8MHY+p66fjSD+VzhII8KaSKzVo2y6Nby0WI
        8y8hCp8n3e1UzfjzOy0KAmvQ9ZrvhlQBcFaxA2ky+Q==
X-Google-Smtp-Source: APXvYqzPlqc2KEsTtkq7U9A3ZJZcmf3UbjlldfSSa8wVqepcd4DoaZaQ2lc/Udlux9Sn+rpIu1TYvoN7MhVgwloZBFo=
X-Received: by 2002:a67:2e0e:: with SMTP id u14mr20554451vsu.182.1566376150531;
 Wed, 21 Aug 2019 01:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190820172351.24145-1-vkoul@kernel.org> <20190820172351.24145-7-vkoul@kernel.org>
In-Reply-To: <20190820172351.24145-7-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 21 Aug 2019 13:58:58 +0530
Message-ID: <CAHLCerP-VP=SguQz4nA2ZFMiKBsNajO9E-CqQivdQm-iviqToQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: sm8150-mtp: add base dts file
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 10:55 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> This add base DTS file for sm8150-mtp and enables boot to console, adds
> tlmm reserved range, resin node, volume down key and also includes pmic
> file.

For some reason, your mailer sent out 2 patches 5/8. I was wondering
why the patch 5 failed to apply, but it seems the two are identical.
Lore seems to show the same.


> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |  1 +
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 51 +++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0a7e5dfce6f7..1964dacaf19b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)       += sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sdm845-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> new file mode 100644
> index 000000000000..6f5777f530ae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8150.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/ {
> +       model = "Qualcomm Technologies, Inc. SM8150 MTP";
> +       compatible = "qcom,sm8150-mtp";
> +
> +       aliases {
> +               serial0 = &uart2;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&qupv3_id_1 {
> +       status = "okay";
> +};
> +
> +&pon {
> +       pwrkey {
> +               status = "okay";
> +       };
> +
> +       resin {
> +               compatible = "qcom,pm8941-resin";
> +               interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
> +               debounce = <15625>;
> +               bias-pull-up;
> +               linux,code = <KEY_VOLUMEDOWN>;
> +       };
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges = <0 4>, <126 4>;
> +};
> +
> +&uart2 {
> +       status = "okay";
> +};
> --
> 2.20.1
>
