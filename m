Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A39826979F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgINVVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgINVVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:21:01 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02207C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:21:01 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y190so748320vsy.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h40Mkmyzjmx1oaGV6NYYOclBhWIiyDBMii4EWAbUUYU=;
        b=EPnLS1RhlA0wyyP1OC7VacOLKiJxMMjRQpvYSkhipIR0qf9WC8RK564fIcvVVeFKbz
         fC8LFeojctt1+gVlRo9X5MbmDgK1ToWp8Y9sHgCHcIzjscTuyvmbWS+p1l6qjzJAWhYZ
         9Qu2jHMXie6FHKJSZDUVVMKxmHVG0KLRa2AC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h40Mkmyzjmx1oaGV6NYYOclBhWIiyDBMii4EWAbUUYU=;
        b=U108ovsw+eExeYu31+b53dQ8LKuU4RsxmWauRjIOfWAvWG3z+4hujK9jnJkB8cS5ml
         tj5R+XHv7FJNdc7rZyJMopIRibxTdg9spVUXD+oLhbW2+NSeMSxIaPcvE738WfgQGPMd
         LSU7JY4EYBhPrleZJ48faCTEJcaXCPoXcrgAlitchpN4fkiC+FJGER2HdC89q3CaK5DN
         rgxhaCvEIsPMZ7ohLWaeeakErPWU0c2PkgVj05Zb51a0uKYz1b6alWt60wsrRn0sJugr
         AyL7JWybllWEkKRjjQnh8xemIvF9i+2O+/JBkUEvSVhegVgja+QnyKxQGmNZpUr0aYO1
         99GQ==
X-Gm-Message-State: AOAM530uoAr1ElgxngnM0axY5l5GWbX3FhOxb9+Xwiq6h2JxaQf+EqPu
        0hZy8Jiz2MjumjPN0H7QZ+J4aUJVFwd6Qw==
X-Google-Smtp-Source: ABdhPJy5xF6lEF0nbuL0drHC0GoEIc6pNo7AE4vAnH/aks20af/WDhaTwnt1CsM97KpFRSKcil4vyg==
X-Received: by 2002:a05:6102:82c:: with SMTP id k12mr9040241vsb.24.1600118459848;
        Mon, 14 Sep 2020 14:20:59 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id d125sm2021884vkd.36.2020.09.14.14.20.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 14:20:59 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id e2so719426vsr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:20:58 -0700 (PDT)
X-Received: by 2002:a67:ff97:: with SMTP id v23mr8916922vsq.11.1600118458295;
 Mon, 14 Sep 2020 14:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org> <1600091917-7464-3-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1600091917-7464-3-git-send-email-skakit@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Sep 2020 14:20:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsU87ZWvhsPAWAnrQmK60SvZoxrefZDdW4y4i1MAEmwg@mail.gmail.com>
Message-ID: <CAD=FV=WsU87ZWvhsPAWAnrQmK60SvZoxrefZDdW4y4i1MAEmwg@mail.gmail.com>
Subject: Re: [PATCH V6 2/4] arm64: dts: qcom: sc7180: Add wakeup support for
 BT UART on sc7180-idp
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 14, 2020 at 6:59 AM satya priya <skakit@codeaurora.org> wrote:
>
> Add the necessary pinctrl, interrupt property and a suitable sleep config
> to support Bluetooth wakeup feature.
>
> GPIO mode is configured in sleep state to drive the RTS/RFR line low.
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - This patch adds sleep state for BT UART. Newly added in V2.
>
> Changes in V3:
>  - Remove "output-high" for TX from both sleep and default states
>    as it is not required. Configure pull-up for TX in sleep state.
>
> Changes in V4:
>  - As per Matthias's comment, removed drive-strength for sleep state
>    and fixed nit-pick.
>
> Changes in V5:
>  - As per Matthias's comments, moved pinmux change for sleep state,
>    pinctrl and interrupt config to the board specific file.
>
> Changes in V6:
>  - As per Doug's comments changed subject, deleted interrupts property.
>  - As per Bjorn's comments changed commit text and rationale for RTS,
>    TX and RX.
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 55 +++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
