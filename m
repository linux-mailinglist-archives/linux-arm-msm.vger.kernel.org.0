Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE05FCBEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKNReu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:34:50 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44406 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfKNRes (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:34:48 -0500
Received: by mail-pf1-f194.google.com with SMTP id q26so4687599pfn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 09:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=13YyYJplXDTAtMUUmDzUuXFByJXSlwAOaXK8MijQBjA=;
        b=IHhR/l4rvRJ0l/zyGknGjc+hj7WtgujeTGkVuOR8ZYP2h+9Eq8NAThS6eQcYtaCFmv
         oqHRrBCkabBVnxzi78L824pjAw2Zsv+IU+1Rx6mPaVaxr5LG0uB3ysBwfwQuVzlcplaX
         Xc5beo8VaCPOV1bRsAT0OODgBzq1GVga963JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=13YyYJplXDTAtMUUmDzUuXFByJXSlwAOaXK8MijQBjA=;
        b=PN74cf4d0FQYQpmjP6Bc9Ghw8c9JoRQPPvsa1gKTvTOjG7s/ZBTy17I5wKFf6YoGgY
         4l+W1W/XXFWNqYUITA0mNanORfqNnefl/HVQHdkX18TxGE1iGguJYUzNyGlUkTX03UWB
         kuucaIP2LMJbSqiqlClI0znRfmK6caVThY37PUQXJ+FoFeqQdilz5Qjm2Hjj1Fpw/xVu
         MpFvl71cSPQxUix7jQ1Xcm/Lqqjp08r56jv1aEu2Gw1dgoCjMKsPXgTPC8aCW0iCE8FK
         keF0c1MYmpjD8tLV7tbepPUka6Qyu3EUOqo3Gj+0yEG3j5cDUuoSbzlUligb0+cKep2L
         5BpQ==
X-Gm-Message-State: APjAAAWZoiPitM7sVaoo+TLsDoZlWdVipYJ7Prw/IUjCSQZUQveTgHc8
        xQXTtwJELjJlDh0x+nhfjHbgAQ==
X-Google-Smtp-Source: APXvYqyfkE4JxZAkCvYnlFt7nUUsEc9loLQqh9js6N5l8TKtBmrUj5YvYfL0kFOvLKUbKPwrNoqr5Q==
X-Received: by 2002:a63:20f:: with SMTP id 15mr8862443pgc.3.1573752885246;
        Thu, 14 Nov 2019 09:34:45 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c1sm7275308pjc.23.2019.11.14.09.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 09:34:44 -0800 (PST)
Date:   Thu, 14 Nov 2019 09:34:42 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?utf-8?B?wqA=?= <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Message-ID: <20191114173442.GH27773@google.com>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-6-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-6-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> Add support for the global clock controller found on SC7180
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sc7180.c | 2450 +++++++++++++++++++++++++++++++++
>  3 files changed, 2460 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sc7180.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 32dbb4f09492..91706d88eeeb 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -227,6 +227,15 @@ config QCS_GCC_404
>  	  Say Y if you want to use multimedia devices or peripheral
>  	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> 
> +config SC_GCC_7180
> +	tristate "SC7180 Global Clock Controller"
> +	select QCOM_GDSC
> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the global clock controller on SC7180 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  I2C, USB, UFS, SDCC, etc.
> +
>  config SDM_CAMCC_845
>  	tristate "SDM845 Camera Clock Controller"
>  	select SDM_GCC_845
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 4a813b4055d0..6fb356a0bbf5 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>  obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
> +obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
>  obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
>  obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
>  obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> new file mode 100644
> index 000000000000..38424e63bcae
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> ...
> +static int __init gcc_sc7180_init(void)
> +{
> +	return platform_driver_register(&gcc_sc7180_driver);
> +}
> +core_initcall(gcc_sc7180_init);

This was a subsys_initcall in v3. In combination with the MSS clock driver
for SC7180 (not posted yet) the change 'causes' an abort:

[    4.892250] DBG: clk_is_enabled_regmap: mss_axi_nav_clk

[    4.586124] Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
[    4.593817] Modules linked in:
[    4.596976] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G S      W         5.4.0-rc6 #27
[    4.604843] Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
[    4.611550] pstate: 20c00089 (nzCv daIf +PAN +UAO)
[    4.616484] pc : regmap_mmio_read32le+0x20/0x40
[    4.621140] lr : regmap_mmio_read+0x44/0x6c
[    4.625443] sp : ffffffc01005bb10
[    4.628863] x29: ffffffc01005bb20 x28: 0000000000000000
[    4.634331] x27: 0000000000000000 x26: 0000000000000000
[    4.639787] x25: 0000000000000000 x24: ffffffd9a8ae1018
[    4.645244] x23: ffffffd9a8e12148 x22: ffffff8177292800
[    4.650712] x21: 00000000000000bc x20: ffffff8177342d80
[    4.656168] x19: 00000000000000bc x18: 0000000059d6eecd
[    4.661635] x17: 00000000765f46d1 x16: 00000000bbaf844b
[    4.667103] x15: 0000000098366c8e x14: 4000000000000000
[    4.672559] x13: ffffff8174b43b30 x12: 0000000000000000
[    4.678015] x11: 0000000000000000 x10: 0000000000000000
[    4.683482] x9 : 0000000000000001 x8 : ffffffc0100250bc
[    4.688949] x7 : 0000000000000008 x6 : 0000000000000000
[    4.694416] x5 : 0000000000000000 x4 : 0000000000000000
[    4.699873] x3 : 0000000000000000 x2 : ffffffc01005bc04
[    4.705340] x1 : 00000000000000bc x0 : ffffff8177342d80
[    4.710807] Call trace:
[    4.713330]  regmap_mmio_read32le+0x20/0x40
[    4.717634]  regmap_mmio_read+0x44/0x6c
[    4.721591]  _regmap_bus_reg_read+0x34/0x44
[    4.725895]  _regmap_read+0x88/0x16c
[    4.729580]  regmap_read+0x54/0x78
[    4.733088]  clk_is_enabled_regmap+0x34/0x84
[    4.737478]  clk_core_is_enabled+0x68/0xac
[    4.741699]  clk_disable_unused_subtree+0x90/0x23c
[    4.746621]  clk_disable_unused+0x44/0x108
[    4.750844]  do_one_initcall+0x120/0x2bc
[    4.754886]  do_initcall_level+0x14c/0x174
[    4.759105]  do_basic_setup+0x30/0x48
[    4.762876]  kernel_init_freeable+0xc4/0x144
[    4.767266]  kernel_init+0x14/0x100
[    4.770855]  ret_from_fork+0x10/0x18
[    4.774546] Code: aa0003f4 d503201f f9400288 8b334108 (b9400100)
[    4.780813] ---[ end trace e75cb36fe5e38dd3 ]---
[    4.791327] Kernel panic - not syncing: Fatal exception
[    4.796710] SMP: stopping secondary CPUs
[    4.801330] Kernel Offset: 0x1997c00000 from 0xffffffc010000000
[    4.807414] PHYS_OFFSET: 0xfffffff180000000
[    4.811718] CPU features: 0x0006,2a80aa18
[    4.815841] Memory Limit: none
[    4.824753] ---[ end Kernel panic - not syncing: Fatal exception ]---

I understand that we don't care too much about the MSS clock driver at this
point since it is out of tree, just wanted to mention it, maybe it helps saving
a bit of time debugging later on.
