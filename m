Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CD124A505
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 19:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgHSRgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 13:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgHSRgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 13:36:51 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DF0C061757;
        Wed, 19 Aug 2020 10:36:51 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z18so22306159wrm.12;
        Wed, 19 Aug 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bhGv6x9d7Md61hsuFNIkfPq3bcxtQviu/6k9haxoN4=;
        b=Y4Yn43JUJRrnzNlVJ+qfW7bTGDlgp2KtAFgWc1ZC9OPN4PtPcF9CK1XSQ8U3PFJ1Tu
         Bsm+r/sys5RMoWP28GmgJYpsd37KV1EcicLfj3QOLnX3TPMxtYJJVk1yCM3Y0w3kIfhY
         EmQpu3G85KwwwpgqHDimPq1NhbMCE0REYYYcDYMlfiMBhnyGJSOPmgpqKDb6bTqvXRAm
         VcjvxvQwfzAM+GBK2aL091eP/ab/HYq1kim9ftBGy5zXWJLGTve5gyYsJ6xOvtaphH+n
         k6y63OsFV5RRYbksUcCsack5Rbaa1ukiRgAA0dZwr3rmhwOi/ViiIumPfhNQjS0qK2jj
         mTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bhGv6x9d7Md61hsuFNIkfPq3bcxtQviu/6k9haxoN4=;
        b=cy+VuMKoK461oslcLqi7nfRIXENYL4U4p3j96s0fek8ItSJhmlADzLh8zAv63+M05T
         92g8apjq9+koiB6IdtPP8dcmluUrsGOBSg0TlaA6O5NQFsQi5AhTfmdHcyi81Fkbtyqz
         XeLfZ5Zcfvfw3KSnJLkpu9sdXcGpLRNb8rfWtcykTRdBaHS4xcGOU0NYgOPR1NY3huUf
         cz8PQaIhpy6R1Abxv2ChEridV5DVBVnCI/1orH/9DAf9Tc4Di7LNY/vrfsRPeMQEhqFt
         uKwMBVz87m8PmnSTCyG1Jx+lUOjhD7w1bVdGmRlJcDbQzaYu6ujlAPLkrL4LChddNfdq
         BohQ==
X-Gm-Message-State: AOAM5305918VcDsvnv6RPD0H8DT9jhdC88F/GUBq7koSnXo4xXCitrff
        ph26w1JSVaZJkOBFmaXl/w2gUDAOD3XVyoGJu7w=
X-Google-Smtp-Source: ABdhPJzglAj2zEcuSTfR/ApGNCwL58mvFBlYw3kwcRHOHl7jcRz0JgVZV5GKXtIiD8j0Ohle/G/9WooWDkBOpUVFHgw=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr4835046wrq.327.1597858609658;
 Wed, 19 Aug 2020 10:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com> <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
In-Reply-To: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 Aug 2020 10:36:38 -0700
Message-ID: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To:     Doug Anderson <dianders@chromium.org>
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

On Wed, Aug 19, 2020 at 10:03 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Jordan Crouse <jcrouse@codeaurora.org>
> >
> > Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> > devices depend on unique features such as split pagetables,
> > different stall/halt requirements and other settings. Identify them
> > with a compatible string so that they can be identified in the
> > arm-smmu implementation specific code.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 503160a7b9a0..5ec5d0d691f6 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -40,6 +40,10 @@ properties:
> >                - qcom,sm8150-smmu-500
> >                - qcom,sm8250-smmu-500
> >            - const: arm,mmu-500
> > +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> > +        items:
> > +          - const: qcom,adreno-smmu
> > +          - const: qcom,smmu-v2
>
> I know I'm kinda late to the game, but this seems weird to me,
> especially given the later patches in the series like:
>
> https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com
>
> Specifically in that patch you can see that this IOMMU already had a
> compatible string and we're changing it and throwing away the
> model-specific string?  I'm guessing that you're just trying to make
> it easier for code to identify the adreno iommu, but it seems like a
> better way would have been to just add the adreno compatible in the
> middle, like:
>
>       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>         items:
>           - enum:
>               - qcom,msm8996-smmu-v2
>               - qcom,msm8998-smmu-v2
>               - qcom,sc7180-smmu-v2
>               - qcom,sdm845-smmu-v2
>         - const: qcom,adreno-smmu
>         - const: qcom,smmu-v2
>
> Then we still have the SoC-specific compatible string in case we need
> it but we also have the generic one?  It also means that we're not
> deleting the old compatible string...

I did bring up the thing about removing the compat string in an
earlier revision of the series.. but then we realized that
qcom,sc7180-smmu-v2 was never actually used anywhere.

But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
"qcom,adreno-smmu", "qcom,smmu-v2";

BR,
-R




>
> -Doug
>
>
> >        - description: Marvell SoCs implementing "arm,mmu-500"
> >          items:
> >            - const: marvell,ap806-smmu-500
> > --
> > 2.26.2
> >
