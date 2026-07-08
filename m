Return-Path: <linux-arm-msm+bounces-117549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COqIFF0GTmpwBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:12:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B362872303A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lq16RL1U;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117549-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117549-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3B6730ABA3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2F3FDBF5;
	Wed,  8 Jul 2026 08:03:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96743F4DF7;
	Wed,  8 Jul 2026 08:02:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497780; cv=none; b=Ky4OV4bu2FPBYsoQLzF9KqrI7IVwk9K+NETO3KZmfIrB4xgClUDY1FXcndAR+PZYXBBfeXpQ1Ks7+EqtrXMj/wBjFIDoxYlzKiwghowwfqK1coWGG+35B86og9eszPzMuwouqZdDRlZBS9r7feAy/T8d5eBPrv9xdWCZ9wtBq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497780; c=relaxed/simple;
	bh=2nYWzZquheDFSeQvULOUmhArum4qMq5VlEch6xqYwoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX0aJxGQq6sOt9xi/exJYaNNDwQ/CnrKZPBewsyjO6Vg+K8XvayQfFa2su97NTwzHKyHmFhsMdhKIKHnkl3b38kjsjSRBPTXztd24l2YDwP2TqtysMnPEayk6GgbMEfwAdgPEYk7bwjFk9T01Xk7tj0T0VH71JZAXShjd7uyYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lq16RL1U; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127121F00A3A;
	Wed,  8 Jul 2026 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783497773;
	bh=XvtzY0SdiIWqZfalwqsBjG5PLQAum4xxC26Jvtrq7IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lq16RL1UDgOfvF4rt9ju2Ld+wVJPWvqi6TWmyFysck9ZRl8iKudMFDj4N7hn0cZtR
	 5QQOvKQMylc8XipxS1ED+9uXBAj8Y/BVxts2YA5v58Pvl5hp7dnaDhFPiVj+ljKz6P
	 Aq9fylb9ZnXT28E3zjsCBWhDSTwcfPOyjBZc/L88JKjecF34luDqlgSQUCD/YGYff6
	 f4TNgHjNDDHX02fP/DO88whZ8UkzNTIqq17fh1NHG3WThPDsbq9ppIgUY6GBdVL6iL
	 gWNy9mNJRRV9L87qtP5bYYp04xw+D8jy37zNd6YNeHAn80+FRiy2vSBeqiZAmdzaFy
	 kJuUVqjl4m+1A==
Date: Wed, 8 Jul 2026 10:02:38 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/9] PCI: qcom: Add PCIe support for Shikra SoC
Message-ID: <e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117549-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qz4pifbos7yf:mid,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B362872303A

On Wed, Jul 01, 2026 at 12:32:42AM +0530, Sushrut Shree Trivedi wrote:
> Add PCIe support for Shikra target, by adding dt-bindings for phy,
> controller and corresponding phy & controller drivers/device-tree
> changes.
> 
> Shikra RC is connected to TC9563 PCIe switch on all three
> EVK variants: CQS, CQM and IQS. The individual downstream ports
> of TC9563 connect like below:
> 
> DSP1: M.2 B-Key for 5G Modem
> DSP2: M.2 M-Key for NVMe
> DSP3: Embedded ethernet device
> 
> Power and reset to M.2 B and M.2 M slot are controlled via
> TC9563 GPIO's. Hence, add DT nodes to enable TC9563 switch
> and include corresponding changes to configure power/reset
> to TC9563 endpoints as part of power on sequence.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Sushrut Shree Trivedi (9):
>       dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra PCIe phy
>       dt-bindings: PCI: qcom: Document the Shikra PCIe Controller
>       dt-bindings: PCI: Add bindings for endpoint gpios
>       PCI: qcom: Add support for Shikra
>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Shikra
>       PCI/pwrctrl: tc9563: Add API to control endpoint power and reset

TC9563 should be modeled as a GPIO controller to drive the PERST# and power-on
GPIOs. There is a patch series under review [1] that adds this support. So it
doesn't make sense to duplicate the effort here (which itself is hackish). So
please drop all the switch related patches from this series and resubmit them
once the above mentioned series from Alex gets merged.

But you can continue with the Shikra PCIe RC/PHY patches.

- Mani

[1] https://lore.kernel.org/all/20260605010022.968612-1-elder@riscstar.com

>       arm64: dts: qcom: shikra: Add PCIe PHY and controller nodes
>       arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch node for PCIe
>       arm64: dts: qcom: shikra-(cqm/cqs/iqs)-evk: Enable PCIe PHY node
> 
>  .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>  .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  22 ++-
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   7 +
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   7 +
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi           | 152 +++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   7 +
>  arch/arm64/boot/dts/qcom/shikra.dtsi               | 154 +++++++++++++++
>  drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
>  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 152 ++++++++++++---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  73 +++++++
>  11 files changed, 764 insertions(+), 24 deletions(-)
> ---
> base-commit: 565fa02f75448ce1ddd18bda6b31ad985cf75411
> change-id: 20260701-shikra-upstream-14b8668f1001
> 
> Best regards,
> -- 
> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

