Return-Path: <linux-arm-msm+bounces-22990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE190C8FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7C31F22200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7795A13B780;
	Tue, 18 Jun 2024 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbK3jcqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1972139A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705204; cv=none; b=UvxaNU5mHZhEWsWc6gMmin8dWVvXKBmOyjGhyxz0pktRraYx5Wk3nFhGEiQg/R4Sxtuiaj3gG/6C6tAzwAFTPB88TMITFTE2j/W4qsokE64gAvqQdrO3/FBUaz9G52dbY35IQRFipnjGZVbDVr8oF3Y7h6ap95Qf4WaQcJRE798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705204; c=relaxed/simple;
	bh=ccCvrVFmurLl9+KG4CWrDeNU5t43iAbp9QCjKO+uA60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qatWnyVmtCfn7v4ZQOaSirndOtl1KiWAbPHqPvjjTqdwgJ57hXO2DAQf4HqqMVHizccdt3Tq4EBi5Pq1qNZn9gymszV1D4zDFkUddHyIhEq7RhHwmFfLvNtN9sNJSTfiU9b1YkqQ/Xdq4UJMwmRZuH3h7HOeOcAjWcHxS73rPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbK3jcqg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f7b785a01so289425866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718705201; x=1719310001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxtSEXxRG1fOCO7Q3yLdK5bi/XGSz1EBERPfpeBZjCU=;
        b=AbK3jcqgdUEbNHNDS5cdHOHBPLip8tpYK0PMrQxAKfFqcn9Gf2OQ4sFzfar70Srew1
         yx3owewQzXUKLJeiyv5eFooUKQRYy+upzv5kVVoXQOEbU2zPK+tiQa7M771hjPbVmTzL
         JkvjQbTsx4GTsy9It0F2hervko4+RSliXMlh88hf2LLgjg1eO81PmlX4o2rG7gmQ9T/w
         QIRgWPph9wB90InEE3KdpvzQN6/bpc2WBPYZUHZNaMvNMgvD54ahYpWc2Tl5RvEm2bxX
         iHxM7X+6t12mSByDFkZ4iavWdwz+ncx2M8tb1UehuwGWpYxLxZgotYxd+/4ZrHIiGQTC
         o7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705201; x=1719310001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxtSEXxRG1fOCO7Q3yLdK5bi/XGSz1EBERPfpeBZjCU=;
        b=AG081149TphheVNzVW+2oMw+xN1L5a1Zc3LTKDLCjQ1yD2Yw5uC39yaQuerUiKtcBd
         7hi8dPfnus8SueCq5zi7NVPD6GrYSlJ2q/Fp3fjm400BZdYn1x8bmjFnbt2stKjB8tN/
         NWci7P9ELvIDqcWw0B5TTxfieITiQkIylU/ql2J0x628GUQaD8WxKuwZJvVEZCgg3prG
         UdkNF+FE1Y4bAeC7vrnUtr5O6SGtwme2rAu8awHkC/yzq1sVOqPALnlnshxCJUd5Cxgk
         2QVmJOa7y9xvysD3/PONWVAVBaoYDwSXIEOsoWsQpOLBQhZRiUWKHgcuSJ4TScbEdQj/
         /wDw==
X-Gm-Message-State: AOJu0Yz1FtCVFaBwk1F/ToUsKXoWR939nn4sJXmd1HoqYY/gpoB8Fbe0
	oJqLFtGUGJnfuxZQC2/l/AgsCwUrgsN85eOEJRofhTL9BN2kh8sm3SMdJ27vtZU=
X-Google-Smtp-Source: AGHT+IHOg/g0sa+NqKDaqzcUgXcPDGg4rNFhsWoxEGCvNIo0M9DZfAQueeBjxTg4h9KDdmiu7h5Zjw==
X-Received: by 2002:a17:906:2c02:b0:a6f:24fe:f2a7 with SMTP id a640c23a62f3a-a6f60cf1dcbmr779303066b.10.1718705200555;
        Tue, 18 Jun 2024 03:06:40 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::52af? ([2a02:8109:aa0d:be00::52af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f43220sm600161566b.185.2024.06.18.03.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 03:06:40 -0700 (PDT)
Message-ID: <44e24399-6efa-41ed-8871-12180dd03e10@linaro.org>
Date: Tue, 18 Jun 2024 12:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-3-quic_tengfan@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240618072202.2516025-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

HI Tengfei,

On 18/06/2024 09:22, Tengfei Fan wrote:
> QCS8550 is derived from SM8550. The difference between SM8550 and
> QCS8550 is QCS8550 doesn't have modem RF system. QCS8550 is mainly used
> in IoT products.
> QCS8550 firmware has different memory map compared to SM8550.
> The memory map will be runtime added through bootloader.
> There are 3 types of reserved memory regions here:
> 1. Firmware related regions which aren't shared with kernel.
>      The device tree source in kernel doesn't need to have node to indicate
> the firmware related reserved information. Bootloader converys the
> information by updating devicetree at runtime.
>      This will be described as: UEFI saves the physical address of the
> UEFI System Table to dts file's chosen node. Kernel read this table and
> add reserved memory regions to efi config table. Current reserved memory
> region may have reserved region which was not yet used, release note of
> the firmware have such kind of information.
> 2. Firmware related memory regions which are shared with Kernel
>      The device tree source in the kernel needs to include nodes that
> indicate fimware-related shared information. A label name is suggested
> because this type of shared information needs to be referenced by
> specific drivers for handling purposes.
>      Unlike previous platforms, QCS8550 boots using EFI and describes
> most reserved regions in the ESRT memory map. As a result, reserved
> memory regions which aren't relevant to the kernel(like the hypervisor
> region) don't need to be described in DT.
> 3. Remoteproc regions.
>      Remoteproc regions will be reserved and then assigned to subsystem
> firmware later.
> Here is a reserved memory map for this platform:
>   0x80000000 +-------------------+
>              |                   |
>              | Firmware Related  |
>              |                   |
>   0x8a800000 +-------------------+
>              |                   |
>              | Remoteproc Region |
>              |                   |
>   0xa7000000 +-------------------+
>              |                   |
>              | Kernel Available  |
>              |                   |
>   0xd4d00000 +-------------------+
>              |                   |
>              | Firmware Related  |
>              |                   |
> 0x100000000 +-------------------+
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8550.dtsi | 162 ++++++++++++++++++++++++++
>   1 file changed, 162 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> new file mode 100644
> index 000000000000..07b314834d88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "sm8550.dtsi"
> +
> +/delete-node/ &reserved_memory;
> +
> +/ {
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +
> +		/* These are 3 types of reserved memory regions here:
> +		 * 1. Firmware related regions which aren't shared with kernel.
> +		 *     The device tree source in kernel doesn't need to have node to
> +		 * indicate the firmware related reserved information. Bootloader
> +		 * conveys the information by updating devicetree at runtime.
> +		 *     This will be described as: UEFI saves the physical address of
> +		 * the UEFI System Table to dts file's chosen node. Kernel read this
> +		 * table and add reserved memory regions to efi config table. Current
> +		 * reserved memory region may have reserved region which was not yet
> +		 * used, release note of the firmware have such kind of information.

This is a lot of implementation detail about UEFI, I'd imagine that 
anyone curious can go read the relevant docs instead. It's a lot of 
words just to say "Firmware regions which the kernel doesn't need to 
know about which are not included in the EFI provided memory map."
> +		 * 2. Firmware related memory regions which are shared with Kernel
> +		 *     The device tree source in the kernel needs to include nodes
> +		 * that indicate fimware-related shared information. A label name
> +		 * is suggested because this type of shared information needs to
> +		 * be referenced by specific drivers for handling purposes.

"Firmware regions the kernel DOES need to know about, which are 
described in the reserved-memory node".
> +		 *     Unlike previous platforms, QCS8550 boots using EFI and describes
> +		 * most reserved regions in the ESRT memory map. As a result, reserved
> +		 * memory regions which aren't relevant to the kernel(like the hypervisor
> +		 ( region) don't need to be described in DT.

These would fall under (1) "firmware the kernel doesn't need to know about"
> +		 * 3. Remoteproc regions.
> +		 *     Remoteproc regions will be reserved and then assigned to
> +		 * subsystem firmware later.

How do these differ from those described in (2)?

I think this comment is trying to describe too much at once. You're 
trying to describe what the different types of reserved memory are, how 
the kernel learns about them, and how this differs from previous 
platforms all at once. I think you should tackle these points separately:

First describe the types of reserved memory and how the kernel learns 
about them (my suggestions above). Then describe the differences with 
previous platforms (like the hypervisor example).

Thanks and regards,
> +		 * Here is a reserved memory map for this platform:
> +		 *  0x80000000 +-------------------+
> +		 *             |                   |
> +		 *             | Firmware Related  |
> +		 *             |                   |
> +		 *  0x8a800000 +-------------------+
> +		 *             |                   |
> +		 *             | Remoteproc Region |
> +		 *             |                   |
> +		 *  0xa7000000 +-------------------+
> +		 *             |                   |
> +		 *             | Kernel Available  |
> +		 *             |                   |
> +		 *  0xd4d00000 +-------------------+
> +		 *             |                   |
> +		 *             | Firmware Related  |
> +		 *             |                   |
> +		 * 0x100000000 +-------------------+
> +		 */
> +
> +		aop_image_mem: aop-image-region@81c00000 {
> +			reg = <0x0 0x81c00000 0x0 0x60000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		aop_config_mem: aop-config-region@81c80000 {
> +			no-map;
> +			reg = <0x0 0x81c80000 0x0 0x20000>;
> +		};
> +
> +		smem_mem: smem-region@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		adsp_mhi_mem: adsp-mhi-region@81f00000 {
> +			reg = <0x0 0x81f00000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss-region@8a800000 {
> +			reg = <0x0 0x8a800000 0x0 0x10800000>;
> +			no-map;
> +		};
> +
> +		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
> +			reg = <0x0 0x9b000000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: ipa-fw-region@9b080000 {
> +			reg = <0x0 0x9b080000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: ipa-gsi-region@9b090000 {
> +			reg = <0x0 0x9b090000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
> +			reg = <0x0 0x9b09a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		spss_region_mem: spss-region@9b100000 {
> +			reg = <0x0 0x9b100000 0x0 0x180000>;
> +			no-map;
> +		};
> +
> +		spu_secure_shared_memory_mem: spu-secure-shared-memory-region@9b280000 {
> +			reg = <0x0 0x9b280000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		camera_mem: camera-region@9b300000 {
> +			reg = <0x0 0x9b300000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		video_mem: video-region@9bb00000 {
> +			reg = <0x0 0x9bb00000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: cvp-region@9c200000 {
> +			reg = <0x0 0x9c200000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp-region@9c900000 {
> +			reg = <0x0 0x9c900000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
> +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
> +			reg = <0x0 0x9e900000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
> +			reg = <0x0 0x9e980000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		adspslpi_mem: adspslpi-region@9ea00000 {
> +			reg = <0x0 0x9ea00000 0x0 0x4080000>;
> +			no-map;
> +		};
> +
> +		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
> +			reg = <0x0 0xd4d00000 0x0 0x3300000>;
> +			no-map;
> +		};
> +	};
> +};

-- 
// Caleb (they/them)

