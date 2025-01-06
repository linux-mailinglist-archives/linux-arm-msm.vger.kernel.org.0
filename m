Return-Path: <linux-arm-msm+bounces-44049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C9A032CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8749164484
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 22:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663871E048D;
	Mon,  6 Jan 2025 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFBRlPop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3B01E008B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736203246; cv=none; b=LJZipKsQOl/18YZueJkEvNMLsQsU3LKnklF5IAovDhxi8I9c2/uOTMGVCYIOtU6joBNfAaiucBav3Pq3Ng3h0aml55g0D/QMxIjT32AkSBmJT6gi10UaZ+Tkqrf9zLPwxtUshMMl1ElXh4Pw1juc9qFdA0iNYBXF5QYhqNYbrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736203246; c=relaxed/simple;
	bh=KcYvJn/OB21p2wmGWULthdW94fsGx4VAFSl5ZTqHWxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTS4u1hwyQ178Abb6RtGFjw4UPTTkfF1ZrAOLuB7s2SGVdI2W7cAw8uvfp5ZHTp6iFPsJQtNnGRq7eapCu1MdJdU/zSPPu3id9ZCfySpddJoKxnRsriicEJO9Hpv2pQENAC6ceA0DUXcmddoPzbR2K2888yb2hpw6oCFJ1FqB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFBRlPop; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so14935206e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736203242; x=1736808042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Avh+nl6Z5hJDoj7n55BVUZpLUAsqWxFGb9cklZ7LaBQ=;
        b=EFBRlPopoZmaw97OLHpgbyffI1eQOsySn6jZi3YGk6r5ISnyU35zNnMIrWJYKcHDN+
         t8xuJ+1vwcqz3LIArjw2qfn/boUHQ0zRGLH5iJX/LBhgYLxvAoGpZuObmil9jC3JYDyy
         VHwY+4QSPsw/vhD/vftuUvkkYe6Q7R8eBAUZJxVqiygp+U8T0lgJNOD77nM1MZ79SUFZ
         95+fddjhRXhF4mUrCr8SnI+37u9FRY/UwPfssL1b5dC8PME8l3waBnT2OtsEleJH0+UY
         bXal9LSL8BdQsOqfX8LnA6Sz2d2G2BcdYh7wpdmGzdOds7AYwRwqnEeFMLOGQpbmziME
         lcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736203242; x=1736808042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Avh+nl6Z5hJDoj7n55BVUZpLUAsqWxFGb9cklZ7LaBQ=;
        b=cLPmWYgWNfc8IeOF+wtYKSq0OP64ninagVymxJ7F/dx9cose9AVu3+e3owUL+sE+Cn
         57POXhFr3LsXMsOrYLfEOA1tTDuV3aQYeDisF2ZIV48gxvjYD+I95av+pSoxq064U8Xt
         AApfGiJpeJTmbWpazOu3VzFbh2qePG1+n/o97Bf4pD+duLUIXoGxFhghTeFgkELEofjO
         E0gAg2z94zv/bAxzRUs/fj3yPXrzie+A7ach6034G5Da2C1xzwQeafH64a7nb4MpPjna
         qdcYMBxJu2GtuTENj0Leq9w3BvjGjGYUwNBnwYx3DkWzV0goEQ+XulbRU9YAEdVGxLVW
         Ck7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUy1oUu9QVmLKmD/iQ137A0nG+OwvvMC7zDJMWpgdN+zsqmelNCePWOBhCOcy2qoCvR4IF+frq009oKp0+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+NILkP636VwfseDqBcb0rCZohMqcTIHxS30n7SQSdtoviy0j
	rEGjIUtYT0k4x/NhD8mICBU/9E5vpj2Ia+Vz/S6dW+7JCulyyGS1qY2Ealz3mOA=
X-Gm-Gg: ASbGncuwKK//gsJfd1hYxdUDkYV9OVHk2PMk9rCydPxo8oUZK1kNcE8ciuMsnRWl5+J
	pAWa6MmfGZgcyAPcEgCBICmRCB8elpfg+kO6VPBHSi0oW8LFTG5xXfFnvwjFSS62fd6OAwTjdgx
	LDtyMeXUV2C3RAEoqYf3WQuw18ykcuyugcW04c3mf5zbLoOX1+lFYM+ntmkfBbDW40eT74VQeHG
	fIL3+Af7nzHQ+9WA6cRa/LLqwiHJhGqhUkmFCcSZfrVERt+H98PonCknU3D1LmouZkfCQrW0sqZ
	//U959N4LgIxJ55l8rOBNqKhFppun7Nut1+s
X-Google-Smtp-Source: AGHT+IH1smEZOfZ8qRrs+G5pEIpwin4KkZa54myAPNzFBvb3/d3bojYFWrsELPf1qasLIQPrd+0z+A==
X-Received: by 2002:a05:6512:1582:b0:542:63a8:3938 with SMTP id 2adb3069b0e04-54263a83a3amr4778193e87.20.1736203242345;
        Mon, 06 Jan 2025 14:40:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813665sm5087258e87.146.2025.01.06.14.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:40:41 -0800 (PST)
Date: Tue, 7 Jan 2025 00:40:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Update memory map
Message-ID: <vx5fhjt2vfa3uf2wwbk5y55qsbbcrjci4qcyvnwhjv6zw7fdbj@z6rfqqqkopfq>
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

Based on? Do you mean that it depends on the mentioned patch? Is it
merged already by maintainers or not?
> 
> New updates to the memory map of qcs8300 have brought in some
> new carveouts (viz. sail_ss, firmware memory, tz memory, etc.) and
> also the base addresses of some of the pil carveouts (q6_cdsp_dtb_mem 
> and cdsp_mem) have changed.

Is there any kind of reference to the firmware / bootloaders version
which changed the layout?

> 
> Incorporate these changes in the new memory map for qcs8300. Also
> modify the labels of some of the carveouts to indicate pil carveouts.
> 
> [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com/

If the patch is merged, please use the standard "commit aabbccdd ("Make
foo do bar")" notation. If it is not yet. please move this under three
dashes line, so that it doesn't get recorded in the git history.

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

-- 
With best wishes
Dmitry

