Return-Path: <linux-arm-msm+bounces-29161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1729590D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 01:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28761F23EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42689190482;
	Tue, 20 Aug 2024 23:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxtjRMuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16E18A6C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724194906; cv=none; b=bdMis3DBoG9mQF6GLQ41J6Ta2PMJpJnXqA//Jqa3sz4vph0cPz03bUyw9InrLS+uk0rEatqgmcspn9agaMbh2qaoWb9XGklPEx9RL1sJSTlNCpu4kWnDI8nVQdhBiHx5mZEnt3GpOdkqvKraMB/3Qfs25tb0TBVIOs84Al8mjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724194906; c=relaxed/simple;
	bh=oZ6HnlhFFnD76cBD61CWDrFOFad6r5f3H3ArzEmAfnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCK+1ngpQEZ7ovSW3WjmGUpM4s/Tpa+33+0+/2Cod7Zl0zXDkfAuB+OS73tAHp3bUpJvEqopsIU8fJgMA7c/4lf5PQQ4bI9DMPK8aJxs12ncEZK3TkoGTZkShDJTIBGlSdR86pCbenfhU+Rn7IkPClRYbSvUdEzgqnPIUj96TOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxtjRMuU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so2763449a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724194902; x=1724799702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kC7vkVAJUQE0cYVMmhqBSRyCNd1fPaHCZyplFYwQ3Ps=;
        b=lxtjRMuU7BveNYz+e+jRioJYRB0qaa/5ZS/qlSs9hcDbp0PsmETdbm4aQ35yvcpT7z
         RM8w4+8AIX9OCdGgBYDtoVA6fjCy59OHtVfcVpiLoP/rg32mS8l9IcJfjH7wODZT/m2R
         QrxFabw88Gq3C2KA1GTKq+1S3LZcoawLmJTBDSfN97HPm8CCcOt/BIOKHCj9Qp/35aa6
         qeb9wSHeDFVIROeHkHPYlqTLr79GWBz+vfbvSchdrTL7L8e+iicdFXmNdrkYFg6sAM46
         glQO5zcrBG3/nwdckG5ai5zrGe7n98X0SJof56ZMXpo5hNW7+RxT+sHppymYDwAZLHz2
         BYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724194902; x=1724799702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kC7vkVAJUQE0cYVMmhqBSRyCNd1fPaHCZyplFYwQ3Ps=;
        b=QodCM9KphGcVA5oCpBI1k7TmqzuBsVAZcHaUWsMn92h92xWbmgaTXY43EwDMbg9ClT
         HN5Ve3BgF9CCn191B4/YV079xr3cuIVh2gvuMxrq6iai4pwfRWRqXAQp7nLLou85Yxw9
         cwL1xVaLbdNmmKI/A3Aq8Eh/qLb4jAoT+/661FQa5jyaWDy877ETTDomZqFVq/S/6LCN
         vwE/Pnl8TfkzqIF2CRAgamI6m9gQFw0h5+b8sIwE1CXlj9g9L+sGzjI3Cq5OlhhdVa8u
         dLT3nEv48/uaCza8fd445qyCtyO67jWy7IJlIDOwgfJG91g4H2jzeVDWxmvYHD1fdZW5
         Q7/w==
X-Forwarded-Encrypted: i=1; AJvYcCVlGHyN1GBLC9NiO+5CZAaNyA7zWKd4TqGu40nJtIhmGvX4W7laLWVBkUut8eD5GOFEdsVx+Nm3/+IvoCLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8Q6zQ6nz/jl0ZLwFCrHk5BmjUWG99wqJZbRUUIZEXC18XU4S
	e0C1fHZACF6dLiXrKObGQIFpz9b8qCu5l5/cNQnF0ZxXURJr+ZWLXtRD8GRD9rM=
X-Google-Smtp-Source: AGHT+IH/kpgHGxeSB23tQMLpjn7/+xqj10S/vaLRuAiUHtgs+SorygqqL8tSoFCWMnv4Rbg1NyhgrA==
X-Received: by 2002:a17:907:d2c9:b0:a7d:33f0:4d58 with SMTP id a640c23a62f3a-a866f73376bmr40138966b.48.1724194902487;
        Tue, 20 Aug 2024 16:01:42 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::676e? ([2a02:8109:aa0d:be00::676e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm809596666b.155.2024.08.20.16.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 16:01:42 -0700 (PDT)
Message-ID: <482ddee7-6b56-47c4-ae80-ed708f7e2c2a@linaro.org>
Date: Wed, 21 Aug 2024 01:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank
 from linux
To: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20240820-smmu-v3-1-2f71483b00ec@freebox.fr>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240820-smmu-v3-1-2f71483b00ec@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/08/2024 15:27, Marc Gonzalez wrote:
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

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>


> ---
> Changes in v3:
> - Use very specific test (hack) to avoid changing the binding (Bjorn)
> - Link to v2: https://lore.kernel.org/r/20240819-smmu-v1-0-bce6e4738825@freebox.fr
> 
> Changes in v2:
> - Use the compatible prop instead of a specific prop to trigger work-around (Bjorn & Caleb)
> - Add qcom,msm8998-lpass-smmu compatible string
> - Link to v1: https://lore.kernel.org/r/20240814-smmu-v1-0-3d6c27027d5b@freebox.fr
> 
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
> For reference, the lpass_q6_smmu node looks like this:
> 
> 	lpass_q6_smmu: iommu@5100000 {
> 		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> 		reg = <0x05100000 0x40000>;
> 		clocks = <&gcc HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
> 		clock-names = "iface";
> 
> 		#global-interrupts = <0>;
> 		#iommu-cells = <1>;
> 		interrupts =
> 			<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> 
> power-domains = <&gcc LPASS_ADSP_GDSC>;
> 		status = "disabled";
> 	};
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7e65189ca7b8c..625db1d00fe5e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -282,6 +282,13 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>   	u32 smr;
>   	int i;
>   
> +	/*
> +	 * MSM8998 LPASS SMMU reports 13 context banks, but accessing
> +	 * the last context bank crashes the system.
> +	 */
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") && smmu->num_context_banks == 13)
> +		smmu->num_context_banks = 12;
> +
>   	/*
>   	 * Some platforms support more than the Arm SMMU architected maximum of
>   	 * 128 stream matching groups. For unknown reasons, the additional
> 
> ---
> base-commit: 96a96aed6bb75b5c212f233b6c059a9354cdeebe
> change-id: 20240814-smmu-d572c1a16aac
> 
> Best regards,

-- 
// Caleb (they/them)

