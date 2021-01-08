Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B54D2EFA4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 22:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbhAHVV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 16:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbhAHVV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 16:21:56 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC6CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 13:21:15 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id u67so2808232vkb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XR8VpqhNvfyeOSjiVGS0Gw6y6Ox46JoGQ/emSYjsvjk=;
        b=AjRH6z5bgTXQmT6C30AB861Wlw5FHUKheGMZVGD8gYjod0dQ3o5VfJLtZeFhJuvoJ5
         WavBV44odXXue/TjtQTruTB7I3vowZx0iO1kXKgc8Tk0Y1GTU8H6UNmVXbPbcRBssPNa
         47U1Y10tNMnEC6216t1LAMqhVBEg4IpxVSqqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XR8VpqhNvfyeOSjiVGS0Gw6y6Ox46JoGQ/emSYjsvjk=;
        b=sfx93cIT4NtmuAWfmDx7zwnE/wjeWxVmOue7xSdD0e654TYkvoKFAJJxy9o4bW2H0X
         X0AineEePavSinPBXLeFRpBLOlhkE6iaXEBsNBc1em0jOEv8f6kuiyvRan+ivW/QBa1A
         E6Zft4CizrdWdYIt6FOIYLQXC1y0DVHMe/wBB1E9OIjsly4jftCOe7Mk+WkEuRQxwd5g
         qHqQ3RRPPeBCeiVRuhwXygAySJEzTtvX0MePQDD842BgAAMouSe7K0YgXm2+pEaGzbIo
         sJIE96tZ2HZzX2IHZD/8lpcH5Z5TN3v0IkFC3qM+m2CehOHbLrb2BFY7fQohEDzWJYFs
         Q+9A==
X-Gm-Message-State: AOAM532wheFH0vzNLRWMF4onllBkribz0NI/L775W6inTC50VfTSpzo3
        +Bur/d/aewRw4vVbjNooOehkK5bzoXIDiw==
X-Google-Smtp-Source: ABdhPJx2VswUVXl0W5lJABSKVepDDNb/ZLu+cyqXvFhQErLUk9a4hcjK7yKFupKtfMIUwSLqjLNFfQ==
X-Received: by 2002:a1f:a796:: with SMTP id q144mr5073064vke.19.1610140874590;
        Fri, 08 Jan 2021 13:21:14 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id s5sm389955vsr.16.2021.01.08.13.21.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 13:21:12 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p2so3899182uac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 13:21:12 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr4896052uaa.104.1610140872334;
 Fri, 08 Jan 2021 13:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
In-Reply-To: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Jan 2021 13:21:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xt0O7WOe-hsiqJ7Jqhgs7TQ_c-_BtyAuj0D2Yxi-TqEg@mail.gmail.com>
Message-ID: <CAD=FV=Xt0O7WOe-hsiqJ7Jqhgs7TQ_c-_BtyAuj0D2Yxi-TqEg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mmc: sdhci-msm: Warn about overclocking SD/MMC
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Taniya Das <tdas@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ulf,

On Mon, Dec 14, 2020 at 9:23 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
>
> This would have saved a bunch of time [1].
>
> NOTE: this doesn't actually fix any problems, it just makes it obvious
> to devs that there is a problem and that should be an indication to
> fix the clock driver.
>
> [1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v4)
>
> Changes in v4:
> - Emphasize in the commit message that this itself doesn't fix anything.
>
> Changes in v3:
> - Proper printf format code.
>
> Changes in v2:
> - Store rate in unsigned long, not unsigned int.
> - Reuse the clk_get_rate() in the later print.
>
>  drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Is there anything you need me to do for this patch and the next one?
They are both reviewed / Acked and hopefully have sat around long
enough that folks who took a long holiday break had a chance to shout
if they were going to, so I think they could land.  ;-)  Please yell
if there's something you need me to do, or feel free to tell me to sit
quietly and be patient.

Thanks!

-Doug
