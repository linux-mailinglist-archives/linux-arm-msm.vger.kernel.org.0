Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495AE118F3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfLJRpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 12:45:10 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:40100 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfLJRpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 12:45:09 -0500
Received: by mail-il1-f193.google.com with SMTP id b15so16880062ila.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 09:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3s6PdFrRQnx7SzGv98D/hXCGEbh47W792wAg1h//fM4=;
        b=AuawT6Mj8mrvWP8b/48YgIEtZKfz2N00kND2g9zLXj126JqCyPKltrUJb+YGgldS9z
         8ZNm1rZez/YoUNrRd19EzaBSR7Hw5FAN832y4IXw5rZeuF2Wwx19ZXvjUeGJPIqjoyEX
         /4KbFy5Y58GNjX538KsJ3sKAqDiKZdTjWs1Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3s6PdFrRQnx7SzGv98D/hXCGEbh47W792wAg1h//fM4=;
        b=ezEi8+FDNKXleuD3ZPNdXcJDHRwg1FHl68UBwO2Ig6Sesd+AOvMti7cNVsKuezQOvl
         envWbibbUbGdTqDpUvqgiWPnbvZGG4X/R+bKGAqyyPIp0yVw0zvlgdqAlIGrD7cJG6Ms
         1IvAJ77Tt+C6nJJaZEpM++IotE39yE9e2Cciu++aIIjaya0z/NDozpMJCRXXeFOEOBwI
         13XUAH0N58Ekezxh85VYxacQfL37M78rOrz3fqTRanHjcGBF1Vx1G5oDSeB8MZSbshUO
         2EVkUp2OkRX8OEqTuT6Wfk8v0EY2pyOZ+uwKj6iam94qTvjxBKGUgfiljlr/PRoDRxvR
         aV0A==
X-Gm-Message-State: APjAAAXzJo9sD0T/swmCVNlwkf1285+pWQnHesQQyqDiplf4r2aRUdTB
        sRzK6stbmr04i6EzumhHgjo45GfDPfQ=
X-Google-Smtp-Source: APXvYqwUex+xaqY6vn/SEEh4tuonjKXDtJ/p+ngSkKwSHuAA/RLDS+a99OXXC51/32JILK6RxG4bTg==
X-Received: by 2002:a92:8fd8:: with SMTP id r85mr34375099ilk.29.1575999908688;
        Tue, 10 Dec 2019 09:45:08 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id r14sm1064826ilg.59.2019.12.10.09.45.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 09:45:07 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id z90so16889064ilc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 09:45:07 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr3619598ilk.58.1575999907357;
 Tue, 10 Dec 2019 09:45:07 -0800 (PST)
MIME-Version: 1.0
References: <0101016eef165cd0-26845355-ff75-416e-99a2-0c4434e18b76-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eef165cd0-26845355-ff75-416e-99a2-0c4434e18b76-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Dec 2019 09:44:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
Message-ID: <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add new qup functions
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 1:14 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> on sc7180 we have cases where multiple functions from the same
> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> Add new function names to distinguish which qup function to use.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 60 +++++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 20 deletions(-)

Two overall issues:

1. I think you also need to update the device tree bindings, so this
should be a 2-patch series.  Those list all possible values for
"function" so you need to update.

2. It would be nice if you mentioned in the commit message that this
will break i2c usage on these QUPs for anyone using old device tree
files.  That shouldn't be a problem (AKA no need to provide backward
compatibility) since I think the main sc7180.dtsi hasn't landed
anywhere yet, but if anyone pulled an early patch from the list it
would be good to give them a heads up in your commit message.


> @@ -976,8 +996,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>         [3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
>         [4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _),
>         [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
> -       [6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _),
> -       [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),
> +       [6] = PINGROUP(6, NORTH, qup11_i2c, qup11_uart, _, _, _, _, _, _, _),
> +       [7] = PINGROUP(7, NORTH, qup11_i2c, qup11_uart, ddr_bist, _, _, _, _, _, _),

You probably have a more complete document than I have.  ...but the
one I'm looking at shows that for pins 6/7 only i2c is available, not
UART.  Said another way: I see QUP1_L0[1] and QUP1_L1[1] on Func1 but
I don't see anything on Func2.  Of course, my document also doesn't
include "ddr_bist", so maybe it's just incomplete.

-Doug
