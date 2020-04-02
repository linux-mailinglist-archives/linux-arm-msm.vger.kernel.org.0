Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F0B19CD34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 00:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390050AbgDBW6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 18:58:39 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46897 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388991AbgDBW6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 18:58:39 -0400
Received: by mail-ua1-f68.google.com with SMTP id y17so2004097uap.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 15:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWD0gE7Vrwy/cdOlV72v6o0XzVmYemF303k1PSNaq4k=;
        b=W9lDsf9RQRgWPbt1c3OjVC4BGPVd7pdAsv+tVNSNuctUqBD8SELyyR9qwex6ROn24r
         d4j4v93TDmqkLacUW8sRAuANhbTyryN7WRH6zDCTynzff3FG7JN3me0PR7vciwMNXLey
         XiJok94xg+8kmBA1DjGznFhPAI1mgMofFv92Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWD0gE7Vrwy/cdOlV72v6o0XzVmYemF303k1PSNaq4k=;
        b=TsHhvzttf3b7wQhbkB9jupS1yE3CtfPZ5fo/T9CE8Pn8aHxlg7ecVmZxR9+GEULZTX
         lkCLbbBHbYM8zi2aT5Tuz+PVlc8paXEHOeMUHwjvl2hJyXQ16Vo6N8kFfOljeIKkHGoD
         R0WY8BIrbg4aSgyKYqAJbQ7xL67yCM9upBEZupOA13Z/Qu6jKAAm86YH7trIxWjUzYL8
         TK/f7eTDGrgnsKpgwDC9ppVSkcj+sqWPCZURwh/W1Mo6vj1hlh9+Dvtr0FwSnzrHFA5K
         wBfVP7AWToTZDcSkLBzwfirkBaGXOYom9Tl4MhzxKF9Q/9CLzkaQeOWqGkr4A5Pkk1nk
         /YjA==
X-Gm-Message-State: AGi0Pub+fU/5I9UirHO+LVrl/MahBdymHvgNTwg9rjFDWk1SGLxVTPX+
        ztQqeSS2csu5vQGYmLVOWb4SBfyxRKk=
X-Google-Smtp-Source: APiQypIt7dX5RNo7ybg/NGVQYlx3IdsLARaI2JUG2xvkdHGDDKdu8aA86wPxTkgX+ZWX65DyxpT3ag==
X-Received: by 2002:a9f:24b2:: with SMTP id 47mr4716512uar.42.1585868317536;
        Thu, 02 Apr 2020 15:58:37 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id p66sm709405vke.13.2020.04.02.15.58.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:58:35 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id o3so3753352vsd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 15:58:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr4114704vsf.109.1585868314963;
 Thu, 02 Apr 2020 15:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
 <1583747589-17267-4-git-send-email-sanm@codeaurora.org> <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
In-Reply-To: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 15:58:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wd1Y-4RvS+jrwMmnZ7tZJdPnQOx8bpQ_QExgwkDNH0zg@mail.gmail.com>
Message-ID: <CAD=FV=Wd1Y-4RvS+jrwMmnZ7tZJdPnQOx8bpQ_QExgwkDNH0zg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 2:39 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Mar 9, 2020 at 2:54 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
> > @@ -774,8 +774,8 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
> >                 .compatible     = "qcom,msm8998-qusb2-phy",
> >                 .data           = &msm8998_phy_cfg,
> >         }, {
> > -               .compatible     = "qcom,sdm845-qusb2-phy",
> > -               .data           = &sdm845_phy_cfg,
> > +               .compatible     = "qcom,qusb2-v2-phy",
> > +               .data           = &qusb2_v2_phy_cfg,
> >         },
> >         { },
> >  };
>
> Just as a heads up, Yongqin (cc'ed) reported this patch (now upstream)
> seems to be causing trouble on the db845c.
>
> It seems like its removing support for the "qcom,sdm845-qusb2-phy"
> compatible string, which is documented:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml#n23
>
> and already in use:
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n2389
>
> Should this instead have been an addition of the "qcom,qusb2-v2-phy",
> line instead of replacing "qcom,sdm845-qusb2-phy"?

To avoid forking the discussion into two threads, I'll suggest that we
focus on keeping the discussion in reply to your newly proposed patch.
I've already replied there:

https://lore.kernel.org/r/CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com

-Doug
