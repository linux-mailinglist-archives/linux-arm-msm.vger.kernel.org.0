Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE53E24A5DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 20:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgHSSVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 14:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgHSSVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 14:21:02 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08343C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 11:21:00 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j188so12462245vsd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
        b=MJ511LjL0Gf8T+5otwSMIHAYNGoOTa7oOz3vFzBU6AZJ6dAX+nI9cC7118htwG/ORX
         eBs8xHYraAXfTg3+3J/RFpfkMga9Cj17oTb4p/TBhXJhoh4jgceQywdVOQqMSK/JOJ3l
         PwBzJDQ8H04HrV4VQtbb6ovc5H+eRX5T4ho3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
        b=Jp0SgAaoILceeWJlLmOuaHfJ0PSukmZ8bx1nxBe5XoY0ky3H42kznyESGv+QXoHKxe
         0KW4D9qODVPHH+o5p3WBvmVsyNG0VDpTSrqUGUK/ZHtlzjQhBTxx7QYGR4LZZSWNxyDH
         gieWqRJ8z6QpEc7PDPPNpZvhpZJy+YUTgiKFmW2rv0UbyLAlQ2zB3YiYiots1SJTdaGj
         JJrFzfEEyFgwzv2CNbY7TazGChBD8zPNJ7kDD3rkPSkM8mosz/AnLh4k+YGLxNc6jiDV
         MHZkVb52JCAIJCUdEIB7+jNJ4IFe+NXksOl5auYp4ctPvoZv6PPdHd7HYiJcWMSXyQlN
         re2w==
X-Gm-Message-State: AOAM5324fxy1hHQBMRSQmnRsZGXy6Ei2o82OawZOC3EbmAc1MayCv4bf
        KbIbvyXqOH/7vrF3Uu5y12J8+I2WwZsWXg==
X-Google-Smtp-Source: ABdhPJwe0kDAp4qeOBybvSMup0sGG1pvP7CEaukng5LLQuRdKzXfPrDZiqY1GxT5aEQMcYIdXdZ2CQ==
X-Received: by 2002:a67:3285:: with SMTP id y127mr17258481vsy.221.1597861258811;
        Wed, 19 Aug 2020 11:20:58 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id u3sm5023378vkb.0.2020.08.19.11.20.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id l184so5337101vki.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr15612583vkv.42.1597861257099;
 Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com> <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com> <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 Aug 2020 11:20:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
Subject: Re: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 19, 2020 at 10:36 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Aug 19, 2020 at 10:03 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Jordan Crouse <jcrouse@codeaurora.org>
> > >
> > > Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> > > devices depend on unique features such as split pagetables,
> > > different stall/halt requirements and other settings. Identify them
> > > with a compatible string so that they can be identified in the
> > > arm-smmu implementation specific code.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 503160a7b9a0..5ec5d0d691f6 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -40,6 +40,10 @@ properties:
> > >                - qcom,sm8150-smmu-500
> > >                - qcom,sm8250-smmu-500
> > >            - const: arm,mmu-500
> > > +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> > > +        items:
> > > +          - const: qcom,adreno-smmu
> > > +          - const: qcom,smmu-v2
> >
> > I know I'm kinda late to the game, but this seems weird to me,
> > especially given the later patches in the series like:
> >
> > https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com
> >
> > Specifically in that patch you can see that this IOMMU already had a
> > compatible string and we're changing it and throwing away the
> > model-specific string?  I'm guessing that you're just trying to make
> > it easier for code to identify the adreno iommu, but it seems like a
> > better way would have been to just add the adreno compatible in the
> > middle, like:
> >
> >       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> >         items:
> >           - enum:
> >               - qcom,msm8996-smmu-v2
> >               - qcom,msm8998-smmu-v2
> >               - qcom,sc7180-smmu-v2
> >               - qcom,sdm845-smmu-v2
> >         - const: qcom,adreno-smmu
> >         - const: qcom,smmu-v2
> >
> > Then we still have the SoC-specific compatible string in case we need
> > it but we also have the generic one?  It also means that we're not
> > deleting the old compatible string...
>
> I did bring up the thing about removing the compat string in an
> earlier revision of the series.. but then we realized that
> qcom,sc7180-smmu-v2 was never actually used anywhere.

Right, so at least there's not going to be weird issues where landing
the dts before the code change will break anything.


> But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
> "qcom,adreno-smmu", "qcom,smmu-v2";

Yeah, that was what I was suggesting.

-Doug
