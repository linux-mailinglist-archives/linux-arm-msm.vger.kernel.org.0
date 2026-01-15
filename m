Return-Path: <linux-arm-msm+bounces-89171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0CED23675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95D623019B8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A51352FA5;
	Thu, 15 Jan 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2lpLKEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC5342509;
	Thu, 15 Jan 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468763; cv=none; b=DEWX59koE14Zr0tPGhbjmR20daT/WILmhL1NGP7QcwWrlTaPcytL6+PTnXxvxucPxtzg7Ata72TQjZ3Pgh/h4RA5FQAFth9pF/lNix557zBXyq3QTVoJOMYAdwVrcT4PvVmEHs7wGc8K1ubtsP3d6KmQfMNiifxwNl2z21NBrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468763; c=relaxed/simple;
	bh=uPzWfMIvUIZQpJE/+QmjxjUS7/ESuB69t58JSuKTx/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpUG+V0X6nUvrioaHOnC9JrpQy492j2o85KrIHHJV6dZ1gAl33PX/sh5oHn/6RwC9wd87p+di53Rz9U5Fzn3ECJitxYIZp2/1eNTNswoheDXrogl/Ev08rCWiQCC+bWn7wFZj7+Nym8AuWmbcFTo2myT2rsiQFpJht/cDC0huSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2lpLKEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480FC116D0;
	Thu, 15 Jan 2026 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468763;
	bh=uPzWfMIvUIZQpJE/+QmjxjUS7/ESuB69t58JSuKTx/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2lpLKECdV/mSXel4uXyPhtVw9sSsnmjH8jgEuqDWbU6tlCeecg5RgT00AFSoFqT1
	 GajjBZ2h5nff5+TF/BCEVaCphjSaJhVTj6sDeQXFnJe11dduVMhGe1c+yXdK66m4D/
	 xG64qxh1OZoDRcA+Xhwxyr7o5iVUQy41KfgcR8mdIS53rJDRo0QKrOOSfh+oZARWY4
	 M0zdCBTCpYwhPQoYgBObROAFjuwJNyI6v5ZMMLWpDit2XIevjfVclqvRqZfzA4vgR7
	 jM1K4hVouabukJzEMPKlryFVp/3rvHlOVD1zCC6I5la7g8L39zuTsYNYLjpKWepkEn
	 S8DDGhz8DjR/g==
Date: Thu, 15 Jan 2026 10:19:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <20260115-refreshing-panther-from-mars-fb2f2e@quoll>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 01:17:59PM -0800, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)

None of your commits are properly wrapped. Please use standard IDE/SW
editing tools which solve all such nits. You really should not have
received such review.

> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
> compatible strings.

This is confusing. You either do the changes because something is not
correct OR you do them because they are part of Kaanapali/Glymur. Fixing
a bug AND adding new support are two separate commits.

Find the real rationale wahy you are doing this.

> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
>  1 file changed, 42 insertions(+), 24 deletions(-)

...

> -static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> -							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> -							   BIT(PMIC_GLINK_CLIENT_UCSI);
> +static const struct pmic_glink_data pmic_glink_adsp_data = {
> +	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> +		       BIT(PMIC_GLINK_CLIENT_UCSI),
> +	.charger_pdr_service_name = "tms/servreg",
> +	.charger_pdr_service_path = "msm/adsp/charger_pd",
> +};
> +
> +static const struct pmic_glink_data pmic_glink_soccp_data = {
> +	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
> +		       BIT(PMIC_GLINK_CLIENT_UCSI),
> +};
>  
>  static const struct of_device_id pmic_glink_of_match[] = {
> -	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> +	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
> +	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },

So these two are compatible? This should be somewhere clarified.

> +	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
> -- 
> 2.34.1
> 

