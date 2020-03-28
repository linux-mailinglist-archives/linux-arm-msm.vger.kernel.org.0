Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1F91965EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 13:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgC1MCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 08:02:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40459 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726045AbgC1MCU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 08:02:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585396939; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=zzBLtQ+//D0bBXPqSlcrMZohpTUdmpgajv0NPqBclSs=; b=NgZNsZ/c5XV8ITXHbpB4VIWvrIaSiGbEMD9RRrkFNsYbqGwrfepUaKxRyF1j03vkhz5CSg/k
 kApcvX/Vk3M91WK1xPU9lxHEq80Dg7LUrqiUefkaRi4gVTtbayZtopt/HhkXb8Wer7DQd8MG
 Zc9cgq0MbRyIwGCmOb3Sqg47X8Y=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7f3cb9.7f7608415458-smtp-out-n04;
 Sat, 28 Mar 2020 12:02:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2FFCC433F2; Sat, 28 Mar 2020 12:02:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.66.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86CE5C433D2;
        Sat, 28 Mar 2020 12:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86CE5C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1585219723-28323-1-git-send-email-pillair@codeaurora.org> <20200327230025.GJ5063@builder>
In-Reply-To: <20200327230025.GJ5063@builder>
Subject: RE: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Sat, 28 Mar 2020 17:31:52 +0530
Message-ID: <000101d604f8$afc48220$0f4d8660$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFGsu5WNDBp+FP/TOeyoiVSrY11cwGGydAyqXBTCQA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,
 Comments inline.


> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: Saturday, March 28, 2020 4:30 AM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> module device node
> 
> On Thu 26 Mar 03:48 PDT 2020, Rakesh Pillai wrote:
> 
> > Add device node for the ath10k SNOC platform driver probe
> > and add resources required for WCN3990 on sc7180 soc.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >
> > Depends on https://patchwork.kernel.org/patch/11455345/
> > The above patch adds the dt-bindings for wifi-firmware
> > subnode
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  8 ++++++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> +++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 043c9b9..a6168a4 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -327,6 +327,14 @@
> >  	};
> >  };
> >
> > +&wifi {
> > +	status = "okay";
> > +	qcom,msa-fixed-perm;
> > +	wifi-firmware {
> > +		iommus = <&apps_smmu 0xc2 0x1>;
> 
> How is sc7180 different from sdm845, where the iommus property goes
> directly in the &wifi node?

Sc7180 IDP is a target without TrustZone support and also with S2 IOMMU
enabled.
Since in Trustzone based targets, the iommu SID configuration was done by
TZ, there was nothing required to be done by driver.
But in non-TZ based targets, the IOMMU mappings need to be done by the
driver.
Since this is the mapping of the firmware memory and to keep it different
from the driver memory access, a different device has been created for
firmware and these SIDs are configured.

The below ath10k series brings-in this support.
https://patchwork.kernel.org/project/linux-wireless/list/?series=261367&stat
e=* 

Thanks,
Rakesh Pillai.

> 
> Regards,
> Bjorn
> 
> > +	};
> > +};
> > +
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> >
> >  &qspi_clk {
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 998f101..2745128 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -83,6 +83,11 @@
> >  			reg = <0 0x8f600000 0 0x500000>;
> >  			no-map;
> >  		};
> > +
> > +		wlan_fw_mem: memory@94104000 {
> > +			reg = <0 0x94104000 0 0x200000>;
> > +			no-map;
> > +		};
> >  	};
> >
> >  	cpus {
> > @@ -835,6 +840,28 @@
> >  			};
> >  		};
> >
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
> > +
> >  		config_noc: interconnect@1500000 {
> >  			compatible = "qcom,sc7180-config-noc";
> >  			reg = <0 0x01500000 0 0x28000>;
> > --
> > 2.7.4
