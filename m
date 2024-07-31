Return-Path: <linux-arm-msm+bounces-27522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F0942CA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 12:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F9C1F24A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 10:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192C91AC42F;
	Wed, 31 Jul 2024 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROQFSSPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A891A8C0C;
	Wed, 31 Jul 2024 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722423531; cv=none; b=Ly2uATJQ8n07ElB/RHMZcOcwTG+XatlXjX5nV2ugTkhrSrWSaJx87oPGCverLUvzcMyBptZx9KpVh0AGQbOYQZmHpAoWNsIEeMIMPa49t6Rxu9Zn5SCgwkcXoS/MlbmEDPZN/tMGtA6EKr678V9A7mDkpzgBc1AKXq7UN09Yt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722423531; c=relaxed/simple;
	bh=VW4oCYZr2JYAYnVYbwqq9fI4vsIbWEW1k7HmyYQ1HNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1eveRBUGnS5lUaqMoY3fy7fL6d6uFTbaBeFOCKbLNn7bL6WWBUNuPodvUDGB5Rqm7nI1sro2DlizxVXk2BuDrRb58xAcGEJpoAZlND8PMAR8pCQUjNZLcsk++VR64G/yUAxNkK3KQrf+Oj6GHy6eotQG8wffmp3IqqrriuIgE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROQFSSPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3311C116B1;
	Wed, 31 Jul 2024 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722423530;
	bh=VW4oCYZr2JYAYnVYbwqq9fI4vsIbWEW1k7HmyYQ1HNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROQFSSPPiZmZ6D3D2Cqo87i46k5tKnpMAo2siKc7e2tbHhsQBAzU0cEHU04TKzYvO
	 lNhUiv4e+dNE+iE8hVniddGFyPIaost5T855kX6LjBdBU0P2oz2DOCtHWxJMQirWyA
	 jXPLrAnq9yJN/EgqmyMJVULcMbwEWJE9u/78wkJcH2P6cNkEhFKIxISx528SA85Ha9
	 LcXXY0x7s9HQ6bPJTH/hK8M5ePXEfKEG2f0t5NkowPeGTZzw7sV+vUJlciPbKCMyGc
	 M8yf9ZoRYsYSwpyYIkoAsdHmdootVQe9QQS/2Nt9CLuvXALNzD6AZl8cdZeEQH7pb+
	 OMk1QeccRx+sw==
Date: Wed, 31 Jul 2024 16:28:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <ZqoY5kFLDEmkb495@matsya>
References: <20240730100351.51454-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730100351.51454-1-manivannan.sadhasivam@linaro.org>

On 30-07-24, 15:33, Manivannan Sadhasivam wrote:
> These register prints are useful to validate the init sequence against the
> Qcom internal documentation and also to share with the Qcom hw engineers to
> debug issues related to PHY.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-common.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> index 799384210509..e6a6bcfcac28 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
> @@ -9,6 +9,7 @@
>  struct qmp_phy_init_tbl {
>  	unsigned int offset;
>  	unsigned int val;
> +	char *name;
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
> @@ -45,6 +48,7 @@ static inline void qmp_configure_lane(void __iomem *base,
>  		if (!(t->lane_mask & lane_mask))
>  			continue;
>  
> +		pr_debug("QMP PHY: Writing: %s --> 0x%02x\n", t->name, t->val);

This lgtm, but fails to help when offset _might_ be incorrect, including
the offset value as well (not just the name) would be better imo... 

>  		writel(t->val, base + t->offset);
>  	}
>  }
> -- 
> 2.25.1

-- 
~Vinod

