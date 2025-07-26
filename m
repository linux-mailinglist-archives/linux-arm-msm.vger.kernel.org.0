Return-Path: <linux-arm-msm+bounces-66762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD80B12BA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 19:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F5117811A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 17:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA9D28851F;
	Sat, 26 Jul 2025 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjPVRqOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9868635D;
	Sat, 26 Jul 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753550670; cv=none; b=RYin8wZQYqyy5qeCF0SPNe2IkFCkfIFrTdkrOLUS1Do14EkHMtrrKCfqKh2wuQI/bG66sxqg5PcfdRQlVuJ4k9NbYS543iRTL6y8SYbvNaKalmMgzB/Jql6wpUBG4hunC3WipgCSZFewRq785eq8MAvdB7SiImoh2JcvHsiUeyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753550670; c=relaxed/simple;
	bh=l2JvLixddTfDkVuDCKxZb4W5IAdUvFAEWmm0wYZUiLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmTCtDxJcj2MqHQFsW5xNwtj41XQvWsCRPtuDquDt31euBRQ4+QS0/z4L94DeFAxYGz6bXrqNuOcKwn5kOx+UlyQonZmqSSY3HfLk9QrTgCWbmTaqEoTlpXSIBmXDTUhdEZZhIgSGlFqpk2y7rdXn9z5b07uom+9oO/gW+0VlW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjPVRqOy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46002C4CEED;
	Sat, 26 Jul 2025 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753550669;
	bh=l2JvLixddTfDkVuDCKxZb4W5IAdUvFAEWmm0wYZUiLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjPVRqOyoXqe30taRl3ukVbz7oszfrPz5BkQe9AygJmFr9DP4uzRKCVlPMSgIjPGx
	 C0jHBccEu/z2xirOlXXHoph2kU4Ld8FLLTsMJsB0saBOnzSqD1mRn+mPGSnEcg/EYH
	 TUR9oz8fBN9MkHSZmbx2jIJs54AY+AUUI6Lp+WtzQ/uAP3aWWpgPbzErrGBimOuqil
	 ZT8xqTshqf2S58gkmzKfN1LlWcZj6vtbPh0ygdXKs88ulacz5ewmU8kiWrbams5Ktu
	 mXxfqn2TpWu2UEsl4rSX0IHUTrLxXEKSbpJI2eLvfsVGL8biaes48iPLsIRcjNpeND
	 Zut4aTN6RabVA==
Date: Sat, 26 Jul 2025 12:24:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com, 
	Pratyush Brahma <quic_pbrahma@quicinc.com>, Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: Update memory-map for IoT
 platforms in lemans
Message-ID: <ol46hlmjf34m3g2xtk6zkkycsphvvtnczakr4mbvqskupxouzl@5rezniryxcbk>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-3-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722144926.995064-3-wasim.nazir@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 08:19:21PM +0530, Wasim Nazir wrote:

Please prefix the $subject with "arm64: dts: qcom: lemans: ".

> Stop using the outdated automotive memory map for Lemans; update it to
> meet IoT requirements.
> 

Please start your commit message with the problem description, not a
summary of the solution.

> Since, most platforms are IoT-based, treat IoT as the default variant

The word "platform" is mostly equivalent to "soc" outside Qualcomm, so
this statement is weird.

Regards,
Bjorn

> under "lemans" and apply it to all platforms, except those requiring the
> old memory-map (e.g., sa8775p, ride, and ride-r3).
> Introduce "lemans-auto" as a derivative of "lemans" that retains the old
> automotive memory map to support legacy use cases.
> 
> As part of the IoT memory map updates:
>   - Introduce new carveouts for gunyah_md and pil_dtb. Adjust the size and
>     base address of the PIL carveout to accommodate these changes.
>   - Increase the size of the video/camera PIL carveout without affecting
>     existing functionality.
>   - Reduce the size of the trusted apps carveout to meet IoT-specific
>     requirements.
>   - Remove audio_mdf_mem, tz_ffi_mem, and their corresponding SCM references,
>     as they are not required for IoT platforms.
> 
> Co-developed-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> Co-developed-by: Prakash Gupta <quic_guptap@quicinc.com>
> Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-auto.dtsi  | 104 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi       |  75 +++++++++------
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |   2 +-
>  3 files changed, 149 insertions(+), 32 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
> new file mode 100644
> index 000000000000..8db958d60fd1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include "lemans.dtsi"
> +
> +/delete-node/ &pil_camera_mem;
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &q6_adsp_dtb_mem;
> +/delete-node/ &q6_gdsp0_dtb_mem;
> +/delete-node/ &pil_gdsp0_mem;
> +/delete-node/ &pil_gdsp1_mem;
> +/delete-node/ &q6_gdsp1_dtb_mem;
> +/delete-node/ &q6_cdsp0_dtb_mem;
> +/delete-node/ &pil_cdsp0_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &pil_cdsp1_mem;
> +/delete-node/ &q6_cdsp1_dtb_mem;
> +/delete-node/ &pil_cvp_mem;
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &gunyah_md_mem;
> +
> +/ {
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tz_ffi_mem: tz-ffi@91c00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x91c00000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		pil_camera_mem: pil-camera@95200000 {
> +			reg = <0x0 0x95200000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		pil_adsp_mem: pil-adsp@95c00000 {
> +			reg = <0x0 0x95c00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_gdsp0_mem: pil-gdsp0@97b00000 {
> +			reg = <0x0 0x97b00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_gdsp1_mem: pil-gdsp1@99900000 {
> +			reg = <0x0 0x99900000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_cdsp0_mem: pil-cdsp0@9b800000 {
> +			reg = <0x0 0x9b800000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_gpu_mem: pil-gpu@9d600000 {
> +			reg = <0x0 0x9d600000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		pil_cdsp1_mem: pil-cdsp1@9d700000 {
> +			reg = <0x0 0x9d700000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_cvp_mem: pil-cvp@9f500000 {
> +			reg = <0x0 0x9f500000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		pil_video_mem: pil-video@9fc00000 {
> +			reg = <0x0 0x9fc00000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		audio_mdf_mem: audio-mdf-region@ae000000 {
> +			reg = <0x0 0xae000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		hyptz_reserved_mem: hyptz-reserved@beb00000 {
> +			reg = <0x0 0xbeb00000 0x0 0x11500000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps@d1900000 {
> +			reg = <0x0 0xd1900000 0x0 0x3800000>;
> +			no-map;
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			memory-region = <&tz_ffi_mem>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 9997a29901f5..bf273660e0cb 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -514,7 +514,6 @@ firmware {
>  		scm {
>  			compatible = "qcom,scm-sa8775p", "qcom,scm";
>  			qcom,dload-mode = <&tcsr 0x13000>;
> -			memory-region = <&tz_ffi_mem>;
>  		};
>  	};
> 
> @@ -773,6 +772,11 @@ sail_ota_mem: sail-ss@90e00000 {
>  			no-map;
>  		};
> 
> +		gunyah_md_mem: gunyah-md@91a80000 {
> +			reg = <0x0 0x91a80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
>  		aoss_backup_mem: aoss-backup@91b00000 {
>  			reg = <0x0 0x91b00000 0x0 0x40000>;
>  			no-map;
> @@ -798,12 +802,6 @@ cdt_data_backup_mem: cdt-data-backup@91ba0000 {
>  			no-map;
>  		};
> 
> -		tz_ffi_mem: tz-ffi@91c00000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x0 0x91c00000 0x0 0x1400000>;
> -			no-map;
> -		};
> -
>  		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
>  			reg = <0x0 0x93b00000 0x0 0xf00000>;
>  			no-map;
> @@ -815,62 +813,77 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
>  		};
> 
>  		pil_camera_mem: pil-camera@95200000 {
> -			reg = <0x0 0x95200000 0x0 0x500000>;
> +			reg = <0x0 0x95200000 0x0 0x700000>;
>  			no-map;
>  		};
> 
> -		pil_adsp_mem: pil-adsp@95c00000 {
> -			reg = <0x0 0x95c00000 0x0 0x1e00000>;
> +		pil_adsp_mem: pil-adsp@95900000 {
> +			reg = <0x0 0x95900000 0x0 0x1e00000>;
>  			no-map;
>  		};
> 
> -		pil_gdsp0_mem: pil-gdsp0@97b00000 {
> -			reg = <0x0 0x97b00000 0x0 0x1e00000>;
> +		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
> +			reg = <0x0 0x97700000 0x0 0x80000>;
>  			no-map;
>  		};
> 
> -		pil_gdsp1_mem: pil-gdsp1@99900000 {
> -			reg = <0x0 0x99900000 0x0 0x1e00000>;
> +		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
> +			reg = <0x0 0x97780000 0x0 0x80000>;
>  			no-map;
>  		};
> 
> -		pil_cdsp0_mem: pil-cdsp0@9b800000 {
> -			reg = <0x0 0x9b800000 0x0 0x1e00000>;
> +		pil_gdsp0_mem: pil-gdsp0@97800000 {
> +			reg = <0x0 0x97800000 0x0 0x1e00000>;
>  			no-map;
>  		};
> 
> -		pil_gpu_mem: pil-gpu@9d600000 {
> -			reg = <0x0 0x9d600000 0x0 0x2000>;
> +		pil_gdsp1_mem: pil-gdsp1@99600000 {
> +			reg = <0x0 0x99600000 0x0 0x1e00000>;
>  			no-map;
>  		};
> 
> -		pil_cdsp1_mem: pil-cdsp1@9d700000 {
> -			reg = <0x0 0x9d700000 0x0 0x1e00000>;
> +		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
> +			reg = <0x0 0x9b400000 0x0 0x80000>;
>  			no-map;
>  		};
> 
> -		pil_cvp_mem: pil-cvp@9f500000 {
> -			reg = <0x0 0x9f500000 0x0 0x700000>;
> +		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
> +			reg = <0x0 0x9b480000 0x0 0x80000>;
>  			no-map;
>  		};
> 
> -		pil_video_mem: pil-video@9fc00000 {
> -			reg = <0x0 0x9fc00000 0x0 0x700000>;
> +		pil_cdsp0_mem: pil-cdsp0@9b500000 {
> +			reg = <0x0 0x9b500000 0x0 0x1e00000>;
>  			no-map;
>  		};
> 
> -		audio_mdf_mem: audio-mdf-region@ae000000 {
> -			reg = <0x0 0xae000000 0x0 0x1000000>;
> +		pil_gpu_mem: pil-gpu@9d300000 {
> +			reg = <0x0 0x9d300000 0x0 0x2000>;
>  			no-map;
>  		};
> 
> -		firmware_mem: firmware-region@b0000000 {
> -			reg = <0x0 0xb0000000 0x0 0x800000>;
> +		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
> +			reg = <0x0 0x9d380000 0x0 0x80000>;
>  			no-map;
>  		};
> 
> -		hyptz_reserved_mem: hyptz-reserved@beb00000 {
> -			reg = <0x0 0xbeb00000 0x0 0x11500000>;
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
> +		firmware_mem: firmware-region@b0000000 {
> +			reg = <0x0 0xb0000000 0x0 0x800000>;
>  			no-map;
>  		};
> 
> @@ -915,7 +928,7 @@ deepsleep_backup_mem: deepsleep-backup@d1800000 {
>  		};
> 
>  		trusted_apps_mem: trusted-apps@d1900000 {
> -			reg = <0x0 0xd1900000 0x0 0x3800000>;
> +			reg = <0x0 0xd1900000 0x0 0x1c00000>;
>  			no-map;
>  		};
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index bcd284c0f939..a9ec6ded412e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> 
> -#include "lemans.dtsi"
> +#include "lemans-auto.dtsi"
>  #include "sa8775p-pmics.dtsi"
> 
>  / {
> --
> 2.49.0
> 

