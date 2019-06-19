Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD084C243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 22:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFSUVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 16:21:38 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35099 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFSUVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 16:21:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id p26so1160904edr.2;
        Wed, 19 Jun 2019 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dt5foXU+GSxuVMklIKIKR8ocB5pAKJsCTrBcOxfy50A=;
        b=AraBg7zqtUA6q56HZl04tbp2kVZutw3FJe0SuFvMdzlxMIh0y3Mp5tKVIffuYBaWhJ
         JpxJcI3RzyjyEJ6p9od/SmjAsFYCIBUXkIft4Khrxe0AKzGYNCosKu912/XWzMdlZrQ+
         pQIGYai+TE2OHtyzYVeetKp9QZHt0RWHwfjsVfa9CHReYql6rUPYo8qmQ8KvB1xT7xNv
         ktBWchctw34EaZdJKN6v9yMkpoGFee9QG1YpS/mAfmLdvnq81dig+lrfXLQvKU6Nea9u
         TGmh/XbuIW33FWdoT+srdSJ9LRZNlDE/ZNJwpOujVbhLBt7GaLqttSG6hB1tuLCxSj8c
         FlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt5foXU+GSxuVMklIKIKR8ocB5pAKJsCTrBcOxfy50A=;
        b=DXwrTgmGpsjJuRyF7mGuW9G5zSB6VYtbwr4IY0jHi8znT4XmFET88Pl4NjSg7QJEoR
         27qCYaHocHeS/HB30QeVpMyja0tCFv/9Vkqq2alEvam9BsN+60yO35rKUmUKwQihS4WG
         JuyYygDn+vukTiVRg3J6RL6TjeN9u65m0zWFQUjDmV1O9vJmRelKOXNIK01DhwWHDQ9Q
         504mpoebLGOahEQdShfJ6gYB9BvK7NmAwvjHalmXScQ9B3YIWII1TPg3tBNtxE7XGaCW
         u4miPQc7CuIKVmbmFBif/Hh7umRAnUyTC8re2hCGLrCPjlueUV/kkj1u/BA7ue9lOpoz
         KBmQ==
X-Gm-Message-State: APjAAAU535MTn6c8mCVKF9MqtcNETo8xvdKTr7SkEmrHlL9fg5vXf0uF
        Q2wyZq9rBRewGjbZZ/1A3PTJRNNuct8+A0aRpjg=
X-Google-Smtp-Source: APXvYqxiuHWkvqriR4R7oJlLWlmCuNQMbohUlkbW5G32Zn3s+lqiJyUeJOj/hTLGnhHr/AUshdmpn/1PBNhzP8/JWNg=
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr12605405ejj.192.1560975695671;
 Wed, 19 Jun 2019 13:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 Jun 2019 13:21:20 -0700
Message-ID: <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Brian Masney <masneyb@onstation.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 1:17 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> > must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> > optional ocmem property to the Adreno Graphics Management Unit bindings.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > index 90af5b0a56a9..c746b95e95d4 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > @@ -31,6 +31,10 @@ Required properties:
> >  - iommus: phandle to the adreno iommu
> >  - operating-points-v2: phandle to the OPP operating points
> >
> > +Optional properties:
> > +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
>
> We already have a couple of similar properties. Lets standardize on
> 'sram' as that is what TI already uses.
>
> Also, is the whole OCMEM allocated to the GMU? If not you should have
> child nodes to subdivide the memory.
>

iirc, downstream a large chunk of OCMEM is statically allocated for
GPU.. the remainder is dynamically allocated for different use-cases.
The upstream driver Brian is proposing only handles the static
allocation case (and I don't think we have upstream support for the
various audio and video use-cases that used dynamic OCMEM allocation
downstream)

Although maybe we should still have a child node to separate the
statically and dynamically allocated parts?  I'm not sure what would
make the most sense..

BR,
-R
