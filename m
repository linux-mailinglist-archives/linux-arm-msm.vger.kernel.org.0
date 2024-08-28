Return-Path: <linux-arm-msm+bounces-29866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD129632EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4EF1F251F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E651ACDE1;
	Wed, 28 Aug 2024 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qg+Kfh29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B101AC43E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878176; cv=none; b=HwBT4ITBEWSsAzqqRAtMeB+QoJmyIZvEdCEAB+6UAbT21XJWnhL/1sp5++b/R4ZHLDDFCsAeF/4pG3gO7vnX92sGLy9nZFs3T3RUS+qiD5bhTtiGIfHnuO2co61hYVcf7TleApBLAJ9U848cBEiTcT7+9/NWLx7u1UhPUdHWaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878176; c=relaxed/simple;
	bh=SI+regcL35D2pgjCxxik/DYpB87OSLp3n3YVroEysHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyi1XCwKYGNwBgkABZQxPnyUNgMnZ+QjZSJEdX51BCcT0NgAl5vTGLx5lMV+qrcvyIwQpR0g0bSH/E4qmfrLBAz6JS2c+cqUEkPXUcQumQgu4rcHmdTUQwcp4VNumgmJ75+RzLEVSnFwuKs5yEh3eFwFsx9mp0Tk6LJSKw8JRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qg+Kfh29; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3409352e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724878172; x=1725482972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7iL+wVZPXpJO8ClTV1l/2A644kBdScvCJ/IGN2rpT8=;
        b=Qg+Kfh29ecFEHpDywXmVQQEHgKVokkO9rkJkIRAyDQiSrHVfnsVbZw8NyiCqKO3JHn
         M2gAzAH7GdvCvxZoC5Lkw++52KQkP1pWpWsWXMJmk429g6RRydQ6Z2cCJrn0O6eik9A8
         WPGAA8U+uK9EcIJLSI03H6sSjquGyrfl5eV37x6oSDoAkdhbPXfyzM+91SJoo2KLf1pQ
         7pj/Azt60V3BLCkLw7Zo+c8nAmgrWle6fB4Wj3Q/KTLVagyU1NXkqanHuhCRk55MCkXo
         zHmE6h7Xo1btpudXhqVQJzP6yoWaGV0ExceZjR4f0HjUS+vFZhEgnSPkoRrUf04nKqAa
         wu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878172; x=1725482972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7iL+wVZPXpJO8ClTV1l/2A644kBdScvCJ/IGN2rpT8=;
        b=loJM93gRbkH3xwSVhXzn0IrcfePkiJSerG3OjLKD02JP/O2UznBq8S5F2Ws4pa9CJV
         5MC400fgOC2/4NVhwwp3zbqsJP0+QjX7h31ISL1JKS7qjP5M2DgiLeu2bNvZJpg4pWe6
         j557TMYIM31Z2+nDEfauzsQaDgGutQ7yaByhcGU7ARqIv/M4Xumhd79UjcR9681croYa
         XKhokzfD1ZkEp+NCdWH2oxqEzrfodpYJGvpsHSRi6AdaA2ki2hwopRT7HLCW5vnUrhlb
         niZCB8dYJUEZhX0H84m89EsfQ+PcrUXdXOFuDOCOIyQtPyDdgZHuCBfxu0nW84iPeIAa
         wLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUwLKr9su0woD06f2SpvsDMGKtJbMChGFK3+ncz5k5l5RxZ+yl59TeD9Fhoi+5psd7Dn+NDmLBvVz+Bal@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIQBzIpX440Rz6ESMeCkhx5MOj4J8/us28nfYNh15iQOOW3ey
	v3MuizSkbinuDDi99TPHdQa5HT3ApDiVxS6ptDZRxw/Il6ickKTG7+3JFg/4Uks=
X-Google-Smtp-Source: AGHT+IGFlooROX7KAAWEZ3u9MgehYtM/1Q4NV0a/4GC6vjfI00yn1fIiQPQwXUf0jAQZYDlL800GWg==
X-Received: by 2002:a05:6512:ac9:b0:533:4591:fbf1 with SMTP id 2adb3069b0e04-5353e567669mr289888e87.15.1724878171237;
        Wed, 28 Aug 2024 13:49:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea36413sm2299368e87.79.2024.08.28.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:49:30 -0700 (PDT)
Date: Wed, 28 Aug 2024 23:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: hide last LPASS SMMU context
 bank from linux
Message-ID: <jxxstowusullmfvtee7xvabc7s3ifele5xlc6muem65dnvzxih@e2nm7ln5n2qv>
References: <20240819-smmu-v1-0-bce6e4738825@freebox.fr>
 <20240819-smmu-v1-1-bce6e4738825@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-smmu-v1-1-bce6e4738825@freebox.fr>

On Mon, Aug 19, 2024 at 02:59:35PM GMT, Marc Gonzalez wrote:
> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
> (base address 0x05100000) produces a system freeze & reboot.
> 
> The hardware/hypervisor reports 13 context banks for the LPASS SMMU
> on msm8998, but only the first 12 are accessible...
> Override the number of context banks
> 
> [    2.546101] arm-smmu 5100000.iommu: probing hardware configuration...
> [    2.552439] arm-smmu 5100000.iommu: SMMUv2 with:
> [    2.558945] arm-smmu 5100000.iommu: 	stage 1 translation
> [    2.563627] arm-smmu 5100000.iommu: 	address translation ops
> [    2.568923] arm-smmu 5100000.iommu: 	non-coherent table walk
> [    2.574566] arm-smmu 5100000.iommu: 	(IDR0.CTTW overridden by FW configuration)
> [    2.580220] arm-smmu 5100000.iommu: 	stream matching with 12 register groups
> [    2.587263] arm-smmu 5100000.iommu: 	13 context banks (0 stage-2 only)
> [    2.614447] arm-smmu 5100000.iommu: 	Supported page sizes: 0x63315000
> [    2.621358] arm-smmu 5100000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
> [    2.627772] arm-smmu 5100000.iommu: 	preserved 0 boot mappings
> 
> Specifically, the crashes occur here:
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
> thus a simple work-around is: DON'T USE IT in Linux.
> 
> If we decrease the number of context banks, last one will be "hidden".
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7e65189ca7b8c..d08c18edf5732 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -282,6 +282,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  	u32 smr;
>  	int i;
>  
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-lpass-smmu")) {
> +		dev_warn(smmu->dev, "hide last ctx bank from linux");

dev_info() or dev_dbg(). dev_warn should be reserved to the case when
you need to warn the user that something went wrong. In this case it is
expected that the last bank is unusable.

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

-- 
With best wishes
Dmitry

