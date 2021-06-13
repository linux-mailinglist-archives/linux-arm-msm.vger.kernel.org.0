Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B953A59B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jun 2021 19:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhFMROa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Jun 2021 13:14:30 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45880 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbhFMRO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Jun 2021 13:14:27 -0400
Received: by mail-ot1-f49.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso8495901oto.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jun 2021 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vBBy6St8FkUvFoOw7EGXmngtbokUJY/bqhzPml+W86c=;
        b=MePmkULJTM5oQwk7zs2nFJZpMMpZLySe6JtvZ9xrB0qOe1+nSjmQPIhz5t2oT0EvAm
         ZmZveNZg1h2ooksoKadmeVXvk0f4JOzw40UOvUcsaENsxjizSw0ZNQlzxosMr6TKk6Mf
         Zjmzgo2cDx93p2ZWu++A7Hc/nl7jyfc26HyOgsceJNGyx/duN0OBVyHpvwXfCh0r7Oyt
         hkZUjmf5b1YKFiKE8E+cDQmzpUO0UIZ/DqyWGlJEIz9/4GSr7TJ2ZZvzjvQtjEGCg6l2
         G/7IIfivjJRuYvqiWS4aQ2ymaej2abz6eGBM9rbVy0v2/o6dFXLqYdga39c9+F+e2w1W
         T8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vBBy6St8FkUvFoOw7EGXmngtbokUJY/bqhzPml+W86c=;
        b=iQVhoZIIr7OcKcML58RPjFYJOfGzN4tmmTwBaurHareoTeCVd3C+gEvz6xyqbMSLgt
         t+DdwT8vV1jBj0u0n9mUhYL6a84xHAQaIX1yy0PLeFaSBx1Mb4X0d7AHst5zKRlL0vuX
         MMykUXsck+5TTGs7P2aXcQRCCFtsEDCk2Ak7QxOvpr2JRrDBjP0T+MTDo7wbdT3PEW4w
         Ra9grgXUDd0aPw5diPlL9l3E1tra0/nu7Xrzog1N+1Jb4oKI1JVyim8j28wnKvTEUKv9
         9ChFJkjUspkieQhEkWckYf2i09srNHYl8OhzsgHOj9lTimuVmklBSpICbhe5f1AIhz/q
         6m0g==
X-Gm-Message-State: AOAM532uXN3iRub1lV8fLvg2ndGrnJZIF6FxoUIfdaDacxDmos2xFMIi
        055CRPCFME07FP7jCf114/ndtw==
X-Google-Smtp-Source: ABdhPJxRafcjqtvKsbQb9zEe9aUB0PnaQaENf16Z38L5f/GmjU8cMUw/qh2LFSOKASFfAWzEPfN6jQ==
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr2114978otn.340.1623604285061;
        Sun, 13 Jun 2021 10:11:25 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d136sm2401178oib.4.2021.06.13.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 10:11:24 -0700 (PDT)
Date:   Sun, 13 Jun 2021 12:11:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] input: add Qualcomm QPNP haptics driver
Message-ID: <YMY8OcMrDh2D4qVg@yoga>
References: <20210612205405.1233588-1-caleb@connolly.tech>
 <20210612205405.1233588-3-caleb@connolly.tech>
 <YMWE+p5zlntC88ti@yoga>
 <b821c5d4-f406-f4bf-638b-59fb20bc2f36@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b821c5d4-f406-f4bf-638b-59fb20bc2f36@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 13 Jun 11:24 CDT 2021, Caleb Connolly wrote:

> Hi Bjorn,
> 
> Thanks a lot for your feedback.
> 
> On 13/06/2021 5:09 am, Bjorn Andersson wrote:
> > On Sat 12 Jun 15:54 CDT 2021, Caleb Connolly wrote:
> >
> >> Add support for the haptics found in pmi8998 and related PMICs.
> >> Based on the ff-memless interface. Currently this driver provides
> >> a partial implementation of hardware features.
> >>
> >> This driver only supports LRAs (Linear Resonant Actuators) in the "buffer"
> >> mode with a single wave pattern.
> >>
> >> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> >
> > Please use a cover letter when posting multiple patches.
> I'm not sure why the cover letter didn't make it to your inbox, here's a
> link:
> https://lore.kernel.org/linux-arm-msm/20210612205405.1233588-1-caleb@connolly.tech/

It arrived later, for some reason. Sorry for the fuzz.

> >
> >> ---
> >>  drivers/input/misc/Kconfig        |   11 +
> >>  drivers/input/misc/Makefile       |    1 +
> >>  drivers/input/misc/qpnp-haptics.c | 1022 +++++++++++++++++++++++++++++
> >>  3 files changed, 1034 insertions(+)
> >>  create mode 100644 drivers/input/misc/qpnp-haptics.c
> >>
> >> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> >> index 498cde376981..b5ba03e6cf58 100644
> >> --- a/drivers/input/misc/Kconfig
> >> +++ b/drivers/input/misc/Kconfig
> >> @@ -186,6 +186,17 @@ config INPUT_PMIC8XXX_PWRKEY
> >>  	  To compile this driver as a module, choose M here: the
> >>  	  module will be called pmic8xxx-pwrkey.
> >>
> >> +config INPUT_QPNP_HAPTICS
> >
> > No-one knows what "QPNP" really is, so please name this
> > "INPUT_QCOM_SPMI_HAPTICS"
> >
> >> +	tristate "Qualcomm QPNP HAPTICS"
> >> +	depends on ARCH_QCOM
> >
> > "depends on SPMI" makes sense here.
> >
> >> +	select INPUT_FF_MEMLESS
> >> +	help
> >> +	  This option enables support for the haptics found in pmi8998 and
> >> +	  related PMICs. Based on the ff-memless interface.
> >> +
> >> +	  To compile this driver as module, choose M here: the
> >> +	  module will be called qpnp-haptics.
> >> +
> >>  config INPUT_SPARCSPKR
> >>  	tristate "SPARC Speaker support"
> >>  	depends on PCI && SPARC64
> >> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> >> index f593beed7e05..c43290163db0 100644
> >> --- a/drivers/input/misc/Makefile
> >> +++ b/drivers/input/misc/Makefile
> >> @@ -65,6 +65,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
> >>  obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
> >>  obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
> >>  obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
> >> +obj-$(CONFIG_INPUT_QPNP_HAPTICS)	+= qpnp-haptics.o
> >>  obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
> >>  obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
> >>  obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
> >> diff --git a/drivers/input/misc/qpnp-haptics.c b/drivers/input/misc/qpnp-haptics.c
> >
> > Again, qcom-spmi-haptics.c
> >
> >> new file mode 100644
> >> index 000000000000..daa7a18ffc7d
> >> --- /dev/null
> >> +++ b/drivers/input/misc/qpnp-haptics.c
> >> @@ -0,0 +1,1022 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2021, Caleb Connolly <caleb@connolly.tech>
> >> + * Qualcomm Plug and Play haptics driver for pmi8998 and related PMICs.
> >> + * Based on ./pm8xxx-vibrator.c
> >
> > Enough "based on" to warrant carrying some copyrights?
> Hmm, I only stole the input device parts, so perhaps not.

Then I think you can drop this comment as well.

Regards,
Bjorn
