Return-Path: <linux-arm-msm+bounces-91706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM4eL3UogmnPPgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:55:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB2DC55E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF5B530CA64C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 16:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0809E3D333C;
	Tue,  3 Feb 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieUtLcs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950E3D3337;
	Tue,  3 Feb 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137490; cv=none; b=CigfI6cQZipyri8S/kWeBU3oHakXrlD+bKmxaxHCd+LcxI2MeyyFqPIJQLITfQzmrHXjFp/1bW7ymOYAbiUMZYmez1Lv47TJ5RPlvJm/8HLg9iIFvUaDZix65GEVGPkzAeQ3sM3blsqcH2Z3tvu3gOTwJuAmSRH/tOT1yUErycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137490; c=relaxed/simple;
	bh=YwmNYrs0metj7MAJTYKjECa1dv7h6VZI7Cy4c6ieIA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOxGTj68j41DkayytUQmsPqyAi8gTOjBsYfuFT2BFg2Cr6zFGAU118QSRwzPi5HeAeM7/0XDcCg7lYLQi3OvCHjcKb6l42rmb20eGabmWGvNLs2sAJJ4/Whwu1lhRoDkHYUtf38rlpv8IhrkkiL8+4g4xTHTMfdruOusmhMZGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieUtLcs2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FD3C19421;
	Tue,  3 Feb 2026 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770137490;
	bh=YwmNYrs0metj7MAJTYKjECa1dv7h6VZI7Cy4c6ieIA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieUtLcs2OeVPa+Ae7d6WDUIOOOOMAHd+RV3UtJQjKkm9g2uNa/Ql046H8T9CXbaRS
	 hu7PBKrnxiEttBPEQGkXgNc1tgR6B8zjjKNju2T4XvsBok3jacGZNKwuc2efOzUwkH
	 Iv7VYIgR+NWigZAzgvuYhpPxYSmtihpnqY3PfL+6nZXWCxNHrjKCt2MehArPhXuNUe
	 qookAJEOIzNR/gRDvdtpKEH3PttfJBlVUC0lXZ30TCEDipmGz/PtuqfnplAv0ejSFc
	 /6ObyznZjJv0Z/jX5lBpiqieLgfZoWGQq4C9O7XenEwiwhEuK/vTsr208w641Ofd50
	 TBAugiOzz3Z5A==
Date: Tue, 3 Feb 2026 10:51:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <hubwpankaj3fxgqotayjintiiafqzxk7yyxrxis76su2kpf67d@gzedj6xziukt>
References: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260202073322.259534-5-varadarajan.narayanan@oss.qualcomm.com>
 <px6xpdu2mafxunvvlx6svf3blyzh3w4le4c7jqgxqeerbsgq2d@3rsoiwpkcguu>
 <aYGQPZJP4ElKnIWP@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYGQPZJP4ElKnIWP@hu-varada-blr.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91706-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3BDB2DC55E
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:35:49AM +0530, Varadarajan Narayanan wrote:
> On Mon, Feb 02, 2026 at 08:04:41AM -0600, Bjorn Andersson wrote:
> > On Mon, Feb 02, 2026 at 01:03:22PM +0530, Varadarajan Narayanan wrote:
> > > RDP433 can have NAND or eMMC based on a board level rework. Since the
> > > same GPIOS are used for both the interfaces, only one of them can be
> > > used. Add a new DTS file to disable NAND and enable eMMC.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > > v4: Move sdhc properties to SoC dtsi.
> > >     Disable nand (that is enabled in ipq9574-rdp-common.dtsi) here as
> > >     the eMMC variant doesn't have NAND.
> > >
> > > v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
> > >     it here. Just enable eMMC.
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
> > >  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 24 +++++++++++++++++++
> > >  2 files changed, 25 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 6f34d5ed331c..d5fe12ef4300 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> > > -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > new file mode 100644
> > > index 000000000000..9053838ef696
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > @@ -0,0 +1,24 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause-Clear
> > > +/*
> > > + * IPQ9574 RDP433 (eMMC variant) board device tree source
> > > + *
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "ipq9574-rdp-common.dtsi"
> > > +#include "ipq9574-rdp433-common.dtsi"
> > > +
> > > +/ {
> > > +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
> > > +	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
> > > +};
> > > +
> > > +&qpic_nand {
> > > +	status = "disabled";
> > > +};
> >
> > I'd prefer you keep optional peripherals/buses disabled in the common
> > dtsi and enable them in respective dts, this generally gives cleaner
> > layers.
> >
> > Was this done on purpose?
> 
> Yes. Presently it qpic_nand is enabled in ipq9574-rdp-common.dtsi [1].
> Since removing that will impact other boards that include
> ipq9574-rdp-common.dtsi chose to disable it here.
> 

This is not a concern. Don't be afraid of fixing adjacent things to make
the whole look better.

> If this is not ok, will disable it in ipq9574-rdp-common.dtsi and enable
> qpic_nand in other board DT files that include ipq9574-rdp-common.dtsi.
> Please let me know.
> 

Please do.

Regards,
Bjorn

> Thanks
> Varada
> 
> 1 - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi#n182

