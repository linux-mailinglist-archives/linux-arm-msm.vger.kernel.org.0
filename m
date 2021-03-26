Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A88C34ADC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCZRoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhCZRo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:44:26 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03430C0613B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:44:25 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id y5so6038353qkl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTiCPMS4dthdULxeLUAd4raLVXYHOILiM1vRqix30Ow=;
        b=PbK4/qmiwnf4feqIwuNChtdWFYvloADtgfAKq6npa2snWi2rZrZkVtTBVnNtn1eXH7
         /O9m+XEscpeDlaZ7PTOxVIFH7aWT8w1K8qklnys1Ob8AXEOVcavq5I+xGg5LM6IBlN9c
         FgHPOIwoCk8iUQtZkvDhodQ/FZ05kPaRoWt16a7UXjPpEoOwWo17qJy13zkX/Ij70Utq
         VCKh85h45oZ4xkFHs/TqELfixKKQqB03XpyrXzjZ4aGFmGFe2mSPovfDL1ZCj6oJQNyL
         W4ct/MjShXCOcs2OdPgm0m/RT0XkQzgkBxxMSSr1dKSq36oAF2mJnJKFCAyj27mEKvRn
         fWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTiCPMS4dthdULxeLUAd4raLVXYHOILiM1vRqix30Ow=;
        b=DPyE8b6pXcorNeiXjH5tx4r8AkY+zeOFQwM+ZjbyecLipUq1CA3p82xT3ErUOF53+e
         Qm4UQduASOXQLzPbRb9ZsHHLIladDGpQEelYC8Vph+datamXLfnrXMh1Bc3nYkGl91zu
         5OqI4vv/q3ZKQ+s1mpD2qyM+GyVfDQIchzsZNLDZsYfhi+zn4cn9jpymCResJKCmK08/
         Vn5C3bsNI9/0M2ZYFX0cGOaYuMF5o41RLfrt6ejxGMWnaPwMNYOV1RyWjDzbeIHe+IDh
         0MlEd4WYsa0Is5I+HiVctv2fADPCKWJ1xRN+FJOcURo1EkENTDGU1BpTXTPleZoHJ3im
         c6fA==
X-Gm-Message-State: AOAM53236YO7+a5r9IZwZ6oUYD9urgR9S7wFRwUk/atWp7MVreR0VGio
        LPwOMEaqXJWSs2Xa1foZ74jiKzTc9jprDsl2UVh/Cg==
X-Google-Smtp-Source: ABdhPJyDfbvLtsTUNR1uDU1zGMnuuEd3/ebE97k9a0Rt0IpEgxJ7+D/HRW49YpHNBZUyH1b8T02Zcdk4eWd6x72fMjY=
X-Received: by 2002:a37:9e50:: with SMTP id h77mr14193891qke.138.1616780665134;
 Fri, 26 Mar 2021 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
 <20210318195930.2229546-2-dmitry.baryshkov@linaro.org> <20210326012017.GA2110606@robh.at.kernel.org>
In-Reply-To: <20210326012017.GA2110606@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 26 Mar 2021 20:44:13 +0300
Message-ID: <CAA8EJprb6Cx=AHMT+4BUpqOVt7nCDUTFHuwPr3p2s8BB4W-g6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: qcom,qmp-usb3-dp: Add support
 for SM8250
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 at 04:20, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 18, 2021 at 10:59:25PM +0300, Dmitry Baryshkov wrote:
> > Add compatible for SM8250 in QMP USB3 DP PHY bindings.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 1 -
> >  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 ++
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > index 626447fee092..c558aa605b9d 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > @@ -38,7 +38,6 @@ properties:
> >        - qcom,sm8250-qmp-gen3x1-pcie-phy
> >        - qcom,sm8250-qmp-gen3x2-pcie-phy
> >        - qcom,sm8250-qmp-modem-pcie-phy
> > -      - qcom,sm8250-qmp-usb3-phy
>
> Why is this being moved? Not sure what the differences between the 2
> bindings, but doesn't seem like a backwards compatible change.

Hmm. I followed the existing schemas, but they are incorrect. It looks
like the commit 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add
DP phy information") has introduced backwards-incompatible change,
which is not followed by the current kernel device trees. I'd proposed
to move qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy back to
bindings/phy/qcom,qmp-phy.yaml (as those device nodes do not use DP
serdes block, etc).

I'll include the fix into v4 of this series.

>
> >        - qcom,sm8250-qmp-usb3-uni-phy
> >        - qcom,sm8350-qmp-ufs-phy
> >        - qcom,sm8350-qmp-usb3-phy
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > index 33974ad10afe..9792cc567cb5 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > @@ -17,6 +17,8 @@ properties:
> >        - qcom,sc7180-qmp-usb3-phy
> >        - qcom,sdm845-qmp-usb3-dp-phy
> >        - qcom,sdm845-qmp-usb3-phy
> > +      - qcom,sm8250-qmp-usb3-dp-phy
> > +      - qcom,sm8250-qmp-usb3-phy
> >    reg:
> >      items:
> >        - description: Address and length of PHY's USB serdes block.
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
