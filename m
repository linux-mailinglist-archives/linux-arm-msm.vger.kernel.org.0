Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE7BBBA1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 19:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437127AbfIWREZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 13:04:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36971 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfIWREY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 13:04:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so14832808wro.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykwFxYrA4TPvhlZt6sywAP+RMRKlnDd3p5lXkqoJCKQ=;
        b=IysTAF4o9O45FzinjBLSR32vsaOnelTbtPbjbibEm3uDyNozHftQuAp3XHwZXC1t63
         o6Z5OOEQN6DQ/V/gawziEqGQAC9898g9i0DxggcNjoHi8ACHenswnKia2O6z4qZhjP7f
         uOqLPPZZaUtmLlWA9CuuPkvxnMzi+8CfAhowohorheHEPJdkAj9Y/EQPq+phVjkjHdU1
         kNCJSirhzFhcIMHK5JLuabw48DpRcGkcWQYK3aH8l71wX/C2sZEit29tlMo9bYGIteRD
         dnMotfhruT5RlYimgmlaYciwhSB02uZKUyQx43+fD6CDqcYsFDs7haHZTbpO16HYzLTu
         M7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykwFxYrA4TPvhlZt6sywAP+RMRKlnDd3p5lXkqoJCKQ=;
        b=lS3OK6Mwy9HYY+6mIzuU/KnFyeqBUp8gaGYQjtIGlDgR3Ka84qfHlYyAtRYfDuM8qx
         fb08+lMOCP8OLLIYqxojmlEiuYP6wwPrcuwKgeghLWsgFnpUUcAIbfph3YGUuwidCx9m
         xBKr/3s9gr0S+N65QYIDZQn/CXK5ehl4RktbQXGc54D4H2x9dfcVEESThAnZi9WCDLXo
         Ljo+Vl7xA67u7tr9rl3eG6Bk12xEd23FXW4sNI3Aav07Dz05ow5OQgiraDRRZZ2YB/qZ
         KKHoJ643msk+nB7DyD6B6nRedeQ+B6ciEsSpGv2hVgN5kZhrCfl/kAEmq421D2WWJjW8
         46Ig==
X-Gm-Message-State: APjAAAW0+f5oXX1zw619ozZIPNxNxNy/5BVl5XyFyRikvIgk6V0UnOiW
        Qfu9qNWzAXMzKsuglItUtxqSlBA2HPOXEKIVTNs=
X-Google-Smtp-Source: APXvYqxQ90sr4EEa5aeBIMKyauKkuhRVFiILEHi5/Rp9Omk2zAC6No51Ma4Vf+KeCWq95/D6l9MSDnnw5pvl9Qg6zwA=
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr341653wru.198.1569258262873;
 Mon, 23 Sep 2019 10:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com> <20190921100439.64402-2-kholk11@gmail.com>
 <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
In-Reply-To: <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Mon, 23 Sep 2019 19:04:12 +0200
Message-ID: <CAK7fi1Y+h+qg3NjnX4KKJhXeZfptSsTzQ9YhNH8kMHZYSfbE5Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno lun 23 set 2019 alle ore 02:45 Jeffrey Hugo
<jeffrey.l.hugo@gmail.com> ha scritto:
>
> On Sun, Sep 22, 2019 at 8:16 AM <kholk11@gmail.com> wrote:
> >
> > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> >
> > Some SoCs, like MSM8956/8976 (and APQ variants), do feature these
> > clocks and we need to enable them in order to get the hardware to
> > properly work.
> >
> > Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
>
> I don't see these clocks documented in the mdp5 DT bindings document.
> They need to be added in the DT first.

I know, you're right... I've just noticed it. I'm sorry, I've
completely forgotten to
add them to the documentation.
I'll do that ASAP and resend.
