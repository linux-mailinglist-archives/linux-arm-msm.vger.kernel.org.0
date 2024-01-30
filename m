Return-Path: <linux-arm-msm+bounces-9049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D29842734
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 15:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045091F29EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7718002C;
	Tue, 30 Jan 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bru1iKqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477A811E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626372; cv=none; b=FzDiQ2heTzrCyLVXzZ3QPGhNL9Ze87vssarkoaxpYP/j19xDdP51eIaQJOMSjRfsscGAIHe8nz2H+eM5BsutybJkOFNCEli/+Eu0GzoN7oHJvdUy7R/RI3sGwgIDvqHM64NeG2UEP3nTG+JMeUCNNQmvUCSThIQ3jiLRjxeytgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626372; c=relaxed/simple;
	bh=vSTH+qJFTV87gQKqkaHX5SCjGsU6KRFuGCr3IlFlsyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEZ3YLAKgqeb29tyOfKxRPEHxiebaZsvcnXv65/7tJjpcdTzuE0w18wcKjPiECpvT15DZm7uX79jZOf07X6X8XfbK40jTqsSP2CjMo1XloqJNnrkc0ah/5SSvLu0sUfhS3v1Vlgt3gYUNmeQYjAdhTZVibXvNFMq8ZZWTVugx8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bru1iKqG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706626368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8zXIEHqxnF5x8fqME0EnzRwI4pZGwBIorp0Z18etWBg=;
	b=Bru1iKqGIXSaHwgiOYKtDVlo+5Z9oTnN3z9vrkxlhyr+VfO9wCYBSjZ0qrM6hNH+ykKVuW
	PEIbithmkb99oo6Cfja+PyIDFwP8Uxj0hsB5pCiu3xJlSDpSC1w/L5S2rK2Q6V8IZs6LWc
	PHQKlBjpEAx2jmaUfZ0V/Zgi6Vya3Wk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-oigZ-3CyO1C0ixF_uD3IKQ-1; Tue, 30 Jan 2024 09:52:47 -0500
X-MC-Unique: oigZ-3CyO1C0ixF_uD3IKQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42aa67d8f27so27652161cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626366; x=1707231166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zXIEHqxnF5x8fqME0EnzRwI4pZGwBIorp0Z18etWBg=;
        b=ni3yDOPWRpQgyezezL6p00VWu4beuIPOdUWppnuCCXxxe2yQOSvMVO6WhBv/5Q4Bu1
         zV/FarMN5vxuSPlRsr6DJFcuvZb7/z73iftZKrShUSGYmxb8q/AyjTPagb5q21xqfo8j
         9HSe5izQWUs9az2HdGJNJ06ir6SeepBbIoiNU0yfPos0Cn4lZQ/nuX3vaO9qiIUYgaxg
         YOAa0lJoxgNJDpYOUnut7ZSLW+NcOVylXRzioXVBByv0eBRXq2RpmfM62wE2bbrZsVVz
         nfEk+3QSlzLIxz607+9McJ2nhkryRpodEvXWS7Sn9tEUmk32EBcD3z1m5iMy/+E6QQxT
         MHVA==
X-Gm-Message-State: AOJu0YyjzYiFBN4GoVSv5X7f2sU+oEvGrWLdqx07TqyXF78DDF/9I5N3
	9qNXpe/ED7htDvOCSY8Q/SgScLB6MLV7JYVugKKtLge1ZS4IFpWcMGd+85LmGA2RUocmjO7DdgH
	ZL79rv/AnwRVY9iCJg5x9KcuehWBvpnTw0ptW0QPvfdcykIRPtBAOhzSD5pecdbQ=
X-Received: by 2002:a05:622a:58d:b0:42a:2c06:8d80 with SMTP id c13-20020a05622a058d00b0042a2c068d80mr8749399qtb.132.1706626366479;
        Tue, 30 Jan 2024 06:52:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjaFGcc9l+3mqQTXVG4vcaZkKQ72af4sAX8tJbGEAhm+gTtc8Kb28IE9sd3pI/NnMzvO8UDg==
X-Received: by 2002:a05:622a:58d:b0:42a:2c06:8d80 with SMTP id c13-20020a05622a058d00b0042a2c068d80mr8749382qtb.132.1706626366172;
        Tue, 30 Jan 2024 06:52:46 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id kf13-20020a05622a2a8d00b0042a9a2e43ffsm2913586qtb.92.2024.01.30.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 06:52:45 -0800 (PST)
Date: Tue, 30 Jan 2024 09:52:44 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Ninad Naik <quic_ninanaik@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, 
	kernel@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Add new memory map updates
 to SA8775P
Message-ID: <p462blapygqos3upzf74las4bze7b54guln4d3cvblw6dtsxga@676j2l7fchy4>
References: <20240125055134.7015-1-quic_ninanaik@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125055134.7015-1-quic_ninanaik@quicinc.com>

On Thu, Jan 25, 2024 at 11:21:34AM +0530, Ninad Naik wrote:
> New memory map layout changes (by Qualcomm firmware) have brought
> in updates to base addresses and/or size for different memory regions
> like cpcucp_fw, tz-stat, and also introduces new memory regions for
> resource manager firmware. The updated memory map also fixes existing
> issues pertaining to boot up failure while running memtest, thus
> improving stability.
> 
> This change brings in these corresponding memory map updates to the
> device tree for SA8775P SoC platform, which currently is in its
> development stage.
> 
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> ---
> Changes since v1:
> - Updated commit message.
> - Fixed reserved memory node naming, by replacing underscore with
>   hyphen.
> - https://lore.kernel.org/all/20240118155711.7601-1-quic_ninanaik@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
>  1 file changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index a7eaca33d326..2e9606c80381 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
>  			no-map;
>  		};
>  
> +		ddr_training_checksum: ddr-training-checksum@908c0000 {
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

On the latest firmware I have access to (mid-January), I still trigger a
fault on that block with these changes applied:
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000a8c000 (options '115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] early_memtest: # of tests: 1
[    0.000000]   0x0000000090880000 - 0x00000000908b0000 pattern 0000000000000000
[    0.000000]   0x00000000908c1000 - 0x00000000908f0000 pattern 0000000000000000
[    0.000000]   0x0000000090b00000 - 0x0000000090c00000 pattern 0000000000000000
[    0.000000] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-rc1-next-20240129-00001-g487b7c881fa6 #179
[    0.000000] Hardware name: Qualcomm SA8775P Ride (DT)
[    0.000000] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : early_memtest+0x1e0/0x2a8
[    0.000000] lr : early_memtest+0x1a8/0x2a8
[    0.000000] sp : ffffc3168c233c60
[    0.000000] x29: ffffc3168c233c60 x28: 0000000000000000 x27: ffff244650b00000
[    0.000000] x26: 0000000090b00000 x25: 0000000000000000 x24: ffff244650c00000
[    0.000000] x23: ffffc3168c872980 x22: ffffc3168c30c000 x21: ffffc3168c30c000
[    0.000000] x20: 0000000080000000 x19: 0000000f54100000 x18: 0000000000000006
[    0.000000] x17: 3030303030303030 x16: 303030303030206e x15: 7265747461702030
[    0.000000] x14: 3030303063303930 x13: 3030303030303030 x12: 3030303030303030
[    0.000000] x11: 206e726574746170 x10: ffffc3168c2bc578 x9 : ffffc3168c264578
[    0.000000] x8 : 00000000ffffefff x7 : ffffc3168c2bc578 x6 : 80000000fffff000
[    0.000000] x5 : 0000000000100000 x4 : 0000000090b00007 x3 : 0000244650b00000
[    0.000000] x2 : 0000000000000000 x1 : ffffc3168c244ec0 x0 : ffff244650b00000
[    0.000000] Call trace:
[    0.000000]  early_memtest+0x1e0/0x2a8
[    0.000000]  bootmem_init+0x54/0x228
[    0.000000]  setup_arch+0x21c/0x658
[    0.000000]  start_kernel+0x7c/0x8c0
[    0.000000]  __primary_switched+0xb8/0xc8
[    0.000000] Code: eb18037f 540003a2 aa1b03e0 d503201f (f800841c) 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Adding back 0x90b00000-0x90bfffff as no-map passed memtest=1.

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
> @@ -433,13 +473,43 @@ pil_video_mem: pil-video@9fc00000 {
>  			no-map;
>  		};
>  
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
>  		hyptz_reserved_mem: hyptz-reserved@beb00000 {
>  			reg = <0x0 0xbeb00000 0x0 0x11500000>;
>  			no-map;
>  		};
>  
> -		tz_stat_mem: tz-stat@d0000000 {
> -			reg = <0x0 0xd0000000 0x0 0x100000>;
> +		scmi_mem: scmi-region@d0000000 {
> +			reg = <0x0 0xd0000000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		firmware_logs_mem: firmware-logs@d0040000 {
> +			reg = <0x0 0xd0040000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		firmware_audio_mem: firmware-audio@d0050000 {
> +			reg = <0x0 0xd0050000 0x0 0x4000>;
> +			no-map;
> +		};
> +
> +		firmware_reserved_mem: firmware-reserved@d0054000 {
> +			reg = <0x0 0xd0054000 0x0 0x9c000>;
> +			no-map;
> +		};
> +
> +		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
> +			reg = <0x0 0xd00f0000 0x0 0x10000>;
>  			no-map;
>  		};
>  
> @@ -453,8 +523,23 @@ qtee_mem: qtee@d1300000 {
>  			no-map;
>  		};
>  
> -		trusted_apps_mem: trusted-apps@d1800000 {
> -			reg = <0x0 0xd1800000 0x0 0x3900000>;
> +		deepsleep_backup_mem: deepsleep-backup@d1800000 {
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


