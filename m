Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74169301D52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbhAXPyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:54:31 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:10645 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbhAXPya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611503497;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=mbd2Z46jbjaElwOiqHX35x+sev/kx7KB9ymQ0iHBXmM=;
        b=clzideFZoLTGovCOdPKWsrVADFPY61UE1Me9VcTQyH3XLCnQ2+pg8XsfFJCudaWxQx
        9fl4+1fVlUG2CRvajB6Nn9BTRaVyR8PIXh7fXwzx9ghz1wkYb+6kgKpDHayMn6EuPHWF
        nM35p4y7A6ZTDnKzfVUr9p9dIGwqkKCy383LpGN8IvbRkrSbGg/xikvlJWI9yPIVRqqI
        Ug+7tyyQM30t8scOblBCOd58rKxI1bc3F7wSpLcufKFXI32WpHZGmD6UaF48vOpreK58
        +VF7B0Difo9GqBVLxlvWssZLRIWPTp88OUCZKl6QcpVhCGz2h751p0gqHRZgJFZcFpG4
        FkLg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczBa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0OFpWgSM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 24 Jan 2021 16:51:32 +0100 (CET)
Date:   Sun, 24 Jan 2021 16:51:31 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add
 imu/magnetometer
Message-ID: <YA2Xg9PboDMc/vu1@gerhold.net>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-4-jonathan.albrieux@gmail.com>
 <e5a65871-08bb-7da9-c298-921395ebf1f8@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5a65871-08bb-7da9-c298-921395ebf1f8@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 24, 2021 at 04:07:19PM +0100, Konrad Dybcio wrote:
> > +&blsp_i2c3 {
> > +	status = "okay";
> > +
> > +	imu@68 {
> > +		compatible = "bosch,bmi160";
> > +		reg = <0x68>;
> > +
> > +		vdd-supply = <&pm8916_l17>;
> > +		vddio-supply = <&pm8916_l6>;
> > +
> > +		mount-matrix = "0", "1", "0",
> > +			      "-1", "0", "0",
> > +			       "0", "0", "1";
> > +	};
> > +
> > +	magnetometer@d {
> > +		compatible = "asahi-kasei,ak09911";
> > +		reg = <0x0d>;
> > +
> > +		vdd-supply = <&pm8916_l17>;
> > +		vid-supply = <&pm8916_l6>;
> > +
> > +		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&mag_reset_default>;
> > +	};
> > +};
> 
> Please sort I2C devices by their address.
> 

+1 :)

> 
> >  	};
> >  
> > +	mag_reset_default: mag-reset-default {
> > +		pins = "gpio111";
> > +		function = "gpio";
> > +
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> 
> Please add this after gpio110 to keep it sorted gpio-number-wise.
> 

This is ordered alphabetically. I haven't seen gpio-number order
anywhere yet... :)

Thanks,
Stephan
