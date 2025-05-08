Return-Path: <linux-arm-msm+bounces-57238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245E0AAF700
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 11:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 092F43B7BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3492A1D86DC;
	Thu,  8 May 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSX8cTI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CF1BEF7D;
	Thu,  8 May 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697519; cv=none; b=T0SVftNwQ9YYWPSLK3mYwJIGW18JHRnNlYNdNfD2dQL5OJ2/0tt+XO4oFT++hX2UO3YQwhQpW7CtmQkGA0dCddrPEaEwnkDgDiBrIGTht3hZPBWavYcFK94AbMnvFqBwqVFWYVhrS1Mu5Hj2ovlDPnC0AG3hEnD6zB/DXJIBbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697519; c=relaxed/simple;
	bh=Cc1Skj2gto0ryJBoXR8ewyIYTGM/x6xJbXVwlCnskmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpx2k1juhOsk2c/vZXOhqF7Ac53l9cyE1ajfOx3jYGGbG2xFlZVdqFw6D29cuqJAPfXho3bFTiNq4tbsaZUteBI351Jjr7vNYpcJRY4jMzwzuxPtQC7cs3Sdj/czhQEH/Cz3afeGO9RH5MT+KZ7z1XAKczMfA/jyxiR5SdHXxrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSX8cTI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0453C4CEE7;
	Thu,  8 May 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746697518;
	bh=Cc1Skj2gto0ryJBoXR8ewyIYTGM/x6xJbXVwlCnskmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSX8cTI8/vBABDZQ+rSYj4l9l4Wc8jSRifZt9YcFuePwFbmbajYbhXgA4oE3NGKhe
	 uWi/ifztGcQTxDHqk0qc/NJsZXS2VYyMEf+uX3YwRJmSGjP6UEMti1pKk1FYVMQ6Xs
	 bWeL65kOJcfpxSz0R7fnOhA8bOwr5aWMT6D99QL4RlAkW1QQKu0fx/LegWUsgHtdNL
	 wgVYKKA3ziMeBm+wuNGFc14nlVJuKlEojt89fj9iJDt/tiVzNy5hnNYBNmWTDs5Zsg
	 zai35rtmGOx0mZBACU/TO/IBhN3qMMUYSK1A7mchf7A0YsKb/juvK7s0/6cB6UmpmH
	 rAjeMbbwH0+JQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCxoa-000000000zp-0t46;
	Thu, 08 May 2025 11:45:16 +0200
Date: Thu, 8 May 2025 11:45:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
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
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>

On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> 
> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> > On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
> >> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>
> >> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> >> clocks provided by the TCSR device.
> > This still looks wrong and you never replied to why these supplies
> > shouldn't be handled by the tcsr clock driver that supplies these
> > clocks:
> >
> > 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/

> Sorry, I thought Konrad had convinced you.

IIRC, he just said you guys were told to add the QREF supply to the PHY.
That's not an argument.

> If the TCSR driver manages these supplies, would it be possible for tscr
> driver to recognize when it needs to turn vdda-qref on or off for a
> specific PCIe port?

Sure, just add a lookup table to the driver and enable the required
supplies when a ref clock is enabled.

As I mentioned in the other thread, the T14s has the following QREF
supplies:

	
	VDD_A_QREFS_1P2_A
	VDD_A_QREFS_1P2_B

	VDD_A_QREFS_0P875_A
	VDD_A_QREFS_0P875_B
	VDD_A_QREFS_0P875_0
	VDD_A_QREFS_0P875_2
	VDD_A_QREFS_0P875_3

and it's not clear how these maps to the various consumer ref clocks,
including the PCIe ones:

	#define TCSR_PCIE_2L_4_CLKREF_EN
	#define TCSR_PCIE_2L_5_CLKREF_EN
	#define TCSR_PCIE_8L_CLKREF_EN
	#define TCSR_PCIE_4L_CLKREF_EN

That mapping can be done by the TCSR clock driver (which would also take
care of the 1.2 V supplies).

Johan

