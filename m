Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55B0125BF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 08:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfLSHUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 02:20:36 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37276 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLSHUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 02:20:36 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so2089406pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 23:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kscgx3K8f9rm17CyfQ9LRYgvhZGZDTucQRqu6s3cXY8=;
        b=wUlqPM9OwvDSBUIguTphIAJetJoP7jzTbb4OIqI84eMHS3lsLy9/5tzHTOqCO7QIBw
         pJrS4iyWynSx5Lp6ccLVem+BqrD+MswvsMg3CoCWPsAo3Yu1MYcq4AOiYJmSYjzndq27
         EG+ib26O/X9xpIikIHi8G8mpEGH4B/tgc8M5+/u+wlWdqZZDwPgd/fVxwmw5G/1Rz5lh
         G4rXxgcmbAF4OVt44n+PpRTdze8k8ywufIRjdT5XJwifVPC1Zsp4Z2ZmBQsbaf0kIFj/
         nCJDLd5WCeDxqpRrB0ZlG/AJsmk+VA2atptI2W8+sXubVQiLg7pK2rQHCDq/P/TR6TMK
         nP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kscgx3K8f9rm17CyfQ9LRYgvhZGZDTucQRqu6s3cXY8=;
        b=dYTnBS9MYDB64p1OTJdbZtsIpdmEDnQrgVfvZbCFndIuB3T+1hc8rX7y80wTDoa6Bu
         FJTCocEdus9RA1WIJPgd7uibOSn4pRiOVPJhIr2CpP0AznyodqajWtkR1WXGUiKpYAcR
         8mIJ/SVf9TxAgip2eJQVOgsCZ/+VbFtRxIL7Nptyuoxyy3jAv0TFL6Af6lbRx+zBY8CR
         Tl6WuhrVjQjRD1ErIeKYvZ3pynvqxdTYwcCMv7n3v1WajqNzpiELyM2aWjUA2yKV0l8F
         vIu8RRRW68DlKRy9z93WjoxwdoFXTcKE9YuXkuXR23JWo4VUu9ZdHVRTh3MHSQzcB9yQ
         mI6Q==
X-Gm-Message-State: APjAAAVHwYhye+gVzv6bZ9gpxg0eza/C55visgkhu591fiFV0Iv+L4Kl
        UZokwfkECpWLr9rFR4TVHlL6mpvbK/Y=
X-Google-Smtp-Source: APXvYqwZDaVVbLJc92e8Bk8x6mCLD0JaErRln4COlsW6/zlSXZ0qymPWOOzXN9QDcgGQYfvmGi86Nw==
X-Received: by 2002:a17:902:7d84:: with SMTP id a4mr7303034plm.97.1576740034787;
        Wed, 18 Dec 2019 23:20:34 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q6sm6515119pfh.127.2019.12.18.23.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 23:20:34 -0800 (PST)
Date:   Wed, 18 Dec 2019 23:20:31 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     pillair@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device
 node
Message-ID: <20191219072031.GH448416@yoga>
References: <0101016ed018cde9-da3dc3e0-de6e-4b18-9add-bc6f88511ab2-000000@us-west-2.amazonses.com>
 <20191211072053.GH3143381@builder>
 <000b01d5b631$30ae26f0$920a74d0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000b01d5b631$30ae26f0$920a74d0$@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 21:57 PST 2019, pillair@codeaurora.org wrote:

> I will raise the next patchset with the comments addressed.
> 
> > -----Original Message-----
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Sent: Wednesday, December 11, 2019 12:51 PM
> > To: Rakesh Pillai <pillair@codeaurora.org>
> > Cc: devicetree@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
> > device node
> > 
> > On Wed 04 Dec 00:48 PST 2019, Rakesh Pillai wrote:
> > 
> > > Add device node for the ath10k SNOC platform driver probe
> > > and add resources required for WCN3990 on sc7180 soc.
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > ---
> > > This change is dependent on the below set of changes
> > > arm64: dts: sc7180: Add qupv3_0 and qupv3_1
> > (https://lore.kernel.org/patchwork/patch/1150367/)
> > 
> > Why?
> 
> The mentioned series of patchset brings the DTSI for sc7180.
> Hence the addition of wifi node is dependent on this series
> https://lore.kernel.org/patchwork/patch/1150367/
> 

I see, this should all be settled now. Looking forward to v2.

Thanks,
Bjorn

> 
> > 
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  4 ++++
> > >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> > +++++++++++++++++++++++++++
> > >  2 files changed, 31 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > index 189254f..8a6a760 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > @@ -248,6 +248,10 @@
> > >  	status = "okay";
> > >  };
> > >
> > > +&wifi {
> > > +	status = "okay";
> > 
> > Please conclude on the representation of the "skip-hyp-mem-assign" and
> > add it here, rather than in a subsequent patch - which implies that this
> > patch doesn't work on its own.
> 
> 
> Sure, I will update the next patchset.
> 
> 
> > 
> > > +};
> > > +
> > >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> > >
> > >  &qup_i2c2_default {
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 666e9b9..40c9971 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > @@ -42,6 +42,12 @@
> > >  			compatible = "qcom,cmd-db";
> > >  			no-map;
> > >  		};
> > > +
> > > +		wlan_fw_mem: wlan_fw_region@93900000 {
> > 
> > wlan_fw_mem: memory@93900000 {
> > 
> > > +			compatible = "removed-dma-pool";
> > > +			no-map;
> > > +			reg = <0 0x93900000 0 0x200000>;
> > > +		};
> > >  	};
> > >
> > >  	cpus {
> > > @@ -1119,6 +1125,27 @@
> > >  				#clock-cells = <1>;
> > >  			};
> > >  		};
> > > +
> > > +		wifi: wifi@18800000 {
> > > +			status = "disabled";
> > > +			compatible = "qcom,wcn3990-wifi";
> > > +			reg = <0 0x18800000 0 0x800000>;
> > > +			reg-names = "membase";
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
> > 
> > No iommus in sc7180?
> > 
> > Regards,
> > Bjorn
> > 
> > > +		};
> > >  	};
> > >
> > >  	timer {
> > > --
> > > 2.7.4
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
