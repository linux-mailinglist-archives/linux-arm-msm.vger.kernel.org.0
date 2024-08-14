Return-Path: <linux-arm-msm+bounces-28516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A041951E7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053E31F222CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A651B3F26;
	Wed, 14 Aug 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNAzQKQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644691B3F0E;
	Wed, 14 Aug 2024 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649087; cv=none; b=GdEiTdWGeDY+aaxpluqQ+htDznUv71tLX3jRr98i19sicUq1A2b19khyze7iy8Aik4GpU8ZKRuIqJEf4k+wG9sVjZ/q6vc9hCR25d28ytwOQwC2Dfh+qssty2xabZIA37LW9lVV7BEFQw5WEALsmz1QEuCHJ3NKnxx/zr4ZkiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649087; c=relaxed/simple;
	bh=Cmpt700VNNEqH7CQ15CAKefFW0scRjyJ7Wr9SRMpBbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTq661fTO/241ZSTGiZW9F8c85Gp+7i1gKom4LJ3eHhkurCGeBWRMf6elQvWe5GPVpBziJtIQPB3ziHjyB+gU3KXlakL3oqigmt323ywGRtkQ1kUPaEaR1psAyWZvBV6uOSirbOuM5lh/2z0+GkWQ1Moyu/kTBuSGWbpU4zuz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNAzQKQk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89860C116B1;
	Wed, 14 Aug 2024 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723649086;
	bh=Cmpt700VNNEqH7CQ15CAKefFW0scRjyJ7Wr9SRMpBbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNAzQKQkdZLIgzm2HlvpMSz8MXQg3GWw1HaAw+E/7XJwURoJFV5EDgxtE4zVYMRYD
	 OkdqshM180yG2Qnsn7hJuPVF0+sT75G9z8K+AgosJHRphvA3Q8DPkJ3UeJ9P/XykRQ
	 kqkHFYF5zPFNB143wjpa2bR5ONRC2q0x/AnGjcXAxH8kB/xUOoiwBNntcGv0K0QY8/
	 +V2XHCTJsuGXVNNe6mvu9OpJwnQsCqQMdoknilffLb4mqxO6Cqy8gxQp3JJXrbn5ww
	 cvAS7BR+fqb+HOkjSxFERtgIEBt+6ZxFpGAJkcnXXe+MgEglVRGS8MvY/lDXj6V/36
	 m7aDYVL2d7ybg==
Date: Wed, 14 Aug 2024 08:29:03 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-qcom: hide last context bank from
 linux
Message-ID: <a7j3lz62bp6pceuq472muioinjzfgw2mec5pv256zfr7yjsn3p@ok6nfsbsabig>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-2-3d6c27027d5b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-smmu-v1-2-3d6c27027d5b@freebox.fr>

On Wed, Aug 14, 2024 at 03:59:56PM GMT, Marc Gonzalez wrote:
> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
> (base address 0x05100000) produces a system freeze & reboot.
> 
> Specifically, here:
> 
> 	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
> 	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
> 
> and here:
> 
> 	arm_smmu_write_context_bank(smmu, i);
> 	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
> 
> It is likely that FW reserves the last context bank for its own use,
> thus a simple work-around would be: DON'T USE IT in Linux.
> 
> If we decrease the number of context banks, last one will be "hidden".
> 

I asked you to write something like "the hardware/hypervisor reports 12
context banks for the lpass smmu on msm8998, but only 11 are
accessible...override the number of context banks"

It also seems, as the different SMMUs in this platform behave
differently it might be worth giving them further specific compatibles,
in which case we could just check if it's the qcom,msm8998-lpass-smmu,
instead of inventing a property for this quirk.

Regards,
Bjorn

> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7e65189ca7b8c..e2e1fd9e2452b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -282,6 +282,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  	u32 smr;
>  	int i;
>  
> +	if (of_property_read_bool(smmu->dev->of_node, "qcom,last-ctx-bank-reserved")) {
> +		dev_warn(smmu->dev, "hiding last ctx bank from linux");
> +		--smmu->num_context_banks;
> +	}
> +
>  	/*
>  	 * Some platforms support more than the Arm SMMU architected maximum of
>  	 * 128 stream matching groups. For unknown reasons, the additional
> 
> -- 
> 2.34.1
> 

