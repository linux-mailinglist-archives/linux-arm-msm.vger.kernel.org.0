Return-Path: <linux-arm-msm+bounces-27643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96257944123
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 04:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C718B1C20962
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7E51EB493;
	Thu,  1 Aug 2024 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHkqHvP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40211EB4A9;
	Thu,  1 Aug 2024 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722479190; cv=none; b=al3B757C5bKhOR5DiB+XPdm4QbN6zNmXhHLHx6T39h8SEiyXy2NcytEH6/5LDlXS/Pj73WLerwf+2JB2Kr8yBIZQAXKrmCwleg51rCzKS28e35/Jv+CPUbTiQQOny0tosSPwyhlR2HFZG30ikuGLLHkTKykxal/BRIfT2E4LUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722479190; c=relaxed/simple;
	bh=dOz9CZJAwvcwTM3cno/e4aaYLwlNEIrTcbyLJ2I+nmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbyKHdCogCVtOGl5s/nKA9ZNzUrLoK3Iippap/6WsfYh6fS1RXtx6BHcc5cEn9qTnKT02opNRKPUKnEel2kY/LxDqtjThOYEI6Fn145JLYfxw8V62DL2rZVruyAtcgGgYGxNJyXBMimIclaxyCMvY6DYh441n4gFbAL8O/oPfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHkqHvP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A26C4AF10;
	Thu,  1 Aug 2024 02:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722479189;
	bh=dOz9CZJAwvcwTM3cno/e4aaYLwlNEIrTcbyLJ2I+nmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHkqHvP+xvPRb7QSZmGyY4+JKZSbz5E+Rr6bMaoJtEzGgfv1C4fHmQrgJDKxpWcRC
	 700Y+cm9k78zsGNIEoNArxJN9YLrOc/DzplgjHl49xr2S0vhoIpSprKUdCCN707165
	 5CSX6zaB/AHGA6FcYx/DZijwLwPvoIaGcNiDlzB1kbybNAEpyvBYlPUoTYhIRyusds
	 4FYsfTUDvIoOJNyPMiYeGvXgbONgeZ/xqmKjieG8ImqZXmu9u4zo7bblvFAhi/5It7
	 h1UnXYGm3p7y4v9Uqjpaz8GsNWy3yn7tvqW/GlJeI7K8jSsNOmeaYPuAUv9IEb7/JG
	 vq9w8FkC1QHVQ==
Date: Wed, 31 Jul 2024 21:26:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <nkfrtuxv4ueow66bnazyb4ul3pz3z3wo6zsptu6wnw7hflxerx@pkwn7sx6gfqi>
References: <20240731115637.90351-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731115637.90351-1-manivannan.sadhasivam@linaro.org>

On Wed, Jul 31, 2024 at 05:26:37PM GMT, Manivannan Sadhasivam wrote:
> These register prints are useful to validate the init sequence against the
> Qcom internal documentation and also to share with the Qcom hw engineers to
> debug issues related to PHY.
> 

I've written this patch every time I've touched one of these PHYs, so I
certainly like this.

> Sample debug prints:
> 
> QMP PHY: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> QMP PHY: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11

That said, with multiple instances of PHYs being configured at about the
same time it seems this would benefit greatly from something identifying
which PHY instance the write relates to?

dev_dbg() would certainly be nice...

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v2:
> 
> * Modifed the debug print to include reg offset
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-common.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> index 799384210509..40beb413328f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> @@ -9,6 +9,7 @@
>  struct qmp_phy_init_tbl {
>  	unsigned int offset;
>  	unsigned int val;
> +	char *name;

const?

Regards,
Bjorn

>  	/*
>  	 * mask of lanes for which this register is written
>  	 * for cases when second lane needs different values
> @@ -20,6 +21,7 @@ struct qmp_phy_init_tbl {
>  	{				\
>  		.offset = o,		\
>  		.val = v,		\
> +		.name = #o,		\
>  		.lane_mask = 0xff,	\
>  	}
>  
> @@ -27,6 +29,7 @@ struct qmp_phy_init_tbl {
>  	{				\
>  		.offset = o,		\
>  		.val = v,		\
> +		.name = #o,		\
>  		.lane_mask = l,		\
>  	}
>  
> @@ -45,6 +48,8 @@ static inline void qmp_configure_lane(void __iomem *base,
>  		if (!(t->lane_mask & lane_mask))
>  			continue;
>  
> +		pr_debug("QMP PHY: Writing Reg: %s Offset: 0x%04x Val: 0x%02x\n",
> +			t->name, t->offset, t->val);
>  		writel(t->val, base + t->offset);
>  	}
>  }
> -- 
> 2.25.1
> 
> 

