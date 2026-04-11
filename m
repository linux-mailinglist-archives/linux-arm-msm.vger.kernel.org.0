Return-Path: <linux-arm-msm+bounces-102755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHuwOKC22WmhsQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:49:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D393DE164
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3445E3041D43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 02:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E92B29CB24;
	Sat, 11 Apr 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g433Igv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C85296BA9;
	Sat, 11 Apr 2026 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875709; cv=none; b=u74vQh6/fcY6BUwfXFNq5edrUwiyBi6UAw4CJOkwbSITfIECsZvD8nwId72Jp1DnFSsqRM90CBpQA8SGwNDbwwrpE8gmmOCWea+aOxZYYjQ07DkjqE6vI7O8v7WOPg8EPBm0K2kU/4/Uh/ZXv4qn3CRjBCBjYlS18XDbBzmECdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875709; c=relaxed/simple;
	bh=C1L68wEOa7QMkQeMg6JXJEZiMI7tywqjcBSBQ2MYaUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF+DJXxcAvmab90wM11zlZ+nT34jX0eDG4WX1r1jQflEpxVO42cMoX7wAMSTw23nNoRWUJ/2T4ZVyxdT55M6bISBORLrW01BRE23HbMHn0uM9wYdPjYalPKgE+avuP7hqL0qFDVCj8CybHTrMd00XUtuCrxHyp8dpIJO3zD/4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g433Igv1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A6DC2BC9E;
	Sat, 11 Apr 2026 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775875708;
	bh=C1L68wEOa7QMkQeMg6JXJEZiMI7tywqjcBSBQ2MYaUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g433Igv1pb8nfxFa7rj3ZTc49IIxGzXLBizezqRH4XX0qqVj55+mIGjqhDbPGZURa
	 IKvEazGCxKsucmjEZTRs2uAUQE5amkO3kD9BuUfakVl2pjT6wQJ7XSh5kW/NBYWlmU
	 JyVWVyJynrmoiZulNiqdYZVnXGKX/9J3pKyZZ7ubpH9+OZyL9Or0V27o5M/dDSFPfU
	 f2QxUWsIz0KVb+sLAcWy8GNvOjm6KU6zstyhh3CWPS50ut18aFngmJ8f5KKx+U3Dh8
	 GtRgDGeAAUuk6eVm3ZroXz8H+Q7X5f0/c6WcA5oZoRMaNJ1QTAtNX/cJwRQUP7sfXQ
	 9DZ6s6YRwXPjw==
Date: Fri, 10 Apr 2026 21:48:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
Message-ID: <adm1uXe6QRes8DiX@baldur>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75D393DE164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:37AM +0530, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> (Driver) regions, each 0x10000 bytes in size, where each region serves a
> specific client in the system . Linux only needs access to the APSS DRV
> region.
> 
> Despite this, the driver was mapping up to 0x30000 bytes (three DRV
> regions) via a QCOM_PDC_SIZE clamp introduced as a workaround for old
> sm8150 DTs that described a too-small register window. Correspondingly,
> most platform DTS files described the PDC reg as 0x30000 in size, and
> several also carried a second, entirely unused reg entry pointing at an
> unrelated register region that the driver never maps.
> 
> This series cleans all of that up in three logical steps:
> 
> 1. (patches 2-6):
> 

These patches are for the IRQ subsystem/maintainer.

> Split __pdc_enable_intr() into two focused per-version helpers
> to separate the HW < 3.2 bank-based path from the HW >= 3.2 per-pin
> path. Replace the pdc_version global with a function pointer assigned
> once at probe time, moving the version check out of the hot path.
> Tighten the ioremap clamp from QCOM_PDC_SIZE (0x30000) to PDC_DRV_SIZE
> (0x10000) now that the DT fixes below make the workaround unnecessary.
> Also add a PDC_VERSION() constructor macro and use FIELD_GET() for bank
> index extraction to make the bit encoding self-documenting.
> 
> 2. (patches 1, 7-28):
> 

And these patches are for the Qualcomm SoC/DT tree.

> All 28 platform DTS files that described the PDC reg window as 0x30000
> are corrected to 0x10000, reflecting the single APSS DRV region that
> Linux actually maps.
> 
> 3. (patches 29-35):
> 

Same with these.


I don't see any dependencies between the IRQ and DT patches, can they be
merged independently? Why did you send them together?

Regards,
Bjorn

> Seven platform DTS files (kaanapali, lemans, milos, monaco, sc8280xp,
> sdx75, talos) carried a second reg entry pointing at an unrelated
> hardware block. The driver only ever calls of_address_to_resource(node,
> 0, ...) so this second entry was never mapped or accessed. Remove it.
> 
> The net result is that every PDC node in the tree now describes exactly
> one register region of exactly 0x10000 bytes — the APSS DRV region that
> the driver actually uses — and the driver's ioremap clamp matches that
> reality.
> 
> Mukesh Ojha (35):
>   dt-bindings: qcom,pdc: Tighten reg to single APSS DRV region
>   irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
>   irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
>   irqchip/qcom-pdc: Replace pdc_version global with a function pointer
>   irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register
>     fields
>   irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit
>     position
>   arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: x1e80100: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: qcs615: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
>   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
>   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
>   arm64: dts: qcom: milos: Drop unused second PDC reg entry
>   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
>   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
>   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
>   arm64: dts: qcom: talos: Drop unused second PDC reg entry
> 
>  .../interrupt-controller/qcom,pdc.yaml        |  2 +-
>  arch/arm64/boot/dts/qcom/hamoa.dtsi           |  2 +-
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  3 +-
>  arch/arm64/boot/dts/qcom/kodiak.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/lemans.dtsi          |  3 +-
>  arch/arm64/boot/dts/qcom/milos.dtsi           |  3 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi          |  3 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi         |  2 +-
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi        |  2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  2 +-
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 +-
>  arch/arm64/boot/dts/qcom/sm4450.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm6350.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
>  arch/arm64/boot/dts/qcom/talos.dtsi           |  3 +-
>  drivers/irqchip/qcom-pdc.c                    | 56 +++++++++++--------
>  25 files changed, 57 insertions(+), 53 deletions(-)
> 
> -- 
> 2.53.0
> 

