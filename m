Return-Path: <linux-arm-msm+bounces-2193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED137FB20F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 07:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE421C209F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDAECA73;
	Tue, 28 Nov 2023 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcAob4de"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296007E8;
	Tue, 28 Nov 2023 06:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0489C433C7;
	Tue, 28 Nov 2023 06:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701154057;
	bh=OxJgD4qf34Xbg3woKklJaOmC7kHvKBOOhlmPWeA/HYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcAob4de27eAJnSsYkTco2tUOVxlt6u5AaClzpVwGIEQSrsj/KI4FWlQWvN6PcwG3
	 9gClQeLhzRkLfAfBIBTJLr+DilMRg6YAXNWHsDYjMG03tyu8XKkzi79NR0U2W3kV+0
	 Krm7w+iGO86EnRwIHbF3sVUACJ7gAu4viZgX4mnclQr5sZFKGDniOyTc+DVVZjyf2Q
	 oFqBoY9XRb2JY/lTwmnO0+pY7j1yzO0OV3YxqOSW3hYmGBwbBUxvc/4YobEQOjud7r
	 i3HKJX7Mj0fq1Hjh+46Z7q8cJBq20gWs0MlqtZydntZLdy3j6ocP23cYRLgSHpCQ+M
	 FE3bj5drIgN2A==
Date: Tue, 28 Nov 2023 12:17:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, adrian.hunter@intel.com, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 09/10] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
Message-ID: <20231128064721.GJ3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-10-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700729190-17268-10-git-send-email-quic_cang@quicinc.com>

On Thu, Nov 23, 2023 at 12:46:29AM -0800, Can Guo wrote:
> On SM8550, two sets of UFS PHY settings are provided, one set is to support
> HS-G5, another set is to support HS-G4 and lower gears. The two sets of PHY
> settings are programming different values to different registers, mixing
> the two sets and/or overwriting one set with another set is definitely not
> blessed by UFS PHY designers.
> 
> To add HS-G5 support for SM8550, split the two sets of PHY settings into
> their dedicated overlay tables, only the common parts of the two sets of
> PHY settings are left in the .tbls.
> 
> Consider we are going to add even higher gear support in future, to avoid
> adding more tables with different names, rename the .tbls_hs_g4 and make it
> an array, a size of 2 is enough as of now.
> 
> In this case, .tbls alone is not a complete set of PHY settings, so either
> tbls_hs_overlay[0] or tbls_hs_overlay[1] must be applied on top of the
> .tbls to become a complete set of PHY settings.
> 

Thanks for the update! This really helps in minimizing the changes for future
gears.

> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |   9 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 174 ++++++++++++++++++---
>  4 files changed, 166 insertions(+), 21 deletions(-)
> 
>  

[...]

> -static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
> +static bool qmp_ufs_match_gear_overlay(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg, int *i)
> +{
> +	u32 max_gear, floor_max_gear = cfg->max_supported_gear;
> +	bool found = false;
> +	int j;
> +
> +	for (j = 0; j < NUM_OVERLAY; j ++) {
> +		max_gear = cfg->tbls_hs_overlay[j].max_gear;
> +
> +		if (max_gear == 0)

Is this condition possible for hs_overlay tables?

> +			continue;
> +
> +		/* Direct matching, bail */
> +		if (qmp->submode == max_gear) {
> +			*i = j;
> +			return true;
> +		}
> +
> +		/* If no direct matching, the lowest gear is the best matching */
> +		if (max_gear < floor_max_gear) {

Can you start the loop from max? If looks odd to set the matching params in the
first iteration itself and then checking the next one.

> +			*i = j;
> +			found = true;
> +			floor_max_gear = max_gear;
> +		}
> +	}
> +
> +	return found;
> +}
> +
> +static int qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
>  {
> +	bool apply_overlay;
> +	int i;
> +
> +	if (qmp->submode > cfg->max_supported_gear || qmp->submode == 0) {
> +		dev_err(qmp->dev, "Invalid PHY submode %u\n", qmp->submode);
> +		return -EINVAL;
> +	}

This check should be moved to qmp_ufs_set_mode().

Rest LGTM.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

