Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2A21B12AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 19:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgDTRJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 13:09:37 -0400
Received: from foss.arm.com ([217.140.110.172]:52412 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgDTRJh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 13:09:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B4331B;
        Mon, 20 Apr 2020 10:09:36 -0700 (PDT)
Received: from [10.57.33.63] (unknown [10.57.33.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 602183F73D;
        Mon, 20 Apr 2020 10:09:34 -0700 (PDT)
Subject: Re: [PATCHv3 4/6] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>
References: <cover.1587400573.git.saiprakash.ranjan@codeaurora.org>
 <509d88fbe7592aa15f867933c177b61bc7ba8efa.1587400573.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <49c8c377-961b-3f95-a99c-08528def4cb7@arm.com>
Date:   Mon, 20 Apr 2020 18:09:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <509d88fbe7592aa15f867933c177b61bc7ba8efa.1587400573.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-20 5:42 pm, Sai Prakash Ranjan wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> Request direct mapping for modem on platforms which don't have TrustZone
> (which programs the modem SIDs) to prevent the following global faults seen
> on Cheza/Trogdor:

Not strictly true - it's patch #6/6 that prevents *those* faults (and 
these days the driver should be reporting unmatched streams a little 
more helpfully). This change would resolve the context faults and/or 
weird memory corruption that might result from applying patch #6 alone - 
this is the crazy thing where transactions sometimes go directly to DRAM 
round the side of the SMMU so we can never safely remap anything, right?

Robin.

> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
> 			 GFSYNR1 0x00000781, GFSYNR2 0x00000000
> 
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
> 			 GFSYNR1 0x00000461, GFSYNR2 0x00000000
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu-qcom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 5bedf21587a5..cf01d0215a39 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -17,7 +17,9 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
>   	{ .compatible = "qcom,mdp4" },
>   	{ .compatible = "qcom,mdss" },
>   	{ .compatible = "qcom,sc7180-mdss" },
> +	{ .compatible = "qcom,sc7180-mss-pil" },
>   	{ .compatible = "qcom,sdm845-mdss" },
> +	{ .compatible = "qcom,sdm845-mss-pil" },
>   	{ }
>   };
>   
> 
