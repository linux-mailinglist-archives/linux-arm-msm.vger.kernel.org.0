Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9C63F3C02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Aug 2021 20:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhHUSSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Aug 2021 14:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbhHUSSS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Aug 2021 14:18:18 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4FCC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Aug 2021 11:17:36 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so16393474otu.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Aug 2021 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2MKqqfHMC9DXCZ5xc/Z5j/sgvGFltKULDdY+rzqw+xI=;
        b=fB2gtJr+5qSucpbo/Htu+gWHsd5m6BQLDuOP2RIzcFVcA4UNf6kYwNfvBWnFOCsiXV
         sAKHY4MVkMqsls1si64SP/MHHeSH9hMsqBLhYDHVBrqP5qGxS83E5QYhoxDJnm3/fZTw
         F2PREdmGa2lzOs8Rlg5fl2hsZp7zu0CLnNyJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2MKqqfHMC9DXCZ5xc/Z5j/sgvGFltKULDdY+rzqw+xI=;
        b=csAv24Sp3LQUku8fzsIg6pwpuR5/d9FB8hNELrUEIphppQTFCcA1gy3y3lcb+N+FAM
         8Zyjh/50kHHSYjp6hsCdhiRfeujltKZS3SoPRalop68oI7AxjJxjzUQQv06G+ImVuGLQ
         IWISKO6y/z/Pe//9rsXFMIvcvWpurA5ElDGu289g80/w287I9pP+XE3u/kq5LFC/Jyfo
         k0gboCLdXj1YUxpWnTNCfFA2mjspjYxv5D4vMesFzTbt4BuJIf4zzjCmF2kxA4Cf8yIg
         JlTQO4Ynmub6wcxvkk2d5fZ+nVgxK7/mMh5CH9ybx6Ox7U0JH4yW8JdRbhYJrAgKXT1n
         7H4A==
X-Gm-Message-State: AOAM533YLX8g03DMVBye04HQLEz07uHgAxBJtDdxNfWDN3t9h1zJ2ES5
        j34qlC6blmA9XUgRtvUC2mTZKr2WbiNc8RWapaHvYA==
X-Google-Smtp-Source: ABdhPJyrMLTV+CWdNDmUPr7eiJ450LgaPMm/6QyCI2ugSBUfQT/aHAxPyhwPwc5pCP7HOzreW/pBZhds3Uo30GK/ALc=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr7110085oiu.19.1629569855413;
 Sat, 21 Aug 2021 11:17:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 21 Aug 2021 11:17:34 -0700
MIME-Version: 1.0
In-Reply-To: <d733d47bc6a86fe28302943e50d02bd5@codeaurora.org>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org>
 <1629342136-3667-3-git-send-email-sibis@codeaurora.org> <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
 <d733d47bc6a86fe28302943e50d02bd5@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 21 Aug 2021 11:17:34 -0700
Message-ID: <CAE-0n50z=MaEZhXRSQpN6Jo8m7nyQSS6MqikAgT5cfkH1ZvL_g@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-20 07:24:02)
> On 2021-08-20 00:25, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2021-08-18 20:02:05)
> >> The load state power-domain, used by the co-processors to notify the
> >> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> >> suffers from the side-effect of changing states during suspend/resume.
> >> However the co-processors enter low-power modes independent to that of
> >> the application processor and their states are expected to remain
> >> unaltered across system suspend/resume cycles. To achieve this
> >> behavior
> >> let's drop the load state power-domain and replace them with the qmp
> >> property for all SoCs supporting low power mode signalling.
> >>
> >
> > How do we drop the load state property without breaking existing DTBs?
> > Maybe we need to leave it there and then somehow make it optional? Or
> > do
> > we not care about this problem as the driver will start ignoring it?
>
> We can afford to break the bindings
> because of the following reason:
>
> * Load state in mainline is currently
>    broken i.e. it doesn't serve its
>    main purpose of signalling AOP of
>    the correct state of Q6 during
>    system suspend/resume. Thus we
>    can maintain current functionality
>    even without the load state votes
>    i.e. when a new kernel with load
>    state removed is used with an older
>    dtb the remoteproc functionality
>    will remain the same.
>

Alright. Is that reflected somewhere in the commit text? I must have
missed it. Can you please add it?
