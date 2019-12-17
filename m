Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DF8123760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 21:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfLQUi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 15:38:26 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:44975 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbfLQUiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 15:38:25 -0500
Received: by mail-il1-f194.google.com with SMTP id z12so9534878iln.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 12:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=SWfYOp7v2Gbzvj0oex2xBcjnDjxUg4jBwLcNA8Lj7Y20hF7uJS8Z+wqqD+6oKZME9U
         3p6Hh+fBlmoE58Y8glJzGHG3nV2ShrZXJI8oFnXr40yYSDt+Y/Yu67GPHgbuOPgKcRLa
         F3Wu2wWaSCDep6oSq/EtkLx/PZFaVr9IF38mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=obztwDTceKX7uOeOJ2JoSLrXanEVtHBrWJFzy9pz2m9xopoJHukdkvSlzlsHWxbIyc
         e/PY6UO08TMkdTC3EhloxBF6obK1VUWg999XKRbDTVmmwnefXAVW8qhmv9oA1zrsHoWu
         Zr/WiBC70zvDHLkKhrocZjvZCmsh/lcAh61VDhx52H5oP1+StKF0ZQasudaeG4yqx4Lc
         c9VqbSFBkaXtWEZYAWMW8Q66IkVfEB6vUvbi4ADT+oESkAuMalTaFvnQZkXVz3CRcTBg
         I26ZNfDiNLoIBIO/uJ8cdfCh+vHBr/pWQpcjsZfj649SEIEHHFTsmtc7uqW57lMGnofl
         tsFA==
X-Gm-Message-State: APjAAAU7G8uAeB/RJdq+QaOdR5Tty7HDag+irj2ERV71jRppOKLCN2uC
        ln6ycCiVugB15jt6gOFWUQoNY+qa0ec=
X-Google-Smtp-Source: APXvYqwBGo7sAWf3V0/U/TZ1puBkjOP2MzdG6X51xzSXi3gaMJN7NhwaSPxl1zpXB/2Q0bcZjs1grg==
X-Received: by 2002:a92:390c:: with SMTP id g12mr15319551ila.246.1576615104547;
        Tue, 17 Dec 2019 12:38:24 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id t25sm4686621ios.78.2019.12.17.12.38.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 12:38:22 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id f10so9571856ils.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 12:38:22 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr4548825ilo.218.1576615101966;
 Tue, 17 Dec 2019 12:38:21 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 12:38:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add wakeup parent for TLMM
To:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn / Andy,

On Wed, Oct 30, 2019 at 12:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Specify wakeup parent irqchip for sc7180 TLMM.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

I see that Linus W. applied patch #1:

https://lore.kernel.org/r/CACRpkdY9ETQRHn7x2D2XVLZ810Uo1cPQxMBqTy5LnrORRNjTVw@mail.gmail.com

...so I think this patch is ready to go.

FWIW, feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
