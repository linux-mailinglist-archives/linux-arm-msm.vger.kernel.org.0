Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F43501C63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 22:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346124AbiDNULv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 16:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346105AbiDNULt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 16:11:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449A95591
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:09:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id i27so12064931ejd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
        b=oM2qYDjzsXJDUAHNx6vFqnV1+qnLdL1Xe5C3dzmC66+quS3wWWGkaNIQsO9Yy8nXam
         YG0sUWZXbEJhoHkK57/0Iw5a6LpPk/LwtPQH0w6pgdrknxCmSrmIE74V2aZZjHJfEvdO
         3quH4CB8aG16ID9RExDHT4l4sF/8MSw6AwssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
        b=zuXZJMHJQylL6f5Wn2RXTPThcAsEe0Y1X90CpZrdOSwykeUzyEuorACFoF2U6WNY8o
         9HEbMnc92SYhK0Ca66Wgikg31+DZlkKRugValL+9P5/oSCuqiOM17/SqfSN5mKmg+/X+
         DXfbr7CaBNyLh5v/awj1smqHq3xukzapOLTOFm0Eq+/WnMnCIGSEINsWm3/12kbj5YZ4
         CGt7Z+AbIOScD9Sm5Bm+e0IpiIrnrwuTWXEB2225tvFSagMkU/KkGQdI1cmfVpCdoLjl
         BCHpIgNffJNeAPkVSjbKed2pBNQJHK9/fVZ/OOxOn6kS5HpHkGIZw1tv40neNksMAZsY
         w/8g==
X-Gm-Message-State: AOAM532ctfcyJrvx49l6GJeZ4C/QGb6S4iZjCBr0eRroto+p20Mi2Pye
        PxaQWHxF8q/6tFHN8VbENqkuB4MViib6/WZ7Mxk=
X-Google-Smtp-Source: ABdhPJwl0MqOJ9SV9bn2u3LicMCzqAf/0e0GxSsQ6Cr8qiY4Cozx92w1cQYVNffSoNauroxrBpZKOw==
X-Received: by 2002:a17:906:7714:b0:6ba:8a6a:b464 with SMTP id q20-20020a170906771400b006ba8a6ab464mr3650696ejm.613.1649966961306;
        Thu, 14 Apr 2022 13:09:21 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id b11-20020a50be8b000000b0041cdd4a7bf6sm1555659edk.58.2022.04.14.13.09.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 13:09:19 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id w4so8337851wrg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:09:18 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr3122026wrb.513.1649966957865; Thu, 14
 Apr 2022 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org> <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
In-Reply-To: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Apr 2022 13:09:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        Aravind Venkateswaran <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 14, 2022 at 12:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
> >
> > I think it's too verbose and a bit incorrect.

Not sure which part you're asserting is incorrect, but shorter is OK w/ me too.


> > This is a bit saner:
> > /*
> >   * These ops do not make sense for eDP, since they are provided
> >   * by the panel-bridge corresponding to the attached eDP panel.
> >   */
> >
> > My question was whether we really need to disable them for eDP since for
> > eDP the detect and and get_modes will be overridden anyway.

Hmm, interesting. Probably for DRM_BRIDGE_OP_MODES that will work?
It's definitely worth confirming but from my reading of the code it
_probably_ wouldn't hurt.

One thing someone would want to confirm would be what would happen if
we move this code and the panel code to implement DRM_BRIDGE_OP_EDID
properly. It looks as if both actually ought to be implementing that
instead of DRM_BRIDGE_OP_MODES, at least in some cases. A fix for a
future day. Could we get into trouble if one moved before the other?
Then the panel would no longer override the eDP controller and the eDP
controller would try to read from a possibly unpowered panel?

So I guess in the end my preference would be that we know that driving
the EDID read from the controller isn't a great idea for eDP (since we
have no way to ensure that the panel is powered) so why risk it and
set the bit saying we can do it?


For hotplug/detect I'm even less confident that setting the bits would
be harmless. I haven't sat down and traced everything, but from what I
can see the panel _doesn't_ set these bits, does it? I believe that
the rule is that when every bridge in the chain _doesn't_ implement
detect/hotplug that the panel is always present. The moment someone
says "hey, I can detect" then it suddenly becomes _not_ always
present. Yes, I guess we could have the panel implement "detect" and
return true, but I'm not convinced that's actually better...


> And to go further, I'd expect that a bridge should expose the
> functionality that it supports, regardless of what is connected down the
> chain. Otherwise we won't be able to mix and match bridges because the
> code is brittle, making assumptions about what is connected.

From my point of view the bridge simply doesn't support any of the
three things when we're in eDP mode. Yes, it's the same driver. Yes,
eDP and DP share nearly the same signalling on the wire. Yes, it's
easily possible to make a single controller that supports DP and eDP.
...but the rules around detection and power sequencing are simply
different for the two cases. The controller simply _cannot_ detect
whether the panel is connected in the eDP case and it _must_ assume
that the panel is always connected. Yes, it has an HPD pin. No, that
HPD pin doesn't tell when the panel is present. The panel is always
present. The panel is always present.

So, IMO, it is _incorrect_ to say we can support HPD and DETECT if we
know we're in eDP mode.

-Doug
