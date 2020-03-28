Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69FF196873
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 19:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgC1SbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 14:31:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34772 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgC1SbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 14:31:01 -0400
Received: by mail-pf1-f194.google.com with SMTP id 23so6314027pfj.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+mVck/pOJv55KYF3ZzMyTGWgs0RFVKHx1LKbGb8RbSs=;
        b=bj4M59RKtnKKUaVQsWvI4u4nhhvyXqBegUEMmfvGKXIBT/mika1RpNwaWwGdABjLzu
         PeSQC2Yl7lqu+IJJl8x6vzppsEG8QEMztXC0LIAjp1v9FU2NPx+XdMCJw+jmd61ds2Nl
         iqzOUHjLA2yTibgvFUBRLUYtzTKkbmCHs/u57EqL332uswGIi+iTTmNCOAotm68VVlbd
         VfRuNm949tV4tyVoq+ouNy1HbzLKzDE4rM6qHY5mS7PKnK64W3GrNA8geQzMiOk/BupI
         aUBhsFQsxGhS7vjn9/PCWhe1j2VzrBOCgHUk1bGK9XJgJGBK9TyvwyNN31JojGWzluUB
         YKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+mVck/pOJv55KYF3ZzMyTGWgs0RFVKHx1LKbGb8RbSs=;
        b=MAUhx42db6XXmg46FU/PYSb4g3yU7EGn69RvrR0FSLkALHeUEQ51p9xcbeabG43C3V
         6KFt/PLKWWxE6VeGYoACjDs/lBAADEBK3k32LEXhcsOC0dtaKpKhoFJekGgbRyxpkld1
         xXqfD3cc3ujcCkDtKbjO0lSGMVQF9B3pcwlq5xPEt7FpSCfJz8PU8L7A9KPw9Vo6sGtq
         c7IH8Xb8nIs1yz/J9BiBllmBzY2WKOugAn+myuRe5UeK0FGJBYtmp6M702qAwsgQoH9C
         LO40su+Ylfnk6YY4iMDiNBWaMkgQm9IlmiJoKRCtDnBDZgO79Co9TF9bkHEGop1Z4ZLy
         wd5Q==
X-Gm-Message-State: ANhLgQ2O8KLRczd94fWrHb62aL1DO9mQWAnXx5ErDttoiaTzI2ZqyWDJ
        bbw2u+UZj7MtV2YN2Mnjb8MtLom6fqk=
X-Google-Smtp-Source: ADFU+vvaKrpy0yv4Pq6rQuQ4KMnEp88icJyuuxyYhbQEtG7ooH+mR8DMcc8VezWIPH5TZPc9M4fJiA==
X-Received: by 2002:a63:7f05:: with SMTP id a5mr5336763pgd.327.1585420258811;
        Sat, 28 Mar 2020 11:30:58 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 79sm6691688pfz.23.2020.03.28.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 11:30:58 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:30:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     pillair@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20200328183055.GA663905@yoga>
References: <1585219723-28323-1-git-send-email-pillair@codeaurora.org>
 <20200327230025.GJ5063@builder>
 <000101d604f8$afc48220$0f4d8660$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000101d604f8$afc48220$0f4d8660$@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 28 Mar 05:01 PDT 2020, pillair@codeaurora.org wrote:

> Hi Bjorn,
>  Comments inline.
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Sent: Saturday, March 28, 2020 4:30 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>
> > Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-
> > kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> > Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> > module device node
> > 
> > On Thu 26 Mar 03:48 PDT 2020, Rakesh Pillai wrote:
> > 
> > > Add device node for the ath10k SNOC platform driver probe
> > > and add resources required for WCN3990 on sc7180 soc.
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > ---
> > >
> > > Depends on https://patchwork.kernel.org/patch/11455345/
> > > The above patch adds the dt-bindings for wifi-firmware
> > > subnode
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  8 ++++++++
> > >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> > +++++++++++++++++++++++++++
> > >  2 files changed, 35 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > index 043c9b9..a6168a4 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > @@ -327,6 +327,14 @@
> > >  	};
> > >  };
> > >
> > > +&wifi {
> > > +	status = "okay";
> > > +	qcom,msa-fixed-perm;
> > > +	wifi-firmware {
> > > +		iommus = <&apps_smmu 0xc2 0x1>;
> > 
> > How is sc7180 different from sdm845, where the iommus property goes
> > directly in the &wifi node?
> 
> Sc7180 IDP is a target without TrustZone support and also with S2 IOMMU
> enabled.
> Since in Trustzone based targets, the iommu SID configuration was done by
> TZ, there was nothing required to be done by driver.
> But in non-TZ based targets, the IOMMU mappings need to be done by the
> driver.
> Since this is the mapping of the firmware memory and to keep it different
> from the driver memory access, a different device has been created for
> firmware and these SIDs are configured.
> 

I see, I missed the fact that 0xc0:1 is used in the &wifi node itself.

So to confirm, we have streams 0xc0 and 0xc1 for data pipes and 0xc2 and
0xc3 for some form of firmware access? And in the normal Qualcomm design
implementation the 0c2/0xc3 stream mapping is setup by TZ, and hidden
from Linux using the SMMU virtualisation?


Would have been nice to have some better mechanism for describing
multi-connected hardware block, than to sprinkle dummy nodes all over
the DT...

Regards,
Bjorn

> The below ath10k series brings-in this support.
> https://patchwork.kernel.org/project/linux-wireless/list/?series=261367&stat
> e=* 
> 
> Thanks,
> Rakesh Pillai.
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > +	};
> > > +};
> > > +
> > >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> > >
> > >  &qspi_clk {
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 998f101..2745128 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > @@ -83,6 +83,11 @@
> > >  			reg = <0 0x8f600000 0 0x500000>;
> > >  			no-map;
> > >  		};
> > > +
> > > +		wlan_fw_mem: memory@94104000 {
> > > +			reg = <0 0x94104000 0 0x200000>;
> > > +			no-map;
> > > +		};
> > >  	};
> > >
> > >  	cpus {
> > > @@ -835,6 +840,28 @@
> > >  			};
> > >  		};
> > >
> > > +		wifi: wifi@18800000 {
> > > +			compatible = "qcom,wcn3990-wifi";
> > > +			reg = <0 0x18800000 0 0x800000>;
> > > +			reg-names = "membase";
> > > +			iommus = <&apps_smmu 0xc0 0x1>;
> > > +			interrupts =
> > > +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0
> > */ >,
> > > +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1
> > */ >,
> > > +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2
> > */ >,
> > > +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3
> > */ >,
> > > +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4
> > */ >,
> > > +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5
> > */ >,
> > > +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6
> > */ >,
> > > +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7
> > */ >,
> > > +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8
> > */ >,
> > > +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9
> > */ >,
> > > +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10
> > */>,
> > > +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11
> > */>;
> > > +			memory-region = <&wlan_fw_mem>;
> > > +			status = "disabled";
> > > +		};
> > > +
> > >  		config_noc: interconnect@1500000 {
> > >  			compatible = "qcom,sc7180-config-noc";
> > >  			reg = <0 0x01500000 0 0x28000>;
> > > --
> > > 2.7.4
