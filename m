Return-Path: <linux-arm-msm+bounces-60248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF89BACE0DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 16:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1F33A6F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B524A290DB1;
	Wed,  4 Jun 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvhgSFbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBD28FFF6;
	Wed,  4 Jun 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049178; cv=none; b=BE7Kki/V2AQYjlTBhLPHga45sTgpVuNxRkDnLlidcEOTwN767rDEGzRO0uBxzHW27y/kKKJqc4uhW0rnbHJIVbaMoxBue1G7maTRqwEB6O9/5HqI1mk2fvs0W+tBNI9XDGVBvFOk76Ha2lnjl+7dXFWx4sopemRT8gggDnYRfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049178; c=relaxed/simple;
	bh=wJsLEtGGSfzQUfeRpedxvZPZVDcyW+G0Ky8PAJCKb/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEZkUhNy12C/p9AtvFLvFDZ1F82RWAqfQ4jJ4T9dU03p/OIKrzNQqNy5EytY9OYCg0ULOIulkFKm8ZAQ1HAqt2GmIVIJtqNTmG85kNSRZMZLoqtZC0A0agwin4VJMfX4IEt8aaEYvagDTzqgy+PMvscRA4AyqRdOYj5w4uvktbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvhgSFbo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575E7C4CEEF;
	Wed,  4 Jun 2025 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049178;
	bh=wJsLEtGGSfzQUfeRpedxvZPZVDcyW+G0Ky8PAJCKb/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvhgSFbo5OA0fTglMBFbVarnMtKITK18FMO5UmtdmrI906yOD+zuwukrmEwfWushX
	 wvbzdnTfVYCy2MVV7s6QmlMYgMgPjdyGnETxZKnyPa61eN73UfverYxcNRxKIXzRVK
	 lndH4lqa5cwiIP1X2z8n2Aawj+zqA5xuKLqjAvuwH3VqCgm+2xKbxUHwJSgBc/hBUa
	 ToAL+ElA6Okw7UJbnMS3RTHC9UAc3rT+6klp9LUn0Uc24L7ikdhcWzrkYyFoVwuW5V
	 xAaahjWLOwgQt33Ea3Lt0IB8K8wVTcLrgDri490DmJV5LmwWQPPHRDr6rZRG7XiUTl
	 OH8ez2iGYuV/A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMpaZ-000000007f1-1W6J;
	Wed, 04 Jun 2025 16:59:36 +0200
Date: Wed, 4 Jun 2025 16:59:35 +0200
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
Message-ID: <aEBfV2M-ZqDF7aRz@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
 <aDRw2rJ39t9W10YG@hovoldconsulting.com>
 <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>

On Tue, May 27, 2025 at 12:50:21PM +0200, Konrad Dybcio wrote:
> On 5/26/25 3:47 PM, Johan Hovold wrote:
> > On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
> >> On 5/8/25 11:45 AM, Johan Hovold wrote:
> >>> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> >>>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> > 
> >>>>> This still looks wrong and you never replied to why these supplies
> >>>>> shouldn't be handled by the tcsr clock driver that supplies these
> >>>>> clocks:
> >>>>>
> >>>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> >>>
> >>>> Sorry, I thought Konrad had convinced you.
> >>>
> >>> IIRC, he just said you guys were told to add the QREF supply to the PHY.
> >>> That's not an argument.
> >>>
> >>>> If the TCSR driver manages these supplies, would it be possible for tscr
> >>>> driver to recognize when it needs to turn vdda-qref on or off for a
> >>>> specific PCIe port?
> >>>
> >>> Sure, just add a lookup table to the driver and enable the required
> >>> supplies when a ref clock is enabled.
> >>>
> >>> As I mentioned in the other thread, the T14s has the following QREF
> >>> supplies:
> >>>
> >>> 	
> >>> 	VDD_A_QREFS_1P2_A
> >>> 	VDD_A_QREFS_1P2_B
> >>>
> >>> 	VDD_A_QREFS_0P875_A
> >>> 	VDD_A_QREFS_0P875_B
> >>> 	VDD_A_QREFS_0P875_0
> >>> 	VDD_A_QREFS_0P875_2
> >>> 	VDD_A_QREFS_0P875_3
> >>>
> >>> and it's not clear how these maps to the various consumer ref clocks,
> >>> including the PCIe ones:
> >>>
> >>> 	#define TCSR_PCIE_2L_4_CLKREF_EN
> >>> 	#define TCSR_PCIE_2L_5_CLKREF_EN
> >>> 	#define TCSR_PCIE_8L_CLKREF_EN
> >>> 	#define TCSR_PCIE_4L_CLKREF_EN
> >>>
> >>> That mapping can be done by the TCSR clock driver (which would also take
> >>> care of the 1.2 V supplies).
> >>
> >> So we had an internal discussion about this and while it may work, it
> >> would only do so for some SoCs, and maybe only on the surface, as the
> >> wiring behind it is rather peculiar..
> > 
> > Care to expand on why it cannot be made to work generally?
> 
> "-ENODATA".. many connections are difficult to unambiguously decipher
> 
> > 
> > Also, what would the mapping of the above QREF supplies to PCIe PHYs
> > even look like?
> 
> I'm not sure I have a clear answer..

How would anyone know how to use a binding like this if you guys with
access to internal docs can't even answer how the QREF supplies maps to
the PHYs for a given SoC?

> >> Plus, not all QREF consumers have a clock expressed in TCSR as of
> >> right now.
> > 
> > Is that because there is no corresponding bit in the TCSR or simply
> > because it has not been described yet?
> 
> Unfortunately, the former.. Some IPs have a non-TCSR ref clock and
> some are presumably implicitly fed by BI_TCXO

I think you need to provide a lot more detail here so we can determine
how best best to proceed. We shouldn't accept made up PHY supplies
without a proper motivation just because that's how it's done
downstream.

Johan

