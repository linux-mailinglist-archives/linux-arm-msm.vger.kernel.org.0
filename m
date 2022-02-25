Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4645F4C411C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 10:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238141AbiBYJRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 04:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbiBYJRj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 04:17:39 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA9B17AB9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 01:17:07 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id i6-20020a4ac506000000b0031c5ac6c078so5476246ooq.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 01:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wkModBfYW/sro4zX7iHc2v70i7FEbVRCcdgHDgCBjEU=;
        b=rxqWkRnYPEe3ddiQuI9xuAVJ2cFo5NwcMOUx3EmugebRUBaLU4E1mtmk5GZKilrNip
         qxJwU718/BGVUHTn9EVrB8SXO0dLkTwcn4Vul65MOJM1+Yb5DJ/qv1pG4uE/bnRKU578
         1erriMs9eMi3EtOrzNjSo3ActyfMATIVdkPIZoZSgqIyDsdPQE685OWeBtRFjajbVydw
         d5IHEMsNJ93r8GHg0UwYojrMW+NtRd7U0KGqHFpRBTJj2SmRmeAPzOAj1/x0N9zHc31R
         PWyZmJOMJg2E6qiW3wqVAf9cBBJDRYMV1ADOpUMQckLZY/ut7UmpeQ3r3pWmShZ1mnDI
         L27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkModBfYW/sro4zX7iHc2v70i7FEbVRCcdgHDgCBjEU=;
        b=UyqeFepGzMNafVdw64WQK+ut09V4sU2dypWpr0us8aASFcDGSI6Kc2Fr6EkrkTAaNt
         gGyjETzRpcjajkKCAQU/LcUZql+XrzFDSoec4eQ/lIk4GMI85DhsQ85cQkHf8XqGOw30
         HFG4p3dHJNdS202KsqMFQIqdv71hdXB0axM0qIYwfPxv5y98WLbu85YonPM1siZ2BJaN
         w7CyrMnmAALh2e1cxt3IwAljIlBLudKFfnXumue0sJ90KCaBpT9gFFsPA303uAovYokX
         7kfIRsmyXjMGn4WkrOvpa2Xir1AodY5uS0Q9pSbX7NW/9Wtf03onpNe4PVsoB9P4Nk+V
         bzjg==
X-Gm-Message-State: AOAM531NZyfv8qf16I9+RXAJRyHoT/nlzGwOsjBtQySNpAoElHoAg59l
        kNGs/HGXotE942byrVwojafaFhlCHz+A8M+pZAbYNQ==
X-Google-Smtp-Source: ABdhPJwQ31m5c0xE+wlL8qf66tvpuk9ah//HylNSbT7uGyrV8YYzHAW11DMgHFvaBIKh1krEo2GpCBGoTVbARGrFBA0=
X-Received: by 2002:a05:6870:450a:b0:d3:58dd:be81 with SMTP id
 e10-20020a056870450a00b000d358ddbe81mr882804oao.304.1645780626498; Fri, 25
 Feb 2022 01:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220224123248.67073-1-bhupesh.sharma@linaro.org> <CAA8EJprRgsZRSXBQumveAn029j+w6xO8K2kZUO4rzZaefuYe7Q@mail.gmail.com>
In-Reply-To: <CAA8EJprRgsZRSXBQumveAn029j+w6xO8K2kZUO4rzZaefuYe7Q@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 25 Feb 2022 14:46:55 +0530
Message-ID: <CAH=2NtxQBS=c0W0cpX5EdNi12PrqiKEuzyvEtF8WrVE6nsU_rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Mark '#clock-cells' as a
 'optional' property
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thanks for your review comments.

On Thu, 24 Feb 2022 at 20:22, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 24 Feb 2022 at 15:33, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > Since '#clock-cells' is not a required property for several
> > QCoM boards supporting qmp-phy(s) (for e.g. sm8150, sm8250 or sm8350 SoC
> > based boards), mark it as an optional property instead.
>
> I believe the description is not correct. the clock-cells should not
> be used at all, so it should be removed from the root node.

Hmm.. 'clock-cells' is still used for describing qmp phy pcie nodes for certain
devices like 'msm8996.dtsi'. I am not sure if removing it would impact existing
dts files. But let me try cleaning them up in v2.

> Also we should describe phy@ properties.

Sure, I will add them in v2.

Regards,
Bhupesh

> >
> > This fixes the following '$ make dtbs_check' warning(s):
> >
> > sm8350-microsoft-surface-duo2.dt.yaml: phy@1d87000:
> >   '#clock-cells' is a required property
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > index 9e0f60e682c4..746a929c63bb 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > @@ -115,7 +115,6 @@ patternProperties:
> >  required:
> >    - compatible
> >    - reg
> > -  - "#clock-cells"
> >    - "#address-cells"
> >    - "#size-cells"
> >    - ranges
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
