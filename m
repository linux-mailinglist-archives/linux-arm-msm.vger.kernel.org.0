Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68BF36CA7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 19:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhD0Rl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 13:41:59 -0400
Received: from foss.arm.com ([217.140.110.172]:55394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230219AbhD0Rl6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 13:41:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9695731B;
        Tue, 27 Apr 2021 10:41:14 -0700 (PDT)
Received: from [10.57.61.101] (unknown [10.57.61.101])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EF583F694;
        Tue, 27 Apr 2021 10:41:13 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] ACPI/IORT: Add Qualcomm Snapdragon platforms to
 iort_plat_info[]
To:     Shawn Guo <shawn.guo@linaro.org>, Will Deacon <will@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20210402035602.9484-1-shawn.guo@linaro.org>
 <20210402035602.9484-3-shawn.guo@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <06a62dc7-f2d8-7b74-3240-adf8504c5063@arm.com>
Date:   Tue, 27 Apr 2021 18:41:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210402035602.9484-3-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-02 04:56, Shawn Guo wrote:
> The SMMU driver on Qualcomm Snapdragon platforms needs to hook up some
> QCOM specific arm_smmu_impl.  Define model identifier for QCOM SMMU and
> add Qualcomm SC8180X platform to iort_plat_info[], so that SMMU
> driver can detect the model and handle QCOM specific arm_smmu_impl.
> 
> Some device chooses to use manufacturer name in IORT table, like Lenovo
> Flex 5G, while others use SoC vendor name, such as Microsoft Surface Pro
> X and Samsung Galaxy Book S.

Just to clarify, my expectation was that the relevant match table and 
its usage would be private to arm-smmu-qcom. There didn't seem to be any 
obvious reason that couldn't work, but please do enlighten me if I've 
overlooked something.

Robin.

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>   drivers/acpi/arm64/iort.c | 5 +++++
>   include/linux/acpi_iort.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index e2a96d2d399a..f88b8c0a7d84 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1467,6 +1467,11 @@ static struct acpi_platform_list iort_plat_info[] __initdata = {
>   	/* HiSilicon Hip08 Platform */
>   	{"HISI  ", "HIP08   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>   	 "Erratum #162001800", IORT_SMMU_V3_PMCG_HISI_HIP08},
> +	/* Qualcomm Snapdragon Platform */
> +	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal,
> +	  "QCOM SMMU", IORT_SMMU_QCOM },
> +	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal,
> +	  "QCOM SMMU", IORT_SMMU_QCOM },
>   	{ }
>   };
>   
> diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> index 678cdf036948..66c859ea2abf 100644
> --- a/include/linux/acpi_iort.h
> +++ b/include/linux/acpi_iort.h
> @@ -21,6 +21,7 @@
>    */
>   #define IORT_SMMU_GENERIC		0x00000000 /* Generic SMMU */
>   #define IORT_SMMU_V3_PMCG_HISI_HIP08	0x00000001 /* HiSilicon HIP08 PMCG */
> +#define IORT_SMMU_QCOM			0x00000002 /* QCOM SMMU */
>   
>   struct iort_smmu_pdata {
>   	struct acpi_iort_node *node;
> 
