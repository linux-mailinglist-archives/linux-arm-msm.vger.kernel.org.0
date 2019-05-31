Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009F830CDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 12:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEaKvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 06:51:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46671 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfEaKvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 06:51:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id m15so856445ljg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eSFdj8v/B2hn6eq+aISdcOvbu5JLjtu1Vr8ajLwYUNk=;
        b=aI2iy5Ad/wjTGlIM92kqSiFz7uuJXxsM4eJMJ/DVQV+jWAHN/0CCQdN+93pDoASKW9
         1N0dBNSnQUw0G6ZDZ9KUpi+mbRf++fvqXn0fUiFF2pJFaeGvJ1uZrgTZJHYFBNO1Emlb
         DXttEAlqIbd+pj1EjNkAAAi3maQwCR/z04iq1mrqS0wpw+vAY5wBbbbWHTMNBeiYjXMa
         z8+ENbh7A7egZLdTl9rXCxRvePZBbywJKlAFC3GxtpqrtQ4CZvB0u/GPu5c9r9xgPOwE
         KhLLA1yqyzf89NSVW+imIs4ICPDL5sGnFB8n6eUDeQNsoKR8oY6nkVNDBzshJOVxAd89
         Uhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eSFdj8v/B2hn6eq+aISdcOvbu5JLjtu1Vr8ajLwYUNk=;
        b=gpgW+tWpIMxeEHAlRqlcwN/7LhCcxkArqfTkv7E3jbxobkKAiTZaUVEdT8nA5WCsxR
         F8/kNBOXTV4Zzq7Dzk3IICGciBaaJvd6c0W8c0HzVh1nQowXGhYxze8LhvtBlT2d+NvI
         +dzRrHhRF4oPfBFwkUtkCj1A/onRolbjJUBHyWPJGbhzO6rYzrAMonoWn5x9dZmXWduU
         nb2tV6aJCqCveDtm0bo3TkK3W1vVZrBAWf7dLUm3lpTAjkDodxpLVKEbmpDKqltnkpHU
         5w7Rse5Q+1CemKbzj+6oEq7E5rn7hEw8/kYWpJuAVJa7YmxS85nY3wIQ9mCw1xCMu3lX
         iYjA==
X-Gm-Message-State: APjAAAUgmHmx6gtC7nIbQfVuqSolYy+feHtLJcbDqQg4PvtUQXzD6Cem
        CaI07tjpC8WNtLQucDikXq5ND5j9HxgPp8/8QzrXww==
X-Google-Smtp-Source: APXvYqxDnzlPXNU+Y5DTaA2BPB+vxJPMWOGT2RoVnJiU+Yk0Rw8NoHYd3Xpa8pVi6m3Tfl2myIAXKSoBTK3XNFk1VOg=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr5474176lji.94.1559299909636;
 Fri, 31 May 2019 03:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com> <20190529101231.GA14540@basecamp>
In-Reply-To: <20190529101231.GA14540@basecamp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 May 2019 12:51:38 +0200
Message-ID: <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
To:     Brian Masney <masneyb@onstation.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
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

On Wed, May 29, 2019 at 12:12 PM Brian Masney <masneyb@onstation.org> wrote:

> My first revision of this vibrator driver used the Linux PWM framework
> due to the variable duty cycle:

So what I perceive if I get the thread right is that actually a lot of
qcom clocks (all with the M/N/D counter set-up) have variable duty
cycle. Very few consumers use that feature.

It would be a bit much to ask that they all be implemented as PWMs
and then cast into clocks for the 50/50 dutycycle case, I get that.

What about simply doing both?

Export the same clocks from the clk and pwm frameworks and be
happy. Of course with some mutex inside the driver so that it can't
be used from both ends at the same time.

Further Thierry comments
https://lore.kernel.org/lkml/20181012114749.GC31561@ulmo/

> The device itself doesn't seem to be a
> generic PWM in the way that the PWM framework
> expects it.

I don't see why.  I just look at this function from the original
patch series:

+static int msm_vibra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
+ int duty_ns, int period_ns)
+{
+ struct msm_vibra_pwm *msm_pwm = to_msm_vibra_pwm(chip);
+ int d_reg_val;
+
+ d_reg_val = 127 - (((duty_ns / 1000) * 126) / (period_ns / 1000));
+
+ msm_vibra_pwm_write(msm_pwm, REG_CFG_RCGR,
+    (2 << 12) | /* dual edge mode */
+    (0 << 8) |  /* cxo */
+    (7 << 0));
+ msm_vibra_pwm_write(msm_pwm, REG_M, 1);
+ msm_vibra_pwm_write(msm_pwm, REG_N, 128);
+ msm_vibra_pwm_write(msm_pwm, REG_D, d_reg_val);
+ msm_vibra_pwm_write(msm_pwm, REG_CMD_RCGR, 1);
+ msm_vibra_pwm_write(msm_pwm, REG_CBCR, 1);
+
+ return 0;
+}

How is this NOT a a generic PWM in the way that the PWM
framework expects it? It configures the period and duty cycle on
a square wave, that is what a generic PWM is in my book.

Yours,
Linus Walleij
