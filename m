Return-Path: <linux-arm-msm+bounces-28989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F098956E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C701F21700
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5BF175548;
	Mon, 19 Aug 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="BjYcs34J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778016D4F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724079741; cv=none; b=ZJLaWB8Do0I1owUc690busHVfbiI2fPfyYDZ+J+6iOVEFAIdsQCzgZQV3T+E74M3w1AC9VP8QCqvlWMAtU9INcnzYWYmUFLOFw0hyNbVTnaQ7UNwg6a/FHwg7w7zFZUcmIE4tVFOU2n7fxgapIjAVxvNST/Yjq/8C1tFSCmULvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724079741; c=relaxed/simple;
	bh=EN08TFaSVBCQMLBeFx4mFOBoH9BoUxUimX0KlSPHLS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjTqAKG3FAY4LyHbh5HBrHxFEWjCXVph1t8lCuomP5xu8dlBfCLqNKeKCXOdKUM0tdyROUQte3kpzNySU1irZu6Dx1X9DvDGNy88uXb2sQ9zO58SRnYKljtnDCR8HCWFwprlvpcnPyuhJ4L8rSVtiAy/THIbg/h14EgDJuQGn9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=BjYcs34J; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso975120f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1724079737; x=1724684537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUK8OL34DJRMcxB19xg1k7/qsStJR02DDbFs+v32ruE=;
        b=BjYcs34JwFjBVBVxdJtj2JKBTwZp04kUNQfvWKbfYQisPeiD8CjU6r+0RUnJ1GQHb1
         73pO65Lqk/DFy6wCUouxYNfkYv02f5z9G5jyFfjl4Y/YFdhaNP3NwcvFguiuQ2R6IATr
         QG5v0c4rrfCvk1PXfuI0RE017WoNkuwZ7v4osqF/ETYjn2QPKJ9dO332Oue46f0cLtbm
         f4D4K3IWca7YHd4qNLxejFFyYRG2sOStCQPEujbxJzTduSYVMG29GGSxHcrtkjTrH4ZY
         IpUQ5rxqJUxbzTzKrTmf5Dbpsw7M1kUf2SnHg5CjyCq1bZC6Q0cxbFEd2i0zafFapsxY
         c5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724079737; x=1724684537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUK8OL34DJRMcxB19xg1k7/qsStJR02DDbFs+v32ruE=;
        b=W1j6btfZBZ0eBrlPYtGQcOIkICt3rdMbBOvzUeGmMMZADwFmmAImFLr1cA4eaSNece
         8miyOGiVqdoLWX2wiOZ8KReIYwrWE6MhRGND7lw/ToLz6ggsGfv63Hdf9l4f+beA2RxY
         Ui1Pz97LmnoHNIq0jQB3L/FCQV943NTdw0uZxWpAbcsnWsjXQIt5wF0QDi00ucDHtK1x
         C3qOnd0OKdzzYGcW2Bo0Z0EN5QL69LCfhXzumJUDWOcDw3S5fcW1iNw7i1cpHDsTxaIu
         Z/KnF5rWdZdyCw+gXlVTDnqVr8c1lbGlB7tkZI1MWIj0UZAObVfoLQYLkAHSCZt7+Sk1
         XXFg==
X-Forwarded-Encrypted: i=1; AJvYcCUaFntXFXzQly5s0/GDfC16MyLpCh8V5lxJ7y0YGfiCtyTpmV5vpAvjSw1APvOfy9UV98UxWEXbk/wjO65HCSuY9fvSzSfnEUBxLhFtxQ==
X-Gm-Message-State: AOJu0Yzm/SvF7IRap6ptQOPjyGZGc1PhHEmgd2Qg/YBx8xyeLLwA0pky
	+Uxy6iTuqqhEZ4lhjwI8klwyLB1HyPwRWIIxNGKvhfqtUvYc4DNaXnCHGjNaGEg=
X-Google-Smtp-Source: AGHT+IHoBqukazpQ2b+gLTUJRvOUgCeOQ4+kudIq0jjRNmYddBHniXchx8b++5+6dBkpqdwg2at2Cg==
X-Received: by 2002:a5d:5e0f:0:b0:367:4d9d:56a5 with SMTP id ffacd0b85a97d-371983d5ea0mr5461777f8f.44.1724079737278;
        Mon, 19 Aug 2024 08:02:17 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a2d7sm10875557f8f.10.2024.08.19.08.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:02:16 -0700 (PDT)
Message-ID: <67f9a762-6d14-4557-b1f6-22aabb33f927@freebox.fr>
Date: Mon, 19 Aug 2024 17:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add
 qcom,last-ctx-bank-reserved
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-1-3d6c27027d5b@freebox.fr>
 <20240818152515.GA104481-robh@kernel.org>
 <30489eee-075b-461b-ab43-c8807d667630@freebox.fr>
 <17893776-9666-4bbe-b5fc-c3fe977d0337@arm.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <17893776-9666-4bbe-b5fc-c3fe977d0337@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2024 14:57, Robin Murphy wrote:

> Luckily, in this case it seems straightforward enough to be able to see 
> that if we have a "qcom,msm8996-smmu-v2" with 13 context banks then we 
> should just treat it as if it has 12 - it's also notable that it only 
> reports NUMSMRG=12, so we couldn't use more than that many S1 context 
> banks at once anyway.

This is what the hypervisor reports:

[    2.550974] arm-smmu 5100000.iommu: probing hardware configuration...
[    2.557309] arm-smmu 5100000.iommu: SMMUv2 with:
[    2.563815] arm-smmu 5100000.iommu:  stage 1 translation
[    2.568494] arm-smmu 5100000.iommu:  address translation ops
[    2.573791] arm-smmu 5100000.iommu:  non-coherent table walk
[    2.579434] arm-smmu 5100000.iommu:  (IDR0.CTTW overridden by FW configuration)
[    2.585088] arm-smmu 5100000.iommu:  stream matching with 12 register groups
[    2.592132] arm-smmu 5100000.iommu:  13 context banks (0 stage-2 only)
[    2.619316] arm-smmu 5100000.iommu:  Supported page sizes: 0x63315000
[    2.626225] arm-smmu 5100000.iommu:  Stage-1: 36-bit VA -> 36-bit IPA
[    2.632645] arm-smmu 5100000.iommu:  preserved 0 boot mappings


smmu->num_mapping_groups = 12
smmu->num_context_banks  = 13


Are you saying that

	smmu->num_context_banks > smmu->num_mapping_groups

does not make sense?


Would a well-placed

	if (smmu->num_context_banks > smmu->num_mapping_groups)
		smmu->num_context_banks = smmu->num_mapping_groups;

be a proper work-around?

(Probably in qcom_smmu_cfg_probe() so as to not interfere with other platforms.)


Maybe to limit the side effects even more:

	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") &&
		smmu->num_context_banks > smmu->num_mapping_groups))
		smmu->num_context_banks = smmu->num_mapping_groups;


Neither work-around would require changing the binding.

Is either work-around acceptable, Robin?

Regards


