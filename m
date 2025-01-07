Return-Path: <linux-arm-msm+bounces-44061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517DA033D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 01:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 798241884BCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F017B18C0C;
	Tue,  7 Jan 2025 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCYCCVm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB55360;
	Tue,  7 Jan 2025 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208913; cv=none; b=Sf7wl3EcIvoOnrKAa4tM4VNPt1h/+ir3UNgMCmjKVOGqQ9V+4XNwksWenrMvykWFBqN3ZlSeoxeJGs/5Bo9fWffiZLNI1DPWCR04hV56Fk66zC3ZnYSL/VC8lNuonhynIg25yAYzLLeK4FND2qS/mloSAS7lt9Q2BVEXh1T9uoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208913; c=relaxed/simple;
	bh=75HxLXxulzWYGod70hg44JNSAjnoy/nx4xa2ykfMsNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jj2MYN6DpsJ7Bcq83kAu2FHajIkfeKCsyDgTs8LEqjYmGCih5aWDPi3pjF3WYHFVYEPd83MmWo29XQXb7jx8cL3v3+q9NVxLzf0NvfaybZbfnqznjRb+P8nX2zx9yM4V7TsRJmoD06f2YcGBbP44IBXvUURpx23Z7WU2/iod9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCYCCVm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CF2C4CED2;
	Tue,  7 Jan 2025 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736208913;
	bh=75HxLXxulzWYGod70hg44JNSAjnoy/nx4xa2ykfMsNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCYCCVm3VM61tkgAUjtSUeGqPWqFtTDV7MGs1hqFaQB8OlpY4QDw7OIeIq7Oj6dsN
	 DAVAjG0BSuNuo6NGBsNxhgxA97wdVpaKharPzKCL/ioR7y0qmeNGjz1pHpvD/NXzoP
	 C6TiRvormG7evZeE9BcYIkGDD6rvIG5RPut7WwpU5ummII4PLxJ129Ag8IVwkpoJMo
	 h2M8RhlbISR3gIH2lA8Czd3rX+OA1cIRfD8vo4FW20Utk++8lwgepKufU1IwiHjltP
	 mxkv6Bjwth2GU7qnFuxLU+x1mOvUsod2H7+5LOos87WAq2PJo9lKMJL/y4UqPPGyr/
	 UsLUCFfqln7+g==
Date: Mon, 6 Jan 2025 18:15:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Update memory map
Message-ID: <hhwc5euwxjpg5r4nfoh77do2g5sm26r7vfs6ibboqw3x4qkwze@zld5mnznijvu>
References: <20241217092636.17482-1-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217092636.17482-1-quic_pbrahma@quicinc.com>

On Tue, Dec 17, 2024 at 02:56:36PM +0530, Pratyush Brahma wrote:
> This is based on Jingyi Wang's patches [1] to introduce the
> initial dtsi for QCS8300 SOC.
> 
> New updates to the memory map of qcs8300 have brought in some
> new carveouts (viz. sail_ss, firmware memory, tz memory, etc.) and
> also the base addresses of some of the pil carveouts (q6_cdsp_dtb_mem 
> and cdsp_mem) have changed.
> 
> Incorporate these changes in the new memory map for qcs8300. Also
> modify the labels of some of the carveouts to indicate pil carveouts.
> 
> [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com/

Does QCS8300 not boot using the efi-stub and get a memory map with most
of these regions removed already?

The excessive representation of reserved-memory regions should only be
required for targets using ABL. (And the regions that the OS is expected
to actually interact with, such as smem and PIL regions).

Regards,
Bjorn

> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 180 ++++++++++++++++++++++++--
>  1 file changed, 170 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 2c35f96c3f28..e16d11c05515 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -377,6 +377,21 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		sail_ss_mem: sail-ss-region@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x10000000>;
> +			no-map;
> +		};
> +
> +		hyp_mem: hyp-region@90000000 {
> +			reg = <0x0 0x90000000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_boot_mem: xbl-boot-region@90600000 {
> +			reg = <0x0 0x90600000 0x0 0x200000>;
> +			no-map;
> +		};
> +
>  		aop_image_mem: aop-image-region@90800000 {
>  			reg = <0x0 0x90800000 0x0 0x60000>;
>  			no-map;
> @@ -388,6 +403,26 @@
>  			no-map;
>  		};
>  
> +		uefi_logs_mem: uefi-logs-region@908b0000 {
> +			reg = <0x0 0x908b0000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ddr_training_checksum_data_mem: ddr-training-checksum-data-region@908c0000 {
> +			reg = <0x0 0x908c0000 0x0 0x1000>;
> +			no-map;
> +		};
> +
> +		reserved_mem: reserved-region@908f0000 {
> +			reg = <0x0 0x908f0000 0x0 0xe000>;
> +			no-map;
> +		};
> +
> +		secdata_apps_mem: secdata-apps-region@908fe000 {
> +			reg = <0x0 0x908fe000 0x0 0x2000>;
> +			no-map;
> +		};
> +
>  		smem_mem: smem@90900000 {
>  			compatible = "qcom,smem";
>  			reg = <0x0 0x90900000 0x0 0x200000>;
> @@ -395,6 +430,61 @@
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
>  
> +		tz_sail_mailbox_mem: tz-sail-mailbox-region@90c00000 {
> +			reg = <0x0 0x90c00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		sail_mailbox_mem: sail-mailbox-region@90d00000 {
> +			reg = <0x0 0x90d00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		sail_ota_mem: sail-ota-region@90e00000 {
> +			reg = <0x0 0x90e00000 0x0 0x300000>;
> +			no-map;
> +		};
> +
> +		xbl_dtlog_mem: xbl-dtlog-region@91a40000 {
> +			reg = <0x0 0x91a40000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		gunyah_md_mem: gunyah-md-region@91a80000 {
> +			reg = <0x0 0x91a80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		aoss_backup_mem: aoss-backup-region@91b00000 {
> +			reg = <0x0 0x91b00000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		cpucp_backup_mem: cpucp-backup-region@91b40000 {
> +			reg = <0x0 0x91b40000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		tz_config_backup_mem: tz-config-backup-region@91b80000 {
> +			reg = <0x0 0x91b80000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ddr_training_data_mem: ddr-training-data-region@91b90000 {
> +			reg = <0x0 0x91b90000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		cdt_data_backup_mem: cdt-data-backup-region@91ba0000 {
> +			reg = <0x0 0x91ba0000 0x0 0x1000>;
> +			no-map;
> +		};
> +
> +		tzffi_mem: tzffi-region@91c00000 {
> +			reg = <0x0 0x91c00000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
>  		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
>  			reg = <0x0 0x93b00000 0x0 0xf00000>;
>  			no-map;
> @@ -405,12 +495,12 @@
>  			no-map;
>  		};
>  
> -		camera_mem: camera-region@95200000 {
> +		camera_mem: pil-camera-region@95200000 {
>  			reg = <0x0 0x95200000 0x0 0x500000>;
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@95c00000 {
> +		adsp_mem: pil-adsp-region@95c00000 {
>  			no-map;
>  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
>  		};
> @@ -425,35 +515,105 @@
>  			no-map;
>  		};
>  
> -		gpdsp_mem: gpdsp-region@97b00000 {
> +		gpdsp_mem: pil-gpdsp-region@97b00000 {
>  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
>  			no-map;
>  		};
>  
> -		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
> -			reg = <0x0 0x99900000 0x0 0x80000>;
> +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9b700000 {
> +			reg = <0x0 0x9b700000 0x0 0x80000>;
>  			no-map;
>  		};
>  
> -		cdsp_mem: cdsp-region@99980000 {
> -			reg = <0x0 0x99980000 0x0 0x1e00000>;
> +		cdsp_mem: pil-cdsp-region@99900000 {
> +			reg = <0x0 0x99900000 0x0 0x1e00000>;
>  			no-map;
>  		};
>  
> -		gpu_microcode_mem: gpu-microcode-region@9b780000 {
> +		gpu_microcode_mem: pil-gpu-region@9b780000 {
>  			reg = <0x0 0x9b780000 0x0 0x2000>;
>  			no-map;
>  		};
>  
> -		cvp_mem: cvp-region@9b782000 {
> +		cvp_mem: pil-cvp-region@9b782000 {
>  			reg = <0x0 0x9b782000 0x0 0x700000>;
>  			no-map;
>  		};
>  
> -		video_mem: video-region@9be82000 {
> +		video_mem: pil-video-region@9be82000 {
>  			reg = <0x0 0x9be82000 0x0 0x700000>;
>  			no-map;
>  		};
> +
> +		audio_mdf_mem: audio-mdf-region@ae000000 {
> +			reg = <0x0 0xae000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		firmware_mem: firmware-region@b0000000 {
> +			reg = <0x0 0xb0000000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		hyptz_reserved_mem: hyptz-reserved@beb00000 {
> +			reg = <0x0 0xbeb00000 0x0 0x11500000>;
> +			no-map;
> +		};
> +
> +		firmware_scmi_mem: scmi-region@d0000000 {
> +			reg = <0x0 0xd0000000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		firmware_logs_mem: firmware-logs-region@d0040000 {
> +			reg = <0x0 0xd0040000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		firmware_audio_mem: firmware-audio-region@d0050000 {
> +			reg = <0x0 0xd0050000 0x0 0x4000>;
> +			no-map;
> +		};
> +
> +		firmware_reserved_mem: firmware-reserved-region@d0054000 {
> +			reg = <0x0 0xd0054000 0x0 0x9c000>;
> +			no-map;
> +		};
> +
> +		firmwarequantum_test_mem: firmwarequantum-test-region@d00f0000 {
> +			reg = <0x0 0xd00f0000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		tags_mem: tags-region@d0100000 {
> +			reg = <0x0 0xd0100000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		qtee_mem: qtee-region@d1300000 {
> +			reg = <0x0 0xd1300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		deep_sleep_back_up_mem: deep-sleep-back-up-region@d1800000 {
> +			reg = <0x0 0xd1800000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps-region@d1900000 {
> +			reg = <0x0 0xd1900000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		tz_stat_mem: tz-stat-region@db100000 {
> +			reg = <0x0 0xdb100000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cpucp_fw_mem: cpucp-fw-region@db200000 {
> +			reg = <0x0 0xdb200000 0x0 0x100000>;
> +			no-map;
> +		};
>  	};
>  
>  	smp2p-adsp {
> -- 
> 2.17.1
> 

