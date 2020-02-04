Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8A9151E62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 17:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgBDQhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 11:37:15 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:16797 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727388AbgBDQhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 11:37:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580834234; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=agoXjFrnTmxkOUbSigXOO4ODx6+TcOAJBzPUjhLzlBM=; b=d+oSMv8hHDjbHLuwjkBIKcjvQ3rrYid8JLBs6IVkyKUUnegBuNT9x9WS/CeWJZ4ZdNybl+3L
 2j8ADFfnHNaz/OKgeVDWgQes0HBNdtQMu2bRXhRBDDvheV2DObBuuqJ47n9ZVOBvk5d9fSCf
 WdJO2dCPvauVcMvWSydULkRe+TM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e399db6.7fd838397030-smtp-out-n03;
 Tue, 04 Feb 2020 16:37:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3EFD8C447A1; Tue,  4 Feb 2020 16:37:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.68.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68156C43383;
        Tue,  4 Feb 2020 16:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68156C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1580281223-2759-1-git-send-email-pillair@codeaurora.org> <20200203173500.GB3948@builder>
In-Reply-To: <20200203173500.GB3948@builder>
Subject: RE: [PATCH v5] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Tue, 4 Feb 2020 22:07:02 +0530
Message-ID: <000001d5db79$5814edb0$083ec910$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHPh76zXXDoz9WIzFQCmi0NWmaUmALbmOLiqAEGNCA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,
I have addressed your comments and sent out the v6 for this patch.

Thanks,
Rakesh Pillai.

> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: Monday, February 3, 2020 11:05 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: Re: [PATCH v5] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
> 
> On Tue 28 Jan 23:00 PST 2020, Rakesh Pillai wrote:
> 
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28
> ++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 388f50a..167f68ac 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -287,6 +287,11 @@
> >  	vdda-pll-supply = <&vreg_l4a_0p8>;
> >  };
> >
> > +&wifi {
> > +	status = "okay";
> > +	qcom,msa-fixed-perm;
> > +};
> > +
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >
> >  &qspi_clk {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 8011c5f..0a00c94 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -75,6 +75,12 @@
> >  			reg = <0x0 0x80900000 0x0 0x200000>;
> >  			no-map;
> >  		};
> > +
> > +		wlan_fw_mem: memory@93900000 {
> > +			compatible = "removed-dma-pool";
> 
> Sorry for not spotting this earlier, the "removed-dma-pool" compatible
> is a downstream thing and isn't defined upstream.
> 
> > +                     no-map;
> > +                     reg = <0 0x93900000 0 0x200000>;
> 
> If you swap the order of no-map and reg in this node it will look like
> all the others.
> 
> 
> Apart from that the patch looks good.
> 
> Regards,
> Bjorn
> 
> > +		};
> >  	};
> >
> >  	cpus {
> > @@ -1490,6 +1496,28 @@
> >
> >  			#freq-domain-cells = <1>;
> >  		};
> > +
> > +		wifi: wifi@18800000 {
> > +			compatible = "qcom,wcn3990-wifi";
> > +			reg = <0 0x18800000 0 0x800000>;
> > +			reg-names = "membase";
> > +			iommus = <&apps_smmu 0xc0 0x1>;
> > +			interrupts =
> > +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0
> */ >,
> > +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1
> */ >,
> > +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2
> */ >,
> > +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3
> */ >,
> > +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4
> */ >,
> > +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5
> */ >,
> > +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6
> */ >,
> > +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7
> */ >,
> > +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8
> */ >,
> > +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9
> */ >,
> > +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10
> */>,
> > +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11
> */>;
> > +			memory-region = <&wlan_fw_mem>;
> > +			status = "disabled";
> > +		};
> >  	};
> >
> >  	thermal-zones {
> > --
> > 2.7.4
> >
