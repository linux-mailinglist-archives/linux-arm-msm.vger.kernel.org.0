Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF27B47C340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 16:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbhLUPno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 10:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbhLUPno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 10:43:44 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE6EC061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 07:43:43 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id t6so12931582qkg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TM/EYNiDRj3pjelGxdOL0frKQz44QCfMf7gv+XrXNos=;
        b=F1zsFtSE/NrsuidTSveNM0gDl67h08lj4dDeshbc+YE7OSUlu8s+0Y5iQn23G3bhNF
         L7/wa0r6XY1bE9rXMFZfTu+Fly1u4zwbeabaGym5nNemI2EFNhoiXlaiBafNGzJ1pQTP
         2NOR8VcChlrzxpu+4bESwQClbVMPNNWZEmiSRYvtoPxULTf3nt37FlKW9Q6pfO9iYgbF
         RF4ZUgWzsXH2D1zT2fqvqSyfy+nAKOb2IS+rLrdYuLLa6toakJZdsUj51MwzHzPBkLlL
         HjQtQKKZ5i8anDKE5BUSwmBMZOsyOFDsDI7yRi2g62QjU2REivitJy90PH6tgx9HdEAF
         0qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TM/EYNiDRj3pjelGxdOL0frKQz44QCfMf7gv+XrXNos=;
        b=0HPziGrAByDJ4VQxZrHiRxW9sk7CJ/dXAgMiQPsznWczE9WPmEunHVzHaiKhA8ABWa
         OY9YzCvC/sC5xvzOQ5TNWg2BOnMXmp5U0FN1IaMXBEjqp+XJvg5Plr7PF0GTC/zEgMN6
         nnUP4cvHOjSQa6zp3UT38X46pvJa7siMsCm/X/jzry7q4KXr5wMmWQkTQMjrHU4EKQYS
         32CT5zaz2qJwBrXrf+s8pV/u1IYGap9pXeLh2KVpsOxYzPFqj1JJXy/64uFI/b2ggxf7
         erwK6B1Bpe8H+E5ouyekLlbLhQEr6MyyQeAj6AU83j+110LS1S67eRIsS1YQgxvol2ui
         hXQQ==
X-Gm-Message-State: AOAM530tBslt2pycJdMx9ax7JrQqPwsXPy6+/X/9TjQQhaXExbXdVZYp
        ufaiUoGp8rrS2aJJkz9+GZeNSKJQpis2x6jsaDBLQQ==
X-Google-Smtp-Source: ABdhPJwWSdSLT82NkDeKpmGZRZMmiKAk2WV6/DtmpRrClrcP7y9OglFbZ/77UwSWGk2t4gOg0h3W0exFjn2hG+lTn5U=
X-Received: by 2002:a05:620a:4101:: with SMTP id j1mr2357042qko.593.1640101422825;
 Tue, 21 Dec 2021 07:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20211218141024.500952-1-dmitry.baryshkov@linaro.org>
 <20211218141024.500952-2-dmitry.baryshkov@linaro.org> <YcHr0/W0QqRlj1Ji@robh.at.kernel.org>
In-Reply-To: <YcHr0/W0QqRlj1Ji@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 18:43:31 +0300
Message-ID: <CAA8EJpr1wfW2CLSjBjJdMhhgBmcnMRkx=x5SAC_4LDQCHw1_qA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: pci: qcom: Document PCIe bindings for SM8450
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Dec 2021 at 17:59, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Dec 18, 2021 at 05:10:20PM +0300, Dmitry Baryshkov wrote:
> > Document the PCIe DT bindings for SM8450 SoC. The PCIe IP is similar
> > to the one used on SM8250, however unlike SM8250, PCIe0 and PCIe1 use
> > different set of clocks, so two compatible entries are required.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie.txt     | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > index a0ae024c2d0c..0adb56d5645e 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > @@ -15,6 +15,8 @@
> >                       - "qcom,pcie-sc8180x" for sc8180x
> >                       - "qcom,pcie-sdm845" for sdm845
> >                       - "qcom,pcie-sm8250" for sm8250
> > +                     - "qcom,pcie-sm8450-pcie0" for PCIe0 on sm8450
> > +                     - "qcom,pcie-sm8450-pcie1" for PCIe1 on sm8450
>
> What's the difference between the two?

Clocks used by these hosts. Quoting the definition:

+                     - "aggre0"      Aggre NoC PCIe0 AXI clock, only
for sm8450-pcie0
+                     - "aggre1"      Aggre NoC PCIe1 AXI clock

aggre1 is used by both pcie0 and pcie1, while aggre0 is used only by pcie0.

>
> >                       - "qcom,pcie-ipq6018" for ipq6018
> >
> >  - reg:
> > @@ -169,6 +171,24 @@
> >                       - "ddrss_sf_tbu" PCIe SF TBU clock
> >                       - "pipe"        PIPE clock
> >
> > +- clock-names:
> > +     Usage: required for sm8450-pcie0 and sm8450-pcie1
> > +     Value type: <stringlist>
> > +     Definition: Should contain the following entries
> > +                     - "aux"         Auxiliary clock
> > +                     - "cfg"         Configuration clock
> > +                     - "bus_master"  Master AXI clock
> > +                     - "bus_slave"   Slave AXI clock
> > +                     - "slave_q2a"   Slave Q2A clock
> > +                     - "tbu"         PCIe TBU clock
> > +                     - "ddrss_sf_tbu" PCIe SF TBU clock
> > +                     - "pipe"        PIPE clock
> > +                     - "pipe_mux"    PIPE MUX
> > +                     - "phy_pipe"    PIPE output clock
> > +                     - "ref"         REFERENCE clock
> > +                     - "aggre0"      Aggre NoC PCIe0 AXI clock, only for sm8450-pcie0
> > +                     - "aggre1"      Aggre NoC PCIe1 AXI clock
> > +
> >  - resets:
> >       Usage: required
> >       Value type: <prop-encoded-array>
> > @@ -246,7 +266,7 @@
> >                       - "ahb"                 AHB reset
> >
> >  - reset-names:
> > -     Usage: required for sc8180x, sdm845 and sm8250
> > +     Usage: required for sc8180x, sdm845, sm8250 and sm8450
> >       Value type: <stringlist>
> >       Definition: Should contain the following entries
> >                       - "pci"                 PCIe core reset
> > --
> > 2.34.1
> >
> >



-- 
With best wishes
Dmitry
