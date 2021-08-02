Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AE03DDD50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 18:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhHBQMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 12:12:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhHBQMV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 12:12:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E9EA60F9C;
        Mon,  2 Aug 2021 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627920732;
        bh=b2Ng61RAPlMVP2k8p8ptM8+ZLyJnqh59TBkLJy5ROis=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FB6RhytU9h1IMIKzRWu6GmLzfCEBjk6A6rHDieSWy6K/7PP1AFgKx9dq2kwTHFCzd
         96MaL/uwcP5Fa2sUBheTQ6kHqmxsFUaNqmPubydLZvP96CB2xWespEO0qCy4S4bf1s
         64Wn5fBpxIwpst/c9+Uue/GKmDdOf7CbaeqxCeCc7U1ZWCmNcD8Ukah0f1QYNfSNMH
         pmVu5gX6k4DPHSTUAAbIfNp97VAE7oHns/Gz1vxI3UGZRR3x4pvo/i/vVyluLojbRb
         44MjxhWYGFkSZkPEruKKiiwocVA2+J5Yct+2FsADX+6Y9o4Ld+VfGByp9IedbE3py5
         LmcCM5PZdGYVA==
Date:   Mon, 2 Aug 2021 17:12:06 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        srimuc <srimuc@codeaurora.org>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
Message-ID: <20210802161206.GA29168@willie-the-truck>
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 27, 2021 at 03:03:22PM +0530, Sai Prakash Ranjan wrote:
> Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
> such cases, we would need to drop the XO clock vote in unprepare call and
> this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
> clock driver which controls RPMh managed clock resources for new QTI SoCs
> and is a blocking call.
> 
> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
> operations like map and unmap can be in atomic context and are in fast
> path, add this prepare and unprepare call to drop the XO vote only for
> system pm callbacks since it is not a fast path and we expect the system
> to enter deep sleep states with system pm as opposed to runtime pm.
> 
> This is a similar sequence of clock requests (prepare,enable and
> disable,unprepare) in arm-smmu probe and remove.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

[+Rob]

How does this work with that funny GPU which writes to the SMMU registers
directly? Does the SMMU need to remain independently clocked for that to
work or is it all in the same clock domain?

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d3c6f54110a5..9561ba4c5d39 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2277,6 +2277,13 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  
>  static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>  {
> +	int ret;
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +
> +	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
> +	if (ret)
> +		return ret;
> +
>  	if (pm_runtime_suspended(dev))
>  		return 0;

If we subsequently fail to enable the clks in arm_smmu_runtime_resume()
should we unprepare them again?

Will

> @@ -2285,10 +2292,19 @@ static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>  
>  static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
>  {
> +	int ret = 0;
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +
>  	if (pm_runtime_suspended(dev))
> -		return 0;
> +		goto clk_unprepare;
>  
> -	return arm_smmu_runtime_suspend(dev);
> +	ret = arm_smmu_runtime_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +clk_unprepare:
> +	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops arm_smmu_pm_ops = {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
