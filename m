Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487BA1AC1E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 14:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894593AbgDPM5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 08:57:43 -0400
Received: from foss.arm.com ([217.140.110.172]:60366 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894447AbgDPM5l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 08:57:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409AA1FB;
        Thu, 16 Apr 2020 05:57:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B093E3F68F;
        Thu, 16 Apr 2020 05:57:38 -0700 (PDT)
Date:   Thu, 16 Apr 2020 13:57:36 +0100
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
Subject: Re: [PATCH 1/2] arm64: Sort vendor-specific errata
Message-ID: <20200416125736.GG4987@lakrids.cambridge.arm.com>
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416115658.20406-2-geert+renesas@glider.be>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 01:56:57PM +0200, Geert Uytterhoeven wrote:
> Sort configuration options for vendor-specific errata by vendor, to
> increase uniformity.
> Move ARM64_WORKAROUND_REPEAT_TLBI up, as it is also selected by
> ARM64_ERRATUM_1286807.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This makes sense to me, so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/Kconfig | 72 +++++++++++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 40fb05d96c6072c9..8d33d7fed6d8549b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -553,6 +553,9 @@ config ARM64_ERRATUM_1530923
>  
>  	  If unsure, say Y.
>  
> +config ARM64_WORKAROUND_REPEAT_TLBI
> +	bool
> +
>  config ARM64_ERRATUM_1286807
>  	bool "Cortex-A76: Modification of the translation table for a virtual address might lead to read-after-read ordering violation"
>  	default y
> @@ -694,6 +697,35 @@ config CAVIUM_TX2_ERRATUM_219
>  
>  	  If unsure, say Y.
>  
> +config FUJITSU_ERRATUM_010001
> +	bool "Fujitsu-A64FX erratum E#010001: Undefined fault may occur wrongly"
> +	default y
> +	help
> +	  This option adds a workaround for Fujitsu-A64FX erratum E#010001.
> +	  On some variants of the Fujitsu-A64FX cores ver(1.0, 1.1), memory
> +	  accesses may cause undefined fault (Data abort, DFSC=0b111111).
> +	  This fault occurs under a specific hardware condition when a
> +	  load/store instruction performs an address translation using:
> +	  case-1  TTBR0_EL1 with TCR_EL1.NFD0 == 1.
> +	  case-2  TTBR0_EL2 with TCR_EL2.NFD0 == 1.
> +	  case-3  TTBR1_EL1 with TCR_EL1.NFD1 == 1.
> +	  case-4  TTBR1_EL2 with TCR_EL2.NFD1 == 1.
> +
> +	  The workaround is to ensure these bits are clear in TCR_ELx.
> +	  The workaround only affects the Fujitsu-A64FX.
> +
> +	  If unsure, say Y.
> +
> +config HISILICON_ERRATUM_161600802
> +	bool "Hip07 161600802: Erroneous redistributor VLPI base"
> +	default y
> +	help
> +	  The HiSilicon Hip07 SoC uses the wrong redistributor base
> +	  when issued ITS commands such as VMOVP and VMAPP, and requires
> +	  a 128kB offset to be applied to the target address in this commands.
> +
> +	  If unsure, say Y.
> +
>  config QCOM_FALKOR_ERRATUM_1003
>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>  	default y
> @@ -705,9 +737,6 @@ config QCOM_FALKOR_ERRATUM_1003
>  	  is unchanged. Work around the erratum by invalidating the walk cache
>  	  entries for the trampoline before entering the kernel proper.
>  
> -config ARM64_WORKAROUND_REPEAT_TLBI
> -	bool
> -
>  config QCOM_FALKOR_ERRATUM_1009
>  	bool "Falkor E1009: Prematurely complete a DSB after a TLBI"
>  	default y
> @@ -729,25 +758,6 @@ config QCOM_QDF2400_ERRATUM_0065
>  
>  	  If unsure, say Y.
>  
> -config SOCIONEXT_SYNQUACER_PREITS
> -	bool "Socionext Synquacer: Workaround for GICv3 pre-ITS"
> -	default y
> -	help
> -	  Socionext Synquacer SoCs implement a separate h/w block to generate
> -	  MSI doorbell writes with non-zero values for the device ID.
> -
> -	  If unsure, say Y.
> -
> -config HISILICON_ERRATUM_161600802
> -	bool "Hip07 161600802: Erroneous redistributor VLPI base"
> -	default y
> -	help
> -	  The HiSilicon Hip07 SoC uses the wrong redistributor base
> -	  when issued ITS commands such as VMOVP and VMAPP, and requires
> -	  a 128kB offset to be applied to the target address in this commands.
> -
> -	  If unsure, say Y.
> -
>  config QCOM_FALKOR_ERRATUM_E1041
>  	bool "Falkor E1041: Speculative instruction fetches might cause errant memory access"
>  	default y
> @@ -758,22 +768,12 @@ config QCOM_FALKOR_ERRATUM_E1041
>  
>  	  If unsure, say Y.
>  
> -config FUJITSU_ERRATUM_010001
> -	bool "Fujitsu-A64FX erratum E#010001: Undefined fault may occur wrongly"
> +config SOCIONEXT_SYNQUACER_PREITS
> +	bool "Socionext Synquacer: Workaround for GICv3 pre-ITS"
>  	default y
>  	help
> -	  This option adds a workaround for Fujitsu-A64FX erratum E#010001.
> -	  On some variants of the Fujitsu-A64FX cores ver(1.0, 1.1), memory
> -	  accesses may cause undefined fault (Data abort, DFSC=0b111111).
> -	  This fault occurs under a specific hardware condition when a
> -	  load/store instruction performs an address translation using:
> -	  case-1  TTBR0_EL1 with TCR_EL1.NFD0 == 1.
> -	  case-2  TTBR0_EL2 with TCR_EL2.NFD0 == 1.
> -	  case-3  TTBR1_EL1 with TCR_EL1.NFD1 == 1.
> -	  case-4  TTBR1_EL2 with TCR_EL2.NFD1 == 1.
> -
> -	  The workaround is to ensure these bits are clear in TCR_ELx.
> -	  The workaround only affects the Fujitsu-A64FX.
> +	  Socionext Synquacer SoCs implement a separate h/w block to generate
> +	  MSI doorbell writes with non-zero values for the device ID.
>  
>  	  If unsure, say Y.
>  
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
