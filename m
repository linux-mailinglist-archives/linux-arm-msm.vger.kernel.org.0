Return-Path: <linux-arm-msm+bounces-114815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HDpMIijYQWoMvAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35A6D5806
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fpV1MKa6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114815-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114815-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34698300D46D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 02:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB0734E74B;
	Mon, 29 Jun 2026 02:27:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694940D585;
	Mon, 29 Jun 2026 02:27:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782700067; cv=none; b=am6GM+iscwpaLIfsgeALgB5HuaNQwZ6+aMItN8NUi9M8/YBVoxEzsqCuNAxfi871ol89lewgCoAEKfPHG7s+CQ/RN05mA32i9VhtaioU/P1AW60Enw5pWqQVSYSL2C1paVL6A3zuANVHSdlEQnQzYjNTO9Ge8DzqbW/5+E0d+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782700067; c=relaxed/simple;
	bh=MzOn116bCikcpWyGXfXSG+0J+ylTVaP0Vccky3qEfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4oAC32Ng09A4ahbb4JMHb4HJczMQRQSx4rAL5KOA/ckcjUF2SW/0lwE7fgfPTpgY0YIOubUQ15cf6R4kgfwmZIECJEUWoQ4rugEgi4yNcpz1SkiH2RsWCxSWAOKKmenVvTnHfzqDIr3sHtMjYvzYfkaOPxrInFtl/xVNO+RHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpV1MKa6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2F21F000E9;
	Mon, 29 Jun 2026 02:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782700066;
	bh=R+L59wpa0lFCCdTpCWDpJ9Lgn8eL+gBxZH1T0tyvv/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpV1MKa6HJkk05UVfXfd8GUCKgfvaNaKfk+G7+I0JfeGnCI6ianYcMtkIQLcPugXE
	 Ck2526icMz+UyA8GTxRd+qO28JiGlVtWM6yvpT2mMfIe5Nj4TqnFI6bng8Kw9rgvmW
	 aiZOCHGa3QnwT73MynQVaevy6tNEmOyApH3TbezKoRlVeBxhESsc+g03lAcZ5nmdzX
	 ptQx6BgVN9jOBtovXjOj2Znoxabv1k5VJTa8TgwiWKbdQ9rmtsD7L+VeNYRhktKixI
	 vn0Hs5Jtv/8/V725Llsvvd+xh+36CBNcmXcSl0l5xFosw6/ddDjDackl0me2N6+4H0
	 08+UWgdXkO6ug==
Date: Sun, 28 Jun 2026 21:27:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Message-ID: <akHTOUvHXooq7ykT@baldur>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114815-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF35A6D5806

On Tue, Jun 23, 2026 at 04:52:13PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Currently as soon as the kernel boots with a populated DT provided then
> the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> actually boots using these tables this is not necessarily desirable.
> 
> It might still be interesting to at least parse the ACPI tables and make
> the ACPI fwnodes available for device-drivers to use. I call this DT-ACPI
> hybrid mode.
> 
> This mainly is an experiment for now and possibly a method for accelerating
> the ongoing effort to run Linux on currently available Snapdragon laptops.
> 
> On current laptops Linux cannot boot using ACPI due to some information
> missing from the ACPI tables. People are working on changing this so that
> for future WoA Snapdragon laptops Linux can boot using ACPI only without
> requiring Devicetree.
> 
> 
> There are a couple of scenarios where DT-ACPI hybrid mode is useful:
> 
> a) This leads to a populated /sys/firmware/acpi/tables allowing one to run
> acpidump, which is useful to grab info from the ACPI tables when e.g.
> creating a DT for a new laptop model.

This depends on the laptop in question sufficiently following the
reference design, such that you actually have a good enough base DT to
find those i2c-hid devices...

E.g. on the Glymur-based Asus Zenbook A14 that I recently brought up,
keyboard sits on a previously unused I2C bus - something I wouldn't know
without first acpidumping.

> As a bonus /sys/firmware/acpi/bgrt
> is also populated allowing the boot-splash to show the vendor logo.
> 
> b) It might be useful for device-drivers to be able to access ACPI data
> for the device even when running in DT mode. E.g. Srini Kandagatla first
> got me thinking about this because he wants to use the ACPI MIPI SDCA
> tables for audio codec routing when booting Linux on Windows Qualcomm X2
> (Glymur) laptops.
> 

As I argued during last year's Plumbers, I'm strongly against this, for
anything but prototyping/experimentation.

Specifically something like the MIPI SDCA tables, are we going to define
an ABI across DT/ACPI such that we now require the hybrid system in
order to build a Glymur-based DT-based product?

> c) It is also possible to go truely hybrid and use ACPI to instantiate
> some of the kernel device objects representing the hardware. For example
> the last patch in this RFC series switches to using ACPI instantiation for
> the I2C clients for the keyboard and touchpad on the Snapdragon X1E Lenovo
> ThinkPad T14s gen 6.
> 

Which introduces the very shortcomings that are a key part of why we
don't just run off ACPI in the first place today.

> d) This may help identify shortcomings in the current ACPI tables which
> need to be fixed to allow future laptop generations to use ACPI only.
> 

This is worth looking further at.

> 
> Upstreaming of these patches (to upstream or not to upstream?).
> 
> 1. The first couple of patches in this series mainly implement a) + b) from
> above. This seems like something genuinely useful to have; and except for
> missing DT-bindings for hybrid mode this seems mostly ready to go upstream.
> 
> 2. I see c) as a way to slowly evolve support for current Snapdragon laptops
> to use more and more info from ACPI and get closer to a point where we only
> need a single DT describing the SoC and any info related to laptop model
> specific bits outside of the SoC can be read from the ACPI tables.
> 
> As mentioned above work is being done to have Linux boot on future laptop
> generations using ACPI only, so all this applies to currently available
> Snapdragon laptop generations only.
> 
> The question is what to do wrt upstreaming patches necessary for c) though
> (patches 7-12) are we going to allow new Devicetree files for not yet
> supported laptop models to partially rely on ACPI?
> 
> The current demo ACPI usage in this RFC series just instantiates I2C-HID
> devices from ACPI. More interesting would be to hookup the embedded
> controller (EC) handling in the ACPI tables instead of having to write
> a special EC driver for each laptop model separately. For the EC parts
> I believe that it might be worthwhile to implement c).
> 

Wiring up the EC is the one use case that I can think of where the
hybrid mode would be really interesting, as a hack around the need to
write custom device drivers for each one.

> This new DT-ACPI hybrid mode works as follows:
> 
> 1. A new global ACPI subsys flag called acpi_dt_hybrid is introduced which
> can be set to 1 combined with acpi_disabled=1. When this is done, then
> despite acpi_disabled being set the ACPI tables will still get parsed and
> /sys/firmware/acpi (tables) and /sys/bus/acpi/devices (fwnodes) will still
> get populated. No devices will be instantiated, no fwnodes will get
> attached to any other (e.g. PCI, USB) devices and no other actions will
> be taken.
> 
> 2. Add acpi=hybrid kernel-commandline option to the arch/arm64 code.
> TODO: Add a DT-binding for selecting hybrid mode from Devicetree.
> 
> 3. drivers/acpi/glue.c changes to support devices with an of_node as
> primary fwnode having a "acpi-path" string property and when present look
> up the ACPI fwnode for that path, e.g. "\\_SB.GIO0", "\\_SB.I2C1" and
> set that fwnode as secondary node.
> 
> 4. pinctrl-msm changes to map special WoA ACPI table virtual GPIO numbers
> for PDC pins back to regular TLMM GPIO numbers.
> 
> 5. Tiny drivers/i2c/i2c-core-acpi.c change to make it instantiate ACPI
> described I2C clients under a DT instantiated I2C adapter if that
> adapter has an ACPI secondary fwnode.
> 
> With this I can drop the DT description of the ThinkPad T14s gen 6
> keyboard and touchpad and instead have these be instantiated by ACPI,
> as shown in patch 12/12.
> 
> Comments, thoughts ?
> 

I love the experimentation!

Regards,
Bjorn

> Regards,
> 
> Hans
> 
> 
> Hans de Goede (12):
>   ACPI: Introduce DT-ACPI hybrid mode
>   arm64: acpi: Cleanup acpi=[on|off|force] handling
>   arm64: acpi: add acpi=hybrid support
>   ACPI: Add helpers for dealing with ACPI fwnode as secondary fwnode
>   ACPI: glue: Implement setting secondary-fwnode for DT-ACPI hybrid mode
>   ACPI: scan: Retry acpi_device_notify() in DT-ACPI hybrid mode
>   ACPI: Make device_match_acpi_handle() also check the secondary fwnode
>   irqchip/gic-v3: Always call acpi_set_irq_model()
>   pinctrl: qcom: Add support for WoA ACPI tables virtual TLMM pin
>     numbers
>   i2c: acpi: Also register ACPI i2c_clients for adapters with a
>     secondary ACPI fwnode
>   i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
>   arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb and touchpad to
>     ACPI enumeration
> 
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  61 +-----
>  arch/arm64/include/asm/acpi.h                 |   1 +
>  arch/arm64/kernel/acpi.c                      |  47 +++--
>  arch/loongarch/include/asm/acpi.h             |   1 +
>  arch/riscv/include/asm/acpi.h                 |   3 +-
>  arch/x86/include/asm/acpi.h                   |   1 +
>  drivers/acpi/acpi_apd.c                       |   3 +
>  drivers/acpi/acpi_memhotplug.c                |   3 +
>  drivers/acpi/acpi_processor.c                 |   3 +
>  drivers/acpi/arm64/init.c                     |   2 +
>  drivers/acpi/bus.c                            |   6 +-
>  drivers/acpi/glue.c                           |  70 ++++++-
>  drivers/acpi/property.c                       |  13 ++
>  drivers/acpi/scan.c                           |  33 +++
>  drivers/acpi/tables.c                         |   4 +-
>  drivers/base/core.c                           |   4 +-
>  drivers/firmware/efi/efi-bgrt.c               |   2 +-
>  drivers/i2c/busses/i2c-qcom-geni.c            |  10 +-
>  drivers/i2c/i2c-core-acpi.c                   |   8 +-
>  drivers/irqchip/irq-gic-v3.c                  |  29 ++-
>  drivers/pinctrl/qcom/Makefile                 |   4 +-
>  drivers/pinctrl/qcom/pinctrl-msm-acpi.c       | 196 ++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.c            |  47 ++++-
>  drivers/pinctrl/qcom/pinctrl-msm.h            |  35 ++++
>  include/acpi/acpi_bus.h                       |  16 ++
>  include/linux/acpi.h                          |  10 +
>  26 files changed, 502 insertions(+), 110 deletions(-)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm-acpi.c
> 
> -- 
> 2.54.0
> 

