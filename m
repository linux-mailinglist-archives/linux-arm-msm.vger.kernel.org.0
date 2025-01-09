Return-Path: <linux-arm-msm+bounces-44558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36DA075B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CFA53A1332
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3FE21765B;
	Thu,  9 Jan 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXGXIqSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D620551B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425661; cv=none; b=hej1Vjrt0Ru13Ubwi116FKcUlEyJbIQaEuTKOjjFfstnJ+e9vk8aWIp6ABlXsEwf1MARzp4vJx6c+QHDRq20tILbHvtQkz0PK7KhPDC5viGLtOU/UJ9MuUvuGOnaa1O/jmkOgMK5IRudZ3U4WffOcvBI+3yY+K28yA21MZq8BOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425661; c=relaxed/simple;
	bh=ilXg/LRsqzkUEXABpJXraHW4qSL6am7p2dO4eeV9qHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ppjm6wdRAQ4ENtoCUj7EbL6DkLfYHgxYjRsH1P9mVqN9eptfFcKtLFg2xISLkByIjKrqPrp/CZ9aRjw0YyGsHeb6SRfA4hBcR6/xthvSMkVAj2O5XMqVlwQ+HJ2gEbVwCMO7NH68H13rMaGum7p+ccIe5uZX0Jn6XIAmeOAIBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXGXIqSt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540218726d5so826692e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736425658; x=1737030458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NW4fi0sqeQx720jZiS/7zPuqhYpeVSuRx2XvwIuoUTU=;
        b=bXGXIqStpP22oFO7ahqsCU/dpwezqAnb9jup2ffkRy8AURnJmstCT+pklip/5kpdil
         caSl1fhqdHRZtRZUZdvBr+RvuhXMf8vN5EBF0Ehq6iXhwnywdJhVsv2X/hQG+EwZCQss
         D4H4sqTKHGjP4jk9nMH1/JwTePmtnV+V5O2iV1gRQU0/Ppk/P1URZV7470kkxtpsBiYb
         i8U9KFXxm7V5liFMeuwBZ2Xc6heiB85WAzagsmZ/GXWIOC+W1os5GbdlvzHKfVXo9s9Y
         zZzW3uMXD5AjbWqIsWEI0UmHVCs2Y+KOcLEHIF85FrznN0ddds3IZNGyMppZaVGrneuN
         k79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736425658; x=1737030458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW4fi0sqeQx720jZiS/7zPuqhYpeVSuRx2XvwIuoUTU=;
        b=lqXJZO6g2UAE++wldoSTxA9GfbCHAyKlPE0HmvU1SU3vkVRQefn8oewnr0zbjCwgyL
         tdukGpkw4/Ylf2ZnRwAFlKNc5yb65h/XxJMf74k24u6jSO5tGVMbMaGo3sfM7bij8c3m
         KL6LaQ3qrF3Nnq3U6a2f/tVo/k28xBwbfdgBOZCM6tA1sUVfS3ulj8LotaQEFTfe9sOk
         a7hq3kMnzqCGYqTRC45Psr4KxvMRDrZj0oYv0Levq0brVJMZaB5//wuYwsqM877fFUcI
         I7HVikNnWdd4bvdAioM1yIzOJFJPn9gAKMAd4ck8OjUbkjglVzuhZhz6ZBiGRJS8r7lK
         e2hg==
X-Forwarded-Encrypted: i=1; AJvYcCXG1jP4EdZiREmwUNO1lirCIytNaE082z7qzm0x0tOO7VgG0IAOXtQ0Kp4AQg0i7XG7kvcoFyo4wjua70Ll@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHOVR8imdfElFX7i9ZRJbIbGf7rREhPr+Kh4XIwh+5ppez1oT
	koqW8gnMAm93SAxux/x9g99pQGQ7qqRPqLxLKnd7wjr1idznnTa28Y4LOlWIZN8=
X-Gm-Gg: ASbGnctYenOYzEm1IzfwX18yD1eZVNqRmVCvizQ+veet45xBUdMgW0yXGDI95rTYgTY
	n9HjtsUNnBmq6LDprpO1af/vvHD6Vq4PD9/qibTaBbgpPluV83HNVwzOFKRbbrQyjz18R0IzDsk
	l8UhqTuKH5YU+LMOyTeqU/rZQpNftucy+/3I0DboEH9cwSkKkHNQfJt6bJ/JD5d6i0BAhqhDadP
	ChxiL4lotpVN3zPKrcu4mHpvAro6rVvG1dIxpDe4MsyZcIt+pdFu1GvE5FycojdvARkFPndZRFD
	TRc0xvYvscCYzuLZVd4PaMM+IhxAO8/MPF4k
X-Google-Smtp-Source: AGHT+IGVxnaWpnca7pnR1vOgIprZHdldk8KoRcJuuOvSARsqHc+j5TR93/bj6fOsAREWPZBIhWE88Q==
X-Received: by 2002:a05:6512:1190:b0:540:1e51:b919 with SMTP id 2adb3069b0e04-542845d5602mr2264317e87.31.1736425658010;
        Thu, 09 Jan 2025 04:27:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becb12esm180434e87.244.2025.01.09.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:27:36 -0800 (PST)
Date: Thu, 9 Jan 2025 14:27:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Update memory map
Message-ID: <7ikzwgi6h7xsuzb2opqwsqeehftg6bcdkzi3xtccifr465rfjh@2jdmiqatokna>
References: <20241217092636.17482-1-quic_pbrahma@quicinc.com>
 <hhwc5euwxjpg5r4nfoh77do2g5sm26r7vfs6ibboqw3x4qkwze@zld5mnznijvu>
 <829e68c7-1a9f-45e9-9a81-77bd9985d85f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <829e68c7-1a9f-45e9-9a81-77bd9985d85f@quicinc.com>

On Thu, Jan 09, 2025 at 03:59:32PM +0530, Pratyush Brahma wrote:
> 
> On 1/7/2025 5:45 AM, Bjorn Andersson wrote:
> > On Tue, Dec 17, 2024 at 02:56:36PM +0530, Pratyush Brahma wrote:
> > > This is based on Jingyi Wang's patches [1] to introduce the
> > > initial dtsi for QCS8300 SOC.
> > > 
> > > New updates to the memory map of qcs8300 have brought in some
> > > new carveouts (viz. sail_ss, firmware memory, tz memory, etc.) and
> > > also the base addresses of some of the pil carveouts (q6_cdsp_dtb_mem
> > > and cdsp_mem) have changed.
> > > 
> > > Incorporate these changes in the new memory map for qcs8300. Also
> > > modify the labels of some of the carveouts to indicate pil carveouts.
> > > 
> > > [1] https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com/
> > Does QCS8300 not boot using the efi-stub and get a memory map with most
> > of these regions removed already?
> > 
> > The excessive representation of reserved-memory regions should only be
> > required for targets using ABL. (And the regions that the OS is expected
> > to actually interact with, such as smem and PIL regions).
> Yes, it boots with the efi-stub but there are some carveouts like gunyah_md,
> hyp_mem, etc
> which it doesn't pass as holes. The OS has no use of it but there are S2
> protections
> on these regions by hypervisor. When buddy tries to allocate from these
> regions, it results into external aborts.

So, it sounds like your UEFI providing incorrect memory map to the
running OS. Please fix the bootloader instead.

> Manually finding out the regions which are not passed as holes but need to
> be no-map wastes
> significant development efforts. To err on the side of caution, I felt it
> would be better to mention
> all the regions that kernel isn't supposed to touch anyway.
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 180 ++++++++++++++++++++++++--
> > >   1 file changed, 170 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> > > index 2c35f96c3f28..e16d11c05515 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> > > @@ -377,6 +377,21 @@
> > >   		#size-cells = <2>;
> > >   		ranges;
> > > +		sail_ss_mem: sail-ss-region@80000000 {
> > > +			reg = <0x0 0x80000000 0x0 0x10000000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		hyp_mem: hyp-region@90000000 {
> > > +			reg = <0x0 0x90000000 0x0 0x600000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		xbl_boot_mem: xbl-boot-region@90600000 {
> > > +			reg = <0x0 0x90600000 0x0 0x200000>;
> > > +			no-map;
> > > +		};
> > > +
> > >   		aop_image_mem: aop-image-region@90800000 {
> > >   			reg = <0x0 0x90800000 0x0 0x60000>;
> > >   			no-map;
> > > @@ -388,6 +403,26 @@
> > >   			no-map;
> > >   		};
> > > +		uefi_logs_mem: uefi-logs-region@908b0000 {
> > > +			reg = <0x0 0x908b0000 0x0 0x10000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		ddr_training_checksum_data_mem: ddr-training-checksum-data-region@908c0000 {
> > > +			reg = <0x0 0x908c0000 0x0 0x1000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		reserved_mem: reserved-region@908f0000 {
> > > +			reg = <0x0 0x908f0000 0x0 0xe000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		secdata_apps_mem: secdata-apps-region@908fe000 {
> > > +			reg = <0x0 0x908fe000 0x0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > >   		smem_mem: smem@90900000 {
> > >   			compatible = "qcom,smem";
> > >   			reg = <0x0 0x90900000 0x0 0x200000>;
> > > @@ -395,6 +430,61 @@
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   		};
> > > +		tz_sail_mailbox_mem: tz-sail-mailbox-region@90c00000 {
> > > +			reg = <0x0 0x90c00000 0x0 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		sail_mailbox_mem: sail-mailbox-region@90d00000 {
> > > +			reg = <0x0 0x90d00000 0x0 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		sail_ota_mem: sail-ota-region@90e00000 {
> > > +			reg = <0x0 0x90e00000 0x0 0x300000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		xbl_dtlog_mem: xbl-dtlog-region@91a40000 {
> > > +			reg = <0x0 0x91a40000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		gunyah_md_mem: gunyah-md-region@91a80000 {
> > > +			reg = <0x0 0x91a80000 0x0 0x80000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		aoss_backup_mem: aoss-backup-region@91b00000 {
> > > +			reg = <0x0 0x91b00000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		cpucp_backup_mem: cpucp-backup-region@91b40000 {
> > > +			reg = <0x0 0x91b40000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		tz_config_backup_mem: tz-config-backup-region@91b80000 {
> > > +			reg = <0x0 0x91b80000 0x0 0x10000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		ddr_training_data_mem: ddr-training-data-region@91b90000 {
> > > +			reg = <0x0 0x91b90000 0x0 0x10000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		cdt_data_backup_mem: cdt-data-backup-region@91ba0000 {
> > > +			reg = <0x0 0x91ba0000 0x0 0x1000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		tzffi_mem: tzffi-region@91c00000 {
> > > +			reg = <0x0 0x91c00000 0x0 0x1400000>;
> > > +			no-map;
> > > +		};
> > > +
> > >   		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
> > >   			reg = <0x0 0x93b00000 0x0 0xf00000>;
> > >   			no-map;
> > > @@ -405,12 +495,12 @@
> > >   			no-map;
> > >   		};
> > > -		camera_mem: camera-region@95200000 {
> > > +		camera_mem: pil-camera-region@95200000 {
> > >   			reg = <0x0 0x95200000 0x0 0x500000>;
> > >   			no-map;
> > >   		};
> > > -		adsp_mem: adsp-region@95c00000 {
> > > +		adsp_mem: pil-adsp-region@95c00000 {
> > >   			no-map;
> > >   			reg = <0x0 0x95c00000 0x0 0x1e00000>;
> > >   		};
> > > @@ -425,35 +515,105 @@
> > >   			no-map;
> > >   		};
> > > -		gpdsp_mem: gpdsp-region@97b00000 {
> > > +		gpdsp_mem: pil-gpdsp-region@97b00000 {
> > >   			reg = <0x0 0x97b00000 0x0 0x1e00000>;
> > >   			no-map;
> > >   		};
> > > -		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
> > > -			reg = <0x0 0x99900000 0x0 0x80000>;
> > > +		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9b700000 {
> > > +			reg = <0x0 0x9b700000 0x0 0x80000>;
> > >   			no-map;
> > >   		};
> > > -		cdsp_mem: cdsp-region@99980000 {
> > > -			reg = <0x0 0x99980000 0x0 0x1e00000>;
> > > +		cdsp_mem: pil-cdsp-region@99900000 {
> > > +			reg = <0x0 0x99900000 0x0 0x1e00000>;
> > >   			no-map;
> > >   		};
> > > -		gpu_microcode_mem: gpu-microcode-region@9b780000 {
> > > +		gpu_microcode_mem: pil-gpu-region@9b780000 {
> > >   			reg = <0x0 0x9b780000 0x0 0x2000>;
> > >   			no-map;
> > >   		};
> > > -		cvp_mem: cvp-region@9b782000 {
> > > +		cvp_mem: pil-cvp-region@9b782000 {
> > >   			reg = <0x0 0x9b782000 0x0 0x700000>;
> > >   			no-map;
> > >   		};
> > > -		video_mem: video-region@9be82000 {
> > > +		video_mem: pil-video-region@9be82000 {
> > >   			reg = <0x0 0x9be82000 0x0 0x700000>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		audio_mdf_mem: audio-mdf-region@ae000000 {
> > > +			reg = <0x0 0xae000000 0x0 0x1000000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmware_mem: firmware-region@b0000000 {
> > > +			reg = <0x0 0xb0000000 0x0 0x800000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		hyptz_reserved_mem: hyptz-reserved@beb00000 {
> > > +			reg = <0x0 0xbeb00000 0x0 0x11500000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmware_scmi_mem: scmi-region@d0000000 {
> > > +			reg = <0x0 0xd0000000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmware_logs_mem: firmware-logs-region@d0040000 {
> > > +			reg = <0x0 0xd0040000 0x0 0x10000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmware_audio_mem: firmware-audio-region@d0050000 {
> > > +			reg = <0x0 0xd0050000 0x0 0x4000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmware_reserved_mem: firmware-reserved-region@d0054000 {
> > > +			reg = <0x0 0xd0054000 0x0 0x9c000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		firmwarequantum_test_mem: firmwarequantum-test-region@d00f0000 {
> > > +			reg = <0x0 0xd00f0000 0x0 0x10000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		tags_mem: tags-region@d0100000 {
> > > +			reg = <0x0 0xd0100000 0x0 0x800000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		qtee_mem: qtee-region@d1300000 {
> > > +			reg = <0x0 0xd1300000 0x0 0x500000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		deep_sleep_back_up_mem: deep-sleep-back-up-region@d1800000 {
> > > +			reg = <0x0 0xd1800000 0x0 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		trusted_apps_mem: trusted-apps-region@d1900000 {
> > > +			reg = <0x0 0xd1900000 0x0 0x1900000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		tz_stat_mem: tz-stat-region@db100000 {
> > > +			reg = <0x0 0xdb100000 0x0 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		cpucp_fw_mem: cpucp-fw-region@db200000 {
> > > +			reg = <0x0 0xdb200000 0x0 0x100000>;
> > > +			no-map;
> > > +		};
> > >   	};
> > >   	smp2p-adsp {
> > > -- 
> > > 2.17.1
> > > 
> -- 
> Thanks and Regards
> Pratyush Brahma
> 

-- 
With best wishes
Dmitry

