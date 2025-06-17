Return-Path: <linux-arm-msm+bounces-61578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECBADC7EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8D707A1543
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D333A21C177;
	Tue, 17 Jun 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHED9/FG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C502BEFF3;
	Tue, 17 Jun 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155630; cv=none; b=VzLMn9NJIeRkJGv4h/oKu1iTP0w3FfHXFveVFnXzIo0XEmwndKnOzuoH0P4mxHBGtRGZAHJFIzgwXkAqaPAsF0wEL9ffI79WrPMvVj3xsnCJBTCdFOPe26DqxuIbLZCAkgmiNeF9txbal+taSgYB5UZzvfhKc0619I+a8uVBXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155630; c=relaxed/simple;
	bh=ShE75AzzcjMtFveguCfs50L+tbA1hP344vJlSCdWg5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSHybytaVAXMsA3iNfXiRQfB7csVLwMP+swIojr/sbAscZiB9dmKoY9+aRivJnT6KDFxSx1jM2IGTIELvbPTCXCrSeevK0Mxh9xeQ0RT/HvAys3BHb8wsl5T8uZmsX95pIsQSd7gjJX+jOh+Jf2+0UvamjPA2W4ZlDDAmplCo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHED9/FG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECE7C4CEED;
	Tue, 17 Jun 2025 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155630;
	bh=ShE75AzzcjMtFveguCfs50L+tbA1hP344vJlSCdWg5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHED9/FG0fmuUoq4vdCO8uCeFLdJ/PDuIFbE+dRFUsFpqyRI/eXUdtCiRQEsLQOCa
	 GZGy22OTcbJoYqdPgheZ0jMD13xyWzgDY0Nu89PNkdOKVbBYkIwq4pchZni+NbvhQZ
	 xV2l+kCNBEYlEM3NS9TFCrbsXZhidBtGMcfK+FpYmTL3mbF9QuxwFj9UvH9NMv2I+A
	 DaEjWaCnJlmnl9PX8/w4c8pd1V+nRvYjJkVc9kOFVjEKEBiq65UVx+/t2ye+6RIsXo
	 +PZS1E+CnK0OqRTiimOV/WSQ3qxVxprHnscyq+5t8xpiD038xAt0nNZf+O5HjYCSti
	 X0bk1Uw4f/IBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRTQZ-000000005RT-0bGw;
	Tue, 17 Jun 2025 12:20:27 +0200
Date: Tue, 17 Jun 2025 12:20:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@kernel.org,
	sfr@canb.auug.org.au, linux-phy@lists.infradead.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aFFBa9ZESDheGAhr@hovoldconsulting.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
 <aELATuLue/Vs8lHz@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aELATuLue/Vs8lHz@hu-qianyu-lv.qualcomm.com>

On Fri, Jun 06, 2025 at 03:17:50AM -0700, Qiang Yu wrote:
> On Wed, Jun 04, 2025 at 05:10:19PM +0200, Johan Hovold wrote:
> > On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> > > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > 
> > > All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> > > clocks provided by the TCSR device.
> > 
> > As I just mentioned in the thread where this is still being discussed:
> > 
> > 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> > 
> > you need to provide a lot more detail on why you think modelling these
> > supplies as PHY supplies (which they are not) is the right thing to do.
> 
> TCSR_PCIE_xx_CLKREF_EN is not always in TCSR, they're custom
> bits to enable pieces of the distribution network. We always classify them
> as "TCSR" even though they're not always in that module.
> 
> So even if we put the QREF supplies in tscr device tree node, it still
> doesn't describe the hardware correctly as the hardware itself does't have
> a unified structure.

It still seems like a better approximation of the hardware.

> Since the TCSR_PCIE_xx_CLKREF_EN is only required by PCIe, why can't we
> model these supplies consumed by TCSR_PCIE_xx_CLKREF_EN as PHY supplies,
> treating PCIe PHY and TCSR_PCIE_xx_CLKREF_EN as a whole.

First, you are only adding one qref supply to the PHY binding, but
apparently there are two or three supplies needed per refclock on X1E
based on the mapping you provided below.

At least on the T14s, these additional qref supplies are identical to
the "phy" and "pll" supplies currently managed by the PHY driver, but is
that always guaranteed to be the case?

Second, the supply properties are supposed to reflect the actual supply
pins on the SoC, but the mapping from the qref supply pins to this new
"qref" supply cannot be inferred without access to internal
documentation. That mapping could go in a driver with a new binding
describing all of the qref supplies, which an integrator can easily
look up from the machine schematics. That driver would also handle any
ordering constraints between the supplies.

Third, what about the other TCSR reference clocks? On X1E there are at
least eleven that besides PCIe are used for USB, eDP and UFS. Don't you
risk disabling a qref supply underneath these drivers as well? A
complete mapping in a clock driver would take care of this too.

What does the mapping look like for the remaining TCSR clocks?

> > Also please answer the question I've asked three times now on how the
> > QREF supplies map to PHY supplies on X1E as no one will be able to use
> > this binding unless this is documented somewhere (and similar for other
> > SoCs).
> >
> 
> PCIe3,
> VDD_A_QREFS_0P875_0,
> VDD_A_QREFS_0P875_B,
> VDD_A_QREFS_1P2_B,
> 
> PCIe4,
> VDD_A_QREFS_0P875_B,
> VDD_A_QREFS_1P2_B
> 
> PCIe5,
> VDD_A_QREFS_0P875_2,
> VDD_A_QREFS_0P875_B,
> VDD_A_QREFS_1P2_B,
> 
> PCIe6
> VDD_A_QREFS_0P875_A,
> VDD_A_QREFS_1P2_A

Thanks for providing these.

Johan

