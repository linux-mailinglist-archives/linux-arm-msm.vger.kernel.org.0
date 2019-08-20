Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C2D95EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfHTMhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:37:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbfHTMhq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:37:46 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14F3B22CF7;
        Tue, 20 Aug 2019 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566304665;
        bh=KVRO40K8LpJzjIGn+3A2o1Q+Qh1PnUhVIwtYsn2qK/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NO3vUFDUX463WH6brpjs4dLrAldhlu8dziuly8uDtxpA7StcPFZjE7HXWTr+ZOnhh
         KtyA+D+Yml7EpqdI8GFWw1g9zbgdh6Ck+vawGicsbReK+9JfSC/DZl/S3+9WVFTAZP
         MlxoJASXKv4NrGoNpMQWZ8Cw7BPAfjiGWs/rZ4H8=
Date:   Tue, 20 Aug 2019 18:06:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm8150-mtp: add base dts file
Message-ID: <20190820123633.GC12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-6-vkoul@kernel.org>
 <20190820122645.GB31261@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820122645.GB31261@centauri>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-19, 14:26, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:13PM +0530, Vinod Koul wrote:
> > This add base DTS file for sm8150-mtp and enables boot to console, adds
> > tlmm reserved range, resin node, volume down key and also includes pmic
> > file.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile       |  1 +
> >  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 48 +++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 0a7e5dfce6f7..1964dacaf19b 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> > new file mode 100644
> > index 000000000000..80b15f4f07c8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2019, Linaro Limited
> > +
> > +/dts-v1/;
> > +
> > +#include "sm8150.dtsi"
> > +#include "pm8150.dtsi"
> > +#include "pm8150b.dtsi"
> > +#include "pm8150l.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. SM8150 MTP";
> > +	compatible = "qcom,sm8150-mtp";
> > +
> > +	aliases {
> > +		serial0 = &uart2;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +};
> > +
> > +&qupv3_id_1 {
> > +	status = "okay";
> > +};
> > +
> > +&pon {
> > +	pwrkey {
> > +		status = "okay";
> > +	};
> > +
> > +	resin {
> > +		compatible = "qcom,pm8941-resin";
> > +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> > +		debounce = <15625>;
> > +		bias-pull-up;
> > +		linux,code = <KEY_VOLUMEDOWN>;
> > +	};
> > +};
> 
> Missing a newline here.

Yup will updated

-- 
~Vinod
