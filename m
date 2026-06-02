Return-Path: <linux-arm-msm+bounces-110737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJAPF3GGHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1B629B3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 654883000FD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541A63A6F0C;
	Tue,  2 Jun 2026 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QH3J6HXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C73939D7;
	Tue,  2 Jun 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385372; cv=none; b=my5wZEi9/NCxf1Imi6S2EiReIzkxtBT6OT79SPujJs1Lifyvwbi37uW5tCK/28a9Oy0UOfP/MHTo7SLUcBkaK9xUw6rzLqCH3iAPVp9B0T0IiiqzSa8vuri9ttD2XW8+B+ijgNt1EM9zKH9z5K4WyDrcqG5o1UifrK7sjITzS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385372; c=relaxed/simple;
	bh=ABzbBfzvuGEu8UqK91ZJZkV+nNBoQnXXsiSvBfp5FMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6It5SU/xiujwcdSl2WRfTVMW33UO/B7qObPUo+XaiDkQtDgk+lSrJU5ct7uIUj5JFxjnt2cDPst0lsrgPM2qld36rvCHJt94NOYqA/ej3SMckUm4tsAhQG5aRz5HES9VHF0X70L59hi4amcWNLP+BfLmIGiMwsNegz6FLVYVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QH3J6HXZ; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780385364; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=d/SQYrTXfJA8D3bWLFflbV8dobWMR1lk7pHzJ8tjx1s=;
	b=QH3J6HXZRL7vvuMVjclM3k5wrZ1aZ7UBmqtAk955avTLakEB6FfW5nH9Nzs2hP8VldRSXfTo5PcBrzrtzYCAHcPaFLOpZ5pSd+w8lAjv8m/Rwlm6Yl1dtHv+Ub+gjfXfwCjGDl/Vuv6UB/zqr3Pg9aFDU2kvLVb0v5WBwdG7KHQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X43YUFg_1780385363;
Received: from 30.74.145.41(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43YUFg_1780385363 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:29:23 +0800
Message-ID: <4eeeef74-8a27-470c-b516-095f029b9e9e@linux.alibaba.com>
Date: Tue, 2 Jun 2026 15:29:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ras: aest: extend AEST support to Device Tree
 frontend
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Ruidong Tian <tianruidond@linux.alibaba.com>, Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
 will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110737-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tianruidong@linux.alibaba.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,alibaba.com:email,arm.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 10D1B629B3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Umang,

I have sent out v7, and I wanted to highlight a few changes to make it 
easier for you to adapt the devicetree support:

1. I stopped passing device information to the driver through the 
acpi_aest_node structure. Instead, I switched to using the device 
property infrastructure and removed the aest_device abstraction layer 
(which was originally introduced to support CMN). This should provide 
good compatibility between ACPI and devicetree and avoid the need to 
write extra adaptation code for devicetree (such as aest_of). In the 
ideal case, adding just one of_match_id should be enough to make it 
work, although this will require you to update the DTB file accordingly.

2. I removed the use of genpool. The current AEST driver only needs 
memory in interrupt context, so genpool is not needed.

3.The driver has been renamed to arm64_ras.

I have already applied some of your previous fix patches and added your 
Signed-off-by.


Best regards,
Ruidong


在 2026/5/5 20:23, Umang Chheda 写道:
> This series extends Tian Ruidong’s [1] ACPI-based AEST support series
> to also cover Device Tree based platforms.
> 
> While the existing AEST driver relies on the AEST ACPI table [3], many
> embedded Arm platforms use Device Tree exclusively and cannot use the
> driver today. This series adds a DT frontend that mirrors the ACPI
> implementation and feeds the same core driver, keeping ACPI and DT
> paths functionally equivalent.
> 
> Along the way, several correctness issues were identified in the core
> driver and are fixed in the first part of this series.
> 
> The DT frontend is mutually exclusive with ACPI and does not introduce
> any DT-specific logic into the core.
> 
> How to test with QEMU
> --------------------------
> Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
> virt machine.  To test the DT frontend:
> 
> 1. Build QEMU:
> 
>       git clone https://github.com/winterddd/qemu.git
>       cd qemu
>       git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
>       ./configure --target-list=aarch64-softmmu
>       make -j$(nproc)
> 
> 2. Build the kernel with:
> 
>       CONFIG_OF_AEST=y
>       CONFIG_AEST=y
>       CONFIG_ARM64_RAS_EXTN=y
>       CONFIG_RAS=y
> 
> 3. Add the following DT node to your virt machine DTB.  The QEMU
>     fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
>     vendor records at 0x090e0000 (SPI 45):
> 
>       aest {
>           compatible = "arm,aest";
>           #address-cells = <2>;
>           #size-cells = <2>;
>           ranges;
>           interrupt-parent = <&gic>;
> 
>           /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
>           aest-dram0@90d0000 {
>               compatible               = "arm,aest-memory";
>               arm,interface-type       = <1>;
>               arm,group-format         = <0>;
>               arm,interface-flags      = <0x22>;
>               arm,num-records          = <4>;
>               arm,record-impl          = /bits/ 64 <0x0>;
>               arm,status-report        = /bits/ 64 <0x0>;
>               arm,addr-mode            = /bits/ 64 <0x0>;
>               arm,proximity-domain     = <0>;
>               reg                      = <0x0 0x090d0000 0x0 0x1000>,
>                                          <0x0 0x090d0800 0x0 0x200>,
>                                          <0x0 0x090d0e00 0x0 0x100>;
>               reg-names                = "errblock", "fault-inject",
>                                          "err-group";
>               interrupts               = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>               interrupt-names          = "fhi";
>           };
> 	};
> 
> 4. Boot QEMU with acpi=off:
> 
>       ./qemu-system-aarch64 \
>         -machine virt,accel=tcg,gic-version=3 \
>         -cpu cortex-a57 -m 2G -smp 4 \
>         -kernel Image -dtb virt-aest.dtb \
>         -append "console=ttyAMA0 acpi=off earlycon" \
>         -nographic
> 
> 5. Verify probe:
> 
>       dmesg | grep "DT AEST"
>       # Expected: DT AEST: registered 1 AEST error source(s) from DT
>       ls /sys/kernel/debug/aest/
> 
> 6. Inject a CE error via the QEMU MMIO fault injection registers.
>     The QEMU device accepts 64-bit accesses only (use devmem with
>     the 64-bit width flag):
> 
>       devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject
> 
>     This triggers QEMU's error_record_inj_write() which sets
>     ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
>     aest_irq_func() fires, reads the status, and logs:
> 
>       AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
>       AEST: {1}[Hardware Error]: Error from memory at SRAT proximity domain 0x0
> 
> Testing
> -------
> - Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
> - Validated CE and UE injection via debugfs soft_inject.
> - Tested ACPI path is unaffected: ACPI boot continues to use
>    drivers/acpi/arm64/aest.c unchanged.
> 
> [1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
> [2] https://github.com/winterddd/qemu/tree/error_record
> [3] https://developer.arm.com/documentation/den0085/0200/
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
> Umang Chheda (8):
>        ras: aest: Fix shared processor node handling and error log messages
>        ras: aest: Fix CE/UE error counts not incrementing in debugfs
>        ras: aest: Skip unimplemented records in debugfs
>        ras: aest: Add panic_on_ue module parameter
>        dt-bindings: arm: ras: Introduce bindings for ARM AEST
>        ras: aest: Add DT frontend for ARM AEST RAS error sources
>        arm64: dts: qcom: lemans: add AEST error nodes
>        arm64: dts: qcom: monaco: add AEST error nodes
> 
>   .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
>   arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
>   drivers/ras/aest/Kconfig                           |  15 +-
>   drivers/ras/aest/Makefile                          |   2 +
>   drivers/ras/aest/aest-core.c                       |  63 +-
>   drivers/ras/aest/aest-of.c                         | 673 +++++++++++++++++++++
>   drivers/ras/aest/aest-sysfs.c                      |  27 +-
>   drivers/ras/aest/aest.h                            |  15 +-
>   include/dt-bindings/arm/aest.h                     |  43 ++
>   10 files changed, 1310 insertions(+), 16 deletions(-)
> ---
> base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
> change-id: 20260505-aest-devicetree-support-a3722d90e1f5
> prerequisite-message-id: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
> prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
> prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
> prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
> prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
> prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
> prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
> prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
> prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
> prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
> prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
> prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
> prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
> prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
> prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
> prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
> prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24
> 
> Best regards,
> --
> Umang Chheda <umang.chheda@oss.qualcomm.com>
> 


