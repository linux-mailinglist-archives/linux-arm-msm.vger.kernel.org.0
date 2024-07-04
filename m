Return-Path: <linux-arm-msm+bounces-25225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C121926D73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 04:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB05C1F2345B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 02:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AB0DDC3;
	Thu,  4 Jul 2024 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mbp7pD+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED58462;
	Thu,  4 Jul 2024 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720060243; cv=none; b=Z2DARZenr7U1Qh55MnrZRVo0M6dKR4CVJYSNP57AYdjYOtzOBCWHw/nu7Qn5avfsK/zxK5N3vTqqPsYwqGlpPHn1rXIi8OTxrm0yxtq+TnVjXK+AGiEmPVB1lXq3mJSzAsdEe8Ev7bmTv1ikZIAVHI4QDpulmQDVQ/Anuw89UVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720060243; c=relaxed/simple;
	bh=aSup+gYAXU5mpLC4dY9Wco8/0/EC2lyaIiizfKDX4cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfbosaluAmZ6YEwQBkpqzrfLSaVxQJWiPr8NSxZaWpkM3jWCKdkRrzY/lqehH1q8/PB75yDKqpsYWiJphjR3ovn6488xYghlSEsdC+2Mn36K8ohcMK4xZBKQyEzULrD0A72HLZAj5/YIVgTa5aFrKD5/AOdn7vrmT/ye6aIuT7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mbp7pD+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB7FC2BD10;
	Thu,  4 Jul 2024 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720060243;
	bh=aSup+gYAXU5mpLC4dY9Wco8/0/EC2lyaIiizfKDX4cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mbp7pD+eM6RHAYr/4tqcPeWgEb5HRoTk3atxf3qvtxv/8ag2mLixuv/lif7YPV9jZ
	 hymGQaXtMOExFaY5gWoHNt0PiGZc2lf7NeCUYaPDYFzVN6pghcs1syTM8Ivjw6PRVM
	 a3sh8uE8NtuKLim3/CP4KYWp+GIdgFU/Y93K+RHooEUxNuGcWb8QZuUUob3JIt1WJb
	 SbSjqG6b8V392jb8iqGSZMcVEVVLVd7eJZbDwS2C3R0UvoPZdOy1N2z7ysiCJlPffn
	 gDnn6u6Z3lY9BQSFgZLpIqJvBIFaaAt56YduLx4E7bOAk6+nPL5AUIGTdppiu6YOc/
	 ifcnrQlC38MzA==
Date: Wed, 3 Jul 2024 21:30:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: David Collins <quic_collinsd@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] spmi: pmic-arb: use correct node when adding irq domain
Message-ID: <wbdccdzncuje5ynof6y27e22dqipqho5j4qtqczlctu7bqhp6z@5qatffxbjykx>
References: <20240703221157.3640361-1-quic_collinsd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703221157.3640361-1-quic_collinsd@quicinc.com>

On Wed, Jul 03, 2024 at 03:11:57PM GMT, David Collins wrote:
> Pass a pointer to the SPMI bus subnode instead of the top-
> level PMIC arbiter node when calling irq_domain_add_tree().
> This ensures that consumer IRQ mappings can be found
> successfully at runtime.
> 
> Here is an example of a consumer device probe deferral that
> happens without this fix in place:
> 
> [   18.197271] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:pwrkey:
>   deferred probe pending: pm8941-pwrkey: IRQ index 0 not found
> [   18.197275] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:resin:
>   deferred probe pending: pm8941-pwrkey: IRQ index 0 not found
> 
> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
> Signed-off-by: David Collins <quic_collinsd@quicinc.com>

Not sure if Stephen was waiting for some fixes tags, but otherwise this
was already proposed and reviewed here:

https://lore.kernel.org/all/20240522-topic-spmi_multi_master_irqfix-v2-1-7ec92a862b9f@linaro.org/

FWIW:

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/spmi/spmi-pmic-arb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 791cdc160c51..e6a4bf3abb1f 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -1737,8 +1737,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>  
>  	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
>  
> -	bus->domain = irq_domain_add_tree(dev->of_node,
> -					  &pmic_arb_irq_domain_ops, bus);
> +	bus->domain = irq_domain_add_tree(node, &pmic_arb_irq_domain_ops, bus);
>  	if (!bus->domain) {
>  		dev_err(&pdev->dev, "unable to create irq_domain\n");
>  		return -ENOMEM;
> -- 
> 2.25.1
> 
> 

