Return-Path: <linux-arm-msm+bounces-84621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03280CAC108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47B4300ACD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97AB2FFF8E;
	Mon,  8 Dec 2025 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGbwq1gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15593002D6;
	Mon,  8 Dec 2025 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765170990; cv=none; b=XnN2svQjtK7iioZ1/dVj1NJzDauGbBNU2B3q3sZabZZ2QwF9Gi7hgrXD9NsLtdj7c2DnQaa9G6fx5GY4BNqtxwCKG9KEsgSwO56UKlbqFU06XxsgDtQc3zAH8TpB8GDyWIIpiEEA4ISPt1bR+uLvF9+FcnwLWoH74L6jYQzJ0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765170990; c=relaxed/simple;
	bh=r83WDIqcqyVKYPc60PL81S93yqBYvLV4FKtAwiWP2io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvm7A/Iv6PeqcxbT1wNkcZocp5Q29JznkesYpnXccG+p2YZuGExjD0bVZs8yHY/L+RDJjBfPNztkeTgnYDdenviExNH9tREJJg9XrpLUloVZdDb1TSt224BXmf7+sv4Xte4RKlrlITSK3qRqd3Bd/Ssj2Bgrqd3+pa8siaOELgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGbwq1gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54C5C4CEF1;
	Mon,  8 Dec 2025 05:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765170990;
	bh=r83WDIqcqyVKYPc60PL81S93yqBYvLV4FKtAwiWP2io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGbwq1gi1BxNXixb/CBALJFXrTrV3VI+9UygoxElzuVIG0dxI4xqbY1aYahpfsU5R
	 F5HCV5W4TFG7g4EVQOlSvUNcQoPmnZn3eFYDZS758JULfsAd/Pr6RFrZ2a2/DEqnQp
	 VZaNIyk5QbfVeFM+XkBKH8B4PAH4/giLDmOLrVkgZIbrNCR0tmLrghhGitjh/aaLQL
	 73ekcy3ArLyfFhenLDmi4GLK42oasGGKtkUlJyxdgepPA1Mgz4pd/+YopJUTUpvh4W
	 wCkoRrbqPPxXjhuktqpKGqU6cAbXmf0Id+IQlcuFIH8nOSP8nJSAwK6dk2C79aBJri
	 2HyIm3g/045ZA==
Date: Mon, 8 Dec 2025 14:16:19 +0900
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ufs: qcom: Fix confusing cleanup.h syntax
Message-ID: <lpneh6skxhpkalzvpjjresw3akxzzxmizohfzjtwgplzpjbsjc@yje4z22fbhcp>
References: <20251208020807.5043-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208020807.5043-2-krzysztof.kozlowski@oss.qualcomm.com>

On Mon, Dec 08, 2025 at 03:08:08AM +0100, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
> 
> Code does not have a bug, but is less readable and uses discouraged
> coding practice, so fix that by moving declaration to the place of
> assignment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. On the side note, I would recommend adding this check to checkpatch to
warn people in the first place.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8d119b3223cb..8ebee0cc5313 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1769,10 +1769,9 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	int i, j, nminor = 0, testbus_len = 0;
> -	u32 *testbus __free(kfree) = NULL;
>  	char *prefix;
>  
> -	testbus = kmalloc_array(256, sizeof(u32), GFP_KERNEL);
> +	u32 *testbus __free(kfree) = kmalloc_array(256, sizeof(u32), GFP_KERNEL);
>  	if (!testbus)
>  		return;
>  
> @@ -1794,13 +1793,12 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
>  static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
>  			      const char *prefix, void __iomem *base)
>  {
> -	u32 *regs __free(kfree) = NULL;
>  	size_t pos;
>  
>  	if (offset % 4 != 0 || len % 4 != 0)
>  		return -EINVAL;
>  
> -	regs = kzalloc(len, GFP_ATOMIC);
> +	u32 *regs __free(kfree) = kzalloc(len, GFP_ATOMIC);
>  	if (!regs)
>  		return -ENOMEM;
>  
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

