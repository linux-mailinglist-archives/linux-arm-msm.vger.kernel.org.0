Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E71309323
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 10:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhA3JSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 04:18:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbhA3EOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 23:14:32 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C871C0617AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 19:59:46 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id u15so6515248plf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 19:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zmqbQDHWa5qE1qWqd3ap0DMM/Xtz2uCqxKtJyp2MZuU=;
        b=KAksbMwVTssgr21laJJdDhf5lwzT2DY647zB1AjU1aOV+t3J5fgUyVAn+rWv3UCPzu
         5YZmAeZksWraf/xL8xmBBRx1xwWYfHyM2lBOkJoXQ57PoZr49xG95ozfnI8UG5qP9YG6
         yH7mGpIOdPzFUYXNXA+PN1CHjtRA8jc2IGpc5akrwO4A9n+/x3ubiBH2IDTe8XqDyHt9
         GupovsE3FRxezJ2BzrWCdNdy6cWGSr6jInIZSqXDomVb7JrDO1imVmttNOB6CUpNYZsp
         heXhOmDj3rithtjMxOkOPLUUcrPhpCxc1UCQHRBwv1bEVR3MKQgxj5mzqYvyQ2C7+wte
         kX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zmqbQDHWa5qE1qWqd3ap0DMM/Xtz2uCqxKtJyp2MZuU=;
        b=J9y9HQ6oeWDYRdRa/m3/vv58lIOFCQIqgdJCJ3mL0dSPIYYauG4gzfVnxvXINIp0Ba
         XJPv1cHqs7g4J2P/J9cnDrx/buGUXIy2cgcOa2uFVnpvG4qSPykPrCfIzWbRT4fM1tGu
         CbWfY0NUoT/yjVmZ60wt11x67xsjPqs/+11YAEznxkQF4u+BkQDrpxaZ1fewTLU6ZZZm
         QarAH9Es68qABjxyFyPQXcGIgcVA4nD6iK4QZPO30lzGuxLJHmZ+qSbOrMVTpgP5SKja
         beCXa/FYW5L0tYBSFNPjcoId8ozriuTyfJ7xRgHDstCy4ipMZASUQ8Ykz2hyGpwCmUkk
         JVww==
X-Gm-Message-State: AOAM530VvmcG0pwPK6n0oqHxd6P5iNPS889bqZiR3dl7OQPG9i9a+igo
        +lVuhh0EP4bWssJ/hH6kEeUM
X-Google-Smtp-Source: ABdhPJwvDyFGZs5+MrSQPiVrSF/8sOJDIsVyypz6GzMuyCULbQkLL3UmYWmA9QgzB161u8XpOgD99w==
X-Received: by 2002:a17:902:b94b:b029:e0:1e:da58 with SMTP id h11-20020a170902b94bb02900e0001eda58mr7695366pls.55.1611979185636;
        Fri, 29 Jan 2021 19:59:45 -0800 (PST)
Received: from work ([103.77.37.140])
        by smtp.gmail.com with ESMTPSA id a2sm9061524pjm.51.2021.01.29.19.59.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 19:59:45 -0800 (PST)
Date:   Sat, 30 Jan 2021 09:29:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: qcom: dts: qrb5165-rb5: add qca6391 power
 device
Message-ID: <20210130035939.GA3544@work>
References: <20210128175225.3102958-1-dmitry.baryshkov@linaro.org>
 <20210128175225.3102958-3-dmitry.baryshkov@linaro.org>
 <YBTW2et0IVCUGmdg@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBTW2et0IVCUGmdg@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 29, 2021 at 09:47:37PM -0600, Bjorn Andersson wrote:
> On Thu 28 Jan 11:52 CST 2021, Dmitry Baryshkov wrote:
> 
> > Add qca6391 to device tree as a way to provide power domain to WiFi and
> > BT parts of the chip.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 61 ++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > index 8aebc3660b11..2b0c1cc9333b 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > @@ -151,6 +151,23 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
> >  		regulator-max-microvolt = <1800000>;
> >  		regulator-always-on;
> >  	};
> > +
> > +	qca6391: qca6391 {
> > +		compatible = "qcom,qca6390";
> > +		#power-domain-cells = <0>;
> > +
> > +		vddaon-supply = <&vreg_s6a_0p95>;
> > +		vddpmu-supply = <&vreg_s2f_0p95>;
> > +		vddrfa1-supply = <&vreg_s2f_0p95>;
> > +		vddrfa2-supply = <&vreg_s8c_1p3>;
> > +		vddrfa3-supply = <&vreg_s5a_1p9>;
> > +		vddpcie1-supply = <&vreg_s8c_1p3>;
> > +		vddpcie2-supply = <&vreg_s5a_1p9>;
> > +		vddio-supply = <&vreg_s4a_1p8>;
> > +		pinctrl-names = "default", "active";
> > +		pinctrl-0 = <&wlan_default_state &bt_default_state>;
> > +		pinctrl-1 = <&wlan_active_state &bt_active_state>;
> 
> I dislike the use of pinctrl states for toggling the level of the gpio
> and would prefer that you use the gpio binding and api for this instead.
> 
> > +	};
> >  };
> >  
> >  &adsp {
> > @@ -1013,6 +1030,28 @@ &tlmm {
> >  		"HST_WLAN_UART_TX",
> >  		"HST_WLAN_UART_RX";
> >  
> > +	bt_default_state: bt-default-state {
> 
> Are you sure you need to drive the BT_EN pin in order to have WiFi
> working? On QCA6174 I believe the "WL_EN" was actually RESET_N and BT_EN
> was actually "blueooth enable" - so we wired that in the bluetooth node
> instead.
> 

IIRC, that's the case. We need both BT_EN and WL_EN for proper bringup of the
chip.

Thanks,
Mani
