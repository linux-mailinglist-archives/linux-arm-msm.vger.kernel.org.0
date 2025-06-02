Return-Path: <linux-arm-msm+bounces-60067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55CACB876
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 17:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30CB57A49D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20627220F41;
	Mon,  2 Jun 2025 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGIGWGP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A30175BF;
	Mon,  2 Jun 2025 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878903; cv=none; b=PUPW8B059mfN+z4taZXuVqt4Qnmp7u6xgPtUi15kPD9QNbmtNHSDCBpQmhZ5jJncKDDOT2LVBmKKmjlsbUxREZjX9WeRYISPNOk+p9nKimHINHUvz8LgdH4s0W6oMRvRa5GCEhl1oT69xjsblEiPaY+YN7PCUi3ABsqIKWI/zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878903; c=relaxed/simple;
	bh=SErxh7WSPVlVMY3VQCtjc25vnpO0BTrBiG4/l0WqpNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5bhsI4OR7fA7eZYf6ohkgqxA9rmPy/BzeLPpl8WnYfCEmQtrmfJDNrDyXdH2AWPzqju4rmyENC0uT/IzxyxIA0BJCFmgrYYCH6n0uWbaLEeNldJ4S+GZMx01ix/mLdUezJXWooAlBTWTQi8ypKhl3XB/F/6xnNMk+y2zC41R1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGIGWGP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731E8C4CEEB;
	Mon,  2 Jun 2025 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748878902;
	bh=SErxh7WSPVlVMY3VQCtjc25vnpO0BTrBiG4/l0WqpNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGIGWGP1rl6fcd+udRDMiHKphlrMMsEvxfYTCB1RGLwgOrbWkGCLD4PaM9JhNyMOm
	 MU5OOQ12RxPYTLgZyhksCrm3ctfp9lWjao/ue4Q9sHwU6jTElsQubbIPy1hmX+ue6+
	 3cxpcV64YaC1ssIbj45mU8NUgo/f7fqAzlJbqHlnJZV2uB/LIn6dqUqBviFA4VzR5X
	 RjL7F0ieVTKYcxb5RwPKVu9/jaZg2YscijxFrNtaYgBpRhfrnazjQS/XabtaOCu++s
	 60m2E5oLtB3bR5sm35tgAC+lGdWlmW1dMS3z+rdK5GcgvRJtRzIGbDEs5RPQAeIudW
	 l3dw+iz5UY0kw==
Date: Mon, 2 Jun 2025 10:41:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, kernel@oss.qualcomm.com, 
	Pratyush Brahma <quic_pbrahma@quicinc.com>, Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530092850.631831-3-quic_wasimn@quicinc.com>

On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> 
> SA8775P has a memory map which caters to the auto specific requirements.

I thought SA8775P was the IoT platform and SA8255P was the automotive
one. Has this changed?

> QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> inherit the memory map of SA8775P require a slightly different memory
> map as compared to SA8775P auto parts.
> This new memory map is applicable for all the IoT boards which inherit
> the initial SA8775P memory map. This is not applicable for non-IoT

Is there are platform out there that actually uses the "initial SA8775P
memory map"?

> boards.
> 
> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> introduced as part of firmware updates for IoT. The size and base address
> have been updated for video PIL carveout compared to SA8775P since it is
> being brought up for the first time on IoT boards. The base addresses
> of the rest of the PIL carveouts have been updated to accommodate the
> change in size of video since PIL regions are relocatable and their
> functionality is not impacted due to this change. The size of camera
> pil has also been increased without breaking any feature.
> 
> The size of trusted apps carveout has also been reduced since it is
> sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> carveout and its corresponding scm reference has been removed as these
> are not required for IoT parts.
> 
> Incorporate these changes in the updated memory map.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> new file mode 100644
> index 000000000000..ff2600eb5e3d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi

The naming convention is <soc>-<something>.dtsi and I don't see any
other uses of the "iq9" naming.

> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +

Why is there a blank space here?

Regards,
Bjorn

> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/delete-node/ &pil_camera_mem;
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &pil_gdsp0_mem;
> +/delete-node/ &pil_gdsp1_mem;
> +/delete-node/ &pil_cdsp0_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &pil_cdsp1_mem;
> +/delete-node/ &pil_cvp_mem;
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &audio_mdf_mem;
> +/delete-node/ &trusted_apps_mem;
> +/delete-node/ &hyptz_reserved_mem;
> +/delete-node/ &tz_ffi_mem;
> +
> +/ {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gunyah_md_mem: gunyah-md@91a80000 {
> +			reg = <0x0 0x91a80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		pil_camera_mem: pil-camera@95200000 {
> +			reg = <0x0 0x95200000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		pil_adsp_mem: pil-adsp@95900000 {
> +			reg = <0x0 0x95900000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
> +			reg = <0x0 0x97700000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
> +			reg = <0x0 0x97780000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		pil_gdsp0_mem: pil-gdsp0@97800000 {
> +			reg = <0x0 0x97800000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_gdsp1_mem: pil-gdsp1@99600000 {
> +			reg = <0x0 0x99600000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
> +			reg = <0x0 0x9b400000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
> +			reg = <0x0 0x9b480000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		pil_cdsp0_mem: pil-cdsp0@9b500000 {
> +			reg = <0x0 0x9b500000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_gpu_mem: pil-gpu@9d300000 {
> +			reg = <0x0 0x9d300000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
> +			reg = <0x0 0x9d380000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		pil_cdsp1_mem: pil-cdsp1@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_cvp_mem: pil-cvp@9f200000 {
> +			reg = <0x0 0x9f200000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		pil_video_mem: pil-video@9f900000 {
> +			reg = <0x0 0x9f900000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps@d1900000 {
> +			reg = <0x0 0xd1900000 0x0 0x1c00000>;
> +			no-map;
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			/delete-property/ memory-region;
> +		};
> +	};
> +};
> --
> 2.49.0
> 

