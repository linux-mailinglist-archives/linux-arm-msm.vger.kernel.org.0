Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9054F59E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbfKHV3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:29:33 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:42958 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731335AbfKHV3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:29:33 -0500
Received: by mail-il1-f194.google.com with SMTP id n18so6380957ilt.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 13:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRmwhSGnJWcbro1I2NsU98mvkk0pcwQPiXBcJRg/O6I=;
        b=nKl15u10ItYfNUfRdfrOlRLJn71C4ibsqBZ/3P+B+74i1afpRcQqn+q6zc8jpdWfF/
         4TlxJXWMVA2CzKaTu4/TkkDz/vWRfcJCJh6ToAyHjyRSfJH2cy+7BAFBE4bUdTXhkVpa
         +vhUPS0fXQBcgMO/mJWo4oLl/GXv8laDO3g2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRmwhSGnJWcbro1I2NsU98mvkk0pcwQPiXBcJRg/O6I=;
        b=qsaBSLszEtuD0ySkcAJB+x4CyNqNnN6NXOWGk5XGyaaWP4VVVYtf5vXX05RJjHmuk+
         Rd3Jv37C4Kc1HDYmmok/xyhUbMy+lLuCu/Oq0rh8WagJy1DBdcyLgRw6B0UobPzTg1Kd
         noq1JAaAqW8KF6tMjZT+uPbJgEK1GQ6WsiHODPNQtSboHmSGKn/og2xstXXNjuK3Mycy
         OS7NUDeAcHmr67LFB7za7L3NU6Npq/4u0q8zZ1ezlUntv/US2guGW2bNdJy1veZqkpqI
         4BwUjSpAwu1N4AzMG0urFkKGlD750QMgoIXRt4P+gp5zKVmuQKIT5LzA8vGlf0oPcY7Q
         94AA==
X-Gm-Message-State: APjAAAXgvAyAh0bH4RkJZ6UjFOOs9nUHaG506YgUV2jBZmDU5NLWefQO
        Nnt6pbmaGX27N3xkmkt31/YyG7h2ps0=
X-Google-Smtp-Source: APXvYqz0ikp3c2RBkm8rybmn7xCZ67PQbe//2+kDb3aIquHSpTLqt65YodnB5JO/uUodo0aHxRJHow==
X-Received: by 2002:a92:6912:: with SMTP id e18mr13989253ilc.134.1573248571089;
        Fri, 08 Nov 2019 13:29:31 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id h14sm926086ilc.87.2019.11.08.13.29.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 13:29:30 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id j20so7635606ioo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 13:29:30 -0800 (PST)
X-Received: by 2002:a5e:c642:: with SMTP id s2mr914619ioo.218.1573248569668;
 Fri, 08 Nov 2019 13:29:29 -0800 (PST)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Nov 2019 13:29:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WeDEaMEEqPr52WBKJ8MLGBZ590ro6nCpemctES0kvvDg@mail.gmail.com>
Message-ID: <CAD=FV=WeDEaMEEqPr52WBKJ8MLGBZ590ro6nCpemctES0kvvDg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 05/14] of: irq: document properties for wakeup
 interrupt parent
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>, maz@kernel.org,
        LinusW <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/interrupts.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> index 8a3c408..c10e310 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -108,3 +108,16 @@ commonly used:
>                         sensitivity = <7>;
>                 };
>         };
> +
> +3) Interrupt wakeup parent
> +--------------------------
> +
> +Some interrupt controllers in a SoC, are always powered on and have a select
> +interrupts routed to them, so that they can wakeup the SoC from suspend. These
> +interrupt controllers do not fall into the category of a parent interrupt
> +controller and can be specified by the "wakeup-parent" property and contain a
> +single phandle referring to the wakeup capable interrupt controller.
> +
> +   Example:
> +       wakeup-parent = <&pdc_intc>;
> +

nit: git flags the above line as whitespace damage.  Please remove
if/when you spin.

Thanks!

-Doug
