Return-Path: <linux-arm-msm+bounces-117954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fALUKj+JT2pUjAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:42:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229F730835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:42:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=lqRJ7n+Z;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117954-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117954-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71A533006D6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 11:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8322A40DFAC;
	Thu,  9 Jul 2026 11:41:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990C3FFF91
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 11:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597309; cv=none; b=NmFMTOLcqq1TMkwSP9X11FpLlqnVILLa/kIFk092+lkDuXB97GueZagprps/4lMfjBD6BpxJETu0kAsmmUtN1zI5+WlUPnQYdgORG7Dw9AbV5kB9/vxuM5YtGun9xmz6JckZ5O8Fcio+D7yxk4n2nb5JDwrJj+vapAzMJoG+w9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597309; c=relaxed/simple;
	bh=U1dCIO2MyctJ6SmYyh0JUmjOQpbmkKGDTuDhpOoRBfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=BX8DB/g1vGctitKYWkhOlsHaxYB1whU/4JTFotHM8cSR4o1v83fg7uVUmw2xa+R1mpv9j65d01QUByTVUDIOopz9Vnp421sW518OZw9YQRsNmXETpv3b7ADnx1ko9MetIJhVJEl/00jqMhthZMiwrtkgpoA6jyBOmdEi6dCWzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lqRJ7n+Z; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260709114144euoutp02b582be6f279093d355bce5a8809106a3~AnExeh1610573105731euoutp02y
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 11:41:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260709114144euoutp02b582be6f279093d355bce5a8809106a3~AnExeh1610573105731euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783597304;
	bh=Y9DQkg6rMxHep3tCQiWIqrIxzviRHpty7VDOh1eSyAU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lqRJ7n+ZMW2FuZip1vN6rjAdZzueQPOENj8l+IflduuR3mkmh3EY8KdZAHJmlNDFs
	 iCmOa7F6LG6cS5B5GQB34LOVxxQ78uy8Tppv2C57oS0yy0U221Iqs8r5zYZe+FY6bR
	 lWFoRs7xiZ8DYkMiIRMpbkWXbPHD1U0hXZ3yXXUY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55~AnEw92OlE1788517885eucas1p1c;
	Thu,  9 Jul 2026 11:41:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260709114143eusmtip109ddf1157d363ce2e032b1b4a26659e9~AnEwUOH3C0267602676eusmtip1Y;
	Thu,  9 Jul 2026 11:41:42 +0000 (GMT)
Message-ID: <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
Date: Thu, 9 Jul 2026 13:41:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55
X-EPHeader: CA
X-CMS-RootMailID: 20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
	<20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
	<CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117954-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,samsung.com:from_mime,samsung.com:dkim,samsung.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9229F730835

On 15.12.2023 01:01, Konrad Dybcio wrote:
> Wire up MPM and the interrupts it provides.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 42 +++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index ce04d0acdede..0911fb08ed63 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -199,6 +199,7 @@ CPU_PD3: power-domain-cpu3 {
>  
>  		CLUSTER_PD: power-domain-cpu-cluster {
>  			#power-domain-cells = <0>;
> +			power-domains = <&mpm>;
>  			domain-idle-states = <&CLUSTER_SLEEP>;
>  		};
>  	};


This patch landed long time ago in mainline as commit e3f6a6994041
("arm64: dts: qcom: qcm2290: Hook up MPM").

Recently I've added Arduino UnoQ board
(arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts) to my test farm
and found that this patch is responsible for the "Invalid wait context"
warning [1] observed during boot of the recent kernels when
CONFIG_PROVE_RAW_LOCK_NESTING is set (which is implicitly true when
CONFIG_PROVE_LOCKING is set since commit d8fccd9ca5f90). This shows
a real problem if one wants to run RT-enabled kernel.

This is because the above chunk adds the "mpm" as a parent power domain
to the "cluster_pd" (in current arch/arm64/boot/dts/qcom/agatti.dtsi). 
"cluster_pd" is initialized as "GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN"
(see psci_pd_init in drivers/cpuidle/cpuidle-psci-domain.c, which use
raw_spinlock_t based locking), while the "mpm" power domain only as 
"GENPD_FLAG_IRQ_SAFE" (see qcom_mpm_probe in drivers/irqchip/irq-qcom-mpm.c,
which use spinlock_t locking).

I've check and there is no easy way to make the "mpm" power domain
GENPD_FLAG_CPU_DOMAIN compatible. drivers/irqchip/irq-qcom-mpm.c driver
uses mbox API, which internally uses spinlock_t based locking. Then
there is a drivers/mailbox/qcom-apcs-ipc-mailbox.c driver and even
more dependencies: mmio regmap, clocks and probably more (I've didn't
check further).

The question is how to solve this issue? Is this dependency really
required? Would it work if the "mpm" power domain is set as always
on and genpd framework extended to support such case without
triggering lockdep warning (it already has support for irq-safe
device in non-irq-safe power domain)?



[1] mentioned kernel log :

 =============================
 [ BUG: Invalid wait context ]
 7.2.0-rc2-next-20260708+ #13154 Not tainted
 -----------------------------
 kworker/u16:1/44 is trying to lock:
 ffff000002517870 (&genpd->slock/1){....}-{3:3}, at: genpd_lock_nested_spin+0x1c/0x30
 other info that might help us debug this:
 context-{5:5}
 locks held by kworker/u16:1/44: 5, last CPU#3:
  #0: ffff000000032140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x6a8/0x86c
  #1: ffff800080533d90 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1f8/0x86c
  #2: ffff00000036c138 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x1b8
  #3: ffffa850a0fca5f8 (gpd_list_lock){+.+.}-{4:4}, at: of_genpd_add_subdomain+0x30/0xc8
  #4: ffff000001994750 (&genpd->raw_slock){....}-{2:2}, at: genpd_lock_raw_spin+0x1c/0x30
 stack backtrace:
 CPU: 3 UID: 0 PID: 44 Comm: kworker/u16:1 Not tainted 7.2.0-rc2-next-20260708+ #13154 PREEMPT
 Hardware name: Arduino UnoQ (DT)
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __lock_acquire+0xa78/0x22a8
  lock_acquire+0x1d8/0x404
  _raw_spin_lock_irqsave_nested+0x64/0x8c
  genpd_lock_nested_spin+0x1c/0x30
  genpd_add_subdomain+0x8c/0x1d8
  of_genpd_add_subdomain+0x68/0xc8
  dt_idle_pd_init_topology+0x88/0x100
  psci_cpuidle_domain_probe+0x1bc/0x31c
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x164/0x184
  driver_probe_device+0xbc/0x11c
  __device_attach_driver+0xb8/0x118
  bus_for_each_drv+0x84/0xe4
  __device_attach+0xac/0x1b8
  device_initial_probe+0x50/0x54
  bus_probe_device+0x38/0xa8
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x248/0x86c
  worker_thread+0x240/0x388
  kthread+0x13c/0x148
  ret_from_fork+0x10/0x20
 CPUidle PSCI: Initialized CPU PM domain topology using OSI mode



> @@ -266,6 +267,24 @@ rpmpd_opp_turbo_plus: opp8 {
>  				};
>  			};
>  		};
> +
> +		mpm: interrupt-controller {
> +			compatible = "qcom,mpm";
> +			qcom,rpm-msg-ram = <&apss_mpm>;
> +			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
> +			mboxes = <&apcs_glb 1>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			#power-domain-cells = <0>;
> +			interrupt-parent = <&intc>;
> +			qcom,mpm-pin-count = <96>;
> +			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
> +					   <5 296>,  /* Soundwire master_irq */
> +					   <12 422>, /* DWC3 ss_phy_irq */
> +					   <24 79>,  /* Soundwire wake_irq */
> +					   <86 183>, /* MPM wake, SPMI */
> +					   <90 260>; /* QUSB2_PHY DP+DM */
> +		};
>  	};
>  
>  	reserved_memory: reserved-memory {
> @@ -429,6 +448,7 @@ tlmm: pinctrl@500000 {
>  			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			gpio-ranges = <&tlmm 0 0 127>;
> +			wakeup-parent = <&mpm>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> @@ -778,7 +798,7 @@ spmi_bus: spmi@1c40000 {
>  				    "obsrvr",
>  				    "intr",
>  				    "cnfg";
> -			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&mpm 86 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "periph_irq";
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
> @@ -793,8 +813,8 @@ tsens0: thermal-sensor@4411000 {
>  			reg = <0x0 0x04411000 0x0 0x1ff>,
>  			      <0x0 0x04410000 0x0 0x8>;
>  			#qcom,sensors = <10>;
> -			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended = <&mpm 2 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "uplow", "critical";
>  			#thermal-sensor-cells = <1>;
>  		};
> @@ -813,8 +833,15 @@ bimc: interconnect@4480000 {
>  		};
>  
>  		rpm_msg_ram: sram@45f0000 {
> -			compatible = "qcom,rpm-msg-ram";
> +			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>  			reg = <0x0 0x045f0000 0x0 0x7000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x045f0000 0x7000>;
> +
> +			apss_mpm: sram@1b8 {
> +				reg = <0x1b8 0x48>;
> +			};
>  		};
>  
>  		sram@4690000 {
> @@ -1293,9 +1320,10 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  		usb: usb@4ef8800 {
>  			compatible = "qcom,qcm2290-dwc3", "qcom,dwc3";
>  			reg = <0x0 0x04ef8800 0x0 0x400>;
> -			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq", "ss_phy_irq";
> +			interrupts-extended = <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq",
> +					  "ss_phy_irq";
>  
>  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


