Return-Path: <linux-arm-msm+bounces-81949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B2C608FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 18:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A00F4E21F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 17:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7462D77F7;
	Sat, 15 Nov 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aTPez47x";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oWmQdel/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5C200113;
	Sat, 15 Nov 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763226636; cv=none; b=utlytrTPfJCNQQY0bouz3HMhbYeURDKdOs/LmDJJTJrKPkqL+ZFjrfAXHaQteXbZInWy5vtxSSMnkZHN5kYCdH9b1A19VJv0UltiYMgeyy4mHAnQW1CGQFxyJ2PASv1mxYuFZfyKXWMBPS+Uc7Ub5s9KCSlH4O5cKy5cfxY5Tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763226636; c=relaxed/simple;
	bh=IwNuIG5YEBKLEuNGHvovrNsovaVjYhFOj4M3D+26q3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqcchf38Q8yIprlzqBZtjvKpW3XcBMs7flvnPFdLyc6yw7Sz/juOgJeYj+rl8oA5Uq9pS9n2t4cCvDvSdBbowYNzyLSHhwoiREOmWARvUXyePpmoILgQwyoG2pb5cX6JWHsFyNmmm5jPRh9oVHiaheED0ko6CLTfY61a/ReYbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aTPez47x; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oWmQdel/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763226481; bh=CbOeqveRkfwcyaZzIJeZEx5
	mwEynF8eqOwV9+gdv6Zs=; b=aTPez47xFeVQjQy0MStJ+qlAnhlMDE8Nhe2FZn/TzRzv/8cfih
	3YIRpevyJL2p8WV8M8uzadR15j4OlLDPW7+3imCgklHu4haJGWV9WYACnQLJTTK0mJM9KHiJMLY
	LIXP1rsqTH063CIyRTQYnTFmFHnagS5G6u2lRerE2d2tDGfK9KHE6uoKDWioCOV7zH0C5TQKYwX
	Z7c+DskMa7k7vp7/7OFwGp07EW7fzwNuPcacYpvvQ8+CpcFlBxfxOWSWsBzYH96rnlrYu2tS/hG
	dPnu80Wzr7xjIwJNlqD9XBSEEWMIX1EmFAYCYLY5I9lbKRlHV6KiJEwAeQfI/fiNZ+Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763226481; bh=CbOeqveRkfwcyaZzIJeZEx5
	mwEynF8eqOwV9+gdv6Zs=; b=oWmQdel/58jocB4Bm5EXz0npGVoNYo/+HkoTnfePqBiyNZUD3G
	L1141J5kZLLy9HzvzZY9G6kfvwXueb9QyOCA==;
Message-ID: <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org>
Date: Sat, 15 Nov 2025 18:08:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
Content-Language: en-US
From: Jens Reidel <adrian@mainlining.org>
In-Reply-To: <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/25 5:34 PM, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Bluetooth (AP6256)
> - Wi-Fi (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - FAN
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - M.2 M-Key 2280 PCIe 3.0
> - RTC
> - USB Type-C
> - USB Type-A 2.0 port
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 ++++++++++++++++++++
>   2 files changed, 1416 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..2433b15754fe 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -138,6 +138,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> new file mode 100644
> index 000000000000..4c9016992de3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -0,0 +1,1415 @@

[snip]

> +
> +&pcie0 {
> +	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie0_clkreq_n>,
> +		    <&pcie0_reset_n>,
> +		    <&pcie0_wake_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	/* Using traditional address mapping */
> +	reg = <0 0x01c08000 0 0x3000>,
> +	      <0 0x40000000 0 0xf1d>,
> +	      <0 0x40000f20 0 0xa8>,
> +	      <0 0x40001000 0 0x1000>,
> +	      <0 0x40100000 0 0x100000>;
> +
> +	ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +		 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;

Thanks for attempting to fix the PCIe issues. With your patch series 
applied on top of linux-next, I'm still seeing PCIe issues:

[    0.380693] Internal error: synchronous external abort: 
0000000096000010 [#1]  SMP
[    0.406491] Modules linked in:
[    0.406495] CPU: 5 UID: 0 PID: 106 Comm: kworker/u32:6 Tainted: G   M 
                6.18.0-rc5-next-20251113 #13 NONE
[    0.406499] Tainted: [M]=MACHINE_CHECK
[    0.406500] Hardware name: thundercomm Thundercomm RUBIK Pi 
3/Thundercomm RUBIK Pi 3, BIOS 2025.10-rc4 10/01/2025
[    0.406502] Workqueue: async async_run_entry_fn
[    0.406508] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    0.428362] pc : __pi_memset_generic+0x16c/0x188
[    0.428366] lr : dma_direct_alloc+0x19c/0x3d0
[    0.428370] sp : ffff8000810e3920
[    0.428371] x29: ffff8000810e3920 x28: ffff000080d0f810 x27: 
ffffba4c6196ec48
[    0.428373] x26: ffff000080d0f810 x25: ffffba4c607b31cc x24: 
0000000000000000
[    0.428375] x23: ffff000080d0f810 x22: ffff000000c00000 x21: 
ffff000082858948
[    0.428376] x20: 0000000000001000 x19: fffffdffc0030000 x18: 
000000000000000a
[    0.428378] x17: ffff0000823dae00 x16: 0000000000000000 x15: 
0000000000000000
[    0.428380] x14: 00000000ffffffff x13: 0000000000000068 x12: 
0000000000000100
[    0.449344] x11: 0000000000000000 x10: ffff0001fef99500 x9 : 
0000000000000000
[    0.449345] x8 : ffff000000c00000 x7 : 0000000000000000 x6 : 
000000000000003f
[    0.449347] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 
0000000000000004
[    0.449349] x2 : 0000000000000fc0 x1 : 0000000000000000 x0 : 
ffff000000c00000
[    0.449350] Call trace:
[    0.449351]  __pi_memset_generic+0x16c/0x188 (P)
[    0.449354]  dma_alloc_attrs+0x94/0x210
[    0.449357]  dmam_alloc_attrs+0x74/0xc0
[    0.469967]  dw_pcie_msi_host_init+0x100/0x300
[    0.469971]  dw_pcie_host_init+0x5e4/0x6d8
[    0.491913]  qcom_pcie_probe+0x5a8/0x838
[    0.491916]  platform_probe+0x64/0xc0
[    0.491919]  really_probe+0xc8/0x3f0
[    0.491921]  __driver_probe_device+0x88/0x170
[    0.491922]  driver_probe_device+0x48/0x130
[    0.491923]  __device_attach_driver+0xc4/0x190
[    0.491925]  bus_for_each_drv+0x90/0x100
[    0.491928]  __device_attach_async_helper+0xb8/0x120
[    0.491929]  async_run_entry_fn+0x3c/0x1e0
[    0.491931]  process_one_work+0x150/0x3a0
[    0.491934]  worker_thread+0x288/0x480
[    0.491936]  kthread+0x118/0x1e0
[    0.491938]  ret_from_fork+0x10/0x20
[    0.513092] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
[    0.513094] ---[ end trace 0000000000000000 ]---

I can only get the device to boot by disabling both pcie0 and pcie1.

> +
> +
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_clkreq_n>,
> +		    <&pcie1_reset_n>,
> +		    <&pcie1_wake_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +

[snip]

> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs6490/adsp.mbn";
> +
> +	status = "okay";
> +};

I'm fairly sure that this is the wrong ADSP firmware. With the firmware 
in linux-firmware, I'm seeing charger pd crashes and the ADSP constantly 
restarting. Using the Radxa Dragon Q6A ADSP firmware which disables the 
charging feature in the firmware works way better and does not result in 
crashes.

> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +

[snip]

Thanks,
Jens


