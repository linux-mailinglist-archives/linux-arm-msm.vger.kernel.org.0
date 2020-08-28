Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97ED3256355
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 01:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgH1XLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 19:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgH1XLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 19:11:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B1AC061264
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 16:11:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d22so1391120pfn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 16:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eTKdXiRCKS6tUmMOhEk7xSRiz3K0QjMIqXKfgOUTwVI=;
        b=DTx98g6eHjR9eWZ8L8pNZvzNzyyoyGJGoCSVzxnwe383QCEf6CiPXBYd7KGVxtcyWM
         imHYSMTzYzDKbP9GdybbwuCc5YWmZJB/nMyEkOnXnO1PMF4GDNLmCJ3JJQnnthHL+c6q
         B4VizqndaVWBqtihAlgf8low/9/yvPUV9bIiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTKdXiRCKS6tUmMOhEk7xSRiz3K0QjMIqXKfgOUTwVI=;
        b=a1rTzYNKl44t/d2chInvtGMuJ2LXDLS4nKgrQ6hUwVaXrklAqqJyptjFUgHxkzfKF4
         W9VVDcSBLCI+NBpvBg7gQk0HqNEGmOpBOKv3+5zdNFqyBS6gDEZlITuaw6+mlkr5z3ju
         YZocsjQWimaDXbsy1KyUAOUUKyd26A9cJD95oYjdKDyhth0tvi8jak1lGwzodduCb4mA
         o67M4TuZvd7JLhreIuqdFKzUk36obOD3FEmNMfeTf3usNl0mXs+Kkv/nXmcD9sxD5M5I
         PkGWwzfNJ9sxufn75rG7INoTzJb76l3sjjW+BNIjLzFcXybgcqHV41CEUZbByYJhtYJ1
         AQQg==
X-Gm-Message-State: AOAM533EQuMXFp6MT1yMXmB08PjHmsFExDDlFdADWokB93klvbgcUJPq
        /V1C0bBZUeU1LfxRVRKoQipK6UdCl2c6sA==
X-Google-Smtp-Source: ABdhPJwBL+23VHA5eA7FtXGXUHHP1RmkGEhE/23xKhy3XDIjL6gpkyky1pcz4t/1fQhFenETRFPsfQ==
X-Received: by 2002:a63:1a66:: with SMTP id a38mr718626pgm.253.1598656291123;
        Fri, 28 Aug 2020 16:11:31 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id e65sm334036pjk.45.2020.08.28.16.11.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 16:11:30 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id g29so1140617pgl.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 16:11:30 -0700 (PDT)
X-Received: by 2002:a1f:d6c4:: with SMTP id n187mr874772vkg.65.1598655985575;
 Fri, 28 Aug 2020 16:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200826110454.1811352-1-cychiang@chromium.org> <20200826110454.1811352-3-cychiang@chromium.org>
In-Reply-To: <20200826110454.1811352-3-cychiang@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 28 Aug 2020 16:06:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Message-ID: <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 26, 2020 at 4:05 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> +config SND_SOC_SC7180
> +       tristate "SoC Machine driver for SC7180 boards"
> +       depends on SND_SOC_QCOM
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_LPASS_SC7180
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_RT5682

I haven't done any significant testing / review of your patch (I'm
mostly sound-clueless), but I believe that the above needs to be
"select SND_SOC_RT5682_I2C" atop the current top of the sound tree.
When I fix that I can confirm that I see the rt5682 probe on
sc7180-trogdor with Rob Clark's dts patch.

-Doug
