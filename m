Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 163764FB2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 12:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfFWKxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 06:53:34 -0400
Received: from onstation.org ([52.200.56.107]:35478 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbfFWKxe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 06:53:34 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BE38C3E951;
        Sun, 23 Jun 2019 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561287212;
        bh=QWDzJTgK2u7G6sVT2aNJPw8wBx+pnsIuHGrHBw4hX1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SylbMrRuiOpN+Ee4P8jjYh0jWnVZKwulHNxQV4dWtYocaTVcBa+/PJSnMhp9LvI+S
         uvG0O/rv8p5g0s2cuL4rw5aUVVcBJitbSXMwx+6oGa+Ss7yl34WPGBMQPFU5E/RPk6
         UUEIzMp5beHwB+fPqSUYXjd8m4Y0HrSj1BLAlkmc=
Date:   Sun, 23 Jun 2019 06:53:32 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Message-ID: <20190623105332.GA25506@onstation.org>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
 <20190529101231.GA14540@basecamp>
 <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen and Thierry,

On Fri, May 31, 2019 at 12:51:38PM +0200, Linus Walleij wrote:
> On Wed, May 29, 2019 at 12:12 PM Brian Masney <masneyb@onstation.org> wrote:
> 
> > My first revision of this vibrator driver used the Linux PWM framework
> > due to the variable duty cycle:
> 
> So what I perceive if I get the thread right is that actually a lot of
> qcom clocks (all with the M/N/D counter set-up) have variable duty
> cycle. Very few consumers use that feature.
> 
> It would be a bit much to ask that they all be implemented as PWMs
> and then cast into clocks for the 50/50 dutycycle case, I get that.
> 
> What about simply doing both?
> 
> Export the same clocks from the clk and pwm frameworks and be
> happy. Of course with some mutex inside the driver so that it can't
> be used from both ends at the same time.

Do you have any feedback about this? As far as I understand, there are
two options on the table right now:

1) Add support for the duty cycle to the qcom clk driver and write a
   general purpose clk-vibra driver for the input subsystem.

2) Do what Linus suggests above. We can use v1 of this series from last
   September (see below for link) that adds this to the pwm subsystem.
   The locking would need to be added so that it won't conflict with the
   clk subsystem. This can be tied into the input subsystem with the
   existing pwm-vibra driver.

Either case, the msm-vibrator driver that I added to the input subsystem
will be dropped.

Thanks,

Brian

> 
> Further Thierry comments
> https://lore.kernel.org/lkml/20181012114749.GC31561@ulmo/
> 
> > The device itself doesn't seem to be a
> > generic PWM in the way that the PWM framework
> > expects it.
> 
> I don't see why.  I just look at this function from the original
> patch series:
> 
> +static int msm_vibra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> + int duty_ns, int period_ns)
> +{
> + struct msm_vibra_pwm *msm_pwm = to_msm_vibra_pwm(chip);
> + int d_reg_val;
> +
> + d_reg_val = 127 - (((duty_ns / 1000) * 126) / (period_ns / 1000));
> +
> + msm_vibra_pwm_write(msm_pwm, REG_CFG_RCGR,
> +    (2 << 12) | /* dual edge mode */
> +    (0 << 8) |  /* cxo */
> +    (7 << 0));
> + msm_vibra_pwm_write(msm_pwm, REG_M, 1);
> + msm_vibra_pwm_write(msm_pwm, REG_N, 128);
> + msm_vibra_pwm_write(msm_pwm, REG_D, d_reg_val);
> + msm_vibra_pwm_write(msm_pwm, REG_CMD_RCGR, 1);
> + msm_vibra_pwm_write(msm_pwm, REG_CBCR, 1);
> +
> + return 0;
> +}
> 
> How is this NOT a a generic PWM in the way that the PWM
> framework expects it? It configures the period and duty cycle on
> a square wave, that is what a generic PWM is in my book.
> 
> Yours,
> Linus Walleij
