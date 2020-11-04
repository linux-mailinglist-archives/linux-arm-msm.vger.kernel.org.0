Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EBE2A6516
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 14:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgKDN1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 08:27:13 -0500
Received: from foss.arm.com ([217.140.110.172]:37138 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729794AbgKDN1N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 08:27:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56447139F;
        Wed,  4 Nov 2020 05:27:12 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC37A3F719;
        Wed,  4 Nov 2020 05:27:11 -0800 (PST)
Date:   Wed, 4 Nov 2020 13:27:10 +0000
From:   Ionela Voinescu <ionela.voinescu@arm.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] arm64: defconfig: enable INTERCONNECT for Qualcomm
 chipsets
Message-ID: <20201104132655.GA1951@arm.com>
References: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi guys,

On Thursday 17 Sep 2020 at 23:39:10 (+0300), Dmitry Baryshkov wrote:
> Enable CONFIG_INTERCONNECT and interconnect drivers for several Qualcomm
> chipsets to enable bus bandwidth control on these SoCs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 63003ec116ee..2e746ebb9245 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1023,6 +1023,12 @@ CONFIG_SLIMBUS=m
>  CONFIG_SLIM_QCOM_CTRL=m
>  CONFIG_SLIM_QCOM_NGD_CTRL=m
>  CONFIG_MUX_MMIO=y
> +CONFIG_INTERCONNECT=y
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_SDM845=m
> +CONFIG_INTERCONNECT_QCOM_SM8150=m
> +CONFIG_INTERCONNECT_QCOM_SM8250=m

This needs an additional

+CONFIG_INTERCONNECT_QCOM_OSM_L3=m
or
+CONFIG_INTERCONNECT_QCOM_OSM_L3=y

Without it cpufreq fails to initialize on DB845c.

When CONFIG_INTERCONNECT_QCOM_OSM_L3=n (which is what it will default to
when doing ARCH=arm64 make defcofnig), the osm_l3 is not registered as a
provider and therefore will not be found when doing:
qcom_cpufreq_hw_driver_probe() -> dev_pm_opp_of_find_icc_paths() ->
of_icc_get_by_index().

This being said, it also does not feel right for cpufreq enablement
to depend on L3 scaling enablement, so better error filtering might be
needed in the drivers instead. But I'll leave that decision to you,
while the above is only a quick fix.

The issue is reproduced with linux next 20201104, after applying the
iommu patches at [1].

Hope it helps,
Ionela.

[1]
https://lore.kernel.org/lkml/160399513141.1314250.8831514745970142969.b4-ty@kernel.org/

>  CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> -- 
> 2.28.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
