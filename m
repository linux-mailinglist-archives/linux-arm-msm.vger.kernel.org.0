Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D471301E85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 20:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbhAXTuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 14:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbhAXTuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 14:50:18 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52BAC061573;
        Sun, 24 Jan 2021 11:49:37 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 190so8797162wmz.0;
        Sun, 24 Jan 2021 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WxlDaXjZhg8DEoZJ+1pFxepmNJMM06kIVYEUk9peK4c=;
        b=JUnNeA+XGRToU53iW/+OwBMlIZYmPl/fpltLJD0P0haa+33DlM8dtM5aw1KlVRmD0E
         os3sNIHRQkWspmTftgp20QMu6SsJI2tmiUOBUbg8I2uRsSwS34CyGaCCckZbgpbew61t
         slLRAdvn8hRakHef3P7fCAQOAd/Q/sKzkK+HrgE+q+ARMTcgBl/WFuSfBE79oBjZ9vI/
         Gms0pZDxgA0qJbevrb4NW2Vy0lBT4qaSzitnfzjEsXY5gur8QBwNA4nLzZZrkxHVSmNZ
         kvbqb7bX6/CJ8iBtI9WjzhJ2ewqaWEoArYDhgGrJaZYE91tcKNFzUVuiD8A2wNESgVrq
         X/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WxlDaXjZhg8DEoZJ+1pFxepmNJMM06kIVYEUk9peK4c=;
        b=dCnnwrnu2sMxriUn1/d252qNBuLZK6D4p28uJ2bOoF4PBXCkwYmUjLq2u3MKkESJol
         23kEeOTvQut2lA48ytCV60Sd0OD3NVg9Wx/3OWRXSBvmhv49i9AMnQSK6IrQAbgS2vJs
         BFpI+Lbl5dAdohYNxGKohAiqB/4fm3N8kVMFF5ep+n5oYnotr52kMGNblq4kisCO3kgR
         29GGH8phY74scf0Ofb9QiZH/NrGzJPpuB+yK9pLRas0895RYAJRkpxYpi+P/7Sl95ZgQ
         /giHU1CP7NuLQ0/zWqtD8IWozU0DXUAFVYC9Qj/a8F3zyS1TycgsEHdCXhBSSMkIUp+z
         zx8w==
X-Gm-Message-State: AOAM531mfn1izZ6H+QqwH0wn1rHDUNHP8tXf3dKNF4H777gyDaleOSqp
        Q2zfTzCrl7DAjLkEweXLrbnfEEWYYZVkMw==
X-Google-Smtp-Source: ABdhPJxhjQbD9ClysWrdJ/vg2uNhv/Kar0+iKc7K2h/Nro2S0kz7ITxObaROI/zsessxCc3Kjor7BA==
X-Received: by 2002:a1c:6608:: with SMTP id a8mr3291246wmc.132.1611517776465;
        Sun, 24 Jan 2021 11:49:36 -0800 (PST)
Received: from jonathan-N53SV ([151.81.101.204])
        by smtp.gmail.com with ESMTPSA id e12sm5370315wrs.67.2021.01.24.11.49.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Jan 2021 11:49:35 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:49:27 +0100
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add
 imu/magnetometer
Message-ID: <20210124194927.GA4448@jonathan-N53SV>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-4-jonathan.albrieux@gmail.com>
 <e5a65871-08bb-7da9-c298-921395ebf1f8@somainline.org>
 <YA2Xg9PboDMc/vu1@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA2Xg9PboDMc/vu1@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 24, 2021 at 04:51:31PM +0100, Stephan Gerhold wrote:
> On Sun, Jan 24, 2021 at 04:07:19PM +0100, Konrad Dybcio wrote:
> > > +&blsp_i2c3 {
> > > +	status = "okay";
> > > +
> > > +	imu@68 {
> > > +		compatible = "bosch,bmi160";
> > > +		reg = <0x68>;
> > > +
> > > +		vdd-supply = <&pm8916_l17>;
> > > +		vddio-supply = <&pm8916_l6>;
> > > +
> > > +		mount-matrix = "0", "1", "0",
> > > +			      "-1", "0", "0",
> > > +			       "0", "0", "1";
> > > +	};
> > > +
> > > +	magnetometer@d {
> > > +		compatible = "asahi-kasei,ak09911";
> > > +		reg = <0x0d>;
> > > +
> > > +		vdd-supply = <&pm8916_l17>;
> > > +		vid-supply = <&pm8916_l6>;
> > > +
> > > +		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&mag_reset_default>;
> > > +	};
> > > +};
> > 
> > Please sort I2C devices by their address.
> > 
> 
> +1 :)
> 
Thank you Konrad, thank you Stephan, I'll fix the order!

> > 
> > >  	};
> > >  
> > > +	mag_reset_default: mag-reset-default {
> > > +		pins = "gpio111";
> > > +		function = "gpio";
> > > +
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +	};
> > > +
> > 
> > Please add this after gpio110 to keep it sorted gpio-number-wise.
> > 
> 
> This is ordered alphabetically. I haven't seen gpio-number order
> anywhere yet... :)
> 
Let me know if this order has to be changed, meanwhile I'll prepare
a v2 for the i2c device order and will prepare a v3 in case this
order too has to be changed.

Again, thank you,
Jonathan

> Thanks,
> Stephan
