Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF4A3191351
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 15:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgCXOfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 10:35:40 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36718 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbgCXOff (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 10:35:35 -0400
Received: by mail-vs1-f67.google.com with SMTP id n6so11252980vsc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
        b=YiMsSpudpT6FxZHxA6De/saSAHGXK7VlyDXtpNtN9hNzxOPelBBcnUkk9LPz8Mz4Ir
         KztvWvGmrqbAk7jwUQE14sSAWV4hf05oN5i6odmjR/cou/29qpALc9peKPyrjgXDkrAc
         oq6V4L/S8pZ9LSBWm00J5so+SUpk1hSQ8Va+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
        b=KIDk0SHSxv/pIpeXbZIiJsUgE90TX/6B/srCfiuj2UqIktyWYLF9sHb+DeCCA/CZkZ
         dP+zADBif8warE3i4bQnoy9qK4XSHbj7BkIAEaLOhA8M2vmOAzWn8S6i8L0LLaTBrKn4
         YNpUKOZUIdSYtJwtelpTNnZhE+hIMH5DyGdzFRRfYuTmG1QFayRKVGamlHF7ep7z4VX0
         1ZcMP9Lh+cD+YBD4JPcsr4zT8pyu9cEUiMgAJTS6bgi+oFJxt0VskjoLulImNoxM9ZPk
         EJ0qlH8BMKTNWczyaDn00ssis5twuv5CPye7GQvt/79HxEHQt2gr8DRrqJ/zpLZLz0EI
         aGXw==
X-Gm-Message-State: ANhLgQ2qUXlmq5D8HptQyRpinfAI3So9Pz67hHlaRamKrKmsw6rOzW4l
        GAx/t+1sFlYjUJMCS+HVgWRcwluQA+U=
X-Google-Smtp-Source: ADFU+vuxxt9vAcLdT9GAxgH3aqfloo7bLzgvPoxTcWwPp5D1VeRdASrjsBeigdqESFo1ZERiGaUvww==
X-Received: by 2002:a67:e24c:: with SMTP id w12mr1520500vse.153.1585060533894;
        Tue, 24 Mar 2020 07:35:33 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 94sm10553496ual.8.2020.03.24.07.35.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id l18so2187617uak.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr18039835uab.91.1585060531555;
 Tue, 24 Mar 2020 07:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Mar 2020 07:35:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>      _dpu_kms_disable_dpu (Rob Clark).

I'm wondering what happened with my feedback on v1, AKA:

https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com

Maybe you didn't see it?  ...or if you or Rob think I'm way off base
(always possible) then please tell me so.

Thanks!

-Doug
