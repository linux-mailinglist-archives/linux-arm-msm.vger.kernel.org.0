Return-Path: <linux-arm-msm+bounces-102477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HMnNfSM12mtPggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409A3C9A7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D4C30179D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C053C13FD;
	Thu,  9 Apr 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKJ82JgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2131175A81;
	Thu,  9 Apr 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733974; cv=none; b=lFR7xz1C3lAvzK4Ot9KpL6dvirihluGxz9SR56AB9MH1bhNC6Uksjv/pM9VCGlqwovPn4YqjYk+MRrvjsiJlddes3aam8JLcUtF2Weu6pkzkLP+8Bp9E6whd+LxoRoTNwrt72uTNaywxmbHCfHaM5inllJ4WAty0lyWrRb4ftpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733974; c=relaxed/simple;
	bh=LFNCQn45e1EAzaB+WITa52cblOfEaBQKyavgFqS6BLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7sd28U4sK62lujvBnsm4Nze4JzIUDQCRlHhAvyUvRdIzs7lx/Om9pdMhH7ehAE28bubs7mlHaqyeX0bE6o3gkHItGAz06n06DTsL3h5V5UXEmvWM9kKvnZWZoCYyE4j/nabAmJ7MdnwpGZmldF4SS53XIXX8puEQyoBjnx4ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKJ82JgK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1888C4CEF7;
	Thu,  9 Apr 2026 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775733974;
	bh=LFNCQn45e1EAzaB+WITa52cblOfEaBQKyavgFqS6BLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKJ82JgKtUsaXNmCaNLLc0WgEdxCpZWIO9NQcXgrC9OthhQVz8f0Z5MelgheUHjkZ
	 jGTYT/nl6IcsdGz/Y6KgfFeQBKDOoBOz4GkK7OVpCGcue8N46K52qV8OONVWXN2M8Z
	 tsbTkdXalHdwmijAFPlropJt5pVjQbmFip25Qc/DoP+JDlt+rvR7Gwsl7Q9UbS6C6z
	 7aV/tbwwsEzwp4t3nGjjY3fJLB6CK67J+YDzDcc2Ge47x8FkKZfCB0JZpzf9z0fVHI
	 c+qi+hw8WwGTv3hQTJ0j/FqVSL8GTUp/xRCPtb3XKrb30gcNCkNKBew3SweAS5KLKL
	 XEsByelgahTvg==
Date: Thu, 9 Apr 2026 16:56:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Joe Sandom <jsandom@axon.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <lusy4sd2q22tvtvzgbb3pbpxauy5ym46ojjtpjq43wyzn72yxy@uxcggqladbnl>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
 <25g2sasffiq4axsamv2m5nywieucj3vbwfhvn66jtzjxoodfxx@vkswsycqju6g>
 <20260409100455.foytyzse3k5ty55l@linaro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409100455.foytyzse3k5ty55l@linaro>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102477-lists,linux-arm-msm=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8409A3C9A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:04:55AM +0100, Joe Sandom wrote:
> On Tue, Apr 07, 2026 at 09:44:34PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> > 
> > [...]
> > 
> > > > > +&pcie0 {
> > > > > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > > > > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > > > > +
> > > > > +	pinctrl-0 = <&pcie0_default_state>;
> > > > > +	pinctrl-names = "default";
> > > > > +
> > > > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > > > +
> > > > > +	/delete-property/ msi-map;
> > > > 
> > > > Why?
> > > I tried extending the msi-map to cover the RIDs from the QPS615
> > > PCIe switch (matching the iommu-map entries), but this caused
> > > ITS MAPD command timeouts.
> > 
> > I'm not aware of any specific issue with ITS on this chipset. At what time did
> > you see the timeout? During probe?
> So when I set msi-map to match the iommu-map entries, I got this;
> [    0.000000] ITS [mem 0x17140000-0x1717ffff]
> [   11.085152] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
> [   11.115762] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
> [   11.153632] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
> [   11.252398] mhi mhi0: Requested to power ON
> .........
> [  101.596274] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  101.603098] ath12k_wifi7_pci 0001:04:00.0: failed to set mhi state: POWER_ON(2)
> [  101.610632] ath12k_wifi7_pci 0001:04:00.0: failed to start mhi: -110
> [  101.617171] ath12k_wifi7_pci 0001:04:00.0: failed to power up :-110
> [  101.794431] ath12k_wifi7_pci 0001:04:00.0: probe failed with error -110
> [  103.158872] ITS queue timeout (12640 12609)
> [  103.163183] ITS cmd its_build_mapd_cmd failed
> 
> With msi-map removed, I got this;
> [   11.469642] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
> [   11.490059] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
> [   11.497787] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
> [   11.559958] mhi mhi0: Requested to power ON
> [   11.567375] mhi mhi0: Power on setup success
> [   11.693069] mhi mhi0: Wait for device to enter SBL or Mission mode
> [   12.185946] ath12k_wifi7_pci 0001:04:00.0: chip_id 0x2 ... soc_id 0x40170200
> [   12.482168] ath12k_wifi7_pci 0001:04:00.0 wlP1p4s0: renamed from wlan0

Thanks for the logs. I also checked internally and learned that the timeout is
due to Gunyah limiting the devices per-port. On SM8550, it currently only
allows 2 devices per RC instance to save the memory footprint. So when you
connect a PCIe switch which exposes more than two devices (1 USP + (1+) DSPs),
you'll run out of ITS mapping in Gunyah, leading to these timeouts.

So either you need to modify Gunyah to allow more devices per-port or switch to
iMSI-RX which you are already doing.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

