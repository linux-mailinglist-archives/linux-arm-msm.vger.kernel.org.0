Return-Path: <linux-arm-msm+bounces-7578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385783226D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 00:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859D71F22F58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 23:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADC51EB4C;
	Thu, 18 Jan 2024 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGLj6CxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B081EB48
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 23:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705622305; cv=none; b=AFu1mSeIVGu8Qz3QlOVPf2EBJBnknq8KdqgARapxgGIwhasDlIO/sXN7mYmW9SX2uOYVWardbLwzC3y54AimQxyvOJwlaLS+GORuqhHB6HJffy1p3wfpVkLdXUIFGdZ02GjOslnGjihWpLPJOSC65oapA6F7Pnj45ANEIXc/kyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705622305; c=relaxed/simple;
	bh=bLKLDQnExBhOenOctqL0oE9krEzzFsDQLFGZ6/TUNok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Lq90we4fTPSEcqcgVR9VLTVuU+2WQWXiVWON50BRw/74BkDdruzzzePbWf8OzzQCYw2/zSctNGFJo+aO0lAP4Ao90uOaZawf4AB0/M7N+nNSc7JJa5qVRuFP/HK+UhBk+r+wITXnANxMoIMC70sdJUV7FO83OG5TFhGY6prxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WGLj6CxQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705622303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OxpbFQ2tBZeZd/oTZKTl2VfQVYd+03NIcZ30w8exkEw=;
	b=WGLj6CxQUQiPBiY71qmr2MuqZkByCF8AQhR00fVRg5HOkXvQQqEGCPfmKuTre7xIAZCj0g
	9p5ZocXMoIOiKVv9vq9pjl/Ar9JSxp1yLWxKWEnm4dh9vlmoqsP1Swb1wJ07d7n0FaHedO
	0ISfjXzhHdshMq84NrprkZPUx5+fzAA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-X4bRfAY_MRSPU9K4rXZfUw-1; Thu, 18 Jan 2024 18:58:21 -0500
X-MC-Unique: X4bRfAY_MRSPU9K4rXZfUw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6800e52d47aso26035116d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 15:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705622301; x=1706227101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxpbFQ2tBZeZd/oTZKTl2VfQVYd+03NIcZ30w8exkEw=;
        b=vhDqif6zueXxgHf7gZxzqDeXkLeCg8ek6SiGQpO1FTUSONlHx6Jl7eo3gwJFC0eapp
         Ls3sSlPJNMWYsqfzF9/qJ4MTKEPK1G0bWGK4mX2wtOzJUKJe2YpeUxp5PYonWjWgQaLH
         +cfq+wwuSluzWD2Fs+FJ9nc8AhooKWaVfe7QkKQKtiayWWMl2EOLqc1DvuxtU1SDP87n
         jH6gWqHrtZUmJ96+ovszdIDmZNqXBMWKYbSM2kCmZ0q03p647mx8SH+ggLCu/Oav60Bn
         G56tl0tmh+MxHCAtNthJUF+ixuVSdrpky6MVJxbMqmhySBoYk6xqmd+T/Ct03V2Y9sTh
         xiWA==
X-Gm-Message-State: AOJu0YzoWed4YXaEIkKWvtxWpg7/lnfFrqHqPYuwxpTppp5RjVeUqbY+
	hfU/1wcmX+1XYi+MdTgDWfyQKGFWIETH/loWC1t1AYJqgXRULvljDL71r6TF5ujx2AE1bhjhAqB
	QqkN6MMBkeqcYcjGlwGC0cX1d5RlbALGjicGiViiBBke+9Fq0QttXSBmD7FE2XTU=
X-Received: by 2002:a05:622a:1048:b0:42a:200f:44b7 with SMTP id f8-20020a05622a104800b0042a200f44b7mr207434qte.47.1705622300885;
        Thu, 18 Jan 2024 15:58:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgWuMzO/3GPwfDI70FfwkPacE4/P/jzdheYvhAENZA6wXb6Zq+EMLALhYYTO6TSdsOAiDr4Q==
X-Received: by 2002:a05:622a:1048:b0:42a:200f:44b7 with SMTP id f8-20020a05622a104800b0042a200f44b7mr207421qte.47.1705622300605;
        Thu, 18 Jan 2024 15:58:20 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id fd10-20020a05622a4d0a00b00429d3257dd6sm6023485qtb.45.2024.01.18.15.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 15:58:20 -0800 (PST)
Date: Thu, 18 Jan 2024 18:58:19 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Ninad Naik <quic_ninanaik@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, 
	quic_ymg@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118155711.7601-1-quic_ninanaik@quicinc.com>

On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
> New memory map layout changes (by Qualcomm firmware) have brought
> in updates to base addresses and/or size for different memory regions
> like cpcucp_fw, tz-stat, and also introduces new memory regions for
> resource manager firmware. This change brings in these corresponding
> memory map updates to the SA8775P SoC device tree.
> 
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>

With next-20240118, without this patch, running "./memtester 32G"[1]
crashed the board quickly during the mlock:

[   42.144892] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
[   42.153316] Modules linked in: r8153_ecm cdc_ether usbnet marvell dwmac_qcom_ethqos stmmac_platform r8152 rfkill stmmac crct10dif_ce qcom_spmi_temp_alarm pcs_xpcs nvmem_qcom_spmi_sdam qcom_stats i2c_qcom_geni qcom_pon spi_geni_qcom qcom_wdt socinfo phy_qcom_sgmii_eth nvmem_reboot_mode phy_qcom_qmp_usb gpucc_sa8775p phy_qcom_snps_femto_v2 phy_qcom_qmp_pcie qcom_rng drm fuse backlight ipv6
[   42.188566] CPU: 3 PID: 472 Comm: memtester Not tainted 6.7.0-next-20240118-00001-g10a3c9d045cf #169
[   42.197944] Hardware name: Qualcomm SA8775P Ride (DT)
[   42.203138] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   42.210292] pc : clear_page+0x18/0x58
[   42.214063] lr : clear_huge_page+0x84/0x1a0
[   42.218370] sp : ffff800081ef3a30
[   42.221776] x29: ffff800081ef3a30 x28: 0000000000000000 x27: 0000000000210009
[   42.229108] x26: 0000000000000000 x25: fffffc6abc053380 x24: ffff000000000000
[   42.236439] x23: 0000000000000000 x22: 0000000000000000 x21: 0000006a89b87f80
[   42.243770] x20: 00000000000001fe x19: fffffc6a89b80000 x18: ffff800081ef3d18
[   42.251101] x17: 0000000000000068 x16: 0000000000000001 x15: 00000000000001c2
[   42.258431] x14: 0000000000000002 x13: fffffc6a89b90008 x12: 0000000000000001
[   42.265761] x11: 0000000000440dc0 x10: 0000000000000100 x9 : ffffc570ba60c604
[   42.273090] x8 : 0000000000000030 x7 : ffff554053756000 x6 : ffff800081ef39f0
[   42.280420] x5 : 0000000000000130 x4 : ffffc570bd029ae0 x3 : ffff554053756000
[   42.287752] x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff1aa26e1ff000
[   42.295083] Call trace:
[   42.297607]  clear_page+0x18/0x58
[   42.301015]  do_huge_pmd_anonymous_page+0x254/0x8f8
[   42.306036]  __handle_mm_fault+0x728/0x1548
[   42.310338]  handle_mm_fault+0x70/0x290
[   42.314281]  __get_user_pages+0x144/0x3c0
[   42.318404]  populate_vma_page_range+0x7c/0xc8
[   42.322972]  __mm_populate+0xc8/0x1d8
[   42.326736]  do_mlock+0x194/0x2d0
[   42.330144]  __arm64_sys_mlock+0x20/0x38
[   42.334178]  invoke_syscall+0x50/0x120
[   42.338034]  el0_svc_common.constprop.0+0xc8/0xf0
[   42.342874]  do_el0_svc+0x24/0x38
[   42.346284]  el0_svc+0x34/0xb8
[   42.349425]  el0t_64_sync_handler+0x120/0x130
[   42.353906]  el0t_64_sync+0x190/0x198
[   42.357674] Code: 37200121 12000c21 d2800082 9ac12041 (d50b7420) 
[   42.363932] ---[ end trace 0000000000000000 ]---

With next-20240118 and this patch, memtester continues through the
test-suite.

Tested-by: Eric Chanudet <echanude@redhat.com> # sa8775p-ride

[1] https://github.com/jnavila/memtester

> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
>  1 file changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index a7eaca33d326..20b16fb5f537 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
>  			no-map;
>  		};
>  
> +		ddr_training_checksum: ddr_training_checksum@908c0000 {
> +			reg = <0x0 0x908c0000 0x0 0x1000>;
> +			no-map;
> +		};
> +
>  		reserved_mem: reserved@908f0000 {
> -			reg = <0x0 0x908f0000 0x0 0xf000>;
> +			reg = <0x0 0x908f0000 0x0 0xe000>;
>  			no-map;
>  		};
>  
> -		secdata_apss_mem: secdata-apss@908ff000 {
> -			reg = <0x0 0x908ff000 0x0 0x1000>;
> +		secdata_apss_mem: secdata-apss@908fe000 {
> +			reg = <0x0 0x908fe000 0x0 0x2000>;
>  			no-map;
>  		};
>  
> @@ -373,8 +378,43 @@ smem_mem: smem@90900000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
>  
> -		cpucp_fw_mem: cpucp-fw@90b00000 {
> -			reg = <0x0 0x90b00000 0x0 0x100000>;
> +		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
> +			reg = <0x0 0x90c00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		sail_mailbox_mem: sail-ss@90d00000 {
> +			reg = <0x0 0x90d00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		sail_ota_mem: sail-ss@90e00000 {
> +			reg = <0x0 0x90e00000 0x0 0x300000>;
> +			no-map;
> +		};
> +
> +		aoss_backup_mem: aoss-backup@91b00000 {
> +			reg = <0x0 0x91b00000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		cpucp_backup_mem: cpucp-backup@91b40000 {
> +			reg = <0x0 0x91b40000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		tz_config_backup_mem: tz-config-backup@91b80000 {
> +			reg = <0x0 0x91b80000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ddr_training_data_mem: ddr-training-data@91b90000 {
> +			reg = <0x0 0x91b90000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
> +			reg = <0x0 0x91ba0000 0x0 0x1000>;
>  			no-map;
>  		};
>  
> @@ -433,14 +473,44 @@ pil_video_mem: pil-video@9fc00000 {
>  			no-map;
>  		};
>  
> +		audio_mdf_mem: audio_mdf_region@ae000000 {
> +			reg = <0x0 0xae000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		firmware_mem: firmware-region@b0000000 {
> +			reg = <0x0 0xb0000000 0x0 0x800000>;
> +			no-map;
> +		};
> +
>  		hyptz_reserved_mem: hyptz-reserved@beb00000 {
>  			reg = <0x0 0xbeb00000 0x0 0x11500000>;
>  			no-map;
>  		};
>  
> -		tz_stat_mem: tz-stat@d0000000 {
> -			reg = <0x0 0xd0000000 0x0 0x100000>;
> +		scmi_mem: scmi_region@d0000000 {
> +			no-map;
> +			reg = <0x0 0xd0000000 0x0 0x40000>;
> +		};
> +
> +		firmware_logs_mem: firmware-logs@d0040000 {
> +			no-map;
> +			reg = <0x0 0xd0040000 0x0 0x10000>;
> +		};
> +
> +		firmware_audio_mem: firmware-audio@d0050000 {
> +			no-map;
> +			reg = <0x0 0xd0050000 0x0 0x4000>;
> +		};
> +
> +		firmware_reserved_mem: firmware-reserved@d0054000 {
>  			no-map;
> +			reg = <0x0 0xd0054000 0x0 0x9c000>;
> +		};
> +
> +		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
> +			no-map;
> +			reg = <0x0 0xd00f0000 0x0 0x10000>;
>  		};
>  
>  		tags_mem: tags@d0100000 {
> @@ -453,8 +523,23 @@ qtee_mem: qtee@d1300000 {
>  			no-map;
>  		};
>  
> -		trusted_apps_mem: trusted-apps@d1800000 {
> -			reg = <0x0 0xd1800000 0x0 0x3900000>;
> +		deepsleep_backup_mem: deepsleep_backup@d1800000 {
> +			reg = <0x0 0xd1800000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps@d1900000 {
> +			reg = <0x0 0xd1900000 0x0 0x3800000>;
> +			no-map;
> +		};
> +
> +		tz_stat_mem: tz-stat@db100000 {
> +			reg = <0x0 0xdb100000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cpucp_fw_mem: cpucp-fw@db200000 {
> +			reg = <0x0 0xdb200000 0x0 0x100000>;
>  			no-map;
>  		};
>  	};
> -- 
> 2.42.0
> 
> 

-- 
Eric Chanudet


