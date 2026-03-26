Return-Path: <linux-arm-msm+bounces-99993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCmMJ8edxGki1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:45:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489732E760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86D9C302C5EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE47C38F643;
	Thu, 26 Mar 2026 02:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEU0U4U1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67412F585;
	Thu, 26 Mar 2026 02:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492862; cv=none; b=PGNHp/TYilhkjDi1zFIhityEQIMXx0MLRJmP8C5z3k7rd0oes88qzg74snAbf9Ch1qvlGB5Yexwpth3dL6RTDQshOKmtyVaaHcxW5Emnbw7rkI/DlkaFRBbq3TVkDKE1m5zWpsKsaV5dvBrJhwkj2YImCDboL526/NewoyvMikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492862; c=relaxed/simple;
	bh=1VDBhYCJ2BETy5mGSLkU/VcwUGRUaX/Cd91vaqYUZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWfzr4/b6Jl1Qs+Og4xs8ZCbaUhLI9bCEzqOkDNzHryNtTxTS4C7w8dFOpGYMNytD7t8eAfS7lDkZDrRhMVmWkODcZ7sCrhBm3aEcTz6wy7HiT3IrB77sF/YTQBALjUU/giqK+GH0PCmtpi/vL3uz6G3Pq4HMmhSvZiczwDGtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEU0U4U1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BBEC2BC9E;
	Thu, 26 Mar 2026 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774492862;
	bh=1VDBhYCJ2BETy5mGSLkU/VcwUGRUaX/Cd91vaqYUZOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEU0U4U1mDHr6WinNDFWo8hdCj4fyDjBC1k1fz8Jd/eHg4kQrz8tvr/K5pXDSswb3
	 qiCMDw4GjgBIdh4HfdPU+BOmHz5KJxiNGlQGHL/l5CtPeAy5A/1LhZzfY3X8xA0Oki
	 h9Lxbx0byNMp/30jIZY7WFJ3XpVxMINApGTFuALF3KWQAYXdaxKAL2owJjvwXIs8zH
	 T/mT4I3zU9JquiR9F/oxxWbRwFGMLYztaHRrSOwWkn/Kz+e+bdMPNvY7s4XnJy+H1e
	 Hl4UlmbRcRyGlcyzzMOtp746vYDqDZHfvMBuYYwssJcq/5MrLS2rjwn2sUo+HV0wdg
	 eFVY6sEpwGPYw==
Date: Wed, 25 Mar 2026 21:40:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <acSZ8AqKC3hdaz2A@baldur>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
 <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99993-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4489732E760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:35:46AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 09:32:39PM -0500, Bjorn Andersson wrote:
> > The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> > the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> > two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> > interface.
> > 
> > The Renesas chip is powered by two regulators controlled through PM7250B
> > GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> > The Genesys chip power is always-on, but the reset pin is controlled
> > through TLMM GPIO 162.
> > 
> > Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> > allow it to be brought out of reset and discovered. Then describe the
> > two peers of the USB hub, with its reset GPIO, to allow this to be
> > brought out of reset.
> > 
> > The USB Type-A connectors are not described, as they are in no regard
> > controlled by the operating system.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> > Dependencies has now landed, so this provides USB Type-A and Ethernet
> > support (when renesas_usb_fw.mem) is present.
> 
> Note, I initially applied the patch to the bit old -next (20260317) and
> I ended up with no PCIe host at all (bare -next would still show the
> PCIe host and the TC9563 bridge).
> 

Applied the patch to next-20260323 and tested again.

> 
> ANyway, does this actually work for you?

Yes, I booted with pcie_aspm=off I have functional ethernet and I can
plug/unplug a USB storage device and access the content on this.

> The hub is detected, but the USB bus is empty.

I've disconnected the USB stick again, so here's the output when only
ethernet is present.

/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 480M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 5000M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
        |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=ax88179_178a, 5000M

> I tried plugging in several devices (includin the
> powered USB hub) and they were completely ignored by the hub.
> 

The USB stick above was powered by the device, so that part is tested as
well. (And schematics shows VBUS is always present on the Type-A ports).

Regards,
Bjorn

> FWIW I tried both the the pcie_aspm=off and w/o it.
> 
> > Missing from the RFC/v1 description was the mentioning that unless I
> > pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
> > 
> >   xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110
> 
> Interesting, it "worked" in my case, having everythign built in into the
> kernel.
> 
> > ---
> > Changes in v2:
> > - Waited for dependencies to land.
> > - Dropped "RFC".
> > - Link to v1: https://lore.kernel.org/r/20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 93 ++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry

