Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0767F266304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgIKQJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:09:08 -0400
Received: from foss.arm.com ([217.140.110.172]:37968 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgIKQDQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:03:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E33F106F;
        Fri, 11 Sep 2020 09:03:15 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88D43F73C;
        Fri, 11 Sep 2020 09:03:11 -0700 (PDT)
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
Date:   Fri, 11 Sep 2020 17:03:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 15:28, Sai Prakash Ranjan wrote:
> There are few places in arm-smmu-impl where there are
> extra blank lines, remove them

FWIW those were deliberate - sometimes I like a bit of subtle space to 
visually delineate distinct groups of definitions. I suppose it won't be 
to everyone's taste :/

> and while at it fix the
> checkpatch warning for space required before the open
> parenthesis.

That one, however, was not ;)

BTW am I supposed to have received 3 copies of everything? Because I did...

Robin.

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index ce78295cfa78..f5b5218cbe5b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -19,7 +19,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   
>   static int arm_smmu_gr0_ns(int offset)
>   {
> -	switch(offset) {
> +	switch (offset) {
>   	case ARM_SMMU_GR0_sCR0:
>   	case ARM_SMMU_GR0_sACR:
>   	case ARM_SMMU_GR0_sGFSR:
> @@ -54,7 +54,6 @@ static const struct arm_smmu_impl calxeda_impl = {
>   	.write_reg = arm_smmu_write_ns,
>   };
>   
> -
>   struct cavium_smmu {
>   	struct arm_smmu_device smmu;
>   	u32 id_base;
> @@ -110,7 +109,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
>   	return &cs->smmu;
>   }
>   
> -
>   #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
>   
>   #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
> @@ -197,7 +195,6 @@ static const struct arm_smmu_impl mrvl_mmu500_impl = {
>   	.reset = arm_mmu500_reset,
>   };
>   
> -
>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
>   	const struct device_node *np = smmu->dev->of_node;
> 
