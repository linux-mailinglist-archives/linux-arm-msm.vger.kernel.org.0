Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8681B1E08EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 10:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgEYIgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 04:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgEYIgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 04:36:03 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07B2C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 01:36:01 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id z9so10582312oid.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NRyvkXRye4iYanmLJM9esEpVEWDZpWUJeI38gHuM/d4=;
        b=D69DgVjlpmos8d57BUoJiWBpsjXn3XSt1iSRkr+MkDgZDWE5try1xRKerx9simqzAF
         6QMf+j8OVCNnVLGtBeTGYwPOGjATY/XS70Y1LO3yvCCFxE1gJSWZXgDeHU277tgQ9Yqe
         T5ylTRD/FbgCXV3yBDwHEITJ29FuG6AvFblhn+33/ZrnWAzvb5HJPz2HwaKjaq6Lr9lV
         qq1AIV9VSuqOLLrhXErp5vg2bFLaenpIAb71fAxU2da0qs0a5DRSywo3gmKAEpN5jJMl
         dSROMusTv0v3AFNCIUeyL/WudiYqfwQ3h7GnjW2u3qAONGrOJTve0zSUi8g5tWeMPKhi
         iI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NRyvkXRye4iYanmLJM9esEpVEWDZpWUJeI38gHuM/d4=;
        b=eicLInQM3+/I+4Ffwbh2Cmltc7CrAAqS3lXxZOWWtk3npHP4DXOVwjDRLj0QVHrptT
         J0j6Jc3IrwJdjFDIe+prlPThhRK7mZ4tQIt7uJQjoLveIwdy+hIhgpuRw8V8fxZq0leJ
         LMZqMSfaNW8IY3JP0hTOg5pBW4ORemde4gLtcmP6s9ZtUyJ1mzcMoitaQofkjYTYMvyM
         99AFUDKqAdEzJjCy52ERshB7rm0hpb5JGqxtBGX5A2MEmG8LKO3YiQez7znpUYzi5kFH
         sfpvptr8ArAoGvnahMv8O8cpxf9VVKO+WjShN0py7EQnSeUHeogqUnih1XEAxuETDgXG
         lJxA==
X-Gm-Message-State: AOAM53161Bxo+BOHpdjvaUFrOmQYbo8VXAUZuI+2irj6htmak7xPoSya
        kxE0PVusEuP/C8r8RU3mflxuNH7jKOR6Vyo+ND1O7g==
X-Google-Smtp-Source: ABdhPJxIrQuW5N7Il7y0ZdJ5sA7xOTsYPnibkCKplJ1Fr7FxMg6AgD+RBAREa2r3PHYpGN46pbDyNDGJWwX9BuuN0dE=
X-Received: by 2002:aca:4ad6:: with SMTP id x205mr11033941oia.56.1590395761206;
 Mon, 25 May 2020 01:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200518082129.2103683-1-robert.foss@linaro.org>
 <20200519102256.GB8114@Mani-XPS-13-9360> <20200519232442.GE2165@builder.lan>
In-Reply-To: <20200519232442.GE2165@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 25 May 2020 10:35:50 +0200
Message-ID: <CAG3jFytUvfwFKvysKpRhrRRAotMv-epQZA3zq8DG0QdrQMpfyg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm APQ8016
 SBC + D3Camera mezzanine
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Thanks for the review. I'll incorporate the changes if we decide to
that this DT should live upstream.

On Wed, 20 May 2020 at 01:26, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 19 May 03:22 PDT 2020, Manivannan Sadhasivam wrote:
>
> > Hi Robert,
> >
> > On Mon, May 18, 2020 at 10:21:29AM +0200, Robert Foss wrote:
> > > Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
> > > the Dragonboard 410c with the D3Camera mezzanine expansion board.
> > >
> > > The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
> > > which is what this DT targets.
> > >
> >
> > What is the motivation behind adding this new dts? We have been using the
> > userspace tool [1] for applying this as an overlay for some time. But if we
> > start adding dts for mezzanines then for sure we'll end up with some good
> > numbers which will flood arch/{..}/qcom directory.
> >
> > I could understand that one of the motivation is to provide nice user experience
> > to users but that's also taken care by the dt-update tool IMO.
> >
>
> The motivation for posting this was to provoke a response like yours.
>
> I knew about [1], but not that it included the overlays. I'm okay with
> using overlays and the dt-update tool. But I would have preferred that
> the dts files didn't live out of tree, given that this approach breaks
> if I change the name of a node you depend on upstream.

I wasn't aware of the dt-update tool, and it seems pretty neat.
However, a thought I had is that using it to enable a dt-node or a
board variant is not very different from applying a patch the the
upstream tree. The work it takes to do it is about the same, and the
maintenance burden of using a patch is about the same as using
dt-tool.

> > [1] https://github.com/96boards/dt-update
