Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91AA313F139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 19:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392295AbgAPS1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 13:27:25 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:43042 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbgAPS1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 13:27:24 -0500
Received: by mail-io1-f68.google.com with SMTP id n21so23004550ioo.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2020 10:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hze97wcopQXdVE5g921uVOJcVOqpEK/vGURcI64jlVE=;
        b=dWRsDztqB3VhgUV55hSNrdtZyGqpnJOyocUQd0cwoEdRKhentt/e+E4mCtGbVO+/2D
         YhDXs80IIYc1xT6ywCoJ0c/UXvcO7Dw29JcMGHzPiGk+vI72vYp4XtjkJAe1VVztnOIc
         HI7AOIlFAsMUIHj+htofFGj8RpLb62HYqqgqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hze97wcopQXdVE5g921uVOJcVOqpEK/vGURcI64jlVE=;
        b=pR3w1RkZsuC0GER6yX7g04dPQ0rVhs7Lpsfnbs+55w+47lU3dmN+R3P8HRi0E/q7tf
         2a2IRXmFsT8M1R279YBW0YqoIWohWIdFmCEExkSCEf90lj2Ofz5v+Gt3BK/f+NlGXLMy
         PxJzfbOyp4RI8bfJI0TI8Kh7MVsgDTByujw600LMFZvVP4fkjxkPoTaHeO6kJmqkKW30
         l7KYR9O8hS0FzeSFkiZulNz0XMR3CyQU71wUMB27KA9DNC9UR8x2YYo4SqzLoPzS4Deh
         QqDm42nqHTJzsentOOQ9SDnqukwf9pKUunz071co8kx3qgOLhHEbjPKOsyTeSme4kKLX
         NkSQ==
X-Gm-Message-State: APjAAAUB7aiVlAJCfcqnfH+imFMm3l1WxnserpjakT6znZFFe0LZInvu
        aeKea4sWGtYdgbK086b7LrPenhGKch4=
X-Google-Smtp-Source: APXvYqyYvYw05Xg3eUZDiQEl5Xab4f+6deKAr578HDsbbrGr5J7nE5/bb44c2kaO+DP8xm4tFxNicQ==
X-Received: by 2002:a5e:924c:: with SMTP id z12mr27886720iop.296.1579199243358;
        Thu, 16 Jan 2020 10:27:23 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id d8sm5087831iok.66.2020.01.16.10.27.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 10:27:22 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id s15so19135556iln.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2020 10:27:22 -0800 (PST)
X-Received: by 2002:a92:8d8e:: with SMTP id w14mr4672100ill.187.1579199241984;
 Thu, 16 Jan 2020 10:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
 <20200116153235.GA18909@willie-the-truck> <1a3f9557fa52ce2528630434e9a49d98@codeaurora.org>
In-Reply-To: <1a3f9557fa52ce2528630434e9a49d98@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jan 2020 10:27:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WP1T7gGC=m5FOwuLvZdwrg5f7K6tDuYFT=0BgCQMZf7A@mail.gmail.com>
Message-ID: <CAD=FV=WP1T7gGC=m5FOwuLvZdwrg5f7K6tDuYFT=0BgCQMZf7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        James Morse <james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 16, 2020 at 8:11 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Will,
>
> On 2020-01-16 21:02, Will Deacon wrote:
> > [+Jeffrey]
> >
> > On Thu, Jan 16, 2020 at 07:49:12PM +0530, Sai Prakash Ranjan wrote:
> >> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
> >> are not affected by Spectre variant 2. Add them to spectre_v2
> >> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
> >> vulnerability sysfs value.
> >>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> ---
> >>  arch/arm64/include/asm/cputype.h | 6 ++++++
> >>  arch/arm64/kernel/cpu_errata.c   | 3 +++
> >>  2 files changed, 9 insertions(+)
> >>
> >> diff --git a/arch/arm64/include/asm/cputype.h
> >> b/arch/arm64/include/asm/cputype.h
> >> index aca07c2f6e6e..7219cddeba66 100644
> >> --- a/arch/arm64/include/asm/cputype.h
> >> +++ b/arch/arm64/include/asm/cputype.h
> >> @@ -85,6 +85,9 @@
> >>  #define QCOM_CPU_PART_FALKOR_V1             0x800
> >>  #define QCOM_CPU_PART_FALKOR                0xC00
> >>  #define QCOM_CPU_PART_KRYO          0x200
> >> +#define QCOM_CPU_PART_KRYO_3XX_SILVER       0x803
> >> +#define QCOM_CPU_PART_KRYO_4XX_GOLD 0x804
> >> +#define QCOM_CPU_PART_KRYO_4XX_SILVER       0x805
> >
> > Jeffrey is the only person I know who understands the CPU naming here,
> > so
> > I've added him in case this needs either renaming or extending to cover
> > other CPUs. I wouldn't be at all surprised if we need a function call
> > rather than a bunch of table entries...
> >
> > That said, the internet claims that KRYO4XX gold is based on
> > Cortex-A76,
> > and so CSV2 should be set...
> >
>
> Yes the internet claims are true and CSV2 is set. SANITY check logs in
> here show ID_PFR0_EL1 - https://lore.kernel.org/patchwork/patch/1138457/

I'm probably just being a noob here and am confused, but if CSV2 is
set then why do you need your patch at all?  The code I see says that
if CSV2 is set then we don't even check the spectre_v2_safe_list().

-Doug
