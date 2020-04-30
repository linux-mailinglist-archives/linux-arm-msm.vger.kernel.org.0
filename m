Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15B71C049A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 20:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgD3SVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 14:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726336AbgD3SVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 14:21:36 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC86C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 11:21:36 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id p5so2069083vke.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=SR5cmb+TdKfA9P9unlHlcoWqQ+iFT2b4XsANwGqxz5Y=;
        b=Kt9s26Qov6Qn68/Pe3SRmeowZf7qJWgEO/1aiZYlcrWn/63/H0Mxf0JJVVMFh+pL7n
         K4YQd/0YimnlqtXjKhoN+B+6gQ/2W073uz2X5RxT5/69tfGQIiW/gnVrr3EHLGpP1Q86
         2T/hEImFFlMGoRGn2f5o5tH6Ov3xB60rvdHTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=SR5cmb+TdKfA9P9unlHlcoWqQ+iFT2b4XsANwGqxz5Y=;
        b=gSHiJnv20eFqAaNGHyMrSbfwQqtCKamEqHH6C51nZPDxLAtStRUlc4zUm8pQfSa9TD
         1I+Xh0UVJJr9hz2JhRIrFDPtwLTOcqQMxhEFQquzsZj2YG01uAJaYAj24n//xAqIVpCi
         FmEwXTK5qOYjEsJdfEbyabEaYbwWsO8+euBg17xvFMcu1/PthTcFG7kPndVZ5Cv8pziY
         whsEuXTk5P2D6f4EvG7HBbwE43Q5DZCjYcIUr9AKnj+k0mmVgvzOls9ocR4KI9jPCPNf
         jIYfKegdg3kAvfjo5jmtwh4wRbvUTV59CaxNWc1qRG2donyg3ZqM8WFlGQSRrPn+yn/2
         DCcg==
X-Gm-Message-State: AGi0Pub0ArQ4dsxZMNW9A2khA/Hf+yAuOMJIVeHQQcM5/uZzgZh365oU
        W6Ysk0cjytySGikMQwka32WaAVEMch0=
X-Google-Smtp-Source: APiQypKCaLsUlHFDTP5jTh+YtwkXhxeigXwzzAwK4vAOOEn1Tq7BJQcOUJw4k0unC3IekqsE+tRdLA==
X-Received: by 2002:a1f:e4c3:: with SMTP id b186mr3962163vkh.34.1588270894226;
        Thu, 30 Apr 2020 11:21:34 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id d1sm159912vsc.30.2020.04.30.11.21.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 11:21:33 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id y185so4695637vsy.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 11:21:33 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr112084vsq.109.1588270892989;
 Thu, 30 Apr 2020 11:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org> <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Apr 2020 11:21:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
Message-ID: <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string
 and mem_iface clock
To:     Sharat Masetty <smasetty@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 11:12 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, Apr 30, 2020 at 09:29:47AM +0530, Sharat Masetty wrote:
> > This patch adds a new compatible string for sc7180 and also an
> > additional clock listing needed to power the TBUs and the TCU.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> > v2: Addressed review comments from Doug
> >
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 6515dbe..ba5dba4 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -28,6 +28,7 @@ properties:
> >            - enum:
> >                - qcom,msm8996-smmu-v2
> >                - qcom,msm8998-smmu-v2
> > +              - qcom,sc7180-smmu-v2
> >                - qcom,sdm845-smmu-v2
> >            - const: qcom,smmu-v2
> >
> > @@ -113,16 +114,23 @@ properties:
> >        present in such cases.
> >
> >    clock-names:
> > +    minItems: 2
> > +    maxItems: 3
> >      items:
> >        - const: bus
> >        - const: iface
> > +      - const: mem_iface
>
> Hi Sharat -
>
> I think there was a bit of confusion due to renaming between downstream and
> upstream.  Currently for the sdm845 and friends we have:
>
>   clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>      <&gcc GCC_GPU_CFG_AHB_CLK>;
>   clock-names = "bus", "iface";
>
> Confusingly these same clocks downstream are "mem_iface_clk" and "iface_clk"
> respectively.
>
> It looks like you are trying to add GCC_DDRSS_GPU_AXI_CLK as "mem_iface" which
> was formerly "mem_clk" downstream. I'm not sure if the naming change is
> intentional or you were trying to make upstream and downstream match and didn't
> realize that they were renamed.
>
> I'm not sure if we need DDRSS_GPU_AXI_CLK or not. Empirically it works without
> it for sdm845 (I don't have a sc7180 to test) but we should probably loop back
> with either the clock team or the hardware designers to be sure there isn't a
> corner case that is missing. I agree with Doug that its always best if we don't
> need to add a clock.

I can confirm that on sc7180 the GPU seems to come up just fine
without the clock being specified in the iommu node.  Definitely would
be good to know what's broken and if nothing is broken maybe we can
change this patch to just add the sc7180 compatible string and drop
the clock.  I do note that the GMU already has a reference to the same
"GCC_DDRSS_GPU_AXI_CLK" clock.

-Doug
