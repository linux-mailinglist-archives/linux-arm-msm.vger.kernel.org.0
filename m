Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D57E13DEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 16:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgAPPco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 10:32:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:40814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgAPPco (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 10:32:44 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 557F42081E;
        Thu, 16 Jan 2020 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579188763;
        bh=2KRjK1V41mmh2xoe9yYAj/6+Sq91KlveZCbfKn1X4x0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SldGcIE8mha8oKPdrIJb8hthCy0q6gcgCf67U/lpFtQ/XcsdwrAw3YY2m97nPOltB
         FkCxoc/5h7MIqK71DwsGfEgIyrYs6sWdsl2zuc/d8GPBOM+D8muFITxxgPfy62MAfT
         HCM5EYBCOfA46QiSbtnvOL1lIN51VTMvF2KX2IDM=
Date:   Thu, 16 Jan 2020 15:32:38 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        jhugo@codeaurora.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        James Morse <james.morse@arm.com>
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
Message-ID: <20200116153235.GA18909@willie-the-truck>
References: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[+Jeffrey]

On Thu, Jan 16, 2020 at 07:49:12PM +0530, Sai Prakash Ranjan wrote:
> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
> are not affected by Spectre variant 2. Add them to spectre_v2
> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
> vulnerability sysfs value.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/include/asm/cputype.h | 6 ++++++
>  arch/arm64/kernel/cpu_errata.c   | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index aca07c2f6e6e..7219cddeba66 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -85,6 +85,9 @@
>  #define QCOM_CPU_PART_FALKOR_V1		0x800
>  #define QCOM_CPU_PART_FALKOR		0xC00
>  #define QCOM_CPU_PART_KRYO		0x200
> +#define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
> +#define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
> +#define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805

Jeffrey is the only person I know who understands the CPU naming here, so
I've added him in case this needs either renaming or extending to cover
other CPUs. I wouldn't be at all surprised if we need a function call
rather than a bunch of table entries...

That said, the internet claims that KRYO4XX gold is based on Cortex-A76,
and so CSV2 should be set...

Will
