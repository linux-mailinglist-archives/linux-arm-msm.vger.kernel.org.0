Return-Path: <linux-arm-msm+bounces-59440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13470AC40A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE68618996ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099F120B813;
	Mon, 26 May 2025 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFET7oiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDE1F463B;
	Mon, 26 May 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267226; cv=none; b=X06IvbQb3IWQRHplakdxBUL+tiqBwj0d+BACjpQQtvC+AWc9u6sk6racy01jWgwZbGW3BuTyn26Q+X0jW9l4S0FnZQO96t+BdsogQzg6vLuE4MwqqNydZq9Iwv9q758PwdnlDzXB8grFSnJGD5gqpBpabJsqLeTXu4YcB3SMJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267226; c=relaxed/simple;
	bh=+uw55Nbvzmy9FIP+DbRI7fubC+YGBHVWZbVdo3cwGXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=If/69Xe0ZR0HlRJnZGgmSj1PG1xt8vaLTvCAYL/sgVmrpfQm/75xGFe4VPS4x2Cerk3G0Gz8ZsxRb6QLCfKdLLUH3n4jwvXpRpoqp+gRdg8ym4UMoFIgN4I7zrhWovYXdhXcbFHYqrfGLC96CHMCOBYkT3gcVS/UpaFJZ955m4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFET7oiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E36C4CEE7;
	Mon, 26 May 2025 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748267226;
	bh=+uw55Nbvzmy9FIP+DbRI7fubC+YGBHVWZbVdo3cwGXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFET7oiZCv2S5pqcYt2OWuU+DnRfYohENWFHzO/Tcht2eH6zoID3fSUPZXwerY66r
	 IUM0Zrglcad3bUC9ID2bRYC1Kspi/rN52PNt2eHMeH68jhDG/kJo3Wy+BXkiuImvUJ
	 mikk9wzRVHk5/Z87IAVRaUejfFTPvp9nEGvKYRDk4UELKkYlvqYABUuzvHSiiEw2pM
	 Kh93BTRBXrHg4AvarAYkvQTPPJ5hHC/MW5hn6TTW07f9l0w3g3wD5WEcoxcDzt/tcP
	 vbp6fXV5PqQiBfN3lMe6Eh/HZNEm+n+IUChv2x1cc3ol4osNC6io0daB3dmVgA4Y6V
	 5ZS5FKs+Fkw+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJYAU-000000006H8-3uM7;
	Mon, 26 May 2025 15:47:07 +0200
Date: Mon, 26 May 2025 15:47:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,
	Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
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
Message-ID: <aDRw2rJ39t9W10YG@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>

On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
> On 5/8/25 11:45 AM, Johan Hovold wrote:
> > On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> >> On 5/8/2025 4:20 PM, Johan Hovold wrote:

> >>> This still looks wrong and you never replied to why these supplies
> >>> shouldn't be handled by the tcsr clock driver that supplies these
> >>> clocks:
> >>>
> >>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> > 
> >> Sorry, I thought Konrad had convinced you.
> > 
> > IIRC, he just said you guys were told to add the QREF supply to the PHY.
> > That's not an argument.
> > 
> >> If the TCSR driver manages these supplies, would it be possible for tscr
> >> driver to recognize when it needs to turn vdda-qref on or off for a
> >> specific PCIe port?
> > 
> > Sure, just add a lookup table to the driver and enable the required
> > supplies when a ref clock is enabled.
> > 
> > As I mentioned in the other thread, the T14s has the following QREF
> > supplies:
> > 
> > 	
> > 	VDD_A_QREFS_1P2_A
> > 	VDD_A_QREFS_1P2_B
> > 
> > 	VDD_A_QREFS_0P875_A
> > 	VDD_A_QREFS_0P875_B
> > 	VDD_A_QREFS_0P875_0
> > 	VDD_A_QREFS_0P875_2
> > 	VDD_A_QREFS_0P875_3
> > 
> > and it's not clear how these maps to the various consumer ref clocks,
> > including the PCIe ones:
> > 
> > 	#define TCSR_PCIE_2L_4_CLKREF_EN
> > 	#define TCSR_PCIE_2L_5_CLKREF_EN
> > 	#define TCSR_PCIE_8L_CLKREF_EN
> > 	#define TCSR_PCIE_4L_CLKREF_EN
> > 
> > That mapping can be done by the TCSR clock driver (which would also take
> > care of the 1.2 V supplies).
> 
> So we had an internal discussion about this and while it may work, it
> would only do so for some SoCs, and maybe only on the surface, as the
> wiring behind it is rather peculiar..

Care to expand on why it cannot be made to work generally?

Also, what would the mapping of the above QREF supplies to PCIe PHYs
even look like?

> Plus, not all QREF consumers have a clock expressed in TCSR as of
> right now.

Is that because there is no corresponding bit in the TCSR or simply
because it has not been described yet?

Johan

