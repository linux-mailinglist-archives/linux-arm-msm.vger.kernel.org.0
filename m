Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956A92D8BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 11:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfE2JNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 05:13:30 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39187 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2JNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 05:13:30 -0400
Received: by mail-lf1-f68.google.com with SMTP id f1so1408753lfl.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2019 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=turgOZHVZA+slmDkzWItW7JViu4gUnC/Ds0bw1pflBM=;
        b=uID7+9gJfQmbk7PHo/mOm4BVImm/+DnpkGNixHRs2SGI9/hzszYymxfaSJ49T8BDUW
         PDJTFfCwkcws2FEhVfx0FheGspexSFRAHXIaLmxpKLBZUUk5SDnkHzKHVb8D1QMa0i+z
         7OWbyDbxVMBqXIBMGCHUyn2iU0Ulq/kWQtQN3jfDwEn+dmk2dk9pWlYPPnu4VQ1zXs6f
         DcAAJufsmv2uc4O95FLoilKAylhGijHSsnbcWVPA1y9WBSVA37t2KmIHqZJLjD3Pt1AB
         6Hz76/Qg7MGnGIQoV5Cdh+fTjjuxX5eQZ+S3Af3rzTj01OKiLFwBc+YQDks9E6jKUYa5
         En4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=turgOZHVZA+slmDkzWItW7JViu4gUnC/Ds0bw1pflBM=;
        b=GCrPmxDiH3q+gBOxfBiURzdYuRUcfSq/vKAFQZGFIP0Sxm0oxaVBCfSvLLr+Z0yYY5
         1mIDr7mcaNvlgPbxMxVQ2LLlLrqeRQyxMPWBNnCnzE5B2/OYkQ0mW9zcufhqOzVyJcZD
         u2RZ0QcxslWwR3xErc6ohLk9D6dFSHjX2I8D3IRxlkHRi+LUdE2mSH7ikCRzX2ghsmHV
         rd8pJoeLDsSb4tZ5swhP4HQMNYemv4xcxoGli5pZGOIS593OW4FF4kyQrX61WNhdCAfd
         z+geWNzVQMJHOWWeA1lN95DztNH/svSdVJ/i20LrWsO490vSinUm2FKpYxrTOP0GmKbl
         OmFg==
X-Gm-Message-State: APjAAAWsLAeUHWfLIdcpTDp8tH9AyOojwdBIA17pHCNV35p2GhP5y7/e
        i+lt5R7beldxp5/SSdit8EA2P+UI6w5RR793Kk9crw==
X-Google-Smtp-Source: APXvYqwjC5SWPgI46QoTgvlTu/96JE/AEpBn03nwkHGSfPInUIonOiiuZICMnjjTvlc2wpiX7j93x2VmEko+tKdqsYE=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr1592103lfm.61.1559121208258;
 Wed, 29 May 2019 02:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org>
In-Reply-To: <20190520142149.D56DA214AE@mail.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 May 2019 11:13:15 +0200
Message-ID: <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Brian Masney <masneyb@onstation.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 20, 2019 at 4:21 PM Stephen Boyd <sboyd@kernel.org> wrote:

> > +       vibrator@fd8c3450 {
> > +               compatible = "qcom,msm8974-vibrator";
> > +               reg = <0xfd8c3450 0x400>;
>
> This is inside the multimedia clk controller. The resource reservation
> mechanism should be complaining loudly here. Is the driver writing
> directly into clk controller registers to adjust a duty cycle of the
> camera's general purpose clk?
>
> Can you add support for duty cycle to the qcom clk driver's RCGs and
> then write a generic clk duty cycle vibrator driver that adjusts the
> duty cycle of the clk? That would be better than reaching into the clk
> controller registers to do this.

There is something ontological about this.

A clock with variable duty cycle, isn't that by definition a PWM?
I don't suppose it is normal for qcom clocks to be able to control
their duty cycle, but rather default to 50/50 as we could expect?

I would rather say that maybe the qcom drivers/clk/qcom/* file
should be exporting a PWM from the linux side of things
rather than a clock for this thingie, and adding #pwm-cells
in the DT node for the clock controller, making it possible
to obtain PWMs right out of it, if it is a single device node for
the whole thing.

Analogous to how we have GPIOs that are ortogonally interrupt
providers I don't see any big problem in a clock controller
being clock and PWM provider at the same time.

There is code in drivers/clk/clk-pwm to use a pwm as a clock
but that is kind of the reverse use case, if we implement PWMs
directly in a clock controller driver then these can be turned into
clocks using clk-pwm.c should it be needed, right?

Part of me start to question whether clk and pwm should even
be separate subsystems :/ they seem to solve an overlapping
problem space.

Yours,
Linus Walleij
