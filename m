Return-Path: <linux-arm-msm+bounces-87361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB493CF1CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 05:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C5C3300FF8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 04:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665A23233E8;
	Mon,  5 Jan 2026 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7GZ72+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095A322B69;
	Mon,  5 Jan 2026 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767587947; cv=none; b=Tu/pVVw89ISoU6etlqF0/WYdAt+sZluSgB3njOV40RdlABeAyTYt2vHsWFcrarrJrx3eOGq0Z8dC9Ywp+XnTzjbgzA+WusxZLNa8l8bf9FvjBnNiDnQkjmboxbs6k78SRYxhs3zeHJ6os0hVninirZJ2p0HL8HJHEmN5ucMrykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767587947; c=relaxed/simple;
	bh=P3Jq1/GVbTG8qT5KcFiU+nHcsgTcm+kO3ZGimEdDNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRPClii5l9cN0myeniOP98c1V+VI0v57zktX02xycX3DnLamUBjwt6ebmKmJkFSFMj8kqsBXz79Ee41IfuEkzHK9cTtRUBdAchrm5DQxCz+5kNeiGOBj56+D1L6fgKVx7AfZkq2XjtOi2oShihC0aqfjqTh3QEtikzK+M+A0dpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7GZ72+m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95908C116D0;
	Mon,  5 Jan 2026 04:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767587945;
	bh=P3Jq1/GVbTG8qT5KcFiU+nHcsgTcm+kO3ZGimEdDNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7GZ72+mIQ4KRIyoikDFPLu/wxaryCH0j+pq4JyW5qik0/eGYC/otBRpeiF2z+Wah
	 PEmtkWlcYNl6No9/if9sJkNJD+ZAvMwwtO0gQxeywkG2X7WldXCittCfP1cbxUVoB0
	 ypI7ghlGueNq3dh9wMlBe52zGQrnnkvNF/8Ddegx1vMSNF23UzqfCVTvGKVRWPUnr1
	 wEqIpQhIsWRG2JMSvdGXxz4DhWbSaSpVE/eXgZJQOwdenM2s70h6a0yPKBtjgIOQjk
	 xDAfIg7v2T1tRFlyqjhA2Bd8jNt3K1+BNPKA58CsEIMrpcHzt/WMt+D6Dkxs7/XC0p
	 LGU9vKhOEszyQ==
Date: Mon, 5 Jan 2026 10:08:58 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <aVtAYqwmjPPRmWzV@sumit-xelite>
References: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
 <e00630b9-56f0-4a30-84ef-8b691ea7af3e@kernel.org>
 <nbmkrvppluonhvs7gjttsyw2nvxq45y44rz6f5w2ytci2mq3sx@m7c5nc5pujll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nbmkrvppluonhvs7gjttsyw2nvxq45y44rz6f5w2ytci2mq3sx@m7c5nc5pujll>

On Fri, Jan 02, 2026 at 02:09:04PM -0600, Bjorn Andersson wrote:
> On Fri, Jan 02, 2026 at 12:08:03PM +0100, Krzysztof Kozlowski wrote:
> > On 02/01/2026 11:46, Varadarajan Narayanan wrote:
> > > RDP433 can have NAND or eMMC based on a board level rework. Since the
> > > same GPIOS are used for both the interfaces, only one of them can be
> > > used. Add a new DTS file to disable NAND and enable eMMC.
> > > 
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
> > >  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
> > >  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 26 +++++++++++++++
> > >  3 files changed, 59 insertions(+), 1 deletion(-)
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
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > index bdb396afb992..e4ae79b2fcd9 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > @@ -169,6 +169,38 @@ data-pins {
> > >  			bias-disable;
> > >  		};
> > >  	};
> > > +
> > > +	sdc_default_state: sdc-default-state {
> > > +		clk-pins {
> > > +			pins = "gpio5";
> > > +			function = "sdc_clk";
> > > +			drive-strength = <8>;
> > > +			bias-disable;
> > > +		};
> > > +
> > > +		cmd-pins {
> > > +			pins = "gpio4";
> > > +			function = "sdc_cmd";
> > > +			drive-strength = <8>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		data-pins {
> > > +			pins = "gpio0", "gpio1", "gpio2",
> > > +			       "gpio3", "gpio6", "gpio7",
> > > +			       "gpio8", "gpio9";
> > > +			function = "sdc_data";
> > > +			drive-strength = <8>;
> > > +			bias-pull-up;
> > > +		};
> > > +
> > > +		rclk-pins {
> > > +			pins = "gpio10";
> > > +			function = "sdc_rclk";
> > > +			drive-strength = <8>;
> > > +			bias-pull-down;
> > > +		};
> > > +	};
> > >  };
> > >  
> > >  &qpic_bam {
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > new file mode 100644
> > > index 000000000000..ffd96b1b1c65
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > 
> > Odd license. We don't take GPL v3.
> > 
> > > +/*
> > > + * IPQ9574 RDP433 eMMC board variant device tree source
> > > + *
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "ipq9574-rdp433.dts"
> > 
> > I find it discouraged practice. Although if Bjorn is fine with it, you
> > still need proper compatibles.
> > 
> 
> Nah, I don't fancy including .dts files. But I do see that I've let a
> few of those slip by over the years.
> 
> The general approach for these cases has been to rename dts->dtsi and
> create the two dts files.

That sounds better to me.

> 
> I wonder though if this would be better served by an overlay, as it's
> the same board, but with modifications applied?

I am not sure how overlay is a better fit here. AFAIK, the DT overlay is
generally used for plug and play hardware mezzanines. But here we are
dealing with the default boot medium which can either be eMMC or NAND.
Can a developer easily reverse the board modifications to boot from a
different medium?

And this DT is not only going to be consumed by the kernel but rather
the bootloader (U-Boot) in this case where there isn't a concept of DT
overlays which the prior stage can apply.

-Sumit

