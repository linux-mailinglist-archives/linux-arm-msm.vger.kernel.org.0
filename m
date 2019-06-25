Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B1652752
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 10:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfFYI7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 04:59:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42974 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730851AbfFYI67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 04:58:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id x144so4610524lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+kChTzQrd3nmy4kJUu2g6Bqv0SUkWeG4jA8/ofAZg8=;
        b=PDip88KV2Zc0xPh+7nuBk+Uw1g8JiP1Xh9eJnc2f+YFDb1bpGtSFn7QQd0iA1UwJ3A
         AZHjwKXC3kVfpk0xM1DH31wKIp/mqDhcqw8gu2IZCM5MAbxqvbtg4LFWLDGsP6gFMkWO
         ua8XZFGsQ3HzZorGf+8s6cMRsY/Ci0OCClzOJBXp3T/QW0oi8tVkBhTZ1Uo6uAb8uosy
         D7hamd540RRzTjo/BWFXXJby4XkOSdu/ZSXBDI6CAcoHJMsi8596yHU2LKkynOQBFVw8
         /5McPRI/hncwobKG6fZdGueR/hChNnaSPRCKQPBOaobG0cyisKp/A7Wvo1/5CPanekFL
         b2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+kChTzQrd3nmy4kJUu2g6Bqv0SUkWeG4jA8/ofAZg8=;
        b=YJHcYTvzSc4S9gskp5FLm6TBe8mabfMymwebhS8KKWGECSbAWw8dBwJedwSHH757Xs
         ht6Iv+I24SefRuba8VXyCoRYZjdixpc4M9U88kSMMjL+1iiGK0N4Pf3Ghbta2C/xRURk
         qqUx2YRlMfXMD3vIWEkuI+KTYTL5keU/7qA47FjT4v2xmQDdhLbeg8mpXHBVOxlTJai8
         Zt1ScKZ+W8ajneRo7BbDLQwzPwVNCgr4ZoCjgGjchJPOY4+s+S4kcX4NqZ6O/afqJihQ
         Kc0LkWxixD7/0huO8wtmSDtG5tmmoF/xVXhdlg2qNatdr4c+7wI+Ky00m/bo5NfGHKKn
         H9/Q==
X-Gm-Message-State: APjAAAV12N75tHRdtPquJdsv5K/tHtXcW/JBY/Vge9PwQTWCAMdffLtY
        bK/RZ6+TPihd27bM9G/AK8LSqHQhfGoLlj9WazF92w==
X-Google-Smtp-Source: APXvYqzzb40u6wurDlM2Fjs+HJlarr9mnj7e3anmVcuTqtUwuM5vMPDwJECaz/ZcV29P/oMJ6JU05Pf1Rj7u2PKHDOI=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr24507877lfm.61.1561453137773;
 Tue, 25 Jun 2019 01:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <1560764090-22740-1-git-send-email-neeraju@codeaurora.org>
In-Reply-To: <1560764090-22740-1-git-send-email-neeraju@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 10:58:45 +0200
Message-ID: <CACRpkdZ4BoZzX7pVw4HYBzSMvhnyu_oVNoiiLk3ME05nnG1T3Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Timur Tabi <timur@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 11:35 AM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:

> From: Srinivas Ramana <sramana@codeaurora.org>
>
> Introduce the irq_enable callback which will be same as irq_unmask
> except that it will also clear the status bit before unmask.
>
> This will help in clearing any erroneous interrupts that would
> have got latched when the interrupt is not in use.
>
> There may be devices like UART which can use the same gpio line
> for data rx as well as a wakeup gpio when in suspend. The data that
> was flowing on the line may latch the interrupt and when we enable
> the interrupt before going to suspend, this would trigger the
> unexpected interrupt. This change helps clearing the interrupt
> so that these unexpected interrupts gets cleared.
>
> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>

Overall this looks good to me, waiting for Bjorn's review.

> Changes since v1:
> - Extracted common code into __msm_gpio_irq_unmask().

Please don't name functions __like __that.

> -static void msm_gpio_irq_unmask(struct irq_data *d)
> +static void __msm_gpio_irq_unmask(struct irq_data *d, bool status_clear)

Instead of __unclear __underscore __semantic use something
really descriptive like

static void msm_gpio_irq_clear_irq()

That is what it does, right?

Other than that it looks fine.

Yours,
Linus Walleij
