Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FAD2C1FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 09:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730608AbgKXI2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 03:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730603AbgKXI2l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 03:28:41 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C6CC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:28:41 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so27689836lfc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76ixO5CUxxnke5hcHoMKuBGHklO16fYsnp2OoEmVY9I=;
        b=G8leHYlsEU5n6pd6cInmCXAoFm6XND5O4pdrrsippB2b/hSgqZUq13wmCTOGN2pDLy
         0ZvAYGUIfc4uyHL34B8QqHnISCrh8M70dupuPPWYAtGfvXMBw/1cf6zpWHCFw6O+OK2G
         krv1FyneNA3Y0jR2u/1rVEJcAu/ld4TMQwCgD7hJskxey0PEeUh6uR+2oiI3uEeYU4sL
         ZmkzsW9ZR7D/e1RjV2b4sXysHEpEFI0pkKwruTz9hbSKYN5nJbbKaxOj97sjf7PMBB4+
         +jQlRVnus2nmkTYuiJdr9WAEMqesS9FihYhzQrkemhiK3zU/mSBggEyBs6/1uAwu9NeR
         CaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76ixO5CUxxnke5hcHoMKuBGHklO16fYsnp2OoEmVY9I=;
        b=jat8LbF2OgoNxaN/fa3ORbXCqtULiAhprF89g+XZglIP8k8WXdKS1DxWjrA1UDqdfN
         xZiDmPCVwvaTMPPYzh1nIDjWacy9La9FSOlx1W9x+3Sp/yCYpiGNep5yjThbfIYbxc4t
         B4XkopSBZ4UM6madgyKB9QXMSQLbNDkoxycF/H7R4DiRcGfUGiPNK9I27sL4ONak0DT1
         6FhTGuwC369OnqxNuCI9Vd/QNUR8S1/DHeCHkbR2cAZ7DkM9KmySC3PaKVcIc6SiOTDS
         zgGhlkLn9jN151JO/MIcovLXSJLwKROi44pvuW6iAbTl+yA9AqGccqF5lHQPPlnzKjBI
         puuw==
X-Gm-Message-State: AOAM5326Ua56ilZtpBGj7rL7YnCgw+1EyU4xLv/xCKBb7JCnhDq4amyQ
        mclck6YXXELUVDhSP/MJYT2eLjQxK5nS9fjP4ZsyZQ==
X-Google-Smtp-Source: ABdhPJz3m9CR00BmIKNF6LAsWT4dz49Cwq7LJkOtP9XV8CKRYiYZYBE3k32TMZ0OuYePMZmd6DcgVibwKqVVmoHDgEQ=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr1409605lfc.260.1606206519702;
 Tue, 24 Nov 2020 00:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
In-Reply-To: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:28:28 +0100
Message-ID: <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 1:02 AM Douglas Anderson <dianders@chromium.org> wrote:

> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>   wakeup-event-action = <EV_ACT_DEASSERTED>;
>   wakeup-source;

I would need Marc's ACK to apply this with the other patches
to the pinctrl tree, but I can't really see if maybe it is OK to
apply it separately?

Also are these patches supposed to all go in as fixes or
for v5.11?

Yours,
Linus Walleij
