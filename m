Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E44CEE949
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 21:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfKDUQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 15:16:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbfKDUQl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 15:16:41 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB286214D8;
        Mon,  4 Nov 2019 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572898601;
        bh=b05dXcuuti/YHfLZVAgLW012W4Cd7uwtx+Uv9cfaXV4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LArOh2yqmAOyihXRGKKn9+QglYUNXuVlu87nkkgOJReelq2tk5zQ1PGsOD2RBCj0W
         m4FQlHk2zZ3XW97iLKD86GB5iiuxRjxp0xplNxJZmq/F4BrnAwgbeJ6V/MZ5PHkP4h
         0To4p6vQ+eZi4+o+4w//LD9NTA1z3Y1VVgy5vQcA=
Received: by mail-qt1-f177.google.com with SMTP id g50so25911511qtb.4;
        Mon, 04 Nov 2019 12:16:40 -0800 (PST)
X-Gm-Message-State: APjAAAXGk6NULi28U24b8k60Cxd7aUHNF6oSXhZ13whh4Y8Svs3rQnCi
        QPzPiDuuBGP3ypAv7xd5cmIVvvBZjOY8QTJaig==
X-Google-Smtp-Source: APXvYqy+kxc7d1zPxumnx1r5zwDTIWjMhGPQkAnTVZG1ZSfd3bbuuZj04XZHEpVsnCoQLFtXRw797ot2aiv6Oofk5pM=
X-Received: by 2002:ac8:7612:: with SMTP id t18mr14352572qtq.143.1572898600005;
 Mon, 04 Nov 2019 12:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com> <20191031104402.31813-3-kholk11@gmail.com>
 <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
In-Reply-To: <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Nov 2019 14:16:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTigx-=E4YoAjOJ9TtZpnAq6+=5VagMgBSYAxsncYCeA@mail.gmail.com>
Message-ID: <CAL_JsqKTigx-=E4YoAjOJ9TtZpnAq6+=5VagMgBSYAxsncYCeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
To:     Rob Clark <robdclark@gmail.com>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        marijns95@gmail.com, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 2, 2019 at 11:53 AM Rob Clark <robdclark@gmail.com> wrote:
>
> + devicetree list

It needs to be resent to get into my queue.

> On Thu, Oct 31, 2019 at 3:44 AM <kholk11@gmail.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > These two clocks aren't present in all versions of the MDP5 HW:
> > where present, they are needed to enable the Translation Buffer
> > Unit(s).
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 ++
> >  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > index 4e11338548aa..43d11279c925 100644
> > --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > @@ -76,6 +76,8 @@ Required properties:
> >  Optional properties:
> >  - clock-names: the following clocks are optional:
> >    * "lut"
> > +  * "tbu"
> > +  * "tbu_rt"
> >
> >  Example:
> >
> > --
> > 2.21.0
> >
