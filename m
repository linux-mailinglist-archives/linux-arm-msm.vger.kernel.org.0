Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE6DE8776
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 12:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbfJ2LuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 07:50:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727799AbfJ2LuN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 07:50:13 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5318521D7C;
        Tue, 29 Oct 2019 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572349813;
        bh=p2adGSsLxFxJ6cJw5+JhARA/vjF5DCxuALEJz8Rs+gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ykT8g89+JWnDxsAJIOKwWqOE7A55myYIXLzfivx+uV0Dc6SF+5RuHkqtR5M6IDv1J
         AU4L9D/f+lTo9naAOu80Tc4BUjrFLT4WBKFWJGCM3WBRVAJ0djYZArXJ1OcSZceRo2
         H/hLX75tkDBzcYUerj12rnOXHPZrt3Tgrd4h9Bqo=
Date:   Tue, 29 Oct 2019 11:50:08 +0000
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: cpufeature: Enable Qualcomm Falkor errata 1009
 for Kryo
Message-ID: <20191029115008.GD12103@willie-the-truck>
References: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 28, 2019 at 11:06:04PM -0700, Bjorn Andersson wrote:
> The Kryo cores share errata 1009 with Falkor, so add their model
> definitions and enable it for them as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/include/asm/cputype.h | 4 ++++
>  arch/arm64/kernel/cpu_errata.c   | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index b1454d117cd2..8067476ea2e4 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -84,6 +84,8 @@
>  #define QCOM_CPU_PART_FALKOR_V1		0x800
>  #define QCOM_CPU_PART_FALKOR		0xC00
>  #define QCOM_CPU_PART_KRYO		0x200
> +#define QCOM_CPU_PART_KRYO_GOLD		0x211
> +#define QCOM_CPU_PART_KRYO_SILVER	0x205

Can you double-check this, please? My Pixel-1 phone claims something with
0x201, but I don't know if that's what you were aiming for. It would be
great if Qualcomm could document these register fields somewhere, especially
since we're trying to work around their hardware errata for them.

That said...

>  #define NVIDIA_CPU_PART_DENVER		0x003
>  #define NVIDIA_CPU_PART_CARMEL		0x004
> @@ -109,6 +111,8 @@
>  #define MIDR_QCOM_FALKOR_V1 MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR_V1)
>  #define MIDR_QCOM_FALKOR MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_FALKOR)
>  #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
> +#define MIDR_QCOM_KRYO_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_GOLD)
> +#define MIDR_QCOM_KRYO_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_SILVER)
>  #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
>  #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index cdd8df033536..315780e7bee7 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -627,6 +627,8 @@ static const struct midr_range arm64_harden_el2_vectors[] = {
>  static const struct midr_range arm64_repeat_tlbi_cpus[] = {
>  #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
>  	MIDR_RANGE(MIDR_QCOM_FALKOR_V1, 0, 0, 0, 0),
> +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_GOLD),
> +	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_SILVER),

... why aren't you following what we do for E1003 and using the
'is_kryo_midr' callback to match these CPUs?

Will
