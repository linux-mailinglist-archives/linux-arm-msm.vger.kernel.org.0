Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD602651C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 23:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgIJVBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 17:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731216AbgIJOkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 10:40:15 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25526C061796
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:40:15 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id w23so1931241uam.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JlHSJzzDMd2cH/FNwWRua8Mp268amVy5W9EWLGVmUPc=;
        b=oD1xRjIlRnK44AUoNaWNO/km7pvdC4CuwaFjutnksJPfr5b6oJmdEgdZ9yNz7Xk2Gm
         bpWVhEtYTCTfJtAz6L1JEx6u/7KKahQo8ztrJBFbVTUqiD5g0ViXtUYWrkuVf7U4IKSh
         OltoiL9sRb/sIZiVWKa1ZI4bJymSa/9pkerP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JlHSJzzDMd2cH/FNwWRua8Mp268amVy5W9EWLGVmUPc=;
        b=hbiGKEJMWWuJ8qEdpeEG/33nKaDvUNLW7XycFQqFogo2KP9NsIVJDjEZMqrGSy1sp4
         Yylm9QiOg7Pxh9E1+IyAxzbSXKZxso+eLaQj5+DBurM2x0Fj05G3BCWA4UHmPn+J8+Wo
         CyKmAzmcQIpt4HY2dBZpnQ8KwrONHgc33k3zbZHXA9N5RRhjuXHZ2BiAxWeSZ8DKp5e6
         bBtLqawBNEaTifXbVb4I8cCtzkxX5qe34v6VuafxsaSexrmL9bP5/GTPFVmSx2jQuQpg
         hszXOuxvfpr5kuHUDvIqVz9e1sgYRotPNsub+eZ237+EcAbee/u7T2PKpiVoEk5Fe3sb
         xA0A==
X-Gm-Message-State: AOAM5332wkPaxn6t5i6AYL7u6P9+FxSvZMhTwA6n6NcrIBP9nvLrs05n
        lZBOD00P4jC10so8Q1xmWUEvnhnEx1nK1A==
X-Google-Smtp-Source: ABdhPJxliirliuva8brS3dy/WpW5HwtuK5f4+p8NOpluKtB+nY1CuGtApqMEZc0LjnskCh9zF6jUZw==
X-Received: by 2002:ab0:29d7:: with SMTP id i23mr4003606uaq.121.1599748813076;
        Thu, 10 Sep 2020 07:40:13 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id t15sm840912vso.27.2020.09.10.07.40.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 07:40:12 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id c127so3541108vsc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:40:11 -0700 (PDT)
X-Received: by 2002:a67:d907:: with SMTP id t7mr4542751vsj.8.1599748811523;
 Thu, 10 Sep 2020 07:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org> <1599742438-16811-2-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1599742438-16811-2-git-send-email-skakit@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Sep 2020 07:40:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYqiGk3QEPxVKCgnYA0FVrizyarSW52HPRGVyAUSugrQ@mail.gmail.com>
Message-ID: <CAD=FV=XYqiGk3QEPxVKCgnYA0FVrizyarSW52HPRGVyAUSugrQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/4] arm64: dts: qcom: sc7180: Improve the pin config
 settings for CTS and TX
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

On Thu, Sep 10, 2020 at 5:55 AM satya priya <skakit@codeaurora.org> wrote:
>
> Remove output-high from CTS and TX as this is not really required. During
> bringup to fix transfer failures this was added to match with console uart
> settings. Probably some boot loader config was missing then. As it is
> working fine now, remove it.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V4:
>  - This is newly added in V4 to separate the improvements in pin settings
>    and wakeup related changes.
>
> Changes in V5:
>  - As per Doug's comment configured pull-down for CTS pin as earlier.
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Looks fine to me.  Slight nit that this only applies to the IDP board
but ${SUBJECT} makes it sound as if this applies to all sc7180.  I
wouldn't spin just for that, though.  If Bjorn agrees, he can always
adjust the subject when applying.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
