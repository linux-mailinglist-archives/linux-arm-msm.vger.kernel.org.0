Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1705306C31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 05:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhA1EXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 23:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhA1EXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 23:23:35 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27085C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 20:22:55 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id h6so4717025oie.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 20:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O1OjT8zIKlV0ZCK1tBM/DkEt2nDZlUgna8AxTAM0HjE=;
        b=Kute2u9nsOXwFp7yoluyqjOpEwyICfdIVWIS0bmcpqcvuEO0TqjS2oDd+rAOZC5Kdo
         v72SJ/MfQiZ4Laf6LckSXyvFegjMVC+kuqplV8vmtsWV3BymP1RFwk3wuSfeg+tdUOkf
         hlnxHmwqqQcMKrbudy23DY6US5Rwbyd9YmX5gNQZYhE+NEWo3UpoVy1rK6CE04NNYT+2
         bWZZAx1H9uxfzl1F7JWVV+vO5NmK1BsXRy0qOzQY7oPV/PR9+gTHieI3zcfxfr6b86zZ
         w1HJrQfzMBLPi3PlIXedtQC772RWefPtf2Z11YBLYl8dE0LCAI6X4AjeD/TYloj00yDD
         zNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O1OjT8zIKlV0ZCK1tBM/DkEt2nDZlUgna8AxTAM0HjE=;
        b=CV5bw9EB5JzWc/x/imfFtoXsdryY+foq67Bniftp6QmT85Iy5aNFq75rPwJ43K+jP4
         BB+OL5EDMsXD+sBwqNuEg6GEul9srCEkaUGGlPsp11ndNdPlWLCSIvTeWa+9oIJDhi7o
         lT2OjwNbW/RSILsM0v6CeUoGFyG6O944QTUH26MtX27zodZdVKR2KBGD+H5uA/2hIxBn
         Vg/u+ae+XzhwEsfu4WP7OCs7yRRe5CO3ZlSH91fQoNznDEjk1QItT6aeXNvVeOHGOwEY
         LZmR6EyzCAIS4RG+cY6I/v7Xtm/43haiC8hLJXWu92CqQ+ClKkdcEM+OAr0gfNzHugtN
         25uw==
X-Gm-Message-State: AOAM532X7K781Lf3QcXLetnz5kxhDt9ynj8kZSd4DCC6kBRtVy61CWFl
        cOPxsHrK0oGZ1TPjJojOOe+lYQ==
X-Google-Smtp-Source: ABdhPJz9/+9CU1uj1vWZJogbcLUZnsFAExsfO+xUQunSfrn5WvbV3SPtE5ZB+Pl2GMuzS5qKZvkXEA==
X-Received: by 2002:a05:6808:213:: with SMTP id l19mr5244420oie.83.1611807774569;
        Wed, 27 Jan 2021 20:22:54 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a22sm785048otp.53.2021.01.27.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 20:22:53 -0800 (PST)
Date:   Wed, 27 Jan 2021 22:22:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add
 imu/magnetometer
Message-ID: <20210128042251.GB5254@yoga>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-4-jonathan.albrieux@gmail.com>
 <e5a65871-08bb-7da9-c298-921395ebf1f8@somainline.org>
 <YA2Xg9PboDMc/vu1@gerhold.net>
 <20210124194927.GA4448@jonathan-N53SV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124194927.GA4448@jonathan-N53SV>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 24 Jan 13:49 CST 2021, Jonathan Albrieux wrote:

> On Sun, Jan 24, 2021 at 04:51:31PM +0100, Stephan Gerhold wrote:
> > On Sun, Jan 24, 2021 at 04:07:19PM +0100, Konrad Dybcio wrote:
> > > > +&blsp_i2c3 {
> > > > +	status = "okay";
> > > > +
> > > > +	imu@68 {
> > > > +		compatible = "bosch,bmi160";
> > > > +		reg = <0x68>;
> > > > +
> > > > +		vdd-supply = <&pm8916_l17>;
> > > > +		vddio-supply = <&pm8916_l6>;
> > > > +
> > > > +		mount-matrix = "0", "1", "0",
> > > > +			      "-1", "0", "0",
> > > > +			       "0", "0", "1";
> > > > +	};
> > > > +
> > > > +	magnetometer@d {
> > > > +		compatible = "asahi-kasei,ak09911";
> > > > +		reg = <0x0d>;
> > > > +
> > > > +		vdd-supply = <&pm8916_l17>;
> > > > +		vid-supply = <&pm8916_l6>;
> > > > +
> > > > +		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
> > > > +
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&mag_reset_default>;
> > > > +	};
> > > > +};
> > > 
> > > Please sort I2C devices by their address.
> > > 
> > 
> > +1 :)
> > 
> Thank you Konrad, thank you Stephan, I'll fix the order!
> 
> > > 
> > > >  	};
> > > >  
> > > > +	mag_reset_default: mag-reset-default {
> > > > +		pins = "gpio111";
> > > > +		function = "gpio";
> > > > +
> > > > +		drive-strength = <2>;
> > > > +		bias-disable;
> > > > +	};
> > > > +
> > > 
> > > Please add this after gpio110 to keep it sorted gpio-number-wise.
> > > 
> > 
> > This is ordered alphabetically. I haven't seen gpio-number order
> > anywhere yet... :)
> > 
> Let me know if this order has to be changed, meanwhile I'll prepare
> a v2 for the i2c device order and will prepare a v3 in case this
> order too has to be changed.
> 

I'm happy with having these sorted alphabetically.

Regards,
Bjorn
