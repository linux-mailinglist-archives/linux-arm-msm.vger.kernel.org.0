Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B21143D595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 23:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhJ0V3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 17:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241730AbhJ0V2Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 17:28:24 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AED3C061232
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 14:19:34 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 810521F673;
        Wed, 27 Oct 2021 23:19:29 +0200 (CEST)
Date:   Wed, 27 Oct 2021 23:19:28 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH v10 2/2] leds: Add driver for Qualcomm LPG
Message-ID: <20211027211928.tjybwy2lokj6eoun@SoMainline.org>
References: <20211010043912.136640-1-bjorn.andersson@linaro.org>
 <20211010043912.136640-2-bjorn.andersson@linaro.org>
 <YXL0DyyPkS4/wfB7@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXL0DyyPkS4/wfB7@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-10-22 10:25:35, Bjorn Andersson wrote:
> On Sat 09 Oct 21:39 PDT 2021, Bjorn Andersson wrote:
> 
> > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > PMICs from Qualcomm. These PMICs typically comes with 1-8 LPG instances,
> > with their output being routed to various other components, such as
> > current sinks or GPIOs.
> > 
> > Each LPG instance can operate on fixed parameters or based on a shared
> > lookup-table, altering the duty cycle over time. This provides the means
> > for hardware assisted transitions of LED brightness.
> > 
> > A typical use case for the fixed parameter mode is to drive a PWM
> > backlight control signal, the driver therefor allows each LPG instance
> > to be exposed to the kernel either through the LED framework or the PWM
> > framework.
> > 
> > A typical use case for the LED configuration is to drive RGB LEDs in
> > smartphones etc, for which the driver support multiple channels to be
> > ganged up to a MULTICOLOR LED. In this configuration the pattern
> > generators will be synchronized, to allow for multi-color patterns.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Any feedback on this?

I asked in #linux-msm whether anything is wrong with the patterns,
since my Sony Discovery (sdm630 with a pm660l) blinks way quicker on a
pattern that's supposed to stay on for 1s and off for 1s:

    echo "0 1000 255 1000" > /sys/class/leds/rgb\:status/hw_pattern

It however seems to be broken in the same way on an older version now
(this might be v9 or v8) which I don't remember to be the case.  Can you
double-check if this is all working fine on your side?  If so, I'll have
to find some time to debug it on my end.

Thanks!
- Marijn
