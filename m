Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17B347C8A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 22:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbhLUVJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 16:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhLUVJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 16:09:39 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38108C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 13:09:39 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id fo11so461308qvb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5b8n9orjAEw20yJsUAGO8xOhgi3RcUL34raFmKfwMXw=;
        b=yts9ohbmCCUWr3HVviMlhLdcGCGcYytNi3Xxr0i8vdU5sxgJU9tbhkWxfue0cntgSu
         LsFNtcZO5eVezqWQosNtyUOZBYj3uJjiYoeMBUbbD4B1WdllWuiAVAB5rRdof4246HuC
         3/IropbvZ+DfegxN5sguXRI5xVJxq9k2pXQZDh3QgUMe45/kW7r9rx6JUjFHoUg1F5CD
         KN6n3Gwn9s3Wf0LKPVtNAMwJobIQGqIimtGIQPXoOecIsajN0bfNTtcnIy9o5C3oF20C
         IdcSR62YI92QCrGdl08wtQ8dNfsC2qE9qVywEBN0t948uemB9KXWogaJtUYARsonSdZ2
         /Jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5b8n9orjAEw20yJsUAGO8xOhgi3RcUL34raFmKfwMXw=;
        b=Hg33jOfaDelk0Rc8p/3+upikMZJfZlJDEYO/PptwTaf8QUs6q1+5MQjBQG4dM+sA0A
         ObPMxqp/zhPda7uliBmfjtilq4qENsPbOHWQr+LT78d7DNxXV6HX6VZy0sbnUvFK7L6a
         9KPGsXtZqHfSlol/uyclomo5pKadAszged5vbZlTRInH7fALcCCKjWBmIDU5gmAO05eZ
         ewK2kKw2K5xmxzdwLyki7LULmgqt3mUMoiVFtF8Bd16Qv3kkWk80A3f2svJ/tpL6cxN2
         6O+q+FvctI3QfJ5mWosgqCyyU2DBOXed+gPN56wPAuSlMFEccgeEt24ARFEpFTGQWGmx
         wI+w==
X-Gm-Message-State: AOAM530VCOrRbjQDQJ5NFAIHfYChM5dIWtJrBpob2gSpckQTH77rRY9b
        xJFgb9aHx0QGusX0D5sqguK5bpmdQddB54Ob+dX/SQ==
X-Google-Smtp-Source: ABdhPJzO5NpLO0SWdQTQPLQ3pS5T+LQSeDWkBslctelVx9sng0G6KIRVPPF5PRkzhgH/O69heeBVsDLZKSB8oL6gvHE=
X-Received: by 2002:a05:6214:248a:: with SMTP id gi10mr108271qvb.115.1640120978287;
 Tue, 21 Dec 2021 13:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20211218141024.500952-1-dmitry.baryshkov@linaro.org>
 <20211218141024.500952-2-dmitry.baryshkov@linaro.org> <YcHr0/W0QqRlj1Ji@robh.at.kernel.org>
 <CAA8EJpr1wfW2CLSjBjJdMhhgBmcnMRkx=x5SAC_4LDQCHw1_qA@mail.gmail.com> <YcIwcUzYCq1v4Kfs@robh.at.kernel.org>
In-Reply-To: <YcIwcUzYCq1v4Kfs@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 22 Dec 2021 00:09:27 +0300
Message-ID: <CAA8EJpr7c-x3WJJQCXy3Wo0o82vODw4svwdZHrJ6ht5=WLNJ3A@mail.gmail.com>
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

On Tue, 21 Dec 2021 at 22:52, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 21, 2021 at 06:43:31PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 21 Dec 2021 at 17:59, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sat, Dec 18, 2021 at 05:10:20PM +0300, Dmitry Baryshkov wrote:
> > > > Document the PCIe DT bindings for SM8450 SoC. The PCIe IP is similar
> > > > to the one used on SM8250, however unlike SM8250, PCIe0 and PCIe1 use
> > > > different set of clocks, so two compatible entries are required.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  .../devicetree/bindings/pci/qcom,pcie.txt     | 22 ++++++++++++++++++-
> > > >  1 file changed, 21 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > > > index a0ae024c2d0c..0adb56d5645e 100644
> > > > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > > > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> > > > @@ -15,6 +15,8 @@
> > > >                       - "qcom,pcie-sc8180x" for sc8180x
> > > >                       - "qcom,pcie-sdm845" for sdm845
> > > >                       - "qcom,pcie-sm8250" for sm8250
> > > > +                     - "qcom,pcie-sm8450-pcie0" for PCIe0 on sm8450
> > > > +                     - "qcom,pcie-sm8450-pcie1" for PCIe1 on sm8450
> > >
> > > What's the difference between the two?
> >
> > Clocks used by these hosts. Quoting the definition:
> >
> > +                     - "aggre0"      Aggre NoC PCIe0 AXI clock, only
> > for sm8450-pcie0
> > +                     - "aggre1"      Aggre NoC PCIe1 AXI clock
> >
> > aggre1 is used by both pcie0 and pcie1, while aggre0 is used only by pcie0.
>
> That doesn't really seem like you need a different compatible for that.
> Do you need to handle them differently? It seems like abuse of clocks
> putting bus/interconnect clocks here, but sadly that's all too common.

Unfortunately, yes, it looks like we need to handle them differently.
The clocks are not handled by the interconnect on their own.

-- 
With best wishes
Dmitry
