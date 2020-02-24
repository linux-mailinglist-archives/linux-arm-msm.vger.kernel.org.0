Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275F5169F13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 08:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgBXHWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 02:22:20 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39484 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgBXHWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 02:22:20 -0500
Received: by mail-ua1-f65.google.com with SMTP id 73so2875300uac.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2020 23:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=51VpaiWfXJd1ONeSEUuEOWBMV41ZnSSRJG+n3jg+2Ko=;
        b=uXt0JYDxbDwwvUxezeC7a0GwQS/QoUKiPOOvCcnibKZADVlU20s696uVOrhCwyJ9uD
         ebeOhCAu+glMcm8JwQJc7NynJr6maQvt/Q3W1Z5FHboIMkw8LjWT34FT6FQBmtYQBkBD
         tiilg+lE6Q4YmUCeFq2D3+IM2habtm/yvHnQgOp93Fa+jZYMQ3P/iQX4xncguVgs+htm
         84nedT0uT3cWK+EDwKjY1/aEEGrdU+W3RZNLcFTmBI130iA3UiUI4gSNQYqtSwzaM5rZ
         NpQieeMXPKgyy0DFkcErj60rJbMjRQ+02CXK8W06u7EMIwEidMCys6BU9Ss+clceXT8u
         5AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51VpaiWfXJd1ONeSEUuEOWBMV41ZnSSRJG+n3jg+2Ko=;
        b=bkbHrMJp1La7Tg2cZNGYZlnmvOvVtFNtPWddH2Qwfl7qQCQ+17u+8523pYdZ8lz3Qb
         sv72vFkzhNzMluWiWKpWLszL0xGVpH0rdpcbFj/FqmZlFCVF3D3+wJDikqYBkn5Z4gcI
         yDFKDnyPytWpK3+Dqyy2FFADlyUCX7i28l8JToS/lEGsSpsQX09AC7zbcsFOkTgLjWpo
         Ou0cITk8hnuV2AISz0OhObRKiLlG+OO5shM2wqh7cGikAq+QB1vdRYtTkdZVq0OqveFK
         Akl0XbaLXbt52J7pYUAmlyPjray/eUgNcQkUTY1deGojfB2pj/d43RTcWSx2EM7ZLdrK
         r4MA==
X-Gm-Message-State: APjAAAWb3DOILqf5HHHjAPnA8Civ9RFHqErKLli5RPpy2MVtxTx2pATZ
        AUm8ryvUFKwCNP0Jt3sCb5s18sEOUVx9WlKayd71Pg==
X-Google-Smtp-Source: APXvYqwotp7wpK2rG0V2qY5vEm6T/AGJnDE4PrXlDeoCMmvRzQPnX9+w+hVrp1Rer4U4wdebA3lwWbaWut3U5wqk+kk=
X-Received: by 2002:ab0:634c:: with SMTP id f12mr24202339uap.48.1582528938687;
 Sun, 23 Feb 2020 23:22:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582527752.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1582527752.git.amit.kucheria@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Mon, 24 Feb 2020 12:52:07 +0530
Message-ID: <CAHLCerPQ1MhxHPYx9sODTf25MFzEYO7W8rREdarTUCGHJzZ2LQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/3] Convert thermal bindings to yaml
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sigh, typo on my part with the version of the series. Will resend with
corrections.

On Mon, Feb 24, 2020 at 12:50 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> Hi all,
>
> Here is a series splitting up the thermal bindings into 3 separate bindings
> in YAML, one each of the sensor, cooling-device and the thermal zones.
> Since I was learning about YAML parsers while creating these bindings,
> there are bound to be some issues.
>
> I have to add that the bindings as they exist today, don't really follow
> the "describe the hardware" model of devicetree. e.g. the entire
> thermal-zone binding is a software abstraction to tie arbitrary,
> board-specific trip points to cooling strategies. This doesn't fit well
> into the model where the same SoC in two different form-factor devices e.g.
> mobile and laptop, will have fairly different thermal profiles and might
> benefit from different trip points and mitigation heuristics. I've started
> some experiments with moving the thermal zone data to a board-specific
> platform data that is used to initialise a "thermal zone driver".
>
> In any case, if we ever move down that path, it'll probably end up being v2
> of the binding, so this series is still relevant.
>
> Please help review.
>
> Regards,
> Amit
>
>
> Amit Kucheria (3):
>   dt-bindings: thermal: Add yaml bindings for thermal sensors
>   dt-bindings: thermal: Add yaml bindings for thermal cooling-devices
>   dt-bindings: thermal: Add yaml bindings for thermal zones
>
>  .../thermal/thermal-cooling-devices.yaml      | 114 +++++++
>  .../bindings/thermal/thermal-sensor.yaml      |  70 ++++
>  .../bindings/thermal/thermal-zones.yaml       | 302 ++++++++++++++++++
>  3 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>  create mode 100644 Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
>  create mode 100644 Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>
> --
> 2.20.1
>
