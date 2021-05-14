Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1517380B21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 16:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhENOKn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 10:10:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:32858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234173AbhENOK2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 10:10:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A4F8613E9;
        Fri, 14 May 2021 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621001262;
        bh=Oj6EqcJGVRl7HQLLBeUi7iUE3kzn01uiwQ60mMnabr0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZlvUVT7SuAyt9VcldCYSCodBCYYmchAiHGOH88ZC3CB0+UFIZv0AJ9zb9qd+KBO1I
         YAQo4Q+T2/o3NFR+yQvf6S3LOWBhlcp7VceLZeVfKnKWr3yHrhkSd4WI1bRDXufktZ
         MEFGb3k2J5zNmNjroisDYeT+WnzSet4yfgDwWup90y4YAqjtrBVq41cf3iy6yE6Y31
         88cnCbKWEByqPikwUdEN5pr2QWM1JArNT2yweWdf02Z+2EWKuPDifFuTFRZD9lT7UV
         kr1eKHE71qNPiSEZ7rWbiWGc5b/ppbA+cdYrHIpaHzUPCifaW1I9eaxHB3gTywS7C0
         MOVNhra/j6G/Q==
Received: by mail-ed1-f42.google.com with SMTP id s6so34790410edu.10;
        Fri, 14 May 2021 07:07:42 -0700 (PDT)
X-Gm-Message-State: AOAM530NLTC0EGGcX7+/1O52HMTEHIQe/VF+WR3Oq83KPNSMPIRzpUDN
        suvLWLE8skIbZiRqVrC5EBmlBkrxzfwxK/3SZw==
X-Google-Smtp-Source: ABdhPJxS5DE6zdpF8zsbOt/jb2GTOdzIFwXPWkfoHTlXpR26d8eKqzJ4NSveJ/zw/8+SAiTELXptXb98kelnX61fB1A=
X-Received: by 2002:a05:6402:234b:: with SMTP id r11mr56322652eda.137.1621001260779;
 Fri, 14 May 2021 07:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
 <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
 <20210408150300.GA1476562@robh.at.kernel.org> <827048554933585f4cc42c94aa911e55@codeaurora.org>
In-Reply-To: <827048554933585f4cc42c94aa911e55@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 14 May 2021 09:07:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCFNToWYUxGnWaA=EaRv5rPfWDsF_DDt6a-w=RzBTKHQ@mail.gmail.com>
Message-ID: <CAL_JsqJCFNToWYUxGnWaA=EaRv5rPfWDsF_DDt6a-w=RzBTKHQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Doug Anderson <dianders@chromium.org>, khsieh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 5, 2021 at 11:11 PM <mkrishn@codeaurora.org> wrote:
>
> On 2021-04-08 20:33, Rob Herring wrote:
> > On Mon, Apr 05, 2021 at 04:36:08PM +0530, Krishna Manikandan wrote:
> >> Add YAML schema for the device tree bindings for DSI

> >> +              data-lanes:
> >> +                $ref: "/schemas/media/video-interfaces.yaml#"
> >
> > Not how this reference works. Look at other examples.
> >
> >> +                description: |
> >> +                  This describes how the physical DSI data lanes are
> >> mapped
> >> +                  to the logical lanes on the given platform. The
> >> value contained in
> >> +                  index n describes what physical lane is mapped to
> >> the logical lane n
> >> +                  (DATAn, where n lies between 0 and 3). The clock
> >> lane position is fixed
> >> +                  and can't be changed. Hence, they aren't a part of
> >> the DT bindings.
> >> +
> >> +                items:
> >> +                  - const: 0
> >> +                  - const: 1
> >> +                  - const: 2
> >> +                  - const: 3
> >
> > If this is the only possible value, why does it need to be in DT?
> Hi Rob,
> These are the possible values:
> -    <0 1 2 3>
> -    <1 2 3 0>
> -    <2 3 0 1>
> -    <3 0 1 2>
> -    <0 3 2 1>
> -    <1 0 3 2>
> -    <2 1 0 3>
> -    <3 2 1 0>
>
> Shall I follow the below mentioned approach for defining these values ?
> oneOf:
>    - items:
>      - const: 0
>      - const: 1
>      - const: 2
>      - const: 3
>    - items:
>      - const: 1
>      - const: 2
>      - const: 3
>      - const: 0
>    - items:
>      - const: 2
>      - const: 3
>      - const: 0
>      - const: 1
>    - items:
>      - const: 3
>      - const: 0
>      - const: 1
>      - const: 2
>    - items:
>      - const: 0
>      - const: 3
>      - const: 2
>      - const: 1
>    - items:
>      - const: 1
>      - const: 0
>      - const: 3
>      - const: 2
>    - items:
>      - const: 2
>      - const: 1
>      - const: 0
>      - const: 3
>    - items:
>      - const: 3
>      - const: 2
>      - const: 1
>      - const: 0

That's too verbose.

maxItems: 4
minItems: 4 (or is less supported?)
items:
  enum: [ 0, 1, 2, 3 ]
