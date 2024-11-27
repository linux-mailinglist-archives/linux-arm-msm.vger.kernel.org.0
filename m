Return-Path: <linux-arm-msm+bounces-39242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA99DA143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 05:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90E15B22987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 03:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA16C139D0B;
	Wed, 27 Nov 2024 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pX50Fys/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483A1114;
	Wed, 27 Nov 2024 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732679994; cv=none; b=gERSZLnuGJu1TLXnRqp1jOqKWrOLzdjkcODsJ1J22IKMjyjrPMElugiGZT2K9jksWHnQOFIQ6vMmMyLV1RuCZclTQvI+yTIQIQQBy23kzotdrQ5PE77Mz15abXPtHbr0VVXv/5genb84nQnnB7dCD3sPYQRQkmaiJoOWYMajUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732679994; c=relaxed/simple;
	bh=CfdB3HRj/RNrlHn2KhBoIsIRucdRW6Yc4yR+ApKOQKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgmWJubgb240eeZtWyo2xoa7csLblBHX0w/ffE7nU2z3B/txIivR2FlO/jvgd0NZvUDOeZOxIyUukX9GFbLf6nx3myDg3BSBawzVEBHaqtk6kFl5ZLfCRn0dKHtlYNF7iS/RJu4wXhR2q7JvSPNNYnbCNVHJHJkhTGj4EwGoa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pX50Fys/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589EBC4CECC;
	Wed, 27 Nov 2024 03:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732679994;
	bh=CfdB3HRj/RNrlHn2KhBoIsIRucdRW6Yc4yR+ApKOQKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX50Fys/4TAc5gCP8I0J6AIn7mM/Svx58UCtsmFBLjxJwEi8Bp6fu7XWEF+VGD3SI
	 axxWTqeVs9YF0j5nG5f1P+2/qLDg015lRngOpbahSIZZPcPpI512MDSmhj9JFYDdcR
	 wz78X3JA+GQrBJHDuftBKnd1KQGnPFFxBfAR5gcZZesKR8mrjaUJm3QZhZXb+locjC
	 cp8MdLPQWuLW0apGqE/bp82j5I19NHwIg8Z2VfXtHcFcvDzz+zkTf/Mb1KtTpVrJ5A
	 9GiMbw9/nxFTSjqsB10VvdXLjgho28ygezJXxqNrH7UZtNabNYVjSZz2AlJ2wnjQb8
	 Rp9/lGyEocyKQ==
Date: Tue, 26 Nov 2024 21:59:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Message-ID: <xgwhbcpid25wkdztvizuthana2vzosslc6fziwpnb32obs5oa5@5cyvyycqpvir>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-1-836dad33521a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-1-836dad33521a@linaro.org>

On Tue, Nov 26, 2024 at 11:44:27PM +0000, Bryan O'Donoghue wrote:
> Adding a new clause to this if/else I noticed the existing usage of
> pm_genpd_add_subdomain() wasn't capturing and returning the result code.
> 
> pm_genpd_add_subdomain() returns and int and can fail. Capture that result

(note to myself?) Drop the 'd' in "an int".

> code and throw it up the call stack if something goes wrong.
> 
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gdsc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
>  		if (!scs[i])
>  			continue;
>  		if (scs[i]->parent)
> -			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> -			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return of_genpd_add_provider_onecell(dev->of_node, data);
> 
> -- 
> 2.45.2
> 

