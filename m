Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4858C5DFBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 10:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfGCI0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 04:26:49 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37971 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbfGCI0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 04:26:46 -0400
Received: by mail-lf1-f67.google.com with SMTP id b11so1128693lfa.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oH+9JEmEdviHn94a7cG/CrP0XnCuvPvdHugovk+1QmU=;
        b=Yr0j9Ul0MKP0dkHoy9so7SqHZjz9YPD/8RtaQYq/QS7hJpMV/YgCE0T28eXT7jCvlS
         yQmRZqNvwMQEyd90J4bhV4PHy5Gm9rZDQYOpw2HFGrqYnG13mxGub7/M3rR+pIskS9RH
         1ZhsY0q7Hm/aXru8eSnmkm75xGDWYmso+K5aSBOYCjI/wj4NuxVFuJ9B+ojMYRnIcO8d
         ix3snxZ0ZJj71x7B6n368jZ9X6YaizA+Ee6+uCLuReo2lBUjxx1g9henIp9r5WGP0WwN
         b1C0fz0nbOuKbXmvt7NjhZPWDwy5iWE/yLpyxrSwtom7abqcgKnr4Xu5GbBkbajHu7wK
         5jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oH+9JEmEdviHn94a7cG/CrP0XnCuvPvdHugovk+1QmU=;
        b=r9SFt7GojNRJ2ZKMqqxV91dNRE7cMd51JjFj9bWGNB1eCi7raryfoeJXoWTvyXb8fz
         sN1kf8nFo8qhQWJAqt7WhA5doff/htbyzhoFZosRpy+lwHawnmDXiiCEEuWPQT7EOwaz
         Zgxu73wDgc+YrxaQ1neKosn+OjX3i64WobqKficyId+D2phkSUkC7DV+DGkkwyT+K0zM
         lJyMQiCB3VrZKNN4AZMa8SoiBZYIkRxXkr8r4tx3h2g/s7veJxLmvqgNp/5L/L3Sv9Aa
         JIVSV667UN7LPg0AAaFOgsVhWfBCbN2oELjAgNZZBPZwB5CjP9SEIvuVUpUMRen0pVij
         1DkQ==
X-Gm-Message-State: APjAAAVaCMSGbn6exkr912/pYckHwLVatTNzBRCaLVCtacuPSGeDZ8dC
        uobno+hbhVmcAZa7VlRNxh1BvbwYqcejHUVbCAYDpg==
X-Google-Smtp-Source: APXvYqymr6EoLSqXvq3rkC3hBxhdSlL8Q76rBENOFxvbDxQXxxcFrCLNfqvoaHdBizGqM1M/jk306H+kUmo4riz9AkI=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr16672551lfh.92.1562142403839;
 Wed, 03 Jul 2019 01:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1561472086-23360-1-git-send-email-neeraju@codeaurora.org>
In-Reply-To: <1561472086-23360-1-git-send-email-neeraju@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 10:26:32 +0200
Message-ID: <CACRpkdbfTTnEbCM4R_F_KYN9ys=VwCLQ5d1cYsx9LQOyTd5dwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
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

On Tue, Jun 25, 2019 at 4:14 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:

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
> ---
>
> Changes since v2:
> - Renamed function to msm_gpio_irq_clear_unmask()

Patch applied, unless Bjorn complains!

Yours,
Linus Walleij
