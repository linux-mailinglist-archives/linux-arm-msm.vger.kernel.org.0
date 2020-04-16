Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1401AC1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 14:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894585AbgDPM4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 08:56:37 -0400
Received: from foss.arm.com ([217.140.110.172]:60334 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894377AbgDPM4f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 08:56:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF5C1FB;
        Thu, 16 Apr 2020 05:56:34 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 688BA3F68F;
        Thu, 16 Apr 2020 05:56:33 -0700 (PDT)
Date:   Thu, 16 Apr 2020 13:56:31 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Robert Richter <rrichter@marvell.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific
 errata
Message-ID: <20200416125630.GF4987@lakrids.cambridge.arm.com>
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416115658.20406-3-geert+renesas@glider.be>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Geert,

On Thu, Apr 16, 2020 at 01:56:58PM +0200, Geert Uytterhoeven wrote:
> Currently the user is asked about enabling support for each and every
> vendor-specific erratum, even when support for the specific platform is
> not enabled.
> 
> Fix this by adding platform dependencies to the config options
> controlling support for vendor-specific errata.
> 
> Note that FUJITSU_ERRATUM_010001 is left untouched, as no config symbol
> exists for the Fujitsu A64FX platform.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm not su1re that it makes sense to do this in general, becaose the
ARCH_* platform symbols are about plactform/SoC support (e.g. pinctrl
drivers), and these are (mostly) CPU-local and/or VM-visible.

I think that it makes sense for those to be independent because:

* future SoCs in the same family might not need the same CPU errata
  workarounds, and it's arguably just as confusing to have the option
  there.

* It prevents building a minimal VM image with all (non-virtualized)
  platform support disabled, but all possible (VM-visible) errata
  options enabled. I do that occassionally for testing/analysis, and I
  can imagine this is useful for those building images that are only
  intended to be used in VMs.

I think the change to SOCIONEXT_SYNQUACER_PREITS makes sense given
that's a platform-level detail. Arguably that should be moved into
drivers/irqchip/Kconfig.

Thanks,
Mark.

> ---
>  arch/arm64/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 8d33d7fed6d8549b..81f52f0b988e6350 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -622,6 +622,8 @@ config ARM64_ERRATUM_1542419
>  
>  	  If unsure, say Y.
>  
> +if ARCH_THUNDER2
> +
>  config CAVIUM_ERRATUM_22375
>  	bool "Cavium erratum 22375, 24313"
>  	default y
> @@ -697,6 +699,8 @@ config CAVIUM_TX2_ERRATUM_219
>  
>  	  If unsure, say Y.
>  
> +endif # ARCH_THUNDER2
> +
>  config FUJITSU_ERRATUM_010001
>  	bool "Fujitsu-A64FX erratum E#010001: Undefined fault may occur wrongly"
>  	default y
> @@ -718,6 +722,7 @@ config FUJITSU_ERRATUM_010001
>  
>  config HISILICON_ERRATUM_161600802
>  	bool "Hip07 161600802: Erroneous redistributor VLPI base"
> +	depends on ARCH_HISI
>  	default y
>  	help
>  	  The HiSilicon Hip07 SoC uses the wrong redistributor base
> @@ -726,6 +731,8 @@ config HISILICON_ERRATUM_161600802
>  
>  	  If unsure, say Y.
>  
> +if ARCH_QCOM
> +
>  config QCOM_FALKOR_ERRATUM_1003
>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>  	default y
> @@ -768,8 +775,11 @@ config QCOM_FALKOR_ERRATUM_E1041
>  
>  	  If unsure, say Y.
>  
> +endif # ARCH_QCOM
> +
>  config SOCIONEXT_SYNQUACER_PREITS
>  	bool "Socionext Synquacer: Workaround for GICv3 pre-ITS"
> +	depends on ARCH_SYNQUACER
>  	default y
>  	help
>  	  Socionext Synquacer SoCs implement a separate h/w block to generate
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
