Return-Path: <linux-arm-msm+bounces-21455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7D8D7E62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE2EB20DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2DE6BFA7;
	Mon,  3 Jun 2024 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epSDWs5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449A53392
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406413; cv=none; b=BAPw99ekZTCI8mYmQrsGHvljhvuo2oQb8E5jp59pJRqyK4OLQAvDwICuYYibYfzud+oNiLnJph4BbBVh0dgpTbFuFXDAms0JK7TpHNpEsmbNAdBm+ScPOTQ0r2QPQ36hiRT+NuHGF7NJ4s1+lr5JLTj83TSc6/EAUAK9hSniRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406413; c=relaxed/simple;
	bh=Ha8VBm8OFXpm7Pbma5iEOhMzm/NDJlVK2JhSWKzDmto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioWio2xh3sJLnuK/n1rnwbPT3zAzsTRcNmI7VzL+SBQUs81Y1yzsDuytAuYYQ/3OQ2iA1H/Col41vkD3g646g/JCjYJm1WKEXFyl9Hq+g6RT7P5N4XapQO/dyA492/ehsaVCUKRHyGMaj78Qj9ASAEUynR5dWmEsWZvz/DiaIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epSDWs5n; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a63359aaaa6so531714566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717406409; x=1718011209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHZqFaN5bKSTWMNSSR+7cQHbzwfkO0znNAJUpVvLcOw=;
        b=epSDWs5n2U8RsCgdBngeAy7Ibn5gI+tUyUGCIsCuYewx6MURM/ZPfCCjneJdbbQo6c
         8TGdSttNU/E/WnE8dai9m0kajegh8w4CAOPn59y+V/FvaFhBuBGr7boX7JkL/e/lzGbo
         vFOy7VsiRiTGSLp8BfTP8/D1I4pzsn4wgKPX8pLxeUeKBFFdAwsX/DyHjp3YBstrOJ6h
         dvL57HA2DMoa9ZZzTDUMsI5vsdDX1QhtMNEL0xE307hXN3dAW+cft7ebu3npYxfa47yQ
         r7iQqznYVdywJf/wEeWeRNRkG4E4R1cD74SRdwBHtcTV+kfnRMlKsz/7BgazNc5fSGJa
         YsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717406409; x=1718011209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHZqFaN5bKSTWMNSSR+7cQHbzwfkO0znNAJUpVvLcOw=;
        b=bEDy7GxfE/Eplkq0IBYN7AURoPZDslqbBjC0mdss5lsLqeg6DtMuUTx4UKzHewbOyh
         CTGSBceO8lhdkIpiDo/9iAgfSljBNC0ieQG1suNHOLA4+iI2qIaCV0f7UkhmDYFC8TEk
         ZMiqY4uVRGOT4luF/U07doycn5Mp+JgzRolKM/Mxde3cf4GKVMPI+0aBKeAjup81MQOF
         gm3lGtAfMX80M7YKjPhG9lQ7lCtoWZ3wa9Zbt3o1SRMns489y3aOti1a13VLi/BBb567
         YlcPZVg7wMlO7M7gqZyy39MdKdOaf8623HQ3aFmm0dXunRWB80vMCJfqtnHZVbeNK7by
         a2pQ==
X-Gm-Message-State: AOJu0YwvZzpIdNo9Ckh/2ONm8x5SeQXAjgmRO+OgvXurnldeQVq6NW7B
	h8hu/wiZ44Ldpj5zZfXiKKtLzES9hJLPAmfoYXJQnPp11uE5pGojTc+B6Gn6EnI=
X-Google-Smtp-Source: AGHT+IHN5YrEtskx+Hnw7hMtvOeOP7AZi8z1fe6A5/NPEPlUuxqnrVNod+3lqTlUDpQ4VmL4P+6Lcw==
X-Received: by 2002:a17:906:f6cd:b0:a68:5b93:594e with SMTP id a640c23a62f3a-a685b935b09mr442343266b.39.1717406409346;
        Mon, 03 Jun 2024 02:20:09 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68e2d1333fsm253066666b.219.2024.06.03.02.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:20:08 -0700 (PDT)
Message-ID: <a95fed63-f48d-42c6-856b-0636a50c9dd4@linaro.org>
Date: Mon, 3 Jun 2024 11:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-3-quic_tengfan@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240529100926.3166325-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tengfei,

On 29/05/2024 12:09, Tengfei Fan wrote:
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

Are you describing some particular quirk of the platform here, or just 
standard UEFI booting?

When booting with UEFI, the memory map is passed via the ESRT, so having 
memory that the kernel shouldn't use it pretty simple (and typical).
> 2. Firmware related memory regions which are shared with Kernel
>      The device tree source in the kernel needs to include nodes that
> indicate fimware-related shared information. A label name is suggested
> because this type of shared information needs to be referenced by
> specific drivers for handling purposes.

Again, is there something non-standard here? If not I would suggest 
dropping these detail comments as they might be misleading.

Thanks and regards,
> 3. Remoteproc regions.
>      Remoteproc regions will be reserved and then assigned to subsystem
> firmware later.
> Here is a reserved memory map for this platform:
> 0x100000000 +-------------------+
>              |                   |
>              | Firmware Related  |
>              |                   |
>   0xd4d00000 +-------------------+
>              |                   |
>              | Kernel Available  |
>              |                   |
>   0xa7000000 +-------------------+
>              |                   |
>              | Remoteproc Region |
>              |                   |
>   0x8a800000 +-------------------+
>              |                   |
>              | Firmware Related  |
>              |                   |
>   0x80000000 +-------------------+
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8550.dtsi | 167 ++++++++++++++++++++++++++
>   1 file changed, 167 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> new file mode 100644
> index 000000000000..685668c6ad14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> @@ -0,0 +1,167 @@
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
> +		 * 2. Firmware related memory regions which are shared with Kernel
> +		 *     The device tree source in the kernel needs to include nodes
> +		 * that indicate fimware-related shared information. A label name
> +		 * is suggested because this type of shared information needs to
> +		 * be referenced by specific drivers for handling purposes.
> +		 * 3. Remoteproc regions.
> +		 *     Remoteproc regions will be reserved and then assigned to
> +		 * subsystem firmware later.
> +		 * Here is a reserved memory map for this platform:
> +		 * 0x100000000 +-------------------+
> +		 *             |                   |
> +		 *             | Firmware Related  |
> +		 *             |                   |
> +		 *  0xd4d00000 +-------------------+
> +		 *             |                   |
> +		 *             | Kernel Available  |
> +		 *             |                   |
> +		 *  0xa7000000 +-------------------+
> +		 *             |                   |
> +		 *             | Remoteproc Region |
> +		 *             |                   |
> +		 *  0x8a800000 +-------------------+
> +		 *             |                   |
> +		 *             | Firmware Related  |
> +		 *             |                   |
> +		 *  0x80000000 +-------------------+
> +		 */
> +
> +		/*
> +		 * Firmware related regions, bootloader will possible reserve parts of
> +		 * region from 0x80000000..0x8a800000.
> +		 */
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
> +		/* PIL region */
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
> +		/*
> +		 * Firmware related regions, bootloader will possible reserve parts of
> +		 * region from 0xd8000000..0x100000000.
> +		 */
> +		mpss_dsm_mem: mpss_dsm_region@d4d00000 {
> +			reg = <0x0 0xd4d00000 0x0 0x3300000>;
> +			no-map;
> +		};
> +	};
> +};

-- 
// Caleb (they/them)

